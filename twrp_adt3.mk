#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Configure virtual_ab_ota.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
# Configure launch_with_vendor_ramdisk.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
# FUSE passthrough
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.vendor_boot=true \
    persist.sys.fuse.passthrough.enable=true

# Inherit some common Twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from adt3 device
$(call inherit-product, device/askey/adt3/device.mk)

PRODUCT_DEVICE := adt3
PRODUCT_NAME := twrp_adt3
PRODUCT_BRAND := ADT-3
PRODUCT_MODEL := ADT-3
PRODUCT_MANUFACTURER := askey

PRODUCT_GMS_CLIENTID_BASE := android-askey

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="diana_p1_arm64-userdebug 14 UP1A.231105.001.A1 eng.ubuntu.20240920.114404 test-keys"

BUILD_FINGERPRINT := ADT-3/adt3/adt3:10/QTT1.200116.002.B6/6245789:user/release-keys
