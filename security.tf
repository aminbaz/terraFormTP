resource "aws_security_group" "allow_all" {
  name        = "my_security"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"

   ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
