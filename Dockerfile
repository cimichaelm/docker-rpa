
# base debian
FROM debian:12

# set environment
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /opt/rpa/etc
COPY conf/*.txt /opt/rpa/etc/


# install packages
RUN apt update -y \
&& apt install --yes --no-install-recommends \
bzip2 \
php-cli \
python3 \
python3-venv \
python3-pip \
python3-full \
pipx \
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

RUN mkdir -p /opt/rpa/code
COPY example/*.py /opt/rpa/code/

RUN /opt/rpa/bin/install-google-chrome.sh
RUN /opt/rpa/bin/init-build-user.sh rpauser

USER rpauser
ENV HOME /home/rpauser
ENV USER rpauser

CMD ["/opt/rpa/bin/init-start.sh"]

