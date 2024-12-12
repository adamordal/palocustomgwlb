## ---------------------------------------------------------------------------------------------------------------------
## LOCAL VARIABLES
## ---------------------------------------------------------------------------------------------------------------------

locals {
  pafw_mgmt_subnets = [
    data.aws_subnet.pafw_mgmt_subnet_a.id,
    data.aws_subnet.pafw_mgmt_subnet_b.id
  ]

  gwlbe_ns_subnets = [
    data.aws_subnet.gwlbe_ns_subnet_a.id,
    data.aws_subnet.gwlbe_ns_subnet_b.id
  ]

  gwlbe_ew_subnets = [
    data.aws_subnet.gwlbe_ew_subnet_a.id,
    data.aws_subnet.gwlbe_ew_subnet_b.id
  ]

  pafw_data_subnets = [
    data.aws_subnet.pafw_data_subnet_a.id,
    data.aws_subnet.pafw_data_subnet_b.id
  ]

  sec_txgw_subnets = [
    data.aws_subnet.sec_txgw_subnet_a.id,
    data.aws_subnet.sec_txgw_subnet_b.id
  ]

  nat_subnets = [
    data.aws_subnet.nat_subnet_a.id,
    data.aws_subnet.nat_subnet_b.id
  ]

  nat_gateways = [
    data.aws_nat_gateway.sec_nat_gw_a.id,
    data.aws_nat_gateway.sec_nat_gw_b.id
  ]

  pafw_mgmt_rts = [
    data.aws_route_table.pafw_mgmt_rt_a.id,
    data.aws_route_table.pafw_mgmt_rt_b.id
  ]

  gwlbe_ns_rts = [
    data.aws_route_table.gwlbe_ns_rt_a.id,
    data.aws_route_table.gwlbe_ns_rt_b.id
  ]

  gwlbe_ew_rts = [
    data.aws_route_table.gwlbe_ew_rt_a.id,
    data.aws_route_table.gwlbe_ew_rt_b.id
  ]

  pafw_data_rts = [
    data.aws_route_table.pafw_data_rt_a.id,
    data.aws_route_table.pafw_data_rt_b.id
  ]

  sec_txgw_rts = [
    data.aws_route_table.sec_txgw_rt_a.id,
    data.aws_route_table.sec_txgw_rt_b.id
  ]

  nat_rts = [
    data.aws_route_table.nat_rt_a.id,
    data.aws_route_table.nat_rt_b.id
  ]
}