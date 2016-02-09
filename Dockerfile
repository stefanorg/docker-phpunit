FROM php:cli

ENV HOME /root

RUN apt-get update -qq && \
	apt-get install -y -qq git curl wget && \
	apt-get -y clean


RUN echo "date.timezone = Europe/Rome" >> /usr/local/etc/php/php.ini

# install phpunit
RUN wget -O /usr/local/bin/phpunit -q https://phar.phpunit.de/phpunit.phar

WORKDIR /srv

ENTRYPOINT ["php", "/usr/local/bin/phpunit"]
