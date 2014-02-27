LOCAL_PATH := $(call my-dir)


ifneq ($(shell uname -m), x86_64)

### host library ############################################
$(call emugl-begin-host-static-library,lib_renderControl_dec)
$(call emugl-import,libOpenglCodecCommon)
$(call emugl-gen-decoder,$(LOCAL_PATH),renderControl)
# For renderControl_types.h
$(call emugl-export,C_INCLUDES,$(LOCAL_PATH))
$(call emugl-end-module)

else # x86_64

### host library, 64-bit ####################################
$(call emugl-begin-host-static-library,lib64_renderControl_dec)
$(call emugl-import,lib64OpenglCodecCommon)
$(call emugl-gen-decoder,$(LOCAL_PATH),renderControl)
# For renderControl_types.h
$(call emugl-export,C_INCLUDES,$(LOCAL_PATH))
$(call emugl-export,CFLAGS,-m64)
$(call emugl-end-module)

endif
