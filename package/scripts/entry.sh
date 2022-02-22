#!/bin/sh
set -e

chmod +x bin/obs

( cd bin
	nv-sglrun ./obs $@
)
