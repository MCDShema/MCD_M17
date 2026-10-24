#!/bin/sh

cd "/sdcard/ppsspp/"

if [ -f "PPSSPPSDL2" ]; then
	mv PPSSPPSDL PPSSPPSDL1
	mv PPSSPPSDL2 PPSSPPSDL
else
	mv PPSSPPSDL PPSSPPSDL2
	mv PPSSPPSDL1 PPSSPPSDL
fi

sync
