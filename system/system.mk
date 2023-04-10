$(warning "System.mk invoked by Rajat Emulator 64 bit vendor.mk" )

$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system.mk)

PRODUCT_PACKAGES += SampleSystemApp

_my_paths := \
 $(TARGET_COPY_OUT_SYSTEM)/

$(call require-artifacts-in-path, $(_my_paths),)