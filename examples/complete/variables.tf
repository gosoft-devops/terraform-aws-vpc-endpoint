variable "region" { type = string }

variable "vpc_ids" { type = list(string) }

variable "service_name" { type = string }

#---------------#
# Resource TAGs #
#---------------#
variable "createby" { type = string }
variable "tag_owner" { type = string }
variable "tag_project" { type = string }
variable "tag_service" { type = string }
variable "tag_system" { type = string }
variable "environment" { type = string }
