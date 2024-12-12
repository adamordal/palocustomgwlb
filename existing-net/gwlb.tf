## ---------------------------------------------------------------------------------------------------------------------
## CREATE Endpoint Service and Endpoint for Gateway Load Balancer
## ---------------------------------------------------------------------------------------------------------------------
resource "aws_lb" "sec_gwlb" {
  name                             = "sec-gwlb-${random_id.deployment_id.hex}"
  load_balancer_type               = "gateway"
  enable_cross_zone_load_balancing = true

  subnets    = slice(local.pafw_data_subnets, 0, min(2, length(local.pafw_data_subnets)))
  depends_on = []
}

resource "aws_lb_target_group" "sec_gwlb_tg" {
  name     = "sec-gwlb-tg-${random_id.deployment_id.hex}"
  port     = 6081
  protocol = "GENEVE"
  vpc_id   = var.vpc_id
  health_check {
    port                = 443
    protocol            = "TCP"
    interval            = 10 # Check every 10 seconds
    timeout             = 5  # Timeout after 5 seconds
    healthy_threshold   = 2  # Mark as healthy after 2 successful checks
    unhealthy_threshold = 2  # Mark as unhealthy after 2 failed checks
  }
}

resource "aws_lb_target_group_attachment" "sec_gwlb_tg_attachment" {
  count            = length(var.availability_zones)
  target_group_arn = aws_lb_target_group.sec_gwlb_tg.arn
  target_id        = aws_instance.firewall_instance[count.index].id
  port             = 6081

  depends_on = [aws_instance.firewall_instance]
}

resource "aws_lb_listener" "sec_gwlb_listener" {
  load_balancer_arn = aws_lb.sec_gwlb.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sec_gwlb_tg.arn
  }
  depends_on = [aws_lb.sec_gwlb, aws_lb_listener.sec_gwlb_listener]
}

resource "aws_vpc_endpoint_service" "sec_gwlb_endpoint_service" {
  acceptance_required        = false
  gateway_load_balancer_arns = [aws_lb.sec_gwlb.arn]
}

resource "aws_vpc_endpoint" "gwlbe_ns_endpoint" {
  count             = length(var.availability_zones)
  service_name      = aws_vpc_endpoint_service.sec_gwlb_endpoint_service.service_name
  subnet_ids        = [local.gwlbe_ns_subnets[count.index]]
  vpc_endpoint_type = "GatewayLoadBalancer"
  vpc_id            = var.vpc_id
}

resource "aws_vpc_endpoint" "gwlbe_ew_endpoint" {
  count             = length(var.availability_zones)
  service_name      = aws_vpc_endpoint_service.sec_gwlb_endpoint_service.service_name
  subnet_ids        = [local.gwlbe_ew_subnets[count.index]]
  vpc_endpoint_type = "GatewayLoadBalancer"
  vpc_id            = var.vpc_id
}
