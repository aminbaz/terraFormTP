resource "aws_subnet" "subnet10" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.10.0/24"
  availability_zone = "eu-west-3a"
}

resource "aws_subnet" "subnet12" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.12.0/24"
}

resource "aws_subnet" "subnet13" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.13.0/24"
}