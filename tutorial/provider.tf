terraform {
    required_version = "1.3.6"

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region  = "ap-northeast-2"
}
