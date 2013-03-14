LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := display.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/etc
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := display.conf
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := display_mode.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/etc
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := display_mode.conf
include $(BUILD_PREBUILT)
