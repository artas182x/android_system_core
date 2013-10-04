LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# files that live under /system/etc/...

copy_from := \
	etc/hosts


copy_to := $(addprefix $(TARGET_OUT)/,$(copy_from))
copy_from := $(addprefix $(LOCAL_PATH)/,$(copy_from))

$(copy_to) : PRIVATE_MODULE := system_etcdir
$(copy_to) : $(TARGET_OUT)/% : $(LOCAL_PATH)/% | $(ACP)
	$(transform-prebuilt-to-target)

ALL_PREBUILT += $(copy_to)


# files that live under /...

# Only copy init.rc if the target doesn't have its own.
ifneq ($(TARGET_PROVIDES_INIT_RC),true)
file := $(TARGET_ROOT_OUT)/init.rc
$(file) : $(LOCAL_PATH)/init.rc | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
$(INSTALLED_RAMDISK_TARGET): $(file)
endif

file := $(TARGET_ROOT_OUT)/ueventd.rc
$(file) : $(LOCAL_PATH)/ueventd.rc | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
$(INSTALLED_RAMDISK_TARGET): $(file)

# init.usb.rc is handled by build/target/product/core.rc


# create some directories (some are mount points)
DIRS := $(addprefix $(TARGET_ROOT_OUT)/, \
		sbin \
		dev \
		proc \
		sys \
		system \
		data \
	) \
	$(TARGET_OUT_DATA)

$(DIRS):
	@echo Directory: $@
	@mkdir -p $@

ALL_PREBUILT += $(DIRS)

file := $(TARGET_ROOT_OUT)/sbin/bigmemcheck
$(file) : $(LOCAL_PATH)/sbin/bigmemcheck | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
$(INSTALLED_RAMDISK_TARGET): $(file)

file := $(TARGET_ROOT_OUT)/sbin/fancyinit1
$(file) : $(LOCAL_PATH)/sbin/fancyinit1 | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
$(INSTALLED_RAMDISK_TARGET): $(file)

file := $(TARGET_ROOT_OUT)/sbin/fancyinit2
$(file) : $(LOCAL_PATH)/sbin/fancyinit2 | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
$(INSTALLED_RAMDISK_TARGET): $(file)

file := $(TARGET_ROOT_OUT)/sbin/media_profiles.xml
$(file) : $(LOCAL_PATH)/sbin/media_profiles.xml | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
$(INSTALLED_RAMDISK_TARGET): $(file)

file := $(TARGET_ROOT_OUT)/sbin/power.tuna.so
$(file) : $(LOCAL_PATH)/sbin/power.tuna.so | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
$(INSTALLED_RAMDISK_TARGET): $(file)

file := $(TARGET_ROOT_OUT)/sbin/binaries/busybox
$(file) : $(LOCAL_PATH)/sbin/binaries/busybox | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
$(INSTALLED_RAMDISK_TARGET): $(file)

file := $(TARGET_ROOT_OUT)/sbin/binaries/tune2fs
$(file) : $(LOCAL_PATH)/sbin/binaries/tune2fs | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
$(INSTALLED_RAMDISK_TARGET): $(file)
