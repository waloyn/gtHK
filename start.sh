#!/bin/sh

# Global variables
RUNTIME="/usr/bin"
TMP="$(mktemp -d)"

#Get Gost 
curl --retry 5 --retry-max-time 60 -H "Cache-Control: no-cache" -fsSL ${DLURL} -o ${TMP}/gost.gz
busybox gzip -d ${TMP}/gost.gz

#Install Gost
install -m 755 ${TMP}/gost ${RUNTIME}

#Run Gost
${RUNTIME}/gost ${CMD}