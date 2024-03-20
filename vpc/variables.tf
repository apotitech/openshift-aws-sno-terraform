variable "tags" {
  type = map(string)
}

variable "vpc_cidr_block" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "public_subnets" {
  type    = number
  default = null
}

variable "private_subnets" {
  type    = number
  default = null
}

variable "region" {
  type = string
}

# variable "ec2_private_ip" {
#   type = string
# }

# variable "ec2_public_ip" {
#   type = string
# }
