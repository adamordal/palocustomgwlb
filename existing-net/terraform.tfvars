# ---------------------------------------------------------------------------------------------------------------------
# MANDATORY PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

region                   = "us-east-1"
availability_zones       = ["us-east-1a", "us-east-1b"]
firewall_ami_id          = "ami-031c5c1c3673d4428"
transit_gw_id            = "tgw-0a391687f20a1cee4"
key_pair                 = "ao-useast1"
vpc_id                   = "vpc-0139fa7be803ac819"
existing_subnet_tag      = "my_subnet_tag"
existing_route_table_tag = "my_route_table_tag"
instance_type            = "m5.xlarge"
existing_nat_gateway_tag = "my_nat_gateway_tag"

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

#access_key         = "myaccesskey"
#secret_key         = "mysecretkey"
