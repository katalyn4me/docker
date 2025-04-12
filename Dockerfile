FROM almalinux:9
MAINTAINER Marius Catalin <katalyn4me@yahoo.com>
USER root
RUN dnf -y install --allowerasing curl curl-devel
RUN dnf -y install https://rpms.remirepo.net/enterprise/remi-release-9.rpm
RUN dnf module install php:remi-7.4 -y
RUN dnf -y install mod_ssl zip unzip php php-cli php-common php-pear php-pecl-mysql php-json php-gd php-pdo php-opcache php-mbstring php-zip php-fpm php-xml php-soap
RUN php -v
RUN pear install php_codesniffer
RUN dnf -y install which openssh openssh-server openssh-clients openssl-libs
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN /usr/local/bin/composer -V
RUN composer global require "laravel/envoy=~1.0"
