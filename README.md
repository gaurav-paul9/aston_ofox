# OrangeFox R12.0 for OnePlus 12R (aston)

Unofficial OrangeFox Recovery for the OnePlus 12R.

## Build

### Prerequisites
- OrangeFox R12.0 source (`fox_12.1` branch)
- ~200GB disk space, 16GB+ RAM

### Steps

```bash
# 1. Sync OrangeFox sources
repo init -u https://gitlab.com/OrangeFox/Manifest.git -b fox_12.1
repo sync -j$(nproc) --force-sync

# 2. Clone device tree
git clone https://github.com/gaurav-paul9/aston_ofox.git device/oneplus/aston

# 3. Clone kernel source & modules (lineage-23.2)
git clone https://github.com/LineageOS/android_kernel_oneplus_sm8550.git -b lineage-23.2 kernel/oneplus/sm8550
git clone https://github.com/LineageOS/android_kernel_oneplus_sm8550-modules.git -b lineage-23.2 kernel/oneplus/sm8550-modules

# 4. Copy defconfig into kernel tree
cp device/oneplus/aston/kernel_config/aston_defconfig kernel/oneplus/sm8550/arch/arm64/configs/vendor/aston_defconfig

# 5. Apply frame-larger-than fix
# Edit kernel/oneplus/sm8550/drivers/power/oplus/v1/Makefile line 10:
#   subdir-ccflags-y += -Werror=parentheses -Wframe-larger-than=8192

# 6. Build
. build/envsetup.sh
lunch twrp_aston-eng
mka recoveryimage
```

Output: `out/target/product/aston/OrangeFox-R12.0_1_A16-Unofficial-aston.img`

## Device info
- **Code name**: aston (OnePlus 12R)
- **SoC**: Snapdragon 8 Gen 2 (SM8550-AB, kalama)
- **Kernel**: 5.15.207 (GKI)
- **Partition**: 100MB dedicated recovery partition
- **A/B slots**: Yes
- **VAB**: Yes
- **AVB**: Yes
- **Recovery**: Ramdisk-only (`BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true`)

## Kernel modules
- 315 `.ko` files built into recovery ramdisk
- 129 loaded at boot via `modules.load`
- Full Qualcomm/OnePlus vendor driver support
- GUNYAH hypervisor driver disabled (x18 clobber issue in clang)

## Build fixes applied
| Issue | Fix |
|-------|-----|
| `CC=" clang"` (leading space) | `KERNEL_CC := CC="clang"` |
| `pahole` blocked by Soong path_interposer | `PAHOLE=true` |
| `-fuse-ld=lld` unused in compiler flags | `HOSTCFLAGS=` |
| BTF generation fails without real pahole | `CONFIG_DEBUG_INFO_BTF=n` |
| Stack frame >2048B in vendor drivers | `CONFIG_FRAME_WARN=8192` + driver Makefile fix |
| x18 register clobber in hvc asm | GUNYAH driver disabled |

## Credits
- LineageOS for kernel sources
- OrangeFox team for recovery base
- TWRP team
