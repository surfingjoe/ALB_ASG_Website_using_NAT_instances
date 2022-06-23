resource "aws_lb_listener" "website-alb-listener" {
  load_balancer_arn = aws_lb.website-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
      
    forward {
      target_group {
        arn = aws_lb_target_group.website-target.arn
      }

      stickiness {
        enabled  = false
        duration = 1
      }
    }
  }
}