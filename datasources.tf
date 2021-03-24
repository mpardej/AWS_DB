data "terraform_remote_state" "management_networks" {
  backend   = "s3"
  config = {
    bucket         = "s3bucket-aws-wmakarzak01"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "aws-locks-wmakarzak"
  }
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["test-vpc"]
  }
}

data "aws_security_groups" "securedb_sg" {
  filter {
    name   = "group-name"
    values = ["sqldb-service-*"]
  }
}
data "aws_subnet_ids" "sql_subnet" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["test-vpc-private*"]
  }
}

