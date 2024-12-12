# ---------------------------------------------------------------------------------------------------------------------
# CREATE NETWORK INTERFACES AND EIPs
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_network_interface" "fw-mgmt-eni" {
  count             = length(var.availability_zones)
  subnet_id         = local.pafw_mgmt_subnets[count.index]
  security_groups   = [aws_security_group.fw-mgmt-sg.id]
  source_dest_check = "false"
  tags = {
    Name = "fw-mgmt-eni-${var.availability_zones[count.index]}-${random_id.deployment_id.hex}"
  }
}

resource "aws_network_interface" "fw-data-eni" {
  count             = length(var.availability_zones)
  subnet_id         = local.pafw_data_subnets[count.index]
  security_groups   = [aws_security_group.fw-data-sg.id]
  source_dest_check = "false"
  tags = {
    Name = "fw-data-eni-${var.availability_zones[count.index]}-${random_id.deployment_id.hex}"
  }
}


resource "aws_eip" "fw-mgmt-eip" {
  count             = length(var.availability_zones)
  domain            = "vpc"
  network_interface = aws_network_interface.fw-mgmt-eni[count.index].id
  tags = {
    Name = "fw-mgmt-eip-${var.availability_zones[count.index]}-${random_id.deployment_id.hex}"
  }
  depends_on = [aws_network_interface.fw-mgmt-eni, aws_instance.firewall_instance]
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE FIREWALL INSTANCE
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "firewall_instance" {
  count         = length(var.availability_zones)
  ami           = var.firewall_ami_id
  instance_type = var.instance_type

  network_interface {
    network_interface_id = aws_network_interface.fw-data-eni[count.index].id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.fw-mgmt-eni[count.index].id
    device_index         = 1
  }

  user_data = "mgmt-interface-swap=enable\nplugin-op-commands=aws-gwlb-inspect:enable\n${var.user_data}"

  key_name = var.key_pair
  tags = {
    Name = "FW-${var.availability_zones[count.index]}-${random_id.deployment_id.hex}"
  }
}
