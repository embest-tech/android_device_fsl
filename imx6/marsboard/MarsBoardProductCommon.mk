PRODUCT_COPY_FILES += \
	device/fsl/imx6/marsboard/required_hardware.xml:system/etc/permissions/required_hardware.xml \
	device/fsl/imx6/marsboard/init.rc:root/init.freescale.rc \
	device/fsl/imx6/marsboard/init.usb.rc:root/init.freescale.usb.rc \
	device/fsl/imx6/marsboard/fs_install.rc:root/fs_install.rc \
    	device/fsl/imx6/marsboard/vold.fstab:system/etc/vold.fstab \
	device/fsl/imx6/marsboard/gpsreset.sh:system/etc/gpsreset.sh \
	device/fsl/imx6/marsboard/ads7846.idc:system/usr/idc/ads7846.idc \
	device/fsl/imx6/marsboard/rt5370sta.ko:system/lib/hw/rt5370sta.ko \
	device/fsl/imx6/marsboard/RT2870STA.dat:/system/etc/Wireless/RT2870STA/RT2870STA.dat \
	device/fsl/imx6/marsboard/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf


# GPU files

DEVICE_PACKAGE_OVERLAYS := device/fsl/imx6/marsboard/overlay
