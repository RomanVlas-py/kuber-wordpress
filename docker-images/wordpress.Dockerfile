FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && \
    apt install -y apache2 php libapache2-mod-php \
    php-mysql curl mariadb-client

RUN curl -o /tmp/wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz \
    && tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1 \
    && chown -R www-data:www-data /var/www/html && \
    rm  /var/www/html/index.html


COPY start2.sh /start.sh

RUN chmod +x /start.sh


EXPOSE 80

ENTRYPOINT ["/start.sh"]