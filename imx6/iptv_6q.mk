# This is a FSL Android Reference Design platform based on i.MX6Q ARD board
# It will inherit from FSL core product which in turn inherit from Google generic

$(call inherit-product, device/fsl/imx6/imx6.mk)

ifneq ($(wildcard device/fsl/iptv_6q/fstab_nand.freescale),)
$(shell touch device/fsl/iptv_6q/fstab_nand.freescale)
endif

ifneq ($(wildcard device/fsl/iptv_6q/fstab.freescale),)
$(shell touch device/fsl/iptv_6q/fstab.freescale)
endif

# Overrides
PRODUCT_NAME := iptv_6q
PRODUCT_DEVICE := iptv_6q


PRODUCT_COPY_FILES += \
	device/fsl/iptv_6q/required_hardware.xml:system/etc/permissions/required_hardware.xml \
	device/fsl/iptv_6q/init.rc:root/init.freescale.rc \
	device/fsl/iptv_6q/audio_policy.conf:system/etc/audio_policy.conf \
	device/fsl/iptv_6q/audio_effects.conf:system/vendor/etc/audio_effects.conf \
	device/fsl/iptv_6q/rt5370sta.ko:system/lib/hw/rt5370sta.ko \
    device/fsl/iptv_6q/RT2870STA.dat:/system/etc/Wireless/RT2870STA/RT2870STA.dat \
    device/fsl/iptv_6q/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
    device/fsl/iptv_6q/ads7846.idc:system/usr/idc/ads7846.idc 


PRODUCT_COPY_FILES +=	\
	external/linux-firmware-imx/firmware/vpu/vpu_fw_imx6d.bin:system/lib/firmware/vpu/vpu_fw_imx6d.bin 	\
	external/linux-firmware-imx/firmware/vpu/vpu_fw_imx6q.bin:system/lib/firmware/vpu/vpu_fw_imx6q.bin

# GPU files

DEVICE_PACKAGE_OVERLAYS := device/fsl/iptv_6q/overlay

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG += xlarge large tvdpi hdpi

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# for PDK build, include only when the dir exists
# too early to use $(TARGET_BUILD_PDK)
ifneq ($(wildcard packages/wallpapers/LivePicker),)
PRODUCT_COPY_FILES += \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
endif

PRODUCT_PACKAGES += AudioRoute
