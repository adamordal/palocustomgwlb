## ---------------------------------------------------------------------------------------------------------------------
## ROUTE CONFIGURATIONS
## ---------------------------------------------------------------------------------------------------------------------

resource "aws_route" "igw_rt_route_web_public_a" {
  route_table_id         = data.aws_route_table.igw_rt.id
  destination_cidr_block = data.aws_subnet.web_public_a.cidr_block
  vpc_endpoint_id        = aws_vpc_endpoint.vpc_endpoint_a.id
}

resource "aws_route" "igw_rt_route_web_public_b" {
  route_table_id         = data.aws_route_table.igw_rt.id
  destination_cidr_block = data.aws_subnet.web_public_b.cidr_block
  vpc_endpoint_id        = aws_vpc_endpoint.vpc_endpoint_b.id
}

resource "aws_route" "rt_route_web_public_a" {
  route_table_id         = data.aws_route_table.web_public_rt_a.id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = aws_vpc_endpoint.vpc_endpoint_a.id
}

resource "aws_route" "rt_route_web_public_b" {
  route_table_id         = data.aws_route_table.web_public_rt_b.id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = aws_vpc_endpoint.vpc_endpoint_b.id
}
