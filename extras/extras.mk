#samuaz-builds-extras

PRODUCT_PACKGES+= \
    bash \
    e2fsck \
    tune2fs

# Nexus One Stock Boot Animation
PRODUCT_COPY_FILES += device/htc/passion/extras/bootanimation.zip:system/media/bootanimation.zip
