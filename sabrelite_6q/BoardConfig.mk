#
# Product-specific compile-time definitions.
#

include device/fsl/imx6/sabrelite/SabreliteBoardConfigComm.mk

BOARD_SOC_TYPE := IMX6Q

USE_OPENGL_RENDERER := true
TARGET_CPU_SMP := true

BOARD_KERNEL_CMDLINE := console=ttymxc1,115200 init=/init video=mxcfb0:dev=hdmi,1920x1080M@60,if=RGB24 fbmem=10M vmalloc=400M androidboot.console=ttymxc1

TARGET_BOOTLOADER_CONFIG := mx6q_sabrelite_android_config

