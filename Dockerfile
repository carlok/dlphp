FROM ubuntu:trusty

RUN apt update
RUN apt-get -y install apache2
RUN apt-get -y install apache2-utils
RUN apt-get -y install libapache2-mod-php5
RUN apt-get -y install php-tcpdf php5-cli php5-curl php5-gd php5-mcrypt php5-mysql php5-readline pkg-php-tools
RUN apt-get clean

EXPOSE 80

RUN cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/ && \
    cp /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled/
CMD ["apache2ctl", "-D", "FOREGROUND"]
