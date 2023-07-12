// public subnet 1
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.first-vpc.id 
  cidr_block = var.subnet1-cidr
  availability_zone = var.subnet_az
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public_subnet-1"
  }
}


// public subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.first-vpc.id 
  cidr_block = var.subnet2-cidr
  availability_zone = var.subnet_az-2
    map_public_ip_on_launch = "true"

  tags = {
    Name = "public_subnet-2"
  }
}

// create route table for public subnets
resource "aws_route_table" "first-rt" {
  vpc_id = aws_vpc.first-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.first-igw.id
  }
  tags = {
    Name = "first-rt"
  }
}

// associate public subnet 1 with route table 
resource "aws_route_table_association" "demo-rt_association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id 
  route_table_id = aws_route_table.first-rt.id
}

// associate public subnet 2 with route table 
resource "aws_route_table_association" "demo-rt_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id 
  route_table_id = aws_route_table.first-rt.id
}