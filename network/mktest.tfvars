# variables
## General
region      = "ap-northeast-1"
environment = "mktest"
component   = "network"
## VPC
vpc_cidr = "10.0.0.0/18"
## Subnet
public_subnets = [
  { cidr = "10.0.0.0/22", az = "ap-northeast-1a" },
  { cidr = "10.0.4.0/22", az = "ap-northeast-1c" },
  { cidr = "10.0.8.0/22", az = "ap-northeast-1d" }
]
protected_subnets = [
  { cidr = "10.0.16.0/22", az = "ap-northeast-1a" },
  { cidr = "10.0.20.0/22", az = "ap-northeast-1c" },
  { cidr = "10.0.24.0/22", az = "ap-northeast-1d" }
]
private_subnets = [
  { cidr = "10.0.32.0/22", az = "ap-northeast-1a" },
  { cidr = "10.0.36.0/22", az = "ap-northeast-1c" },
  { cidr = "10.0.40.0/22", az = "ap-northeast-1d" }
]
## NACL
### Public
public_ingress_v4_rules = [
  {
    rule_no   = 100,
    protocol  = "tcp",
    cidr      = "0.0.0.0/0",
    from_port = 443,
    to_port   = 443
  },
  {
    rule_no   = 110,
    protocol  = "tcp",
    cidr      = "0.0.0.0/0",
    from_port = 1024,
    to_port   = 65535
  },
  {
    rule_no   = 120,
    protocol  = "tcp",
    cidr      = "10.0.0.0/18",
    from_port = 22,
    to_port   = 22
  }
]
public_egress_v4_rules = [
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
  },
  {
    rule_no   = 130,
    protocol  = "tcp",
    cidr      = "10.0.0.0/18",
    from_port = 22,
    to_port   = 22
  }
]
public_ingress_v6_rules = []
public_egress_v6_rules  = []
### Protected
protected_ingress_v4_rules = [
  {
    rule_no   = 100,
    protocol  = "tcp",
    cidr      = "10.0.0.0/18",
    from_port = 80,
    to_port   = 80
  },
  {
    rule_no   = 110,
    protocol  = "tcp",
    cidr      = "10.0.0.0/18",
    from_port = 1024,
    to_port   = 65535
  }
]
protected_egress_v4_rules = [
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
### Private
private_ingress_v4_rules = []
private_egress_v4_rules  = []
## IAM
role_flowlog = "__flowlog"
## S3
bucket_flowlog = "mksredmmflowlog"
## cloudwatch logs
cwlogs_flowlog = "/flowlog"
