# Allocate an Elastic IP for the NAT gateway
resource "aws_eip" "nat_eip" {

  public_ipv4_pool = "amazon"
  tags             = {}
  domain           = "vpc"
  timeouts {}

}

# Create a NAT gateway in the public subnet
resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id
}
