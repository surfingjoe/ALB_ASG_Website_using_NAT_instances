output "Controller-IP" {
  value = [aws_instance.controller.public_ip]
}