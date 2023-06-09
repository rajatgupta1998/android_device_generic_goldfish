#
# Copyright (C) 2012 The Android Open Source Project
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
# This file is included by other product makefiles to add all the
# emulator-related modules to PRODUCT_PACKAGES.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_vendor.mk)
ifneq ($(EMULATOR_DISABLE_RADIO),true)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_vendor.mk)
endif

# need this for gles libraries to load properly
# after moving to /vendor/lib/
PRODUCT_PACKAGES += \
    vndk-sp

DEVICE_PACKAGE_OVERLAYS := device/generic/goldfish/overlay

PRODUCT_CHARACTERISTICS := emulator

PRODUCT_FULL_TREBLE_OVERRIDE := true

# goldfish vendor partition configurations
$(call inherit-product-if-exists, device/generic/goldfish/64bitonly/product/vendor.mk)

#watchdog tiggers reboot because location service is not
#responding, disble it for now.
#still keep it on internal master as it is still working
#once it is fixed in aosp, remove this block of comment.
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
#config.disable_location=true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.has_wide_color_display=false
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.has_HDR_display=false
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.use_color_management=false
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.protected_contents=false

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.com.google.locationfeatures=1

# disable setupwizard
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.setupwizard.mode=DISABLED
