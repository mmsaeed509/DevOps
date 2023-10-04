#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Mahmoud Mohamed   #
#                                   #
#####################################

# get ubuntu container #
FROM ubuntu:latest

# add env var to prevent form failure #
ENV DEBIAN_FRONTEND=noninteractive

# set the label #
LABEL author="Mahmoud Mohamed"
LABEL project="Soft Landing"

# install needed pkgs #
RUN apt update && apt install apache2 git -y

# launch apache2 services #
CMD [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]

# mapping the port #
EXPOSE 80

# adding working dir #
WORKDIR /var/www/html

# save logs in volume #
VOLUME [ "/var/log/apache2" ]

# extract files #
ADD softLanding.tar.gz /var/www/html
