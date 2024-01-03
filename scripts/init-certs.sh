#!/bin/sh
# file: init-certs.sh
# initialize extra certificates
#
defaults()
{
    tmpdir=/tmp
    bindir=$HOME/bin
    h=$HOME
    systemdir=/opt/rpa
    certdir=/usr/share/ca-certificates
    newcertdir=$certdir/newcerts
}

create_directory()
{
    Ldir=$1
    if [ ! -d $Ldir ]; then
        mkdir -p $Ldir
    fi
}

setup()
{
    create_directory $newcertdir
}

download_certs()
{
    cd $tmpdir
    wget https://cacerts.digicert.com/GeoTrustTLSRSACAG1.crt.pem
    cp $tmpdir/*.pem $newcertdir
    sudo update-ca-certificates
}

defaults

#
# certificates
#

setup

download_certs
