resource "aws_subnet" "private_subnet" {
    for_each={for subnet in var.private_subnet:subnet.name=>subnet}
    vpc_id = aws_vpc.vpc1.id
    availability_zone = each.value.az
    cidr_block = each.value.cidr
    tags ={
        Name = each.value.name
    }
  
}
resource "aws_subnet" "public_subnet" {
    for_each = {for subnet in var.public_subnet:subnet.name=>subnet}
    vpc_id = aws_vpc.vpc1.id
    availability_zone = each.value.az
    cidr_block = each.value.cidr
    tags = {
      Name=each.value.name
    }

  
}