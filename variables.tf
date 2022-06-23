
variable "ssh_location" {
  type        = string
  description = "My Public IP Address"
}
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "av-zone1" {
  type    = string
}
variable "av-zone2" {
  type    = string
}
variable "public_cidr" {
  type    = string
  default = "10.0.1.0/24"
}
variable "public_cidr2" {
  type    = string
  default = "10.0.2.0/24"
}
variable "private_cidr" {
  type    = string
  default = "10.0.101.0/24"
}
variable "private_cidr2" {
  type    = string
  default = "10.0.102.0/24"
}

variable "nickname" {
  type    = string
}
variable "region" {
  type = string
}
variable "key" {
  type = string
}
variable "instance_type" {
  description = "Type of EC2 instance to use"
  type        = string
  default     = "t2.micro"
}
variable "environment" {
  description = "User selects environment"
  type        = string
}
variable "your_name" {
  description = "Your Name?"
  type        = string
}