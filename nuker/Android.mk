LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := Nuker
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := Maps Drive PrebuiltGmail YouTube GoogleTTS SoundAmplifierPrebuilt Photos GoogleCamera arcore talkback RecorderPrebuilt Videos AndroidAutoStubPrebuilt
LOCAL_UNINSTALLABLE_MODULE := true 
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)

