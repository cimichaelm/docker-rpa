#!/bin/sh
#file: rpa-start.sh

defaults()
{
    tmpdir=/var/tmp
    bindir=/opt/rpa/code
    prog=$bindir/batch-screenshot.py
    workdir=/storage/work
}

run_batch()
{
    echo "${Lopts}"
    echo "Starting job processor"
    date
    
    if [ -d $workdir ]; then
	cd $workdir

	for prog in ${workdir}/*.py; do
	    echo "Running: $prog"
	    python $prog
	done
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
