LOCAL_PATH := $(call my-dir)

ifneq ($(shell uname -m), x86_64)

$(call emugl-begin-host-shared-library,libut_rendercontrol_dec)
$(call emugl-import, libOpenglCodecCommon)
$(call emugl-gen-decoder,$(LOCAL_PATH),ut_rendercontrol)
$(call emugl-end-module)

endif
