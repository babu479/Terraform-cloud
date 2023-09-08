resource "aws_internet_gateway" "igw" {
    tags = {
      Name=var.igw_name
    }
  
}
resource "aws_internet_gateway_attachment" "igw-attach" {
    vpc_id = aws_vpc.vpc1.id
    internet_gateway_id = aws_internet_gateway.igw.id
  
}