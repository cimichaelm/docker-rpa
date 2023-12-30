#!/bin/sh
#file: init-start.sh

defaults()
{
    tmpdir=/var/tmp
    bindir=/opt/rpa/bin
    prog="${bindir}/rpa-start.sh"
}

defaults

opts=$*

sh $prog

exit 0
