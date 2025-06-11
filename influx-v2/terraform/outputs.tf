output "monitoring_instance_ip" {
  value = aws_instance.monitoring_node.public_ip
}
