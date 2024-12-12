## ---------------------------------------------------------------------------------------------------------------------
## TRANSIT GATEWAY CONFIGURATION
## ---------------------------------------------------------------------------------------------------------------------

data "aws_ec2_transit_gateway" "transit_gw" {
  id = var.transit_gw_id
}

#resource "aws_ec2_transit_gateway_vpc_attachment" "sec_txgw_attach" {
#  subnet_ids             = local.sec_txgw_subnets
#  transit_gateway_id     = data.aws_ec2_transit_gateway.transit_gw.id
#  vpc_id                 = data.aws_vpc.sec_vpc.id
#  appliance_mode_support = "enable"
#
#  tags = {
#    Name = "sec-txgw-attach-${random_id.deployment_id.hex}"
#  }
#
#  depends_on = []
#}