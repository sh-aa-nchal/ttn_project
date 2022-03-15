resource "aws_default_vpc" "default" {
    tags = {
        Name = "Default VPC"
    }
  
}

resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = []
  subnets            = [var.subnet1, var.subnet2]

  enable_deletion_protection = true


  tags = {
    Environment = "production"
  }
}

resource "aws_placement_group" "test" {
  name     = "test"
  strategy = "cluster"
}
