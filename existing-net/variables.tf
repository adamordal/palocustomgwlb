# ---------------------------------------------------------------------------------------------------------------------
# MANDATORY PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "availability_zones" {
  description = "Availability zones in a region to deploy instances on"
  type        = list(any)
}

variable "firewall_ami_id" {
  description = "VM-Series AMI ID BYOL/Bundle1/Bundle2 for the specified region"
  type        = string
}

variable "transit_gw_id" {
  description = "Transit gateway ID"
  type        = string
}

variable "key_pair" {
  description = "AWS SSH Key Pair Name"
  type        = string
}

variable "vpc_id" {
  description = "ID of the existing VPC"
  type        = string
}

variable "existing_subnet_tag" {
  description = "Tag for the existing subnets"
  type        = string
}

variable "existing_route_table_tag" {
  description = "Tag for the existing route tables"
  type        = string
}

variable "existing_nat_gateway_tag" {
  description = "Tag for the existing NAT gateways"
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "access_key" {
  description = "AWS Access Key"
  type        = string
  default     = ""
}

variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
  default     = ""
}

variable "prefix" {
  description = "Deployment ID Prefix"
  type        = string
  default     = "PANW"
}

variable "user_data" {
  description = "User Data for VM Series Bootstrapping. Ex. 'type=dhcp-client\nhostname=PANW\nvm-auth-key=0000000000\npanorama-server=<Panorama Server IP>\ntplname=<Panorama Template Stack Name>\ndgname=<Panorama Device Group Name>' or 'vmseries-bootstrap-aws-s3bucket=<s3-bootstrap-bucket-name>'"
  type        = string
  default     = ""
}

variable "fw_mgmt_sg_list" {
  description = "List of IP CIDRs that are allowed to access firewall management interface"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "instance_type" {
  description = "Instance type of the web server instances in ASG"
  type        = string
  default     = "m5.xlarge"
}
