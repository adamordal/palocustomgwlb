## ---------------------------------------------------------------------------------------------------------------------
## ROUTE TABLE DATA SOURCES
## ---------------------------------------------------------------------------------------------------------------------

data "aws_route_table" "pafw_mgmt_rt_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_route_table_tag}-mgmt-rt-a"]
  }
}

data "aws_route_table" "pafw_mgmt_rt_b" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_route_table_tag}-mgmt-rt-b"]
  }
}

data "aws_route_table" "gwlbe_ns_rt_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_route_table_tag}-outbound-NS-rt-a"]
  }
}

data "aws_route_table" "gwlbe_ns_rt_b" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_route_table_tag}-outbound-NS-rt-b"]
  }
}

data "aws_route_table" "gwlbe_ew_rt_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_route_table_tag}-inbound-EW-rt-a"]
  }
}

data "aws_route_table" "gwlbe_ew_rt_b" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_route_table_tag}-inbound-EW-rt-b"]
  }
}

data "aws_route_table" "pafw_data_rt_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_route_table_tag}-data-rt-a"]
  }
}

data "aws_route_table" "pafw_data_rt_b" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_route_table_tag}-data-rt-b"]
  }
}

data "aws_route_table" "sec_txgw_rt_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_route_table_tag}-tgw-rt-a"]
  }
}

data "aws_route_table" "sec_txgw_rt_b" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_route_table_tag}-tgw-rt-b"]
  }
}

data "aws_route_table" "nat_rt_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_route_table_tag}-nat-rt-a"]
  }
}

data "aws_route_table" "nat_rt_b" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_route_table_tag}-nat-rt-b"]
  }
}