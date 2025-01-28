## ---------------------------------------------------------------------------------------------------------------------
## SUBNET DATA SOURCES
## ---------------------------------------------------------------------------------------------------------------------

data "aws_subnet" "web_public_a" {
  filter {
    name   = "tag:Name"
    values = ["${var.name_prefix}-web-public-A"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

data "aws_subnet" "web_public_b" {
  filter {
    name   = "tag:Name"
    values = ["${var.name_prefix}-web-public-B"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

data "aws_subnet" "fw_endpoint_a" {
  filter {
    name   = "tag:Name"
    values = ["${var.name_prefix}-fw-endpoint-A"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

data "aws_subnet" "fw_endpoint_b" {
  filter {
    name   = "tag:Name"
    values = ["${var.name_prefix}-fw-endpoint-B"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}
