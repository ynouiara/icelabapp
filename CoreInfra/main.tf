provider aws {}

resource "aws_vpc" "myvpc" {
  cidr_block = "${var.cidr_vpc}"

  tags = {
    Name = "icelab"
  }
}

resource "aws_subnet" "mysubnet" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "${var.cidr_subnet}"

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

resource "aws_route_table_association" "myrta" {
  subnet_id      = "${aws_subnet.mysubnet.id}"
  route_table_id = "${aws_route_table.myrt.id}"
}
