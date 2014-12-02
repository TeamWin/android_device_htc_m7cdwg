$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/htc/m7cdwg/m7cdwg-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/m7cdwg/overlay

LOCAL_PATH := device/htc/m7cdwg
ifeq ($(TARGET_PREBUILT_KERNEL),)
        LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
        LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/etc/fstab.m7c:recovery/root/fstab.m7cdwg \
    $(LOCAL_PATH)/recovery/etc/lpm.rc:recovery/root/lpm.rc \
    $(LOCAL_PATH)/recovery/etc/init.recovery.m7c.rc:root/init.recovery.m7cdwg.rc \
    $(LOCAL_PATH)/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    $(LOCAL_PATH)/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    $(LOCAL_PATH)/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    $(LOCAL_PATH)/recovery/sbin/power_test:recovery/root/sbin/power_test

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
