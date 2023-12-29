
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
php-cli \
python3 \
python3-venv \
curl \
wget \
ca-certificates \
jq \
sudo \
nano \
unzip \
chromium \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /opt/rpa/bin
COPY scripts/*.sh /opt/rpa/bin/
RUN chmod 755 /opt/rpa/bin/*.sh
RUN /opt/rpa/bin/install-google-chrome.sh

RUN mkdir -p /opt/rpa/etc
COPY conf/*.txt /opt/rpa/etc/

# ENTRYPOINT ["/opt/rpa/bin/rpa-start.sh"]
