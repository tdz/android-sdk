LOCAL_PATH := $(call my-dir)

host_common_SRC_FILES := \
     GLEScmImp.cpp       \
     GLEScmUtils.cpp     \
     GLEScmContext.cpp   \
     GLEScmValidate.cpp

ifneq ($(shell uname -m), x86_64)

### GLES_CM host implementation (On top of OpenGL) ########################
$(call emugl-begin-host-shared-library,libGLES_CM_translator)

$(call emugl-import,libGLcommon)

LOCAL_SRC_FILES := $(host_common_SRC_FILES)

$(call emugl-end-module)

else # x86_64

### GLES_CM host implementation, 64-bit ########################
$(call emugl-begin-host-shared-library,lib64GLES_CM_translator)

$(call emugl-import,lib64GLcommon)

LOCAL_LDLIBS += -m64
LOCAL_SRC_FILES := $(host_common_SRC_FILES)

$(call emugl-end-module)

endif
