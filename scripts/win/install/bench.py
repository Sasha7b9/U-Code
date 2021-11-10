# bench.py assembly full all
# HP 17-by3063ur                0:14:07
# FX-8350         

# bench.py assembly make all
# HP 17-by3063ur                0:01:18
# FX-8350

import os
import sys
from datetime import datetime

if len(sys.argv) < 2:
    quit()

command = ""

for str in sys.argv:
    if str != sys.argv[0]:
        command += str
        command += " "

startTime = datetime.now();

os.system(command)

print("\n Total lead time \" ", command, "\" : ", datetime.now() - startTime, "\n")
      
