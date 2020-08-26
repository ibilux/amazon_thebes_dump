#!/system/bin/sh

THEBES_PVT_BOARD_ID=0020001060000015
MEMPHIS_PVT_BOARD_ID=0021001060000015
T_REFRESH_PVT_BOARD_ID=0020001860000015
LOG=/persistbackup/lock.log

evt_build=`cat /proc/idme/board_id`
boot0_lock=`cat /sys/class/mmc_host/mmc0/mmc0\:0001/block/mmcblk0/mmcblk0boot0/ro_lock`
mmc_lock_disable=`cat /sys/class/mmc_host/mmc0/mmc0\:0001/card_lock_disable`

if [[ "$evt_build" == "$THEBES_PVT_BOARD_ID" || "$evt_build" == "$MEMPHIS_PVT_BOARD_ID" || "$evt_build" == "$T_REFRESH_PVT_BOARD_ID" ]]; then
   if [[ "$boot0_lock" != 2 ]]; then
      echo "Locking boot0 of eMMC..." >> $LOG
      echo 2 > /sys/class/mmc_host/mmc0/mmc0\:0001/block/mmcblk0/mmcblk0boot0/ro_lock
   fi

   if [[ "$mmc_lock_disable" != 1 ]]; then
      echo "Disabling eMMC lock..." >> $LOG
      echo 1 > /sys/class/mmc_host/mmc0/mmc0\:0001/card_lock_disable
   fi
fi
