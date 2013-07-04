
#
# Product-specific compile-time definitions.
#

include device/fsl/imx6/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME := MARSBOARD
BOARD_SOC_CLASS := IMX6

TARGET_TS_CALIBRATION := true
TARGET_TS_DEVICE := "ads7846"

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER 	:= WEXT
WIFI_DRIVER_MODULE_PATH         := "/system/lib/hw/rt5370sta.ko"
WIFI_DRIVER_MODULE_NAME         := "rt5370sta"


BOARD_HAVE_VPU := true
HAVE_FSL_IMX_GPU := true
HAVE_FSL_IMX_IPU := true
BOARD_MODEM_VENDOR := AMAZON

BOARD_HAVE_HARDWARE_GPS := true
USE_ATHR_GPS_HARDWARE := true
USE_QEMU_GPS_HARDWARE := false

#for accelerator sensor, need to define sensor type here
BOARD_HAS_SENSOR := true
SENSOR_MMA8451 := true

# for recovery service
TARGET_SELECT_KEY := 28
TARGET_USERIMAGES_USE_EXT4 := true

# atheros 3k BT
BOARD_USE_AR3K_BLUETOOTH := true

BOARD_KERNEL_BASE := 0x10800000

USE_ION_ALLOCATOR := true

include device/fsl/proprietary/gpu-viv/fsl-gpu.mk
