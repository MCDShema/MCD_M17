#!/bin/sh
progdir=$(dirname "$0")/drastic

CUST_LOGO=1

if [ -f "$1" ]; then
	GAME="$1"
fi

cd "$progdir"

if [ "$CUST_LOGO" = "1" ]; then
    echo "convert resources/logo/0.png to drastic_logo_0.raw"
    echo "convert resources/logo/1.png to drastic_logo_1.raw"
    ./png2raw
fi

HOME=$progdir

./drastic ${GAME:+"$GAME"}
sync
