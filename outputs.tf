output "aws_region" {
  description = "AWS region"
  value       = data.aws_region.current.name
}

output "vpc_id" {
  description = "Output VPC ID"
  value       = aws_vpc.my-vpc.id
}

output "Controller-sg_id" {
  description = "Security group IDs for Controller"
  value       = [aws_security_group.controller-ssh.id]
}

output "web-sg_id" {
  description = "Security group IDs for Web servers"
  value       = [aws_security_group.web-sg.id]
}

output "alb-sg_id" {
  description = "Security group IDs for Web servers"
  value       = [aws_security_group.alb-sg.id]
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = [aws_subnet.public-1.id,aws_subnet.public-2.id]
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = [aws_subnet.private-1.id,aws_subnet.private-2.id]
}

output "lb_dns_name" {
  value = aws_lb.website-alb.dns_name
}