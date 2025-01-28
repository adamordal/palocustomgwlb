variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "name_prefix" {
  description = "The prefix for the route table names"
  type        = string
}

variable "endpoint_service_name" {
  description = "The name of the endpoint service in another AWS account"
  type        = string
}

variable "region" {
  description = "The AWS region"
  type        = string
}

variable "target_account_id" {
  description = "The ID of the account that owns the endpoint service"
  type        = string
}