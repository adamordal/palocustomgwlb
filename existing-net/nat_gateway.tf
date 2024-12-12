## ---------------------------------------------------------------------------------------------------------------------
## USE EXISTING NAT GATEWAYS
## ---------------------------------------------------------------------------------------------------------------------

data "aws_nat_gateway" "sec_nat_gw_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_nat_gateway_tag}-nat-gw-A"]
  }
}

data "aws_nat_gateway" "sec_nat_gw_b" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_nat_gateway_tag}-nat-gw-B"]
  }
}