resource "aws_security_group" "openshift_sno_sg" {
  name        = "${var.cluster_name}-openshift-sno-sg"
  description = "Security group for OpenShift SNO node encompassing both control plane and worker functionalities"
  vpc_id      =  aws_vpc.vpc.id

  tags = {
    "Name" = "${var.cluster_name}-openshift-sno-sg"
  }

  # Egress rule to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 represents all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Ingress rule for OpenShift API server
  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  # Ingress rule for SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #[aws_ec2.bootstrap.public_ip, aws_ec2.bootstrap.private_ip]
  }

  # Ingress for NodePort services range
  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

tags_all = {
    "Name" = "${var.cluster_name}-openshift-sno-sg"
  }
  # Additional ingress rules for other necessary services can be added here
  # Example: Metrics, logging, or application-specific ports
}
