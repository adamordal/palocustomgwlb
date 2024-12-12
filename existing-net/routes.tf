## ---------------------------------------------------------------------------------------------------------------------
## ROUTE CONFIGURATIONS
## ---------------------------------------------------------------------------------------------------------------------

resource "aws_route" "pafw_mgmt_rt_route" {
  for_each               = { for idx, rt_id in local.pafw_mgmt_rts : idx => rt_id }
  route_table_id         = each.value
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = data.aws_internet_gateway.sec_vpc_igw.id
}

resource "aws_route" "gwlbe_ns_rt_route_0" {
  for_each               = { for idx, rt_id in local.gwlbe_ns_rts : idx => rt_id }
  route_table_id         = each.value
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = local.nat_gateways[each.key % length(local.nat_gateways)]
}

resource "aws_route" "gwlbe_ns_rt_route_1" {
  for_each               = { for idx, rt_id in local.gwlbe_ns_rts : idx => rt_id }
  route_table_id         = each.value
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = data.aws_ec2_transit_gateway.transit_gw.id
}

resource "aws_route" "gwlbe_ew_rt_route_0" {
  for_each               = { for idx, rt_id in local.gwlbe_ew_rts : idx => rt_id }
  route_table_id         = each.value
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = data.aws_ec2_transit_gateway.transit_gw.id
}

resource "aws_route" "gwlbe_ew_rt_route_1" {
  for_each               = { for idx, rt_id in local.gwlbe_ew_rts : idx => rt_id }
  route_table_id         = each.value
  destination_cidr_block = "172.16.0.0/12"
  transit_gateway_id     = data.aws_ec2_transit_gateway.transit_gw.id
}

resource "aws_route" "sec_txgw_rt_route_0" {
  for_each               = { for idx, rt_id in local.sec_txgw_rts : idx => rt_id }
  route_table_id         = each.value
  destination_cidr_block = "10.0.0.0/8"
  vpc_endpoint_id        = aws_vpc_endpoint.gwlbe_ew_endpoint[each.key % length(aws_vpc_endpoint.gwlbe_ew_endpoint)].id
}

resource "aws_route" "sec_txgw_rt_route_1" {
  for_each               = { for idx, rt_id in local.sec_txgw_rts : idx => rt_id }
  route_table_id         = each.value
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = aws_vpc_endpoint.gwlbe_ns_endpoint[each.key % length(aws_vpc_endpoint.gwlbe_ns_endpoint)].id
}

#resource "aws_route" "nat_rt_route_0" {
#  for_each               = { for idx, rt_id in local.nat_rts : idx => rt_id }
#  route_table_id         = each.value
#  destination_cidr_block = "0.0.0.0/0"
#  gateway_id             = data.aws_internet_gateway.sec_vpc_igw.id
#}

resource "aws_route" "nat_rt_route_1" {
  for_each               = { for idx, rt_id in local.nat_rts : idx => rt_id }
  route_table_id         = each.value
  destination_cidr_block = "10.0.0.0/8"
  vpc_endpoint_id        = aws_vpc_endpoint.gwlbe_ns_endpoint[each.key % length(aws_vpc_endpoint.gwlbe_ns_endpoint)].id
}