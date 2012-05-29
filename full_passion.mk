#
# Copyright (C) 2009 The Android Open Source Project
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

# Overlay / Locale
DEVICE_PACKAGE_OVERLAYS := device/htc/passion/overlay
PRODUCT_LOCALES := en

# General propreties
PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=240 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=80 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072

# Performance Tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    pm.sleep_mode=1 \
    ro.ril.disable.power.collapse=0 \
    windowsmgr.max_events_per_sec=150 \
    ro.telephony.call_ring.delay=0 \
    ro.lge.proximity.delay=10 \
    mot.proximity.delay=10 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.checkjni=false

# Inc uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

$(call inherit-product, device/common/gps/gps_us_supl.mk)

PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/root/init.mahimahi.rc:root/init.mahimahi.rc \
    device/htc/passion/prebuilt/root/init.mahimahi.usb.rc:root/init.mahimahi.usb.rc \
    device/htc/passion/prebuilt/root/ueventd.mahimahi.rc:root/ueventd.mahimahi.rc

# Default heap settings for 512mb device
include frameworks/base/build/phone-hdpi-512-dalvik-heap.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Ril properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2 \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=10 \
    ro.ril.disable.power.collapse=false \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.telephony.call_ring.delay=2 \
    ro.telephony.ril.v3=signalstrength \
    ro.telephony.default_network=0

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# Touchscreen
PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# Optical trackball
PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/usr/idc/mahimahi-nav.idc:system/usr/idc/mahimahi-nav.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/usr/keylayout/mahimahi-keypad.kl:system/usr/keylayout/mahimahi-keypad.kl \
    device/htc/passion/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

# Keymap
PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/usr/keychars/mahimahi-keypad.kcm:system/usr/keychars/mahimahi-keypad.kcm

# sysctl parameters$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/etc/sysctl.conf:system/etc/sysctl.conf

# non-rotational init.d script
PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/bin/a2sd:system/bin/a2sd \
    device/htc/passion/prebuilt/bin/e2fsck:system/bin/e2fsck \
    device/htc/passion/prebuilt/etc/init.d/03sdcard:system/etc/init.d/03sdcard \
    device/htc/passion/prebuilt/etc/init.d/05mountext:system/etc/init.d/05mountext \
    device/htc/passion/prebuilt/etc/init.d/10apps2sd:system/etc/init.d/10apps2sd
    
# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml


# Firmware
PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/etc/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd

PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# Prebuilt libcamera for HAL
PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/lib/libcamera.so:obj/lib/libcamera.so \
    device/htc/passion/prebuilt/lib/libcamera.so:system/lib/libcamera.so

# Kernel modules
PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/lib/modules/bcm4329.ko:system/lib/modules/bcm4329.ko \

#
# Packages needed for Passion
#
# Sensors
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    gps.mahimahi \
    lights.mahimahi \
    sensors.mahimahi \
    librs_jni \
    camera.qsd8k
# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.qsd8k \
    audio_policy.qsd8k
# GPU
PRODUCT_PACKAGES += \
    copybit.qsd8k \
    gralloc.qsd8k \
    hwcomposer.qsd8k \
    libgenlock \
    libmemalloc \
    libtilerenderer \
    libQcomUI
# OMX
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVidEnc \
    libOmxVdec \
    libstagefrighthw

# Enable GPU composition (0: cpu, 1: gpu)
# Note: must be 1 for composition.type to work
PRODUCT_PROPERTY_OVERRIDES += debug.sf.hw=1

# Enable copybit composition
PRODUCT_PROPERTY_OVERRIDES += debug.composition.type=mdp

# Force 2 buffers since gralloc defaults to 3 (we only have 2)
PRODUCT_PROPERTY_OVERRIDES += debug.gr.numframebuffers=2

# HardwareRenderer properties
# dirty regions: "false" disables partial invalidates (override if enabletr=true)
PRODUCT_PROPERTY_OVERRIDES += \
    hwui.render_dirty_regions=false \
    hwui.disable_vsync=true \
    hwui.print_config=choice \
    debug.enabletr=false

# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mass_storage \
    persist.service.adb.enable=1

# Set dirty_ratio for UMS
PRODUCT_PROPERTY_OVERRIDES += ro.vold.umsdirtyratio=20

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/htc/passion/prebuilt/root/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/htc/passion/passion-vendor.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/passion/media_a1026.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

PRODUCT_NAME := full_passion
PRODUCT_DEVICE := passion
PRODUCT_MODEL := Full Android on Passion
