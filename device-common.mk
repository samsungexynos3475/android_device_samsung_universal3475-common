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

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@5.0-impl \
    android.hardware.audio.effect@5.0-impl \
    android.hardware.audio@2.0-service \
    audio.primary.universal3475 \
    audio.r_submix.default \
    audio.usb.default \
    tinymix

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    $(COMMON_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(COMMON_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

# APN configs (from N975FXXS9HWHA)
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/configs/ril/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

# BatteryLifeExtender
PRODUCT_PACKAGES += \
	vendor.lineage.batterylifeextender@1.0-service.samsung

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl.universal3475 \
    android.hardware.bluetooth@1.0-service \
    libbt-vendor

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/bluetooth/bt_vendor.conf:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bt_vendor.conf

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    camera.universal3475 \
    Snap

# Configstore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.0-impl \
    android.hardware.configstore@1.0-service

# Control groups and task profiles
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/cgroup/cgroups.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    $(COMMON_PATH)/configs/cgroup/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# Debug logcat
ifeq ($(TARGET_BUILD_DEBUG),true)
    PRODUCT_COPY_FILES += \
        $(COMMON_PATH)/configs/init/debug_logcat.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/debug_logcat.rc
endif

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
	android.hardware.drm@1.2-service.clearkey

# DTB
PRODUCT_HOST_PACKAGES += \
    dtbhtoolExynos

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    android.hardware.gnss@1.0-service

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(COMMON_PATH)/configs/gps/gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gps.xml

# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service

# Keylayout
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/keylayout/gpio_keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio_keys.kl \
    $(COMMON_PATH)/configs/keylayout/sec_touchkey.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_touchkey.kl

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.samsung

# LiveDisplay
ifneq ($(filter j2lte j3xlte on5lte on5ltetmo, $(subst lineage_,,$(TARGET_PRODUCT))),)
    # Software-based SurfaceFlinger
    DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/livedisplay/overlay
else
    # mDNIe
    PRODUCT_PACKAGES += \
        AdvancedDisplay \
        vendor.lineage.livedisplay@2.0-service.samsung-exynos

    # Overlay
    DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/livedisplay/overlay-mdnie
endif

# Media
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(COMMON_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

# Media profiles
ifneq ($(filter on5lte, $(TARGET_DEVICE)),)
    PRODUCT_COPY_FILES += \
        $(COMMON_PATH)/configs/media/media_profiles_V1_0_1080p.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml
else
    PRODUCT_COPY_FILES += \
        $(COMMON_PATH)/configs/media/media_profiles_V1_0_720p.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml
endif

# Memory
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.3-service.samsung-libperfmgr

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/power/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

# Radio
PRODUCT_PACKAGES += \
	cbd \
    libprotobuf-cpp-full \
    libsecril-client \
    modemloader \
    libxml2 \
    rild \
    libril \
    libreference-ril \
    libsecril-client-sap \
    android.hardware.radio@1.1 \
    android.hardware.radio.deprecated@1.0

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/init/rild.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/rild.legacy.rc

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.universal3475 \
    init.baseband.rc \
    init.mobicore.rc \
    init.power.rc \
    init.recovery.universal3475.rc \
    init.samsung.rc \
    init.target.rc \
    init.universal3475.rc \
    init.universal3475.usb.rc \
    init.wifi.rc \
    ueventd.universal3475.rc

# Filesystem tools
PRODUCT_PACKAGES += \
	e2fsck_static \
	resize2fs_static

# RenderScript
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# SamsungDoze
PRODUCT_PACKAGES += \
    SamsungDoze

# Samsung Linaro BSP
PRODUCT_PACKAGES += \
    gralloc.universal3475 \
    hwcomposer.universal3475 \
    memtrack.universal3475 \
    libcsc \
    libfimg \
    libhwc2on1adapter \
    libstagefrighthw \
    libion \
    libExynosOMX_Core \
    libExynosOMX_Resourcemanager \
    libOMX.Exynos.AVC.Decoder \
    libOMX.Exynos.AVC.Encoder \
    libOMX.Exynos.HEVC.Decoder \
    libOMX.Exynos.HEVC.Encoder \
    libOMX.Exynos.MPEG4.Decoder \
    libOMX.Exynos.MPEG4.Encoder \
    libOMX.Exynos.VP8.Decoder \
    libOMX.Exynos.VP8.Encoder \
    libOMX.Exynos.VP9.Decoder \
    libOMX.Exynos.WMV.Decoder

# SEC
PRODUCT_PACKAGES += \
    libsecnativefeature

# Seccomp filters
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(COMMON_PATH)/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

# Shims
PRODUCT_PACKAGES += \
    libcamera_client_shim \
    libexynoscamera_shim \
    libstagefright_shim

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
	$(COMMON_PATH) \
	hardware/samsung_slsi-linaro/exynos/cpboot

# TextClassifier
PRODUCT_PACKAGES += \
    textclassifier.bundle1

# Touch features
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.samsung

# Trust HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Vendor security patch level (Vendor blobs from G550FYXXU1CRF1)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2018-04-01

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0 \
    android.hardware.wifi@1.0-impl \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwpa_client \
    macloader \
    wificond \
    wifiloader \
    wifilogd \
    wlutil \
    wpa_supplicant \
    wpa_supplicant.conf

# Wi-Fi Configs
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/wifi/cred.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/cred.conf \
    $(COMMON_PATH)/configs/wifi/filter_ie:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/filter_ie \
    $(COMMON_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(COMMON_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# call the proprietary setup
$(call inherit-product, vendor/samsung/universal3475-common/universal3475-common-vendor.mk)
