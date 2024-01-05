#!/bin/sh
#file: rpa-batch.sh

defaults()
{
    tmpdir=/var/tmp
    bindir=/opt/rpa/bin
    codedir=/opt/rpa/code
    prog=$codedir/batch-screenshot.py
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

run_batch()
{
    echo "${Lopts}"
    echo "Starting job processor"
    date

    use_venv $venv
    
    if [ -d $outputdir ]; then
	cd $outputdir
	proglist=`echo ${workdir}/*.py`
	for prog in $proglist; do
	    echo "Running: $prog"
	    if [ -f $prog ]; then
		$interpreter $prog
	    fi
	done
    else
	echo "No work directory found"
    fi
    
    date
    echo "End of jobs"
}

defaults

opts=$*
workdir=$1

configure
setup

run_batch $opts | tee $logfile

exit 0
