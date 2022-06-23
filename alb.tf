resource "random_pet" "app" {
  length    = 2
  separator = "-"
}

resource "aws_lb" "website-alb" {
  name               = "main-app-${random_pet.app.id}-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public-1.id, aws_subnet.public-2.id]
  security_groups    = ["${aws_security_group.alb-sg.id}"]
}