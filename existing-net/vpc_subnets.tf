## ---------------------------------------------------------------------------------------------------------------------
## USE EXISTING VPC AND SUBNETS
## ---------------------------------------------------------------------------------------------------------------------

data "aws_vpc" "sec_vpc" {
  id = var.vpc_id
}

data "aws_internet_gateway" "sec_vpc_igw" {
  filter {
    name   = "tag:Name"
    values = ["inspection-vpc"]
  }
}

// Management Subnets
data "aws_subnet" "pafw_mgmt_subnet_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_subnet_tag}-mgmt-A"]
  }
}

data "aws_subnet" "pafw_mgmt_subnet_b" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_subnet_tag}-mgmt-B"]
  }
}

// Outbound NS Subnets
data "aws_subnet" "gwlbe_ns_subnet_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_subnet_tag}-outbound-NS-A"]
  }
}

data "aws_subnet" "gwlbe_ns_subnet_b" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_subnet_tag}-outbound-NS-B"]
  }
}

// Inbound EW Subnets
data "aws_subnet" "gwlbe_ew_subnet_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_subnet_tag}-inbound-EW-A"]
  }
}

data "aws_subnet" "gwlbe_ew_subnet_b" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_subnet_tag}-inbound-EW-B"]
  }
}

// Data Subnets
data "aws_subnet" "pafw_data_subnet_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_subnet_tag}-data-A"]
  }
}

data "aws_subnet" "pafw_data_subnet_b" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_subnet_tag}-data-B"]
  }
}

// Transit Gateway Subnets
data "aws_subnet" "sec_txgw_subnet_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_subnet_tag}-tgw-A"]
  }
}

data "aws_subnet" "sec_txgw_subnet_b" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_subnet_tag}-tgw-B"]
  }
}

// NAT Subnets
data "aws_subnet" "nat_subnet_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_subnet_tag}-nat-A"]
  }
}

data "aws_subnet" "nat_subnet_b" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.sec_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.existing_subnet_tag}-nat-B"]
  }
}