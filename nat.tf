# Creating a NAT gateway in public subnet 1




####
resource "aws_nat_gateway" "nat1" {
  


  # Allocating the Elastic IP to the NAT Gateway!
  allocation_id = aws_eip.eip_nat1.id
  
  # Associating it in the Public Subnet!
  subnet_id = aws_subnet.public_sub1.id
  tags = {
    Name = "NAT gateway 1"
  }
}

resource "aws_nat_gateway" "nat2" {
 

  # Allocating the Elastic IP to the NAT Gateway!
  allocation_id = aws_eip.eip_nat2.id
  
  # Associating it in the Public Subnet!
  subnet_id = aws_subnet.public_sub2.id
  tags = {
    Name = "NAT gateway 2"
  }
}

# Creating a Route Table for the Nat Gateway 
resource "aws_route_table" "route_tb_nat1" {
  depends_on = [
    aws_nat_gateway.nat1
  ]

  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat1.id
  }

  tags = {
    Name = "Route Table for NAT Gateway 1"
  }

}

resource "aws_route_table" "route_tb_nat2" {
  depends_on = [
    aws_nat_gateway.nat2
  ]

  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat2.id
  }

  tags = {
    Name = "Route Table for NAT Gateway 2"
  }

}


# Associating route table for NAT gateway to public subnet A
resource "aws_route_table_association" "nat1_association" {
  depends_on = [
    aws_route_table.route_tb_nat2
  ]

#  Private Subnet ID for adding this route table to the DHCP server of Private subnet!
  subnet_id      = aws_subnet.private_sub1.id

# Route Table ID
  route_table_id = aws_route_table.route_tb_nat1.id
}

# Associating route table for NAT gateway to public subnet B
resource "aws_route_table_association" "nat2_association" {
  depends_on = [
    aws_route_table.route_tb_nat2
  ]

  #Private Subnet ID for adding this route table to the DHCP server of Private subnet!
  subnet_id      = aws_subnet.private_sub2.id

 #Route Table ID
  route_table_id = aws_route_table.route_tb_nat2.id
}
