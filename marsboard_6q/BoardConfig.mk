#
# Product-specific compile-time definitions.
#

include device/fsl/imx6/soc/imx6dq.mk
include device/fsl/marsboard_6q/build_id.mk
include device/fsl/imx6/BoardConfigCommon.mk
include device/fsl-proprietary/gpu-viv/fsl-gpu.mk
# marsboard_6q default target for EXT4
BUILD_TARGET_FS ?= ext4
BUILD_TARGET_LOCATION ?= emmc
include device/fsl/imx6/imx6_target_fs.mk

ifeq ($(BUILD_TARGET_FS),ubifs)
TARGET_RECOVERY_FSTAB = device/fsl/marsboard_6q/fstab_nand.freescale
# build ubifs for nand devices
PRODUCT_COPY_FILES +=	\
	device/fsl/marsboard_6q/fstab_nand.freescale:root/fstab.freescale
else
ifeq ($(BUILD_TARGET_LOCATION),sdmmc)
TARGET_RECOVERY_FSTAB = device/fsl/marsboard_6q/fstab.freescale.sdmmc
# build ext4 for sdmmc
PRODUCT_COPY_FILES +=   \
	device/fsl/marsboard_6q/fstab.freescale.sdmmc:root/fstab.freescale
else
TARGET_RECOVERY_FSTAB = device/fsl/marsboard_6q/fstab.freescale.emmc
# build ext4 for emmc
PRODUCT_COPY_FILES +=	\
	device/fsl/marsboard_6q/fstab.freescale.emmc:root/fstab.freescale
endif # BUILD_TARGET_LOCATION
endif # BUILD_TARGET_FS


TARGET_BOOTLOADER_BOARD_NAME := MARSBOARD
PRODUCT_MODEL := MARSBOARD-MX6Q

TARGET_TS_CALIBRATION := true
TARGET_TS_DEVICE := "ads7846"
TARGET_TS_SYS_PATH := "/sys/devices/platform/imx6q-ecspi.1/spi_master/spi1/spi1.0/calibration"

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER     := WEXT
WIFI_DRIVER_MODULE_PATH         := "/system/lib/hw/rt5370sta.ko"
WIFI_DRIVER_MODULE_NAME         := "rt5370sta"

BOARD_MODEM_VENDOR := AMAZON

USE_ATHR_GPS_HARDWARE := true
USE_QEMU_GPS_HARDWARE := false

#for accelerator sensor, need to define sensor type here
BOARD_HAS_SENSOR := true
SENSOR_MMA8451 := true

# for recovery service
TARGET_SELECT_KEY := 28

# we don't support sparse image.
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# uncomment below lins if use NAND
#TARGET_USERIMAGES_USE_UBIFS = true


ifeq ($(TARGET_USERIMAGES_USE_UBIFS),true)
UBI_ROOT_INI := device/fsl/marsboard_6q/ubi/ubinize.ini
TARGET_MKUBIFS_ARGS := -m 4096 -e 516096 -c 4096 -x none
TARGET_UBIRAW_ARGS := -m 4096 -p 512KiB $(UBI_ROOT_INI)
endif

ifeq ($(TARGET_USERIMAGES_USE_UBIFS),true)
ifeq ($(TARGET_USERIMAGES_USE_EXT4),true)
$(error "TARGET_USERIMAGES_USE_UBIFS and TARGET_USERIMAGES_USE_EXT4 config open in same time, please only choose one target file system image")
endif
endif

BOARD_KERNEL_CMDLINE := console=ttymxc1,115200 init=/init video=mxcfb0:dev=ldb,bpp=32 video=mxcfb1:off video=mxcfb2:off fbmem=10M fb0base=0x27b00000 vmalloc=400M androidboot.console=ttymxc1 androidboot.hardware=freescale

ifeq ($(TARGET_USERIMAGES_USE_UBIFS),true)
#UBI boot command line.
# Note: this NAND partition table must align with MFGTool's config.
BOARD_KERNEL_CMDLINE +=  mtdparts=gpmi-nand:16m(bootloader),16m(bootimg),128m(recovery),-(root) gpmi_debug_init ubi.mtd=3
endif

# atheros 3k BT
BOARD_USE_AR3K_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/fsl/marsboard_6q/bluetooth

USE_ION_ALLOCATOR := false
USE_GPU_ALLOCATOR := true

# camera hal v2
IMX_CAMERA_HAL_V2 := true

# define frame buffer count
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

ifeq ($(BUILD_TARGET_LOCATION),emmc)
TARGET_BOOTLOADER_CONFIG := mx6q_marsboard_android_emmc_config
else
TARGET_BOOTLOADER_CONFIG := mx6q_marsboard_android_tf_config
endif# BUILD_TARGET_LOCATION


