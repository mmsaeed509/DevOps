#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Mahmoud Mohamed   #
#                                   #
#####################################

variable "region" {

  description = "AWS region"
  type        = string
  default     = "us-east-2"

}

variable "clusterName" {

  description = "Name of the EKS cluster"
  type        = string
  default     = "kitops-eks"

}
