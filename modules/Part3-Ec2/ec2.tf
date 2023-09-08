resource "aws_security_group" "sg1" {
    name = "ec2-instace-group"
    ingress{
        from_port=80
        to_port=80
      cidr_blocks =  ["0.0.0.0/0"]
      protocol = "tcp"
      
    }
    ingress  {
        from_port=0
        to_port=0
        cidr_blocks=["0.0.0.0/0"]
        protocol="-1"
    }
    egress  {
        from_port=0
        to_port=0
        cidr_blocks=["0.0.0.0/0"]
        protocol="-1"
    }
  
}
resource "aws_instance" "instance" {
    ami = "ami-051f7e7f6c2f40dc1"
    instance_type="t2.medium"
    key_name = "3-tier"
    vpc_security_group_ids = [aws_security_group.sg1.id]
    tags={
        Name="Instance1"
    }
  
}