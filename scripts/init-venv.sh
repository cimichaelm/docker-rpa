#!/bin/sh
# file: init-venv.sh
# initialize python virtual environments
#
defaults()
{

    bindir=$HOME/bin
    systemdir=/opt/rpa
    requirements=$systemdir/etc/requirements.txt
    instdirflags="-d -m 755 -o ${u} -g ${u}"
    pipopts=""
    extrapipopts=""
    makeopts="PREFIX=$h"
    pkglist=""
    py3venv="py3env"
}

setup_py3_venv()
{
    python3 -m venv $py3venv
}

use_py3_venv()
{
    if [ -f $h/$py3venv/bin/activate ]; then
	. $h/$py3venv/bin/activate
    fi
}

upgrade_pip()
{
    pip install --upgrade pip
    pip install --upgrade setuptools
}

setup_python()
{

    Lrequirements=$1
    if [ -f $Lrequirements ]; then
	pip install $pipopts $extrapipopts -r $Lrequirements
    fi
}


defaults

#
# python 3
#

setup_py3_venv
use_py3_venv
# upgrade_pip
setup_python $requirements
