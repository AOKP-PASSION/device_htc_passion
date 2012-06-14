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

# General propreties
PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=240 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072

# Performance Tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    pm.sleep_mode=1 \
    ro.ril.disable.power.collapse=0 \
    windowsmgr.max_events_per_sec=150 \
    ro.telephony.call_ring.delay=0 \
    ro.lge.proximity.delay=10 \
    mot.proximity.delay=10


$(call inherit-product, device/common/gps/gps_us_supl.mk)

PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/root/init.mahimahi.rc:root/init.mahimahi.rc \
    device/htc/passion/prebuilt/root/init.mahimahi.usb.rc:root/init.mahimahi.usb.rc \
    device/htc/passion/prebuilt/root/ueventd.mahimahi.rc:root/ueventd.mahimahi.rc

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
   frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

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
    gps.mahimahi \
    lights.mahimahi \
    sensors.mahimahi \
    librs_jni \
    camera.qsd8k

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
$(call inherit-product, device/htc/qsd8k-common/qsd8k.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

PRODUCT_NAME := full_passion
PRODUCT_DEVICE := passion
PRODUCT_MODEL := Full Android on Passion
