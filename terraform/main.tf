terraform {
  backend "s3" {
    bucket         = "manikanta-tf-state-demo"
    key            = "ec2/dev.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "test" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"
}
