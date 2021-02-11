FROM centos:centos8
MAINTAINER Marius Catalin <katalyn4me@yahoo.com>
USER root
RUN dnf -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm
RUN dnf module reset php
RUN dnf module enable php:remi-7.4 -y
RUN yum -y install mod_ssl php php-cli php-common php-pecl-mysql php-json php-gd php-pdo php-opcache php-mbstring php-zip php-fpm php-xml php-soap curl curl-devel
RUN php -v
RUN pear install php_codesniffer
RUN yum -y install which openssh openssh-server openssh-clients openssl-libs
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN /usr/local/bin/composer -V
RUN composer global require "laravel/envoy=~1.0"
