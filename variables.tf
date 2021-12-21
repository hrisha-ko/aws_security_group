## Region name ##
variable "aws_region" {
  default = ""
}

## VPC ID ##
variable "vpc_id" {
  description = "VPC id"
  type = string
  default = ""
}

## Common information ##
variable "common_tags" {
  description = "Common tags"
  type        = map(any)
  default = {
    Owner   = ""
    Company = ""
  }
}

## Security group name ##
variable  "security_group_name" {
  description = "Security group name"
  type = string
  default = ""
}

## Type of environment ##
variable "environment" {
  description = "Type of working environment"
  type        = string
  default     = ""
}

## The list of Ingress ports from rules.tf file ##
variable "ingress_ports" {
  description = "Ingress ports for public servers"
  type = list(object({
    rule = string
    cidr_blocks = list(string)
  }))
  default = []
}

## The list of Egress ports from rules.tf file ##
variable "egress_ports" {
  description = "Egress ports for public servers"
  type = list(object({
    rule = string
    cidr_blocks = list(string)
  }))
  default = []
}

