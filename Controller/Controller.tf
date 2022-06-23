terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}

#------------------------- State terraform backend location---------------------
data "terraform_remote_state" "vpc" {
  backend = "s3" 
  config = {
    bucket = "surfingjoes-terraform-states"
    key    = "terraform.tfstate"
    region = "us-west-1"
  }
}

# --------------------- Determine region from backend data -------------------
# provider "aws" {
#   region = data.terraform_remote_state.vpc.outputs.public_subnets
# }

# # --------------------- Determine region from backend data -------------------
# provider "aws" {
#   region = data.terraform_remote_state.vpc.outputs.aws_region
# }

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "controller" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  key_name               = var.aws_key_name
  subnet_id              = data.terraform_remote_state.vpc.outputs.public_subnet_ids [0]
  vpc_security_group_ids = data.terraform_remote_state.vpc.outputs.Controller-sg_id
  user_data              = file("bootstrap_controller.sh")

  tags = {
    Name = "controller"
  }
}


