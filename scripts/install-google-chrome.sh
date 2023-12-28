#!/bin/sh
#file: install-google-chrome.sh

defaults()
{

    instdirflags="-d -m 755"
    instlibflags="-c -m 644"
    filename="google-chrome-stable_current_amd64.deb"
    url="https://dl.google.com/linux/direct/${filename}"
    dldir=$HOME/source
    prefix=/usr/local
    progdir=$prefix

    prereq_pkg="fonts-liberation"
    z="xdg-utils libasound2  libcairo2 libcups2 libdrm2 libgbm1 libnspr4 libnss3 libx11-6 libxcb1"
    pkgs="google-chrome-stable"
}

setup()
{
    Lurl=$1
    if [ ! -d $dldir ]; then
	mkdir -p $dldir
    fi
    cd $dldir
}

get_remote_file()
{
    Lurl=$1
    if [ ! -d $dldir ]; then
	mkdir -p $dldir
    fi
    cd $dldir
    wget --quiet $Lurl
}

install_pkg()
{
    Lpkg=$*
    sudo apt-get install --yes ${Lpkg}
}


install_app2()
{
    install_pkg ${prereq_pkg}

    get_remote_file $url
    dpkg -i $filename
}

install_app()
{
    install_pkg ${prereq_pkg}
    
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub > linux_signing_key.pub
    sudo install -D -o root -g root -m 644 linux_signing_key.pub /etc/apt/keyrings/linux_signing_key.pub
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/linux_signing_key.pub] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
    sudo apt update
    sudo apt-get install --yes ${pkgs}
}

defaults

setup

install_app

exit 0


