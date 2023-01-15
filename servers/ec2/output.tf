// Outputs
output "private_ip" {
  value = aws_instance.test[0].private_ip
}
