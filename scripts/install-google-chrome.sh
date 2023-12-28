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

    prereq_pkg="libu2f-udev libvulkan1 xdg-utils fonts-liberation libasound2 libatk-bridge2 libatk1 libatspi2 libcairo2 libcups2 libdbus libdrm2 libgbm1 libglib2 libgtk-3 libgtk-4 libnspr4 libnss3 libpango-1 libu2f-udev libvulkan1 libx11-6 libxcb1"
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


install_app()
{
    install_pkg ${prereq_pkg}

    get_remote_file $url
    dpkg -i $filename
    
}

defaults

install_app

exit 0


