# créatiion  internet gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    "Name" = "igw"
  }
}

# creating a route table 
resource "aws_route_table" "route_tb" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    "Name" = "rtb"
  }
}
# creating a route

resource "aws_route" "route_tb" {
  route_table_id = aws_route_table.route_tb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id

}

# associating the route table to public subnet 1

resource "aws_route_table_association" "rtb_assoc1" {
  subnet_id = aws_subnet.public_sub1.id
  route_table_id = aws_route_table.route_tb.id
}

# associating the route table to public subnet 2

resource "aws_route_table_association" "rtb_assoc2" {
  subnet_id = aws_subnet.public_sub2.id
  route_table_id = aws_route_table.route_tb.id
}
