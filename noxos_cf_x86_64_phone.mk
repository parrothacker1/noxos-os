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

PRODUCT_PACKAGES := $(filter-out \
    ONS \
    CarrierDefaultApp \
    CallLogBackup \
    com.android.cellbroadcast \
    CellBroadcastLegacyApp \
    CarrierConfig \
    Dialer \
    ImsServiceEntitlement \
    preinstalled-packages-platform-telephony-product.xml \
,$(PRODUCT_PACKAGES))

PRODUCT_PACKAGES := $(filter-out \
    PacProcessor \
    MusicFX \
    DeviceAsWebcam \
    BluetoothMidiService \
,$(PRODUCT_PACKAGES))

PRODUCT_PACKAGES := $(filter-out \
    NotoNaskhArabic-Bold.ttf \
    NotoNaskhArabic-Regular.ttf \
    NotoNaskhArabicUI-Bold.ttf \
    NotoNaskhArabicUI-Regular.ttf \
    NotoSansAdlam-VF.ttf \
    NotoSansAhom-Regular.otf \
    NotoSansAnatolianHieroglyphs-Regular.otf \
    NotoSansArmenian-VF.ttf \
    NotoSansAvestan-Regular.ttf \
    NotoSansBalinese-Regular.ttf \
    NotoSansBamum-Regular.ttf \
    NotoSansBassaVah-Regular.otf \
    NotoSansBatak-Regular.ttf \
    NotoSansBengali-VF.ttf \
    NotoSansBengaliUI-VF.ttf \
    NotoSansBhaiksuki-Regular.otf \
    NotoSansBrahmi-Regular.ttf \
    NotoSansBuginese-Regular.ttf \
    NotoSansBuhid-Regular.ttf \
    NotoSansCanadianAboriginal-Regular.ttf \
    NotoSansCarian-Regular.ttf \
    NotoSansChakma-Regular.otf \
    NotoSansCham-Bold.ttf \
    NotoSansCham-Regular.ttf \
    NotoSansCherokee-Regular.ttf \
    NotoSansCJK-Regular.ttc \
    NotoSansCoptic-Regular.ttf \
    NotoSansCuneiform-Regular.ttf \
    NotoSansCypriot-Regular.ttf \
    NotoSansDeseret-Regular.ttf \
    NotoSansDevanagari-VF.ttf \
    NotoSansDevanagariUI-VF.ttf \
    NotoSansEgyptianHieroglyphs-Regular.ttf \
    NotoSansElbasan-Regular.otf \
    NotoSansEthiopic-VF.ttf \
    NotoSansGeorgian-VF.ttf \
    NotoSansGlagolitic-Regular.ttf \
    NotoSansGothic-Regular.ttf \
    NotoSansGrantha-Regular.ttf \
    NotoSansGujarati-Bold.ttf \
    NotoSansGujarati-Regular.ttf \
    NotoSansGujaratiUI-Bold.ttf \
    NotoSansGujaratiUI-Regular.ttf \
    NotoSansGunjalaGondi-Regular.otf \
    NotoSansGurmukhi-VF.ttf \
    NotoSansGurmukhiUI-VF.ttf \
    NotoSansHanifiRohingya-Regular.otf \
    NotoSansHanunoo-Regular.ttf \
    NotoSansHatran-Regular.otf \
    NotoSansHebrew-Bold.ttf \
    NotoSansHebrew-Regular.ttf \
    NotoSansImperialAramaic-Regular.ttf \
    NotoSansInscriptionalPahlavi-Regular.ttf \
    NotoSansInscriptionalParthian-Regular.ttf \
    NotoSansJavanese-Regular.otf \
    NotoSansKaithi-Regular.ttf \
    NotoSansKannada-VF.ttf \
    NotoSansKannadaUI-VF.ttf \
    NotoSansKayahLi-Regular.ttf \
    NotoSansKharoshthi-Regular.ttf \
    NotoSansKhmer-VF.ttf \
    NotoSansKhmerUI-Bold.ttf \
    NotoSansKhmerUI-Regular.ttf \
    NotoSansKhojki-Regular.otf \
    NotoSansLao-Bold.ttf \
    NotoSansLao-Regular.ttf \
    NotoSansLaoUI-Bold.ttf \
    NotoSansLaoUI-Regular.ttf \
    NotoSansLepcha-Regular.ttf \
    NotoSansLimbu-Regular.ttf \
    NotoSansLinearA-Regular.otf \
    NotoSansLinearB-Regular.ttf \
    NotoSansLisu-Regular.ttf \
    NotoSansLycian-Regular.ttf \
    NotoSansLydian-Regular.ttf \
    NotoSansMalayalam-VF.ttf \
    NotoSansMalayalamUI-VF.ttf \
    NotoSansMandaic-Regular.ttf \
    NotoSansManichaean-Regular.otf \
    NotoSansMarchen-Regular.otf \
    NotoSansMasaramGondi-Regular.otf \
    NotoSansMedefaidrin-VF.ttf \
    NotoSansMeeteiMayek-Regular.ttf \
    NotoSansMeroitic-Regular.otf \
    NotoSansMiao-Regular.otf \
    NotoSansModi-Regular.ttf \
    NotoSansMongolian-Regular.ttf \
    NotoSansMro-Regular.otf \
    NotoSansMultani-Regular.otf \
    NotoSansMyanmar-Bold.otf \
    NotoSansMyanmar-Medium.otf \
    NotoSansMyanmar-Regular.otf \
    NotoSansMyanmarUI-Bold.otf \
    NotoSansMyanmarUI-Medium.otf \
    NotoSansMyanmarUI-Regular.otf \
    NotoSansNabataean-Regular.otf \
    NotoSansNewa-Regular.otf \
    NotoSansNewTaiLue-Regular.ttf \
    NotoSansNKo-Regular.ttf \
    NotoSansOgham-Regular.ttf \
    NotoSansOlChiki-Regular.ttf \
    NotoSansOldItalic-Regular.ttf \
    NotoSansOldNorthArabian-Regular.otf \
    NotoSansOldPermic-Regular.otf \
    NotoSansOldPersian-Regular.ttf \
    NotoSansOldSouthArabian-Regular.ttf \
    NotoSansOldTurkic-Regular.ttf \
    NotoSansOriya-Bold.ttf \
    NotoSansOriya-Regular.ttf \
    NotoSansOriyaUI-Bold.ttf \
    NotoSansOriyaUI-Regular.ttf \
    NotoSansOsage-Regular.ttf \
    NotoSansOsmanya-Regular.ttf \
    NotoSansPahawhHmong-Regular.otf \
    NotoSansPalmyrene-Regular.otf \
    NotoSansPauCinHau-Regular.otf \
    NotoSansPhagsPa-Regular.ttf \
    NotoSansPhoenician-Regular.ttf \
    NotoSansRejang-Regular.ttf \
    NotoSansRunic-Regular.ttf \
    NotoSansSamaritan-Regular.ttf \
    NotoSansSaurashtra-Regular.ttf \
    NotoSansSharada-Regular.otf \
    NotoSansShavian-Regular.ttf \
    NotoSansSinhala-VF.ttf \
    NotoSansSinhalaUI-VF.ttf \
    NotoSansSoraSompeng-Regular.otf \
    NotoSansSoyombo-VF.ttf \
    NotoSansSundanese-Regular.ttf \
    NotoSansSylotiNagri-Regular.ttf \
    NotoSansSyriacEastern-Regular.ttf \
    NotoSansSyriacEstrangela-Regular.ttf \
    NotoSansSyriacWestern-Regular.ttf \
    NotoSansTagalog-Regular.ttf \
    NotoSansTagbanwa-Regular.ttf \
    NotoSansTaiLe-Regular.ttf \
    NotoSansTaiTham-Regular.ttf \
    NotoSansTaiViet-Regular.ttf \
    NotoSansTakri-VF.ttf \
    NotoSansTamil-VF.ttf \
    NotoSansTamilUI-VF.ttf \
    NotoSansTelugu-VF.ttf \
    NotoSansTeluguUI-VF.ttf \
    NotoSansThaana-Bold.ttf \
    NotoSansThaana-Regular.ttf \
    NotoSansThai-Bold.ttf \
    NotoSansThai-Regular.ttf \
    NotoSansThaiUI-Bold.ttf \
    NotoSansThaiUI-Regular.ttf \
    NotoSansTifinagh-Regular.otf \
    NotoSansUgaritic-Regular.ttf \
    NotoSansVai-Regular.ttf \
    NotoSansWancho-Regular.otf \
    NotoSansWarangCiti-Regular.otf \
    NotoSansYi-Regular.ttf \
    NotoSerifArmenian-VF.ttf \
    NotoSerifBengali-VF.ttf \
    NotoSerifCJK-Regular.ttc \
    NotoSerifDevanagari-VF.ttf \
    NotoSerifDogra-Regular.ttf \
    NotoSerifEthiopic-VF.ttf \
    NotoSerifGeorgian-VF.ttf \
    NotoSerifGujarati-VF.ttf \
    NotoSerifGurmukhi-VF.ttf \
    NotoSerifHebrew-Bold.ttf \
    NotoSerifHebrew-Regular.ttf \
    NotoSerifHentaigana.ttf \
    NotoSerifKannada-VF.ttf \
    NotoSerifKhmer-Bold.otf \
    NotoSerifKhmer-Regular.otf \
    NotoSerifLao-Bold.ttf \
    NotoSerifLao-Regular.ttf \
    NotoSerifMalayalam-VF.ttf \
    NotoSerifMyanmar-Bold.otf \
    NotoSerifMyanmar-Regular.otf \
    NotoSerifNyiakengPuachueHmong-VF.ttf \
    NotoSerifSinhala-VF.ttf \
    NotoSerifTamil-VF.ttf \
    NotoSerifTelugu-VF.ttf \
    NotoSerifThai-Bold.ttf \
    NotoSerifThai-Regular.ttf \
    NotoSerifTibetan-VF.ttf \
    NotoSerifYezidi-VF.ttf \
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

