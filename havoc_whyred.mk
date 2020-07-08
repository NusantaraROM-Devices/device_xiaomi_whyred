# 
# Copyright (C) 2018 The Mokee Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Inherit from whyred device
$(call inherit-product, device/xiaomi/whyred/device.mk)

# Inherit from custom vendor
$(call inherit-product, vendor/MiuiCamera/config.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/havoc/config/common_full_phone.mk)

# Bootanimation world
TARGET_BOOT_ANIMATION_RES := 1080
IS_PHONE := true

PRODUCT_NAME := havoc_whyred
PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := whyred
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := Redmi Note 5

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="whyred" \
    PRODUCT_NAME="whyred"

# Build Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="coral-user 10 QQ3A.200705.002 6506677 release-keys" \

#Build FP to be picked by both system and vendor
BUILD_FINGERPRINT := "google/coral/coral:10/QQ3A.200705.002/6506677:user/release-keys"
PLATFORM_SECURITY_PATCH_OVERRIDE := 2020-07-05

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

TARGET_VENDOR := Xiaomi

HAVOC_BUILD_TYPE := Azimxv-Edition
PRODUCT_PROPERTY_OVERRIDES += \
    ro.havoc.maintainer=AzimovHero
