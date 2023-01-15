// AWS EC2
resource "aws_instance" "test" {
  count                       = var.servers
  instance_type               = var.instance_type
  ami                         = var.image
  associate_public_ip_address = "true"
  key_name                    = var.key
  subnet_id                   = var.subnet-private-a
  vpc_security_group_ids      = [var.ec2-sg]

  tags = local.common_tags

  root_block_device {
    volume_size = var.volume-size
  }
}
