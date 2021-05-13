resource "aws_internet_gateway" "main"{
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.env}-igv"
  }
}

resource "aws_nat_gateway" "nat" {
  count = length(var.private_subnet_cidrs)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
  tags = {
    Name = "${var.env}-nat-gw-${count.index + 1}"
  }
}
