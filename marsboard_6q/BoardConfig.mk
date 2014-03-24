#
# Product-specific compile-time definitions.
#

include device/fsl/imx6/marsboard/MarsBoardConfigComm.mk

BOARD_SOC_TYPE := IMX6Q

USE_OPENGL_RENDERER := true
TARGET_CPU_SMP := true

BOARD_KERNEL_CMDLINE := console=ttymxc1,115200 init=/init rw video=mxcfb0:dev=lcd,7inch_LCD,if=RGB24 video=mxcfb1:dev=hdmi,1920x1080M@60,if=RGB24 fbmem=10M vmalloc=400M androidboot.console=ttymxc1 calibration

TARGET_LOCATION := emmc

ifeq ($(TARGET_LOCATION),tf)
TARGET_BOOTLOADER_CONFIG := mx6q_marsboard_android_tf_config
PRODUCT_COPY_FILES += \
        device/fsl/imx6/marsboard/init.rc.tf:root/init.freescale.rc \
        device/fsl/imx6/marsboard/vold.fstab.tf:system/etc/vold.fstab
else
TARGET_BOOTLOADER_CONFIG := mx6q_marsboard_android_emmc_config
PRODUCT_COPY_FILES += \
        device/fsl/imx6/marsboard/init.rc.emmc:root/init.freescale.rc \
        device/fsl/imx6/marsboard/vold.fstab.emmc:system/etc/vold.fstab
endif

TARGET_BOOTLOADER_CONFIG := mx6q_marsboard_android_tf_config

