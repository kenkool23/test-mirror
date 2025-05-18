
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
  source             = "./module"
  bucket_name        = "my-deployed-bucket-kenkool"
  enabled_versioning = true
  bucket_object = {
    "file1" = {
      object_key  = "my-key-1"
      object_path = "file1.txt"
    },
    "file2" = {
      object_key  = "my-key-2"
      object_path = "file2.txt"
    }
  }
}