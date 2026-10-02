FROM ubuntu:latest
RUN apt update && apt install -y sudo

WORKDIR /
RUN apt install apache2 -y
RUN apt install libapache2-mod-php -y
RUN apt install iputils-ping -y
WORKDIR /var/www/html

COPY html/index.php ./
COPY html/index.html ./
RUN mkdir ./static
COPY html/static/general.css ./static/
COPY html/static/general.js ./static/
COPY .htaccess ./.htaccess

WORKDIR /etc/apache2/sites-available/
COPY cmdinjection.conf ./
RUN a2ensite cmdinjection.conf
RUN a2dissite 000-default.conf
RUN a2enmod rewrite
EXPOSE 80
EXPOSE 1234

CMD ["apachectl", "-D", "FOREGROUND"]