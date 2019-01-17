provider aws {}

resource "aws_vpc" "myvpc" {
  cidr_block = "172.23.0.0/16"

  tags = {
    Name = "icelab"
  }
}

resource "aws_subnet" "mysubnet" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "172.23.1.0/24"

  tags = {
    Name = "icelab"
  }
}

resource "aws_internet_gateway" "myig" {
  vpc_id = "${aws_vpc.myvpc.id}"

  tags = {
    Name = "icelab"
  }
}

resource "aws_route_table" "myrt" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.myig.id}"
  }

  tags {
    Name = "icelab"
  }
}
