
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
php8 \
php8-mysql \
php8-ldap \
php8-xmlrpc \
php8-imap \
curl \
php8-curl \
php8-gd \
php8-mbstring \
php8-xml \
php8-apcu-bc \
php-cas \
php8-intl \
php8-zip \
php8-bz2 \
php8-redis \
cron \
wget \
ca-certificates \
jq \
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
