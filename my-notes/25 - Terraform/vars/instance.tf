#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Mahmoud Mohamed   #
#                                   #
#####################################

resource "aws_instance" "dove-inst" {

  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "aws"
  vpc_security_group_ids = ["sg-02f3805c7e74703b8"]

  tags = {

    Name    = "Dove-Instance"
    Project = "Dove"

  }

}
