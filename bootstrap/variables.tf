variable "ami" {
  type = string
}

variable "type" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "subnet_id" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "ssh_key" {
}

variable "openshift_version" {
  type = string
}

variable "region" {
  type = string
}

variable "domain" {
  type = string
}

variable "openshift_sno_sg" {
  type = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key used for the OpenShift installation"
  type        = string
}