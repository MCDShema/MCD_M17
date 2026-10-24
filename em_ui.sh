#!/bin/sh
export XDG_CONFIG_HOME=/sdcard/
export MG_CFG_PATH=/etc

# Performance tuning for RK3126C CPU
if [ -d /sys/devices/system/cpu/cpu0/cpufreq ]; then
    echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null
fi
if [ -w /sys/devices/system/cpu/autoplug/plug_mask ]; then
    echo 0xf > /sys/devices/system/cpu/autoplug/plug_mask 2>/dev/null
fi
for i in 1 2 3; do
    if [ -w /sys/devices/system/cpu/cpu$i/online ]; then
        echo 1 > /sys/devices/system/cpu/cpu$i/online 2>/dev/null
    fi
done

# Auto-recombine any split large files on first boot
for part in /sdcard/cores/*.partaa /sdcard/retroarch/cores/*.partaa; do
    if [ -f "$part" ]; then
        base="${part%.partaa}"
        cat "${base}".part* > "$base" 2>/dev/null && rm -f "${base}".part*
    fi
done

# Auto-create swapfile if not present (512MB)
if [ ! -f /sdcard/swapfile ]; then
    dd if=/dev/zero of=/sdcard/swapfile bs=1M count=512 2>/dev/null
    mkswap /sdcard/swapfile 2>/dev/null
fi

if [ -e "/sdcard/test/game" ]; then
    export MG_CFG_PATH=/sdcard/test
    export LD_LIBRARY_PATH=/sdcard/test/lib
    /sdcard/test/game &
else
    swapon /sdcard/swapfile 2>/dev/null
    while true; do
        /sdcard/emulationstation 
        killall -9 emulationstation
    done
fi
