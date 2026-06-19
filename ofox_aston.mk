COMMON_SOC := sm85xx
PRODUCT_PLATFORM := kalama
PRODUCT_RELEASE_NAME := $(lastword $(subst /, ,$(lastword $(subst _, ,$(firstword $(subst ., ,$(MAKEFILE_LIST)))))))
CUSTOM_VENDOR := $(lastword $(subst /, ,$(firstword $(subst _, ,$(firstword $(MAKEFILE_LIST))))))
$(call inherit-product, vendor/twrp/config/common.mk)
BOARD_VENDOR := $(or $(word 2,$(subst /, ,$(firstword $(MAKEFILE_LIST)))),$(value 2))
PRODUCT_DEVICE := aston
PRODUCT_NAME := $(CUSTOM_VENDOR)_$(PRODUCT_DEVICE)
PRODUCT_MODEL := CPH2585
PRODUCT_SYSTEM_NAME := $(PRODUCT_MODEL)
PRODUCT_SYSTEM_DEVICE := OP5D35L1
PRODUCT_BRAND := $(BOARD_VENDOR)
PRODUCT_MANUFACTURER := $(BOARD_VENDOR)
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)
COMMON_PATH := device/oneplus/sm85xx-common
DEVICE_PATH := device/oneplus/aston
$(call inherit-product, $(DEVICE_PATH)/device-aston.mk)
