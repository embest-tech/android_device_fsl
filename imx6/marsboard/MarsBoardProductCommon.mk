PRODUCT_COPY_FILES += \
	device/fsl/imx6/marsboard/required_hardware.xml:system/etc/permissions/required_hardware.xml \
	device/fsl/imx6/marsboard/init.rc:root/init.freescale.rc \
	device/fsl/imx6/marsboard/init.usb.rc:root/init.freescale.usb.rc \
	device/fsl/imx6/marsboard/fs_install.rc:root/fs_install.rc \
    	device/fsl/imx6/marsboard/vold.fstab:system/etc/vold.fstab \
	device/fsl/imx6/marsboard/gpsreset.sh:system/etc/gpsreset.sh \
	device/fsl/imx6/marsboard/eGalax_Touch_Screen.idc:system/usr/idc/eGalax_Touch_Screen.idc \
	device/fsl/imx6/marsboard/eGalax_Touch_Screen.idc:system/usr/idc/HannStar_P1003_Touchscreen.idc \
	device/fsl/imx6/marsboard/ads7846.idc:system/usr/idc/ads7846.idc

# GPU files

DEVICE_PACKAGE_OVERLAYS := device/fsl/imx6/marsboard/overlay
