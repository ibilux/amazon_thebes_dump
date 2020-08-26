#!/system/bin/sh

if [ ! -e /data/inv_cal_data.bin ]; then
    /system/bin/idme copy sensorcal
    chown system /data/inv_cal_data.bin
fi
