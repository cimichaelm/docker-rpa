#!/bin/sh
#file: rpa-start.sh

defaults()
{
    tmpdir=/var/tmp
    bindir=/opt/rpa/code
    prog=$bindir/batch-screenshot.py
    workdir=$tmpdir
}

run_batch()
{
    echo "${Lopts}"
    cd $workdir

    python $prog
}

defaults

opts=$*
run_batch $opts

exit 0
