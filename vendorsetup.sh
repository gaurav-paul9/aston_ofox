#
# OrangeFox build variables for OnePlus 12R (aston)
# These must be set in a shell script (vendorsetup.sh), NOT in BoardConfig.mk
#

# A/B and Virtual A/B
export FOX_AB_DEVICE=1
export FOX_VIRTUAL_AB_DEVICE=1
export OF_AB_DEVICE_WITH_RECOVERY_PARTITION=1

# Dynamic partitions
export OF_DYNAMIC_FULL_SIZE=16642998272

# Keymaster version for decryption
export OF_DEFAULT_KEYMASTER_VERSION=4.1

# Kernel - GKI prebuilt

# Reduce image size
export OF_USE_LZMA_COMPRESSION=1
export FOX_DRASTIC_SIZE_REDUCTION=1

# Disable MIUI specific features
export FOX_VANILLA_BUILD=1
export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1

# Maintainer info
export FOX_MAINTAINER=michael
export FOX_VARIANT=A16
export FOX_BUILD_TYPE=Unofficial

# Version
export FOX_MAINTAINER_PATCH_VERSION=1
