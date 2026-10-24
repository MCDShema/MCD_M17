#!/bin/sh

export XDG_CONFIG_HOME=/storage
export ROMS_HOME=/storage/roms # start directory to scan content in RetroArch

/storage/retroarch/retroarch -v --log-file /dev/console
