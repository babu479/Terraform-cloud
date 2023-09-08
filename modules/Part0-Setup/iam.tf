resource "aws_iam_role" "create-role" {
    name = "RoleName"
    assume_role_policy = jsonencode({
        Version="2012-10-17"
        Statement=[{
            Action="sts:AssumeRole",
            Effect="Allow",
            Principal={
                Service="ec2.amazonaws.com"
            }

        }]
    })
    }
resource "aws_iam_policy" "policy-create" {
    for_each = aws_s3_bucket.bucket_create
    name = "S3Policy"
    policy = jsonencode({
        Version:"2012-10-17"
        Statement:[{
            Effect: "Allow"
            Action:[
                "dynamodb:GetItem"
            ],
        resource: aws_s3_bucket.bucket_create[each.key].id
        }]
    })
  
}
resource "aws_iam_policy_attachment" "policy-attached" {
    count = var.bucket_properties?1:0
    
    name="PolicyAttach"
    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    roles = [aws_iam_role.create-role.name]
    
  
}
    
  