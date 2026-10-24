#!/bin/sh

CORES_PATH=$(dirname "$0")
EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM="$1"

HOME=/mnt/sdcard/Emus/m17/DREAM.pak
XDG_HOME=/mnt/sdcard/Emus/m17/DREAM.pak
XDG_DATA_HOME=/mnt/sdcard/Emus/m17/DREAM.pak
XDG_CONFIG_HOME=/mnt/sdcard/Emus/m17/DREAM.pak/.config
export HOME
export XDG_HOME
export XDG_DATA_HOME
export XDG_CONFIG_HOME
cd "$HOME"
./reicastsdl "$ROM"
