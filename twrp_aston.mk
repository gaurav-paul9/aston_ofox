#
# Copyright (C) 2025 The OrangeFox Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/oneplus/aston

# 64-bit
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Include TWRP common config
$(call inherit-product, vendor/twrp/config/common.mk)

# Product properties
PRODUCT_NAME := twrp_aston
PRODUCT_DEVICE := aston
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := CPH2585

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
