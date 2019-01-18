# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.camera.HAL3.enabled=1 \
    persist.vendor.camera.awb.sync=2 \
    persist.vendor.camera.depth.focus.cb=0 \
    persist.vendor.camera.exif.make=Xiaomi \
    persist.vendor.camera.exif.model=Redmi Note 5 \
    persist.vendor.camera.expose.aux=1 \
    persist.vendor.camera.fdvideo=1 \
    persist.vendor.camera.imglib.usefdlite=1 \
    persist.vendor.camera.isp.clock.optmz=0 \
    persist.vendor.camera.isp.turbo=1 \
    persist.vendor.camera.linkpreview=0 \
    persist.vendor.camera.ltm.overlap=13 \
    persist.vendor.camera.preview.ubwc=0 \
    persist.vendor.camera.stats.test=5 \
    persist.vendor.flash.light.lux=340 \
    persist.vendor.flash.low.lux=390 \
    persist.vendor.imx376_ofilm.light.lux=280 \
    persist.vendor.imx376_ofilm.low.lux=310 \
    persist.vendor.imx376_sunny.light.lux=280 \
    persist.vendor.imx376_sunny.low.lux=310 \
    persist.vendor.ov13855_sunny.light.lux=370 \
    persist.vendor.ov13855_sunny.low.lux=385 \
    persist.vendor.s5k3l8_ofilm.light.lux=367 \
    persist.vendor.s5k3l8_ofilm.low.lux=379 \
    persist.vendor.camera.fdvideo=1 \
    persist.vendor.camera.awb.sync=2 \

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.camera.hal1.packagelist=com.intsig.camscanner,com.btpn.dc,com.telkom.tracencare \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.motorola.faceunlock,com.android.camera

# Dirac
PRODUCT_PROPERTY_OVERRIDES += \
    persist.dirac.acs.controller=qem \
    persist.dirac.acs.storeSettings=1 \
    persist.dirac.acs.ignore_error=1

# Dirac headset effect
PRODUCT_PROPERTY_OVERRIDES += \
    ro.audio.soundfx.dirac=true \
    persist.audio.dirac.speaker=true

 #Ram Management 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.fha_enable=true \
    ro.sys.fw.bg_apps_limit=32 \
    ro.config.dha_cached_max=16 \
    ro.config.dha_empty_max=42 \
    ro.config.dha_empty_init=32 \
    ro.config.dha_lmk_scale=0.545 \
    ro.config.dha_th_rate=2.3 \
    ro.config.sdha_apps_bg_max=64 \
    ro.config.sdha_apps_bg_min=8
