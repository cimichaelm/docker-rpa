#!/bin/sh
# file: init-build-user.sh
# build user directory/environment
#

defaults()
{

    u=rpauser
    systemdir=/opt/rpa
    sudoopts=""
    homedir=/home
}


create_user()
{
    Luser=$1    
    useradd -ms /bin/bash $Luser
}


build_user()
{
    Luser=$1
    Lhome=${homedir}/$Luser
    cd $Lhome
    sudo $sudoopts -u $Luser --set-home $systemdir/bin/init-venv.sh
}

defaults

u=$1

create_user $u
build_user $u