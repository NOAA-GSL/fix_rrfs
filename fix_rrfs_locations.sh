#!/bin/sh
#
# FIX_RRFS locaitons at different HPC platforms
#
if [[ -d /dcom && -d /hwrf ]] ; then
    PLATFORM=wcoss
    RRFS_FIX_LOCATION="/to/do"
elif [[ -d /cm ]] ; then
    PLATFORM=wcoss_c
    RRFS_FIX_LOCATION="/to/do"
elif [[ -d /ioddev_dell ]]; then
    PLATFORM=wcoss_d
    RRFS_FIX_LOCATION="/to/do"
elif [[ -d /scratch1 ]] ; then
    PLATFORM=hera
    RRFS_FIX_LOCATION="/scratch2/BMC/rtrr/FIX_RRFS"
elif [[ -d /carddata ]] ; then
    PLATFORM=s4
    RRFS_FIX_LOCATION="/to/do"
elif [[ -d /jetmon ]] ; then
    PLATFORM=jet
    RRFS_FIX_LOCATION="/lfs4/BMC/nrtrr/FIX_RRFS"
elif [[ -d /glade ]] ; then
    PLATFORM=cheyenne
    RRFS_FIX_LOCATION="/to/do"
elif [[ -d /sw/gaea ]] ; then
    PLATFORM=gaea
    RRFS_FIX_LOCATION="/to/do"
elif [[ -d /work ]]; then
    PLATFORM=orion
    RRFS_FIX_LOCATION="/work/noaa/rtrr/FIX_RRFS"
else
    PLATFORM=unknow
    RRFS_FIX_LOCATION="/this/is/an/unknow/platform"
fi
