resource "aws_eip" "nat" {
  count = length(var.private_subnet_cidrs)
  vpc = true
  tags = {
    Name = "${var.env}-nat-gw-eip-${count.index + 1}"
  }
}
