module "example" {
  source = "../../"

  region       = var.region
  vpc_ids      = var.vpc_ids
  service_name = var.service_name

  # Resource tags
  tag_service = var.tag_service
  tag_system  = var.tag_system
  tag_owner   = var.tag_owner
  tag_project = var.tag_project
  createby    = var.createby
  environment = var.environment
}
