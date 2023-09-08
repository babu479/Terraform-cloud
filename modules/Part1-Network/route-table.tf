resource "aws_route_table" "private_table" {
    for_each={for routes in var.private_subnet:routes.name=>routes}
    vpc_id = aws_vpc.vpc1.id
    tags = {
      Name = each.value.rt
}
}
resource "aws_route_table_association" "private_subnet_association" {
    for_each = aws_subnet.private_subnet
    subnet_id = each.value.id
    route_table_id = aws_route_table.private_table[each.key].id
  
}
resource "aws_route_table" "public_table" {
    for_each={for routes in var.public_subnet:routes.name=>routes}
    vpc_id = aws_vpc.vpc1.id
    tags = {
      Name = each.value.rt
}
}
resource "aws_route_table_association" "public_subnet_association" {
    for_each = aws_subnet.public_subnet
    subnet_id = each.value.id
    route_table_id = aws_route_table.public_table[each.key].id
  
}
