#
# file: batch-screenshot.py
#

import rpa as r

sitelist = []

r.init(headless_mode = True)
i=0

if sitelist:
    for site in sitelist:
        r.url(site)
        file="results-{0}.png".format(i)
        msg = "processing: [{0}] {1}".format(i,site)
        print(msg)
        r.snap('page', file)
        i += 1

r.close()
