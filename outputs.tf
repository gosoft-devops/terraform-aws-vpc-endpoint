output "arn" {
  description = "The Amazon Resource Name (ARN) of the VPC endpoint."
  value       = flatten([for vpce in aws_vpc_endpoint.vpce : vpce.arn])
}

output "id" {
  description = "The ID of the VPC endpoint."
  value       = flatten([for vpce in aws_vpc_endpoint.vpce : vpce.id])
}

output "dns_entry" {
  description = "The DNS entries for the VPC Endpoint."
  value       = flatten([for vpce in aws_vpc_endpoint.vpce : vpce.dns_entry])
}

output "eni_ids" {
  description = "One or more network interfaces for the VPC Endpoint. Applicable for endpoints of type Interface."
  value       = flatten([for vpce in aws_vpc_endpoint.vpce : vpce.network_interface_ids])
}

output "security_group_ids" {
  description = "The ID lists of security group."
  value       = flatten([for vpce in aws_vpc_endpoint.vpce : vpce.security_group_ids])
}
