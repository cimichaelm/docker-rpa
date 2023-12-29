#!/bin/sh
#file: rpa-start.sh

defaults()
{
	tmpdir=/var/tmp
}

run_batch()
{
	echo "${Lopts}"
}

defaults

opts=$*
run_batch $opts

exit 0
