resource "aws_s3_bucket" "bucket_create" {
    for_each = {for bucket in var.bucket_properties:bucket.name=>bucket}
    bucket = each.value.name
    acl = each.value.acl
    tags = {
      Name= each.value.name
    } 
}
resource "aws_s3_bucket_versioning" "backet-versioning" {
    for_each = {for bucket in var.bucket_properties:bucket.name=>bucket}
    bucket = aws_s3_bucket.bucket_create[each.key].id
    versioning_configuration {
      status = each.value.version_status
    }
}
resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_rule" {
    for_each = {for bucket in var.bucket_properties:bucket.name=>bucket}
    rule {
      id = each.value.lifecycle_id
      status = each.value.lifecycle_status
      transition {
          storage_class = each.value.storage_class
          days = each.value.expire_day
        }

    }
    bucket = aws_s3_bucket.bucket_create[each.key].id
  
}