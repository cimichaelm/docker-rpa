#!/bin/sh
#file: rpa-start.sh

defaults()
{
    tmpdir=/var/tmp
    bindir=/opt/rpa/code
    prog=$bindir/batch-screenshot.py
    workdir=${RPA_WORKDIR:-"/storage/work"}
    prog="${bindir}/rpa-batch.sh"
}

run_batch()
{
    
    if [ -f $prog ]; then
	sh $prog $workdir
    fi
}

defaults

opts=$*
run_batch $opts

exit 0
