#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/by-name/recovery:6379520:39740bfb2b7aa6f2e5cca93b211b0b03bbe1e657; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/by-name/boot:5916672:071aa60180ee0757e43492ed80a63ecd05b6de61 EMMC:/dev/block/platform/mtk-msdc.0/by-name/recovery 39740bfb2b7aa6f2e5cca93b211b0b03bbe1e657 6379520 071aa60180ee0757e43492ed80a63ecd05b6de61:/system/recovery-from-boot.p && echo "
Installing new recovery image: succeeded
" >> /cache/recovery/log || echo "
Installing new recovery image: failed
" >> /cache/recovery/log
else
  log -t recovery "Recovery image already installed"
fi
