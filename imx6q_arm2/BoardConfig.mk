#
# Product-specific compile-time definitions.
#

include device/fsl/imx6/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME := ARM2

BOARD_SOC_CLASS := IMX6
BOARD_SOC_TYPE := IMX6Q

USE_OPENGL_RENDERER := true
TARGET_CPU_SMP := true

# Wifi
BOARD_WLAN_DEVICE := ar6003
BOARD_HAS_ATH_WLAN := true
BOARD_WLAN_ATHEROS_SDK := system/wlan/atheros/compat-wireless
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_9_ATHEROS
HOSTAPD_VERSION := VER_0_9_ATHEROS
WIFI_DRIVER_MODULE_PATH         := "/system/lib/modules/ath6kl_sdio.ko"
WIFI_DRIVER_MODULE_NAME         := "ath6kl_sdio"
WIFI_DRIVER_MODULE_ARG          := "suspend_mode=2 ar6k_clock=26000000"
WIFI_DRIVER_P2P_MODULE_ARG      := "suspend_mode=2 ar6k_clock=26000000 ath6kl_p2p=1 debug_mask=0x2413"
WIFI_SDIO_IF_DRIVER_MODULE_PATH := "/system/lib/modules/cfg80211.ko"
WIFI_SDIO_IF_DRIVER_MODULE_NAME := "cfg80211"
WIFI_SDIO_IF_DRIVER_MODULE_ARG  := ""
WIFI_COMPAT_MODULE_PATH  := "/system/lib/modules/compat.ko"
WIFI_COMPAT_MODULE_NAME  := "compat"
WIFI_COMPAT_MODULE_ARG   := ""
WIFI_TEST_INTERFACE      := "sta"


BOARD_HAVE_VPU := true
HAVE_FSL_IMX_GPU := true
HAVE_FSL_IMX_IPU := true
BOARD_MODEM_VENDOR := AMAZON

BOARD_HAVE_HARDWARE_GPS := true
USE_ATHR_GPS_HARDWARE := true
USE_QEMU_GPS_HARDWARE := false

#for accelerator sensor, need to define sensor type here
#BOARD_HAS_SENSOR := true
#SENSOR_MMA8451 := true

# for recovery service
TARGET_SELECT_KEY := 28
TARGET_USERIMAGES_USE_EXT4 := true

# atheros 3k BT
BOARD_USE_AR3K_BLUETOOTH := true

BOARD_KERNEL_CMDLINE := console=ttymxc3,115200 init=/init video=mxcfb0 fbmem=10M vmalloc=400M androidboot.console=ttymxc3
BOARD_KERNEL_BASE := 0x10800000

TARGET_BOOTLOADER_CONFIG := mx6q_arm2_android_config

include device/fsl/proprietary/gpu-viv/fsl-gpu.mk
