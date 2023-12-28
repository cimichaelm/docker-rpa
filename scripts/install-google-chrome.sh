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

    prereq_pkg="libu2f-udev libvulkan1 xdg-utils"
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


