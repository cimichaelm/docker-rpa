
# base debian
FROM debian:12

# set environment
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /opt/rpa/etc
COPY ./conf/version.txt /opt/rpa/etc/version.txt

# install packages
RUN apt update -y \
&& apt install --yes --no-install-recommends \
bzip2 \
php8.1 \
php8.1-mysql \
php8.1-ldap \
php8.1-xmlrpc \
php8.1-imap \
curl \
php8.1-curl \
php8.1-gd \
php8.1-mbstring \
php8.1-xml \
php8.1-apcu-bc \
php-cas \
php8.1-intl \
php8.1-zip \
php8.1-bz2 \
php8.1-redis \
cron \
wget \
ca-certificates \
jq \
libldap-2.4-2 \
libldap-common \
libsasl2-2 \
libsasl2-modules \
libsasl2-modules-db \
sudo \
nano \
unzip \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /opt/rpa/bin
COPY scripts/*.sh /opt/rpa/bin
RUN chmod 755 /opt/rpa/bin/*.sh
RUN /opt/rpa/bin/install-google-chrome.sh

# ENTRYPOINT ["/opt/rpa/bin/rpa-start.sh"]
