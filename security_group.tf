resource "aws_security_group" "mysg" {
	vpc_id = "vpc-0667d8087f224dbf6"
	name = "tf-ssh"
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
	security_group_id = aws_security_group.mysg.id
	cidr_ipv4 = "0.0.0.0/0"
	from_port = 22
	to_port = 22
	ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "all" {
	security_group_id = aws_security_group.mysg.id
	cidr_ipv4 = "0.0.0.0/0"
	ip_protocol = "-1"
}
