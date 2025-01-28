## ---------------------------------------------------------------------------------------------------------------------
## DEPLOYMENT OF VPC ENDPOINTS
## ---------------------------------------------------------------------------------------------------------------------

provider "aws" {
  alias  = "assume_role"
  region = var.region
  assume_role {
    role_arn = "arn:aws:iam::${var.target_account_id}:role/EndpointServicePermissions"
  }
}

data "aws_caller_identity" "current" {
}

resource "aws_vpc_endpoint_service_allowed_principal" "allowed_principal" {
  provider                = aws.assume_role
  vpc_endpoint_service_id = data.aws_vpc_endpoint_service.endpoint_service.service_id
  principal_arn           = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
}

data "aws_vpc_endpoint_service" "endpoint_service" {
  service_name = var.endpoint_service_name
  provider     = aws.assume_role
}

resource "aws_vpc_endpoint" "vpc_endpoint_a" {
  depends_on        = [aws_vpc_endpoint_service_allowed_principal.allowed_principal]
  vpc_id            = data.aws_vpc.selected.id
  service_name      = var.endpoint_service_name
  vpc_endpoint_type = "GatewayLoadBalancer"

  subnet_ids = [
    data.aws_subnet.fw_endpoint_a.id
  ]

  private_dns_enabled = false
}

resource "aws_vpc_endpoint" "vpc_endpoint_b" {
  depends_on        = [aws_vpc_endpoint_service_allowed_principal.allowed_principal]
  vpc_id            = data.aws_vpc.selected.id
  service_name      = var.endpoint_service_name
  vpc_endpoint_type = "GatewayLoadBalancer"

  subnet_ids = [
    data.aws_subnet.fw_endpoint_b.id
  ]

  private_dns_enabled = false
}


