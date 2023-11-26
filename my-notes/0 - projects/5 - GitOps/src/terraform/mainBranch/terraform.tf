#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Mahmoud Mohamed   #
#                                   #
#####################################

terraform {

  required_providers {

    aws = {

      source  = "hashicorp/aws"
      version = "~> 5.25.0"

    }

    random = {

      source  = "hashicorp/random"
      version = "~> 3.5.1"

    }

    tls = {

      source  = "hashicorp/tls"
      version = "~> 4.0.4"

    }

    cloudInit = {

      source  = "hashicorp/cloudInit"
      version = "~> 2.3.2"

    }

    kubernetes = {

      source  = "hashicorp/kubernetes"
      version = "~> 2.23.0"

    }

  }

  backend "s3" {

    bucket = "gitopsterrastate"
    key    = "terraform.tfstate"
    region = "us-east-2"

  }

  required_version = "~> 1.6.3"

}
