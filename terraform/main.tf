
provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "test-bucket-sgdfsjdsksd"
    key    = "states"
    region = "us-east-1"
  }
}


module "bucket" {
  source      = "./module"
  bucket_name = "my-deployed-bucket-kenkool"
}