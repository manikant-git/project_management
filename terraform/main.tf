terraform {
  backend "s3" {
    bucket         = "manikanta-tf-state-demo"
    key            = "lock-lab/dev.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-locks"
  }

  required_providers {
    time = {
      source  = "hashicorp/time"
      version = "~> 0.13"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "time_sleep" "wait" {
  create_duration = "300s"
}
