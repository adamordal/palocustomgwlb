## ---------------------------------------------------------------------------------------------------------------------
## ROUTE TABLE DATA SOURCES
## ---------------------------------------------------------------------------------------------------------------------

data "aws_vpc" "selected" {
  id = var.vpc_id
}

data "aws_route_table" "web_public_rt_a" {
  filter {
    name   = "tag:Name"
    values = ["${var.name_prefix}-web-public-rt-a"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

data "aws_route_table" "web_public_rt_b" {
  filter {
    name   = "tag:Name"
    values = ["${var.name_prefix}-web-public-rt-b"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

data "aws_route_table" "igw_rt" {
  filter {
    name   = "tag:Name"
    values = ["${var.name_prefix}-igw-rt"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}
