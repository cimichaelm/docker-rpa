#!/bin/sh
#file: rpa-download.sh

defaults()
{
    tmpdir=/var/tmp
    bindir=/opt/rpa/bin
    codedir=/opt/rpa/code
    prog=$codedir/rpa-download.py
    workdir=${RPA_WORKDIR:-"/storage/work"}
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


create_directory()
{
    Ldir=$1
    if [ ! -d $Ldir ]; then
	mkdir -p $Ldir
    fi
}

rpa_download()
{
    cd $HOME
    python3 $prog
}

defaults

opts=$*
workdir=$1

configure
setup

rpa_download

exit 0
