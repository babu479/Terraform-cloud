variable "vpc_name" {
    type = string
    default = "Hukum-vpc1"
  
}
variable "vpc-cidr" {
    type = string
    default = "10.0.0.0/16"  
}

variable "private_subnet" {
    type=list(object({
        name = string
        cidr = string
        az   = string
        rt  = string

    }))
    default = [ 
    {
        name="subnet_private_db1"
        cidr="10.0.0.0/19"
        az="us-east-1a"
        rt="RouteTable_DB_Private"
    },
    {
        name="subnet_private_db2"
        cidr="10.0.32.0/19"
        az="us-east-1b"
        rt="RouteTable_DB_Private"

    },
    {
        name="subnet_private_app1"
        cidr="10.0.64.0/19"
        az="us-east-1a"
        rt="RouteTable_App_Private"
    },
    {
        name="subnet_private_app2"
        cidr="10.0.96.0/19"
        az="us-east-1b"
        rt="RouteTable_App_Private"
    },
    {
        name="subnet_private_web1"
        cidr="10.0.128.0/19"
        az="us-east-1a"
        rt="RouteTable_Web_Private"
    },
    {
        name="subnet_private_web2"
        cidr="10.0.160.0/19"
        az="us-east-1b"
        rt="RouteTable_Web_Private"
    }]
}
variable "public_subnet" {
    type=list(object({
        name=string
        cidr=string
        az=string
        rt=string
        nat=string
    }))
    default = [
    {
        name="subnet_public1"
        cidr="10.0.192.0/19"
        az="us-east-1a"
        rt="RouteTable_Public"
        nat="Nat1"
    },
    {
        name="subnet_public2"
        cidr="10.0.224.0/19"
        az="us-east-1b"
        rt="RouteTable_Public"
        nat="Nat2"
    }]
}
variable "igw_name" {
  type = string
  default = "Hukum-igw"
}

variable "bucket_name"{
    type=string
    default = "hukum-code-s3"
}
variable "acl_value" {
    type = string
    default = "private"
}
variable "S3-Setup" {
    type = list(object({
        name=string
        acl=string
        storage_class=string
        expire_day=number
        lifecycle_id=string
        lifecycle_status=string
        version_status=string

    }))
    default = [ {
      name = "hukum-code-s3"
      acl = "private"
      lifecycle_id = "hukum-lifecycle"
      lifecycle_status = "Enabled"
      storage_class = "STANDARD_IA"
      version_status = "Enabled"
      expire_day=35 
    } ]
  
}

