# Define the provider
provider "aws" {
  region = "us-east-1"
}

# Data source for availability zones in us-east-1
data "aws_availability_zones" "available" {
  state = "available"
}

# Local variables
locals {
  default_tags = merge(
    var.default_tags,
    { "Env" = var.env }
  )
  name_prefix = "${var.prefix}-${var.env}"
}

resource "aws_lb" "elb" {
  name               = "elb-${var.env}"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnets
  tags = merge(local.default_tags,
    {
      "Name" = "${local.name_prefix}-ELB"
    }
  )
}


resource "aws_lb_listener" "elb_listener" {
  load_balancer_arn = aws_lb.elb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

# resource "aws_lb_target_group" "target_group" {
#   health_check {
#     interval            = 10
#     path                = "/"
#     protocol            = "HTTP"
#     timeout             = 5
#     healthy_threshold   = 5
#     unhealthy_threshold = 2
#   }
#   name        = "tg-elb-${var.env}"
#   port        = 80
#   protocol    = "HTTP"
#   target_type = "instance"
#   vpc_id      = var.vpc_id
# }

# Use remote state to retrieve the data
data "terraform_remote_state" "network" { // This is to use Outputs from Remote State
  backend = "s3"
  config = {
    bucket = "terraform-devs3"                // Bucket from where to GET Terraform State
    key    = "dev/network/terraform.tfstate" // Object name in the bucket to GET Terraform State
    region = "us-east-1"                         // Region where bucket created
  }
}

resource "aws_lb_target_group" "target_group" {
  name     = "tg-elb-${var.env}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.network.outputs.vpc_id

  tags = {
    Name = "tg-elb-${var.env}",
  Env = var.env 
  }
}