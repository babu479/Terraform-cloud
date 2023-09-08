resource "aws_eip" "nat_eip" {
    for_each = {for nat in var.public_subnet:nat.name=>nat}
    vpc=true
    tags = {
      Name= each.value.nat
    }
}
resource "aws_nat_gateway" "aws_nat_gateway" {
    for_each = aws_subnet.public_subnet
    allocation_id = aws_eip.nat_eip[each.key].id
    subnet_id = each.value.id 
  
}