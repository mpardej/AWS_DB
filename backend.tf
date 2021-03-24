terraform {
  required_version = ">=0.12.13"
  backend "s3" {
    bucket         = "s3bucket-aws-wmakarzak01"
    key            = "db/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "aws-locks-wmakarzak"
    encrypt        = true
  }
}