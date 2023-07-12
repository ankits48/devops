data "aws_vpc" "existing_vpc" {
  id = "vpc-087ef39f3d7e0a56c" # Replace with your VPC ID
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = data.aws_vpc.existing_vpc.id
  cidr_block              = "10.5.11.0/24"
  availability_zone       = "us-east-1a"
   map_public_ip_on_launch = "false"
   tags = {
    Name = "dev-private-us-east-1b-1"
  }
}
resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = data.aws_vpc.existing_vpc.id
  cidr_block              = "10.5.10.0/24"
  availability_zone       = "us-east-1b"
   map_public_ip_on_launch = "false"
   tags = {
    Name = "dev-private-us-east-1b-2"
  }
}

# data "aws_nat_gateway" "existing_nat_gateway-1" {
#   id = "nat-04332782e7124190f"
# }

data "aws_route_table" "route-table-1" {
  route_table_id = "rtb-0014c933f8cafdbed"
}
# resource "aws_route_table" "private_subnet_1_route_table" {
#   vpc_id = data.aws_vpc.existing_vpc.id
# }

# resource "aws_route" "private_subnet_1_nat_route-1" {
#   route_table_id         = data.aws_route_table.route-table-1.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = data.aws_nat_gateway.existing_nat_gateway-1.id
# }

resource "aws_route_table_association" "existing_association-1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = data.aws_route_table.route-table-1.id

}
# data "aws_nat_gateway" "existing_nat_gateway-2" {
#   id = "nat-0b959ab1e79f345f7"
# }

data "aws_route_table" "route-table-2" {
  route_table_id = "rtb-03bb1edc2de03fa55"
}

# resource "aws_route_table" "private_subnet_2_route_table" {
#   vpc_id = data.aws_vpc.existing_vpc.id
# }

resource "aws_route_table_association" "existing_association-2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = data.aws_route_table.route-table-2.id
}

# resource "aws_route" "private_subnet_1_nat_route-2" {
#   route_table_id         = data.aws_route_table.route-table-2.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = data.aws_nat_gateway.existing_nat_gateway-2.id
# }