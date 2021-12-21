## Security Groups settings ##

resource "aws_security_group" "sg" {
  name        = var.security_group_name
  description = "Custom security group"
  vpc_id      = var.vpc_id
  tags = merge(var.common_tags, { Type = var.environment })
} 

resource "aws_security_group_rule" "ingress" {
  count = length(var.ingress_ports) 
  security_group_id = aws_security_group.sg.id
  type = "ingress"
  from_port = element(var.rules[var.ingress_ports[count.index].rule], 0)
  to_port = element(var.rules[var.ingress_ports[count.index].rule], 1)
  protocol = element(var.rules[var.ingress_ports[count.index].rule], 2)
  cidr_blocks = var.ingress_ports[count.index].cidr_blocks
}

resource "aws_security_group_rule" "egress" {
  count = length(var.egress_ports) 
  security_group_id = aws_security_group.sg.id
  type = "egress"
  from_port = element(var.rules[var.egress_ports[count.index].rule], 0)
  to_port = element(var.rules[var.egress_ports[count.index].rule], 1)
  protocol = element(var.rules[var.egress_ports[count.index].rule], 2)
  cidr_blocks = var.egress_ports[count.index].cidr_blocks
}


  


