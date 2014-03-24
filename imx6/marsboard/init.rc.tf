import init.freescale.usb.rc
on boot

    # Set permission for IIM node
    symlink /dev/mxs_viim /dev/mxc_mem

    #Set GPS serial and reset GPIO pin
    symlink /dev/ttymxc2 /dev/gpsdevice
    setprop ro.kernel.android.gps ttya
    write /sys/class/gpio/export 60
    write /sys/class/gpio/gpio60/direction "out"
    write /sys/class/gpio/gpio60/value 1

    # Enable Tethering in the Settings
    setprop ro.tether.denied false

    # 3D acceleration property
    setprop debug.sf.showfps    0
    setprop debug.sf.enable_hgl 1
    setprop debug.egl.hw	1
    setprop hwc.filter_stretch  1
    setprop persist.sys.ui.hw   1

    # deine board type
    setprop sys.devicy.type  "tablet"

    # fsl omx graphic manager media framework property
    setprop media.omxgm.enable-player 1
    setprop media.omxgm.enable-record 1
    setprop media.omxgm.enable-scan 1
    setprop rw.VIDEO_RENDER_NAME video_render.surface

    #Define the config for dual camera
    #For landscape mode, orient is 0
    #For portrait mode, orient is 90
    #the android before honycomb are all in portrait mode
    setprop back_camera_name uvc
    setprop back_camera_orient 0
    setprop front_camera_name uvc
    setprop front_camera_orient 0

    # Set OpenGLES version
    setprop ro.opengles.version 131072

    # Disable UI output for second display during video playback
    setprop ro.secfb.disable-overlay  0

    # Enable auto configuration with 1, disable with 0
    setprop ro.AUTO_CONFIG_DISPLAY  1

    # Set rotation to 270 to cofigure as portrait mode
    setprop ro.sf.hwrotation 0

    # hdmi audio output
    setprop ro.HDMI_AUDIO_OUTPUT 1

    # Set video overlay display mode
    setprop sys.VIDEO_OVERLAY_DISPLAY 1

    # Default backlight device
    setprop hw.backlight.dev "pwm-backlight.0"
    # Chmod/chown FSL specific sys entry
    chown system system /sys/class/backlight/pwm-backlight.0/brightness
    chmod 0660 /sys/class/backlight/pwm-backlight.0/brightness

    # Set light sensor sysfs path and light sensor threshold lux value
    setprop ro.hardware.lightsensor "/sys/class/i2c-dev/i2c-2/device/2-0044/"
    setprop ro.lightsensor.threshold  20

    # No bluetooth hardware present
    setprop hw.bluetooth 0

# Power Management Patches
    setprop hw.nopm true

# Prepare for wifi
    setprop wifi.interface ra0
    setprop wifi.ap.interface ra0
    mkdir /data/misc/wifi/sockets 0770 wifi system
    mkdir /data/misc/dhcp 0770 dhcp dhcp
    chown dhcp dhcp /data/misc/dhcp

service wpa_supplicant /system/bin/wpa_supplicant -Dwext
    socket wpa_ra0 dgram 660 wifi wifi
    class late_start
    disabled
    oneshot


# magd daemon
service magd /system/bin/magd
    class main
    user system
    group input
    oneshot

# Orion InG
service ing /system/etc/gps/ingsvcd -c /system/etc/gps/Orion.ini
    class late_start
    user root
    group gps
    disabled
    oneshot

service iprenew_ra0 /system/bin/dhcpcd -n
    class late_start
    disabled
    oneshot

service dhcpcd_ra0 /system/bin/logwrapper /system/bin/dhcpcd -ABKL
    class late_start
    disabled
    oneshot

service hostapd /system/bin/hostapd /data/misc/wifi/hostapd.conf
    socket hostapd_ra0 dgram 660 root wifi
    user root
    group wifi
    oneshot
    disabled

on fs
# mount ext4 partitions
    mount ext4 /dev/block/mmcblk1p5 /system
    mount ext4 /dev/block/mmcblk1p5 /system ro remount
    mount ext4 /dev/block/mmcblk1p7 /data nosuid nodev nodiratime noatime noauto_da_alloc
    mount ext4 /dev/block/mmcblk1p6 /cache nosuid nodev
    mount ext4 /dev/block/mmcblk1p8 /vendor nosuid nodev

