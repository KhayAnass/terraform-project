resource "aws_eip" "eip_nat1" {
    depends_on = [ aws_internet_gateway.igw
      
    ]
  
}

resource "aws_eip" "eip_nat2" {
    depends_on = [ aws_internet_gateway.igw
      
    ]
  
}