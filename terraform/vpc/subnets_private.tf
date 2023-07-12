// private subnet 1

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.first-vpc.id
  cidr_block              = var.subnet1-cidr-1
  availability_zone       = var.subnet_az
   map_public_ip_on_launch = "false"
   tags = {
    Name = "private_subnet-1"
  }
}

// private subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.first-vpc.id
  cidr_block              = var.subnet2-cidr-2
  availability_zone       = var.subnet_az-2
   map_public_ip_on_launch = "false"
  tags = {
    Name = "private_subnet-2"
  }
}

// ROUTE TABLE WITH THEIR ASSOCIATIONS 

resource "aws_route_table" "private_subnet_1_route_table" {
  vpc_id = aws_vpc.first-vpc.id
}
resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_subnet_1_route_table.id
}


resource "aws_route" "private_subnet_1_nat_route" {
  route_table_id         = aws_route_table.private_subnet_1_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.my_nat_gateway.id
}

resource "aws_route_table" "private_subnet_2_route_table" {
  vpc_id = aws_vpc.first-vpc.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_subnet_2_route_table.id
}

resource "aws_route" "private_subnet_2_nat_route" {
  route_table_id         = aws_route_table.private_subnet_2_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.my_nat_gateway.id
}
