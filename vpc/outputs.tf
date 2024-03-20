output "public_subnets" {
  value = aws_subnet.public
}

output "private_subnets" {
  value = aws_subnet.private
}

output "zone_private_subnet" {
  value = zipmap(values(aws_subnet.private)[*].availability_zone, values(aws_subnet.private)[*].id)
}

output "zone_public_subnet" {
  value = zipmap(values(aws_subnet.public)[*].availability_zone, values(aws_subnet.public)[*].id)
}

// In /path/to/vpc-module/outputs.tf

output "openshift_sno_sg" {
  value = aws_security_group.openshift_sno_sg.id
  description = "The ID of the control plane security group."
}

# Inside your VPC module (vpc.tf or outputs.tf within the VPC module directory)
