#!/bin/sh
#file: rpa-start.sh

defaults()
{
    tmpdir=/var/tmp
    bindir=/opt/rpa/code
    prog=$bindir/batch-screenshot.py
    workdir=$tmpdir
    interpreter="python3"
}

run_batch()
{
    echo "${Lopts}"
    echo "Starting job processor"
    date
    
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
