#!/bin/sh
#file: rpa-clean.sh

defaults()
{
    tmpdir=/var/tmp
    bindir=/opt/rpa/bin
    codedir=/opt/rpa/code
    prog=$codedir/batch-screenshot.py
    workdir=${RPA_WORKDIR:-"/storage/work"}
}

configure()
{
    logdir="${workdir}/log"
    logfile=${logdir}/batch.log
    outputdir="$workdir/output"
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

clean_batch()
{
    echo "Cleaning job output files"
    
    if [ -d ${outputdir} ]; then
	rm "${outputdir}/*.png"
    else
	echo "No work directory found"
    fi
    
    rm "${logdir}/*.log"
    
    echo "End of jobs"
}

defaults

opts=$*
workdir=$1

configure
setup

clean_batch

exit 0
