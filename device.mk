#
# Copyright (C) 2014 NovaFusion http://novafusion.pl
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

# Add overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/golden/overlay

# Define kind of DPI
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Inputs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Graphics
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/lib/egl/egl.cfg:system/lib/egl/egl.cfg

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/etc/media_codecs.xml:system/etc/media_codecs.xml 

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    libnetcmdiface

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0
    wifi.supplicant_scan_interval=150
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/sirfgps.conf:system/etc/sirfgps.conf \
    $(LOCAL_PATH)/configs/etc/gps.conf:system/etc/gps.conf

PRODUCT_PROPERTY_OVERRIDES += ro.gps.init=true

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# RIL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/ste_modem.sh:system/etc/ste_modem.sh \
    $(LOCAL_PATH)/configs/etc/cspsa.conf:system/etc/cspsa.conf 

PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.sends_barcount=1 \
    ro.telephony.default_network=0

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/etc/asound.conf:system/etc/asound.conf

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default

# Open-source HALs
PRODUCT_PACKAGES += \
    lights.montblanc

# Misc packages
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs \
    Stk

#F2FS
PRODUCT_PACKAGES += \
    genfstab

# Prebuilt kernel
PRODUCT_COPY_FILES += \
    device/samsung/golden/ramdisk/zImage:kernel

# Initial ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/golden/ramdisk/init.samsunggolden.rc:root/init.samsunggolden.rc \
    device/samsung/golden/ramdisk/init.samsunggolden.usb.rc:root/init.samsunggolden.usb.rc \
    device/samsung/golden/ramdisk/ueventd.samsunggolden.rc:root/ueventd.samsunggolden.rc \
    device/samsung/golden/ramdisk/lpm.rc:root/lpm.rc \
    device/samsung/golden/ramdisk/sbin/charger:root/sbin/charger \
    device/samsung/golden/ramdisk/res/images/charger/battery_0.png:root/res/images/charger/battery_0.png \
    device/samsung/golden/ramdisk/res/images/charger/battery_1.png:root/res/images/charger/battery_1.png \
    device/samsung/golden/ramdisk/res/images/charger/battery_2.png:root/res/images/charger/battery_2.png \
    device/samsung/golden/ramdisk/res/images/charger/battery_3.png:root/res/images/charger/battery_3.png \
    device/samsung/golden/ramdisk/res/images/charger/battery_4.png:root/res/images/charger/battery_4.png \
    device/samsung/golden/ramdisk/res/images/charger/battery_5.png:root/res/images/charger/battery_5.png \
    device/samsung/golden/ramdisk/res/images/charger/battery_charge.png:root/res/images/charger/battery_charge.png \
    device/samsung/golden/ramdisk/res/images/charger/battery_fail.png:root/res/images/charger/battery_fail.png

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Codec config files
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml

# Use U8500 opensource parts
$(call inherit-product, hardware/samsung/u8500/ux500/Android.mk)

# Get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/golden/golden-vendor.mk)

# Dalvik config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
