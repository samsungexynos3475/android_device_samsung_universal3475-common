#
# Copyright (C) 2018 The LineageOS Project
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

COMMON_PATH := device/samsung/universal3475-common

BUILD_BROKEN_DUP_RULES := true

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7

# Backlight
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"

# Binder
TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_CUSTOM_BT_CONFIG := $(COMMON_PATH)/configs/bluetooth/libbt_vndcfg.txt
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Boot animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
    ifneq ($(TARGET_BUILD_VARIANT),eng)
        WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= false
        WITH_DEXPREOPT := true
    endif
endif

# File System
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_NO_MISC_PARTITION:= false
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Firmware
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# HIDL
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true

# HWUI
HWUI_COMPILE_FOR_PERF := true

# Kernel
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_ADDITIONAL_FLAGS := \
    HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument" \
    KBUILD_BUILD_USER=$(BUILD_USERNAME) KBUILD_BUILD_HOST=$(BUILD_HOSTNAME)
BOARD_KERNEL_BASE := 0x10000000
# BOARD_KERNEL_CMDLINE := The bootloader ignores the cmdline from the boot.img
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_KERNEL_SOURCE := kernel/samsung/universal3475
TARGET_LINUX_KERNEL_VERSION := 3.10
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_KERNEL_SEPARATED_DT := true
BOARD_RAMDISK_USE_XZ := true
TARGET_CUSTOM_DTBTOOL := dtbhtoolExynos
BOARD_USES_FULL_RECOVERY_IMAGE := false

# Legacy BLOB Support
TARGET_PROCESS_SDK_VERSION_OVERRIDE += /system/vendor/bin/hw/rild=27

# LiveDisplay (mDNIe)
ifeq ($(filter j2lte j3xlte on5lte on5ltetmo, $(TARGET_DEVICE)),)
    DEVICE_MANIFEST_FILE += $(COMMON_PATH)/livedisplay/livedisplay_manifest.xml
endif

# Manifest
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml

# Network Routing
TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

# NFC
BOARD_HAVE_NFC := false

# Partitions
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE := 13631488
BOARD_CACHEIMAGE_PARTITION_SIZE := 202211328
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4831838208
BOARD_ROOT_EXTRA_FOLDERS += efs cpefs
TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/config.fs

# Platform
TARGET_BOARD_PLATFORM := exynos5
include hardware/samsung_slsi-linaro/config/BoardConfig3475.mk
TARGET_SOC := exynos3475
TARGET_BOOTLOADER_BOARD_NAME := universal3475
BOARD_VENDOR := samsung

# Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/ramdisk/etc/fstab.universal3475

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

# RIL
BOARD_MODEM_TYPE := tss310
BOARD_PROVIDES_LIBRIL := true
BOARD_NEEDS_ROAMING_PROTOCOL_FIELD := true

# Samsung HALs
TARGET_AUDIOHAL_VARIANT := samsung
TARGET_POWERHAL_VARIANT := samsung

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Shim
TARGET_LD_SHIM_LIBS += \
    /system/lib/libcamera_client.so|/vendor/lib/libcamera_client_shim.so \
    /vendor/lib/libexynoscameraexternal.so|/vendor/lib/libcamera_client_shim.so \
    /vendor/lib/libexynoscameraexternal.so|/vendor/lib/libexynoscamera_shim.so \
    /system/lib/libstagefright.so|/system/lib/libstagefright_shim.so

# System prop
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system_go.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy
SELINUX_IGNORE_NEVERALLOWS := true

# Vendor separation
TARGET_COPY_OUT_VENDOR := system/vendor

# Wifi
BOARD_HAVE_SAMSUNG_WIFI          := true
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_USE_HIDL          := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/etc/wifi/bcmdhd_apsta.bin"
WIFI_BAND                        := 802_11_ABG
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
