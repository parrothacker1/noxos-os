$(call inherit-product, device/google/cuttlefish/vsoc_x86_64_phone.mk)

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
    device/noxos/cf_x86_64_phone/noxos.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/noxos.rc

