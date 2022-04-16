# Add output variables
output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}



output "lb_dns_name" {
  description = "The DNS of elastic load balancer."
  value       = module.elb.lb_dns_name
}

# Step 10 - Add output variables
output "public_ip" {
  value = aws_instance.webserver[*].public_ip
}