resource "aws_security_group" "nginx-sg" {
	vpc_id      = aws_vpc.my-vpc.id
// Inbound rule for HTTP
ingress {
	from_port = 80
	to_port = 80
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
}

// Outbound port

egress {
	from_port = 0  // enable all port
	to_port = 0
	protocol = "-1"  // enable all protocol
	cidr_blocks = ["0.0.0.0/0"]

}


  
	tags = {
	  Name = "nginx-sg"
	}
  }
