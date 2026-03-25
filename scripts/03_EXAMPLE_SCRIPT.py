#
# This is an example
#
import casatasks
import sys

MSFILE      = sys.argv[1]
sing_ddir   = sys.argv[2]
sing_wdir   = sys.argv[3]

ms_name   = sing_ddir + MSFILE
ms_output = sing_wdir + MSFILE+'.OBSINFO'

casatasks.listobs(vis=ms_name, verbose=True,listfile=ms_output)
