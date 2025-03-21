FROM debian:bullseye-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd \
	php-cli \
	php-mbstring \
    curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir /run/php

COPY ./tools/scriptwp.sh /usr/local/bin/
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /var/www/html
RUN chmod +x /usr/local/bin/scriptwp.sh
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 777 /var/www/html


WORKDIR /var/www/html/
ENTRYPOINT [ "/usr/local/bin/scriptwp.sh" ]
CMD [ "php-fpm7.4", "-F" ]

EXPOSE 9000
