resource "aws_instance" "bootstrap" {
  ami           = var.ami
  instance_type = var.type
  subnet_id     = var.subnet_id
  vpc_security_group_ids =  [var.openshift_sno_sg] #[data.terraform_remote_state.vpc.outputs.openshift_sno_sg]
  associate_public_ip_address = true
  key_name = "OSKEY"
  tags = {
    Name = "bootstrap"
  }
}