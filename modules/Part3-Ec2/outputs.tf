output "InstaceId" {
    value = aws_instance.instance.id
  
}
output "PublicIp" {
    value = aws_instance.instance.arn
  
}
output "aws_key" {
    value = aws_instance.instance.key_name
  
}
output "aws_security_group" {
    value = aws_instance.instance.security_groups
  
}