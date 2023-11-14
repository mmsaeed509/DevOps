#!/bin/bash

#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Exodia OS         #
#                                   #
#####################################

## Install Tomcat ##
su - \
apt update && apt upgrade -y \
apt install openjdk-8-jdk tomcat8 tomcat8-admin \
tomcat8-docs tomcat8-common git -y
