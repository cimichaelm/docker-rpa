#
# file: rpa-download.py
#

import rpa as r

msg = "Running setup"
print(msg)

r.setup()

msg = "Running pack"
print(msg)

r.pack()

msg = "Done."
print(msg)
