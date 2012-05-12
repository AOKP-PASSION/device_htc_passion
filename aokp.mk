$(call inherit-product, device/htc/passion/full_passion.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)


# Setup device specific product configuration.
#
PRODUCT_NAME    := aokp_passion

PRODUCT_BRAND   := google
PRODUCT_DEVICE  := passion
PRODUCT_MODEL   := Nexus One

PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=passion \
				 BUILD_FINGERPRINT=google/passion/passion:2.3.6/GRK39F/189904:user/release-keys \
				 PRIVATE_BUILD_DESC="passion-user 2.3.6 GRK39F 189904 release-keys"