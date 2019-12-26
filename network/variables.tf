# Variables
## General
variable "region" {
  default = "ap-northeast-1"
}
variable "environment" {}
variable "component" {}
## VPC
variable "vpc_cidr" {}
## Subnet
variable "public_subnets" {
  type = list(
    map(string)
  )
}
variable "protected_subnets" {
  type = list(
    map(string)
  )
}
variable "private_subnets" {
  type = list(
    map(string)
  )
}
## NACL
### Public NACL
#### Ingress
variable "public_ingress_v4_rules" {
  type = list(
    object({
      rule_no   = number
      protocol  = string
      cidr      = string
      from_port = number
      to_port   = number
    })
  )
  default = [
    {
      rule_no   = 100,
      protocol  = "tcp",
      cidr      = "0.0.0.0/0",
      from_port = 80,
      to_port   = 80
    },
    {
      rule_no   = 110,
      protocol  = "tcp",
      cidr      = "0.0.0.0/0",
      from_port = 443,
      to_port   = 443
    },
    {
      rule_no   = 120,
      protocol  = "tcp",
      cidr      = "0.0.0.0/0",
      from_port = 1024,
      to_port   = 65535
    }
  ]
}
variable "public_ingress_v6_rules" {
  type = list(
    object({
      rule_no   = number
      protocol  = string
      cidr      = string
      from_port = number
      to_port   = number
    })
  )
  default = [
    {
      rule_no   = 130,
      protocol  = "tcp",
      cidr      = "::/0",
      from_port = 80,
      to_port   = 80
    },
    {
      rule_no   = 140,
      protocol  = "tcp",
      cidr      = "::/0",
      from_port = 443,
      to_port   = 443
    },
    {
      rule_no   = 150,
      protocol  = "tcp",
      cidr      = "::/0",
      from_port = 1024,
      to_port   = 65535
    }
  ]
}
#### Egress
variable "public_egress_v4_rules" {
  type = list(
    object({
      rule_no   = number
      protocol  = string
      cidr      = string
      from_port = number
      to_port   = number
    })
  )
  default = [
    {
      rule_no   = 100,
      protocol  = "tcp",
      cidr      = "0.0.0.0/0",
      from_port = 80,
      to_port   = 80
    },
    {
      rule_no   = 110,
      protocol  = "tcp",
      cidr      = "0.0.0.0/0",
      from_port = 443,
      to_port   = 443
    },
    {
      rule_no   = 120,
      protocol  = "tcp",
      cidr      = "0.0.0.0/0",
      from_port = 1024,
      to_port   = 65535
    }
  ]
}
variable "public_egress_v6_rules" {
  type = list(
    object({
      rule_no   = number
      protocol  = string
      cidr      = string
      from_port = number
      to_port   = number
    })
  )
  default = [
    {
      rule_no   = 130,
      protocol  = "tcp",
      cidr      = "::/0",
      from_port = 80,
      to_port   = 80
    },
    {
      rule_no   = 140,
      protocol  = "tcp",
      cidr      = "::/0",
      from_port = 443,
      to_port   = 443
    },
    {
      rule_no   = 150,
      protocol  = "tcp",
      cidr      = "::/0",
      from_port = 1024,
      to_port   = 65535
    }
  ]
}
### Protected NACL
#### Ingress
variable "protected_ingress_v4_rules" {
  type = list(
    object({
      rule_no   = number
      protocol  = string
      cidr      = string
      from_port = number
      to_port   = number
    })
  )
  default = [
  ]
}
variable "protected_ingress_v6_rules" {
  type = list(
    object({
      rule_no   = number
      protocol  = string
      cidr      = string
      from_port = number
      to_port   = number
    })
  )
  default = [
  ]
}
###e Egress
variable "protected_egress_v4_rules" {
  type = list(
    object({
      rule_no   = number
      protocol  = string
      cidr      = string
      from_port = number
      to_port   = number
    })
  )
  default = [
  ]
}
variable "protected_egress_v6_rules" {
  type = list(
    object({
      rule_no   = number
      protocol  = string
      cidr      = string
      from_port = number
      to_port   = number
    })
  )
  default = [
  ]
}
### Private NACL
#### Ingress
variable "private_ingress_v4_rules" {
  type = list(
    object({
      rule_no   = number
      protocol  = string
      cidr      = string
      from_port = number
      to_port   = number
    })
  )
  default = [
  ]
}
variable "private_ingress_v6_rules" {
  type = list(
    object({
      rule_no   = number
      protocol  = string
      cidr      = string
      from_port = number
      to_port   = number
    })
  )
  default = [
  ]
}
#### Egress
variable "private_egress_v4_rules" {
  type = list(
    object({
      rule_no   = number
      protocol  = string
      cidr      = string
      from_port = number
      to_port   = number
    })
  )
  default = [
  ]
}
variable "private_egress_v6_rules" {
  type = list(
    object({
      rule_no   = number
      protocol  = string
      cidr      = string
      from_port = number
      to_port   = number
    })
  )
  default = [
  ]
}
## IAM
variable "role_flowlog" {}
## S3
variable "bucket_flowlog" {}
## cloudwatch logs
variable "cwlogs_flowlog" {}
