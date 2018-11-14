provider "aws" {
    region = "eu-west-3"
    version = "~> 1.0"
}

resource "aws_s3_bucket" "TD1_intro_devops_bucket"{
 bucket = "abazaz-td1-intro-devops-bucket"
 acl = "public-read"
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
}

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



resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route_table" "public_routetable" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.internet_gateway.id}"
  }
}

resource "aws_route_table_association" "public_subnet_a" {
  subnet_id      = "${aws_subnet.subnet13.id}"
  route_table_id = "${aws_route_table.public_routetable.id}"
}