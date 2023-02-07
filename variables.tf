variable "region" {
  type        = string
  description = "AWS region"
}

variable "vpc_ids" {
  type        = list(string)
  description = "The list of VPC IDs, This module will create a vpc endpoint in each vpcs as defined in the list."
}

variable "service_name" {
  type        = string
  description = "Short service name (either \"s3\" or \"dynamodb\"), or fulle service name endpoint"
}

#---------------#
# Resource TAGs #
#---------------#
variable "createby" {
  type        = string
  description = "Who has perform this operation, Please type your UserLan. (กรุณาพิมพ์ User Lan ของคุณ)"
}
variable "tag_owner" {
  type        = string
  description = "The resource owner id."
}
variable "tag_project" {
  type        = string
  description = "The project name."
}
variable "tag_service" {
  type        = string
  description = "The Service code id."
}
variable "tag_system" {
  type        = string
  description = "The System code id."
}
variable "environment" {
  type        = string
  description = "The environment name."
}
