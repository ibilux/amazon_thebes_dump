#!/system/bin/sh
if [ -f /system/bin/amzn_drmprov_check ] ; then
	/system/bin/amzn_drmprov_check
fi
if [ -f /system/bin/amzn_dha_hmac ] ; then
	/system/bin/amzn_dha_hmac
fi