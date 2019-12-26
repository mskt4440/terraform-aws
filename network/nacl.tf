# Create Network ACL
## Public nacl
resource "aws_network_acl" "public_nacl" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = aws_subnet.public_subnet.*.id

  dynamic "ingress" {
    for_each = var.public_ingress_v4_rules

    content {
      protocol   = ingress.value.protocol
      rule_no    = ingress.value.rule_no
      action     = "allow"
      cidr_block = ingress.value.cidr
      from_port  = ingress.value.from_port
      to_port    = ingress.value.to_port
    }
  }

  dynamic "ingress" {
    for_each = var.public_ingress_v6_rules

    content {
      protocol        = ingress.value.protocol
      rule_no         = ingress.value.rule_no
      action          = "allow"
      ipv6_cidr_block = ingress.value.cidr
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
    }
  }

  dynamic "egress" {
    for_each = var.public_egress_v4_rules

    content {
      protocol   = egress.value.protocol
      rule_no    = egress.value.rule_no
      action     = "allow"
      cidr_block = egress.value.cidr
      from_port  = egress.value.from_port
      to_port    = egress.value.to_port
    }
  }

  dynamic "egress" {
    for_each = var.public_egress_v6_rules

    content {
      protocol        = egress.value.protocol
      rule_no         = egress.value.rule_no
      action          = "allow"
      ipv6_cidr_block = egress.value.cidr
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
    }
  }

  tags = {
    Name        = format("%s-%s", var.environment, var.component)
    Environment = var.environment
    Component   = var.component
  }
}
## Protected nacl
resource "aws_network_acl" "protected_nacl" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = aws_subnet.protected_subnet.*.id

  dynamic "ingress" {
    for_each = var.protected_ingress_v4_rules

    content {
      protocol   = ingress.value.protocol
      rule_no    = ingress.value.rule_no
      action     = "allow"
      cidr_block = ingress.value.cidr
      from_port  = ingress.value.from_port
      to_port    = ingress.value.to_port
    }
  }

  dynamic "ingress" {
    for_each = var.protected_ingress_v6_rules

    content {
      protocol        = ingress.value.protocol
      rule_no         = ingress.value.rule_no
      action          = "allow"
      ipv6_cidr_block = ingress.value.cidr
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
    }
  }

  dynamic "egress" {
    for_each = var.protected_egress_v4_rules

    content {
      protocol   = egress.value.protocol
      rule_no    = egress.value.rule_no
      action     = "allow"
      cidr_block = egress.value.cidr
      from_port  = egress.value.from_port
      to_port    = egress.value.to_port
    }
  }

  dynamic "egress" {
    for_each = var.protected_egress_v6_rules

    content {
      protocol        = egress.value.protocol
      rule_no         = egress.value.rule_no
      action          = "allow"
      ipv6_cidr_block = egress.value.cidr
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
    }
  }

  tags = {
    Name        = format("%s-%s", var.environment, var.component)
    Environment = var.environment
    Component   = var.component
  }
}
## Private nacl
resource "aws_network_acl" "private_nacl" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = aws_subnet.private_subnet.*.id

  dynamic "ingress" {
    for_each = var.private_ingress_v4_rules

    content {
      protocol   = ingress.value.protocol
      rule_no    = ingress.value.rule_no
      action     = "allow"
      cidr_block = ingress.value.cidr
      from_port  = ingress.value.from_port
      to_port    = ingress.value.to_port
    }
  }

  dynamic "ingress" {
    for_each = var.private_ingress_v6_rules

    content {
      protocol        = ingress.value.protocol
      rule_no         = ingress.value.rule_no
      action          = "allow"
      ipv6_cidr_block = ingress.value.cidr
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
    }
  }

  dynamic "egress" {
    for_each = var.private_egress_v4_rules

    content {
      protocol   = egress.value.protocol
      rule_no    = egress.value.rule_no
      action     = "allow"
      cidr_block = egress.value.cidr
      from_port  = egress.value.from_port
      to_port    = egress.value.to_port
    }
  }

  dynamic "egress" {
    for_each = var.private_egress_v6_rules

    content {
      protocol        = egress.value.protocol
      rule_no         = egress.value.rule_no
      action          = "allow"
      ipv6_cidr_block = egress.value.cidr
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
    }
  }

  tags = {
    Name        = format("%s-%s", var.environment, var.component)
    Environment = var.environment
    Component   = var.component
  }
}
