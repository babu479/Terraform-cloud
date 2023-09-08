output "vpc_output" {
    value = aws_vpc.vpc1.id
}
output "subnet_output" {
    value = aws_subnet.private_subnet
  
}
output "route_table_output" {
    value = aws_route_table.private_table
  
}
output "route_table_association" {
    value=aws_route_table_association.private_subnet_association
  
}