#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Mahmoud Mohamed   #
#                                   #
#####################################

provider "aws" {

  region     = "us-east-1"
  access_key = ""
  secret_key = ""

}

resource "aws_instance" "intro" {

  ami                    = "ami-067d1e60475437da2"
  instance_type          = "t2.micro"
  key_name               = "aws"
  vpc_security_group_ids = ["sg-02f3805c7e74703b8"]

  tags = {

    Name    = "Dove-Instance"
    Project = "Dove"

  }

}
