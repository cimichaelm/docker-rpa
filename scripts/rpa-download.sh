#!/bin/sh
#file: rpa-download.sh

defaults()
{
    tmpdir=/var/tmp
    bindir=/opt/rpa/bin
    codedir=/opt/rpa/code
    prog=$codedir/rpa-download.py
    workdir=${RPA_WORKDIR:-"/storage/work"}
    interpreter="python3"
    venv="py3env"
    export OPENSSL_CONF=/dev/null
}

configure()
{
    builddir="$workdir/build"
    logdir="${builddir}/log"
    logfile=${logdir}/batch.log
    outputdir="$builddir/output"
}

setup()
{
    create_directory $outputdir
    create_directory $logdir
}

use_venv()
{
    Lvenv=$1
    if [ -f $HOME/$Lvenv/bin/activate ]; then
        . $HOME/$Lvenv/bin/activate
    fi
}

create_directory()
{
    Ldir=$1
    if [ ! -d $Ldir ]; then
	mkdir -p $Ldir
    fi
}

rpa_download()
{
    use_venv $venv

    if [ -d $outputdir ]; then
        cd $outputdir
        if [ -f $prog ]; then
            $interpreter $prog
        fi
    fi
    
}

defaults

opts=$*
workdir=$1

configure
setup

rpa_download $workdir

exit 0