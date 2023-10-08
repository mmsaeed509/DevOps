#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Mahmoud Mohamed   #
#                                   #
#####################################


variable "REGION" {

  default = "us-east-1"

}

variable "ZONE1" {

  default = "us-east-1a"

}

variable "AMIS" {

  type = map(any)

  default = {

    us-east-1 = "ami-067d1e60475437da2"
    us-east-2 = "ami-036f5574583e16426"

  }

}