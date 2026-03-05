FROM debian:12

RUN apt update && apt upgrade -y && \
    apt install -y git apache2 libapache2-mod-php php-mysql

RUN git clone https://github.com/construktdev/nextbikesearch.git /nextbikesearch

RUN cp -r /nextbikesearch/* /var/www/html/

RUN mv /var/www/html/web.html /var/www/html/index.html

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
