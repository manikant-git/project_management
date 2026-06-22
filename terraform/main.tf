terraform {
  backend "s3" {
    bucket         = "manikanta-tf-state-demo"
    key            = "ec2/dev.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "test" {
  ami           = "ami-023b6eace47afd3b4"
  instance_type = "t2.micro"
}
