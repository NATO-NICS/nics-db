#!/usr/bin/python3

import sys
import subprocess

# Utility to enable all symbology for all orgs, given the orgid and symbologyid ranges
# Relies on enableSymbologyForOrg.sh script being in the same path

if len(sys.argv) != 5:
    print("\nMust enter Org min and max ID and Symbology min and max ID\n")
    exit(1)

org_min = int(sys.argv[1])
org_max = int(sys.argv[2])

symb_min = int(sys.argv[3])
symb_max = int(sys.argv[4])


for o in range(org_min, org_max+1):
    for s in range(symb_min, symb_max+1):
        enable_call = subprocess.run(["bash", "enableSymbologyForOrg.sh", "nics", "nics", "-np", str(o), str(s)])
        print("\nGot exit code: {}".format(enable_call.returncode))
