provider "aws" {
  region = var.region
}

resource "aws_security_group" "monitoring" {
  name        = "monitoring-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.your_ip]
  }

  ingress {
    from_port   = 8086
    to_port     = 8086
    protocol    = "tcp"
    cidr_blocks = [var.your_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "monitoring_node" {
  ami           = var.ami_id
  instance_type = "t3.small"
  key_name      = var.key_pair
  vpc_security_group_ids = [aws_security_group.monitoring.id]
  user_data     = file("${path.module}/install.sh")

  tags = {
    Name = "InfluxDB2-Monitoring"
  }
}
