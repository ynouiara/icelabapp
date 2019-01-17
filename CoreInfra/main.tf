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
