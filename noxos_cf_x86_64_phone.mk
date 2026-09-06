$(call inherit-product, device/google/cuttlefish/vsoc_x86_64/phone/aosp_cf.mk)

PRODUCT_NAME := noxos_cf_x86_64_phone
PRODUCT_DEVICE := vsoc_x86_64
PRODUCT_MANUFACTURER := NoxOS
PRODUCT_MODEL := NoxOS Cuttlefish (x86_64)
PRODUCT_BRAND := noxos

PRODUCT_PACKAGES := $(filter-out \
    BasicDreams \
    PrintSpooler \
    LiveWallpapersPicker \
    EasterEgg \
,$(PRODUCT_PACKAGES))

PRODUCT_LOCALES := en_US

PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := speed

PRODUCT_COPY_FILES += \
    device/noxos/cf_x86_64_phone/noxos.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/noxos.rc \
    device/noxos/cf_x86_64_phone/branding/bootanimation.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/etc/init/noxos.rc \
    system/media/bootanimation.zip

DEVICE_PACKAGE_OVERLAYS += device/noxos/cf_x86_64_phone/overlay

