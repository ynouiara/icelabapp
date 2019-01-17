provider aws {}

resource "aws_vpc" "myvpc" {
  cidr_block = "172.23.0.0/16"

  tags = {
    Name = "icelab"
  }
}
