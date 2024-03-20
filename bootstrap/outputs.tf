output "ec2_private_ip" {
  value = aws_instance.bootstrap.private_ip
  description = "The private IP address of the bootstrap node."
}

output "ec2_public_ip" {
  value = aws_instance.bootstrap.public_ip
  description = "The public IP address of the bootstrap node."
}

