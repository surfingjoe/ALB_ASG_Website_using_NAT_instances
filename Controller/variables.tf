variable "region" {
  description = "The region Terraform deploys your instances"
  type        = string
  default     = "us-west-2"
}

variable "aws_key_name" {
  type    = string
  default = "Mykey"
}
variable "instance_type" {
  description = "Type of EC2 instance to use"
  type        = string
  default     = "t2.micro"
}
variable "environment" {
  description = "User selects environment"
  type = string
  default = "Test"
}
variable "your_name" {
  description = "Your Name?"
  type = string
  default = "Joe"
}