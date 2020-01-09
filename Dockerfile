FROM centos:centos7
MAINTAINER Marius Catalin <katalyn4me@yahoo.com>
USER root
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum -y install yum-utils
RUN yum-config-manager --enable remi-php72
RUN yum -y install php php-common php-mysqlnd php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap php-mcrypt php-zip unzip
RUN php -v
RUN pear install php_codesniffer
RUN yum -y install which openssh openssh-server openssh-clients openssl-libs
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN composer global require "laravel/envoy=~1.0"
