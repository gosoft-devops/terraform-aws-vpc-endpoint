locals {
  region    = var.region
  name      = "${var.tag_service}-${var.tag_system}-vpce-${var.environment}"
  vpcs_name = [for name in data.aws_vpc.lz[*].tags.Name : substr(name, 8, -1)]
  tags = {
    Name        = local.name
    Service     = var.tag_service
    System      = var.tag_system
    Owner       = var.tag_owner
    Project     = var.tag_project
    Createby    = var.createby
    Environemnt = var.environment
    Managedby   = "terraform"
  }
}

data "aws_subnets" "secure" {
  count = length(var.vpc_ids)
  filter {
    name   = "vpc-id"
    values = [var.vpc_ids[count.index]]
  }
  tags = {
    Name = "*secure*"
  }
}

data "aws_vpc" "lz" {
  count = length(var.vpc_ids)
  id    = var.vpc_ids[count.index]
}

resource "aws_security_group" "vpce" {
  count       = length(var.vpc_ids)
  vpc_id      = var.vpc_ids[count.index]
  name        = "${var.tag_service}-${var.tag_system}-vpce-${local.vpcs_name[count.index]}-sg"
  description = "Allow Oasis vpce for ${data.aws_vpc.lz[count.index].tags.Name}"

  ingress {
    description = "vpce"
    from_port   = 8529
    to_port     = 8529
    protocol    = "tcp"
    cidr_blocks = [
      data.aws_vpc.lz[count.index].cidr_block,
      "100.64.0.0/19" # nonexpose CIDR
    ]
  }

  egress {
    description = "egress to any"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [
      data.aws_vpc.lz[count.index].cidr_block,
      "100.64.0.0/19" # nonexpose CIDR
    ]
  }

  tags = local.tags
}

resource "aws_vpc_endpoint" "vpce" {
  count              = length(var.vpc_ids)
  vpc_id             = var.vpc_ids[count.index]
  vpc_endpoint_type  = "Interface"
  service_name       = var.service_name
  subnet_ids         = data.aws_subnets.secure[count.index].ids
  security_group_ids = [aws_security_group.vpce[count.index].id]
  ip_address_type    = "ipv4"

  tags = merge(local.tags, {
    Name = "${var.tag_service}-${var.tag_system}-vpce-vpce-${local.vpcs_name[count.index]}"
  })
}

resource "aws_route53_zone" "vpce" {
  count   = length(var.vpc_ids)
  name    = "vpce.cloud"
  comment = "vpce VPCe for VPC ${data.aws_vpc.lz[count.index].tags.Name}"

  vpc {
    vpc_region = local.region
    vpc_id     = var.vpc_ids[count.index]
  }

  tags = merge(local.tags, {
    Name = "${var.tag_service}-${var.tag_system}-vpce-vpce-${local.vpcs_name[count.index]}"
  })
}

resource "aws_route53_record" "vpce" {
  count   = length(var.vpc_ids)
  zone_id = aws_route53_zone.vpce[count.index].id
  name    = "*.vpce.cloud"
  type    = "CNAME"
  ttl     = 300
  records = [aws_vpc_endpoint.vpce[count.index].dns_entry[0].dns_name]

  depends_on = [
    aws_route53_zone.vpce,
    aws_vpc_endpoint.vpce
  ]
}
