#!/bin/sh
#file: rpa-start.sh

defaults()
{
    tmpdir=/var/tmp
    bindir=/opt/rpa/code
    prog=$bindir/batch-screenshot.py
    workdir=$tmpdir
    interpreter="python3"
    venv="py3env"
    export OPENSSL_CONF=/dev/null
}


use_venv()
{
    Lvenv=$1
    if [ -f $HOME/$Lvenv/bin/activate ]; then
        . $HOME/$Lvenv/bin/activate
    fi
}

run_batch()
{
    echo "${Lopts}"
    echo "Starting job processor"
    date
    
    use_venv $venv

    if [ -d $workdir ]; then
	cd $workdir

	if [ -f $prog ]; then
	    $interpreter $prog
	fi
    else
	echo "No work directory found"
    fi
    
    date
    echo "End of jobs"
}

defaults

opts=$*
run_batch $opts

exit 0
