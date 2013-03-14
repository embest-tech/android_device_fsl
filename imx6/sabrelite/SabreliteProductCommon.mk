PRODUCT_COPY_FILES += \
	device/fsl/imx6/sabrelite/required_hardware.xml:system/etc/permissions/required_hardware.xml \
	device/fsl/imx6/sabrelite/init.rc:root/init.freescale.rc \
	device/fsl/imx6/sabrelite/init.usb.rc:root/init.freescale.usb.rc \
    	device/fsl/imx6/sabrelite/vold.fstab:system/etc/vold.fstab \
	device/fsl/imx6/sabrelite/gpsreset.sh:system/etc/gpsreset.sh \
	device/fsl/imx6/sabrelite/eGalax_Touch_Screen.idc:system/usr/idc/eGalax_Touch_Screen.idc \
	device/fsl/imx6/sabrelite/eGalax_Touch_Screen.idc:system/usr/idc/HannStar_P1003_Touchscreen.idc

# GPU files

DEVICE_PACKAGE_OVERLAYS := device/fsl/imx6/sabrelite/overlay
