provider "aws" {
  region = var.region
}

locals {
  ami          = var.amis[var.region]
  cluster_name = local.full_cluster_name
  tags = merge(var.tags, {
    owned-by = local.cluster_name
  })
}

resource "tls_private_key" "ocp4_installer" {
  algorithm = "RSA"
}

resource "aws_key_pair" "ocp4_installer_aws" {
  key_name   = local.cluster_name
  public_key = tls_private_key.ocp4_installer.public_key_openssh
}

module "bootstrap" {
  source = "./bootstrap"

  ami               = local.ami
  subnet_id         = module.vpc.public_subnets[var.availability_zones[0]].id
  tags              = local.tags
  type              = var.bootstrap.instance_type
  ssh_key           = aws_key_pair.ocp4_installer_aws.id
  cluster_name      = local.cluster_name
  openshift_version = var.openshift_version
  region            = var.region
  domain            = var.base_domain
  openshift_sno_sg  = module.vpc.openshift_sno_sg
  ssh_public_key_path = var.ssh_public_key_path
}

module "controlPlane" {
  source = "./controlPlane"

  ami = local.ami
}

module "route53" {
  source = "./route53"
}

module "vpc" {
  source = "./vpc"

  tags               = local.tags
  vpc_cidr_block     = var.vpc_cidr_block
  cluster_name       = local.cluster_name
  availability_zones = var.availability_zones
  region             = var.region
}
