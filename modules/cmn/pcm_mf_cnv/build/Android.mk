LOCAL_PATH := $(call my-dir)/..

PCM_MF_CNV_C_INCLUDES := \
    $(LOCAL_PATH)/capi/pcm_cnv/api \
    $(LOCAL_PATH)/capi/pcm_cnv/inc \
    $(LOCAL_PATH)/capi/pcm_cnv/src \
    $(LOCAL_PATH)/capi/mfc/api \
    $(LOCAL_PATH)/capi/mfc/inc \
    $(LOCAL_PATH)/lib/inc \
    ${PROJECT_SOURCE_DIR}/modules/audio/pcm_encoder/api \
    ${PROJECT_SOURCE_DIR}/modules/audio/pcm_encoder/inc \
    ${PROJECT_SOURCE_DIR}/modules/audio/pcm_decoder/api \
    ${PROJECT_SOURCE_DIR}/modules/audio/pcm_decoder/inc

PCM_MF_CNV_EXPORT_C_INCLUDE_DIRS := \
    $(LOCAL_PATH)/capi/pcm_cnv/api \
    $(LOCAL_PATH)/capi/pcm_cnv/inc \
    $(LOCAL_PATH)/capi/mfc/api \
    $(LOCAL_PATH)/capi/mfc/inc

PCM_MF_CNV_SRC_FILES := \
    capi/pcm_cnv/src/capi_pcm_mf_cnv.cpp \
    capi/pcm_cnv/src/capi_pcm_mf_cnv_island.cpp \
    capi/pcm_cnv/src/capi_pcm_mf_cnv_utils.cpp \
    capi/pcm_cnv/src/capi_pcm_mf_cnv_utils_island.cpp \
    lib/src/pc_converter.cpp \
    lib/src/pc_converter_island.cpp \
    lib/src/pc_init.cpp \
    lib/src/pc_process.cpp \
    lib/src/pc_process_island.cpp \
    lib/src/pc_float/pc_float.cpp

PCM_MF_CNV_CFLAGS    += -O3 -Wall -ffixed-x18

PCM_MF_CNV_CFLAGS_32 += -mfpu=neon
PCM_MF_CNV_CFLAGS_64 += -march=armv8-a+crypto

PCM_MF_CNV_SHARED_LIBS := \
    liblx-osal \
    libar-gpr \
    libdynamic_resampler \
    libiir_resampler

PCM_MF_CNV_HEADER_LIBS := \
    lib_spm_cmn_utils_headers \
    libposal_headers \
    libspf_interfaces_headers \
    libspf_api \
    libspf_utils_headers \
    libspf_gu_headers \
    libspf_topo_utils_headers

PCM_MF_CNV_STATIC_LIBS := \
    lib_spm_cmn_utils \
    libposal \
    libspf_interfaces \
    libspf_utils \
    libspf_gu \
    libspf_topo_utils \
    lib_chmixer

#####################################
# Module 1: PCM_CNV
#####################################
include $(CLEAR_VARS)
LOCAL_MODULE                      := lib_pcm_cnv
LOCAL_VENDOR_MODULE               := true
LOCAL_MODULE_TAGS                 := optional

LOCAL_C_INCLUDES                  := $(PCM_MF_CNV_C_INCLUDES)
LOCAL_EXPORT_C_INCLUDE_DIRS       := $(PCM_MF_CNV_EXPORT_C_INCLUDE_DIRS)
LOCAL_SRC_FILES                   := $(PCM_MF_CNV_SRC_FILES)
LOCAL_CFLAGS                      := $(PCM_MF_CNV_CFLAGS)
LOCAL_CFLAGS_32                   := $(PCM_MF_CNV_CFLAGS_32)
LOCAL_CFLAGS_64                   := $(PCM_MF_CNV_CFLAGS_64)
LOCAL_CPPFLAGS                    := $(PCM_MF_CNV_CPPFLAGS)
LOCAL_SHARED_LIBRARIES            := $(PCM_MF_CNV_SHARED_LIBS)
LOCAL_HEADER_LIBRARIES            := $(PCM_MF_CNV_HEADER_LIBS)
LOCAL_STATIC_LIBRARIES            := $(PCM_MF_CNV_STATIC_LIBS)

LOCAL_SPF_MODULE_KCONFIG          := CONFIG_PCM_CNV
LOCAL_SPF_MODULE_NAME             := $(LOCAL_MODULE)
LOCAL_SPF_MODULE_MAJOR_VER        := 1
LOCAL_SPF_MODULE_MINOR_VER        := 0
LOCAL_SPF_MODULE_AMDB_ITYPE       := "capi"
LOCAL_SPF_MODULE_AMDB_MTYPE       := "pp"
LOCAL_SPF_MODULE_AMDB_MID         := "0x07001003"
LOCAL_SPF_MODULE_AMDB_TAG         := "capi_pcm_cnv"
LOCAL_SPF_MODULE_AMDB_MOD_NAME    := "MODULE_ID_PCM_CNV"
LOCAL_SPF_MODULE_QACT_MODULE_TYPE := ""
LOCAL_SPF_MODULE_AMDB_FMT_ID1     := "MODULE_ID_PCM_CNV"
LOCAL_SPF_MODULE_H2XML_HEADERS    := "$(LOCAL_PATH)/capi/pcm_cnv/api/pcm_converter_api.h"

include $(BUILD_ARE_MODULES)

#####################################
# Module 2: PCM_DECODER
#####################################
include $(CLEAR_VARS)
LOCAL_MODULE                      := lib_pcm_decoder
LOCAL_VENDOR_MODULE               := true
LOCAL_MODULE_TAGS                 := optional

LOCAL_C_INCLUDES                  := $(PCM_MF_CNV_C_INCLUDES)
LOCAL_EXPORT_C_INCLUDE_DIRS       := $(PCM_MF_CNV_EXPORT_C_INCLUDE_DIRS)
LOCAL_SRC_FILES                   := $(PCM_MF_CNV_SRC_FILES)
LOCAL_CFLAGS                      := $(PCM_MF_CNV_CFLAGS)
LOCAL_CFLAGS_32                   := $(PCM_MF_CNV_CFLAGS_32)
LOCAL_CFLAGS_64                   := $(PCM_MF_CNV_CFLAGS_64)
LOCAL_CPPFLAGS                    := $(PCM_MF_CNV_CPPFLAGS)
LOCAL_SHARED_LIBRARIES            := $(PCM_MF_CNV_SHARED_LIBS)
LOCAL_HEADER_LIBRARIES            := $(PCM_MF_CNV_HEADER_LIBS)
LOCAL_STATIC_LIBRARIES            := $(PCM_MF_CNV_STATIC_LIBS)

LOCAL_SPF_MODULE_KCONFIG          := CONFIG_PCM_DECODER
LOCAL_SPF_MODULE_NAME             := $(LOCAL_MODULE)
LOCAL_SPF_MODULE_MAJOR_VER        := 1
LOCAL_SPF_MODULE_MINOR_VER        := 0
LOCAL_SPF_MODULE_AMDB_ITYPE       := "capi"
LOCAL_SPF_MODULE_AMDB_MTYPE       := "decoder"
LOCAL_SPF_MODULE_AMDB_MID         := "0x07001005"
LOCAL_SPF_MODULE_AMDB_TAG         := "capi_pcm_dec"
LOCAL_SPF_MODULE_AMDB_MOD_NAME    := "MODULE_ID_PCM_DEC"
LOCAL_SPF_MODULE_QACT_MODULE_TYPE := ""
LOCAL_SPF_MODULE_AMDB_FMT_ID1     := "MEDIA_FMT_ID_PCM"
LOCAL_SPF_MODULE_H2XML_HEADERS    := "${PROJECT_SOURCE_DIR}/modules/audio/pcm_decoder/api/pcm_decoder_api.h"

include $(BUILD_ARE_MODULES)

#####################################
# Module 3: PCM_ENCODER
#####################################
include $(CLEAR_VARS)
LOCAL_MODULE                      := lib_pcm_encoder
LOCAL_VENDOR_MODULE               := true
LOCAL_MODULE_TAGS                 := optional

LOCAL_C_INCLUDES                  := $(PCM_MF_CNV_C_INCLUDES)
LOCAL_EXPORT_C_INCLUDE_DIRS       := $(PCM_MF_CNV_EXPORT_C_INCLUDE_DIRS)
LOCAL_SRC_FILES                   := $(PCM_MF_CNV_SRC_FILES)
LOCAL_CFLAGS                      := $(PCM_MF_CNV_CFLAGS)
LOCAL_CFLAGS_32                   := $(PCM_MF_CNV_CFLAGS_32)
LOCAL_CFLAGS_64                   := $(PCM_MF_CNV_CFLAGS_64)
LOCAL_CPPFLAGS                    := $(PCM_MF_CNV_CPPFLAGS)
LOCAL_SHARED_LIBRARIES            := $(PCM_MF_CNV_SHARED_LIBS)
LOCAL_HEADER_LIBRARIES            := $(PCM_MF_CNV_HEADER_LIBS)
LOCAL_STATIC_LIBRARIES            := $(PCM_MF_CNV_STATIC_LIBS)

LOCAL_SPF_MODULE_KCONFIG          := CONFIG_PCM_ENCODER
LOCAL_SPF_MODULE_NAME             := $(LOCAL_MODULE)
LOCAL_SPF_MODULE_MAJOR_VER        := 1
LOCAL_SPF_MODULE_MINOR_VER        := 0
LOCAL_SPF_MODULE_AMDB_ITYPE       := "capi"
LOCAL_SPF_MODULE_AMDB_MTYPE       := "encoder"
LOCAL_SPF_MODULE_AMDB_MID         := "0x07001004"
LOCAL_SPF_MODULE_AMDB_TAG         := "capi_pcm_enc"
LOCAL_SPF_MODULE_AMDB_MOD_NAME    := "MODULE_ID_PCM_ENC"
LOCAL_SPF_MODULE_QACT_MODULE_TYPE := ""
LOCAL_SPF_MODULE_AMDB_FMT_ID1     := "MEDIA_FMT_ID_PCM"
LOCAL_SPF_MODULE_H2XML_HEADERS    := "${PROJECT_SOURCE_DIR}/modules/audio/pcm_encoder/api/pcm_encoder_api.h"

include $(BUILD_ARE_MODULES)

#####################################
# Module 4: MFC
#####################################
include $(CLEAR_VARS)
LOCAL_MODULE                      := lib_mfc
LOCAL_VENDOR_MODULE               := true
LOCAL_MODULE_TAGS                 := optional

LOCAL_C_INCLUDES                  := $(PCM_MF_CNV_C_INCLUDES)
LOCAL_EXPORT_C_INCLUDE_DIRS       := $(PCM_MF_CNV_EXPORT_C_INCLUDE_DIRS)
LOCAL_SRC_FILES                   := $(PCM_MF_CNV_SRC_FILES)
LOCAL_CFLAGS                      := $(PCM_MF_CNV_CFLAGS)
LOCAL_CFLAGS_32                   := $(PCM_MF_CNV_CFLAGS_32)
LOCAL_CFLAGS_64                   := $(PCM_MF_CNV_CFLAGS_64)
LOCAL_CPPFLAGS                    := $(PCM_MF_CNV_CPPFLAGS)
LOCAL_SHARED_LIBRARIES            := $(PCM_MF_CNV_SHARED_LIBS)
LOCAL_HEADER_LIBRARIES            := $(PCM_MF_CNV_HEADER_LIBS)
LOCAL_STATIC_LIBRARIES            := $(PCM_MF_CNV_STATIC_LIBS)

LOCAL_SPF_MODULE_KCONFIG          := CONFIG_MFC
LOCAL_SPF_MODULE_NAME             := $(LOCAL_MODULE)
LOCAL_SPF_MODULE_MAJOR_VER        := 1
LOCAL_SPF_MODULE_MINOR_VER        := 0
LOCAL_SPF_MODULE_AMDB_ITYPE       := "capi"
LOCAL_SPF_MODULE_AMDB_MTYPE       := "pp"
LOCAL_SPF_MODULE_AMDB_MID         := "0x07001015"
LOCAL_SPF_MODULE_AMDB_TAG         := "capi_mfc"
LOCAL_SPF_MODULE_AMDB_MOD_NAME    := "MODULE_ID_MFC"
LOCAL_SPF_MODULE_QACT_MODULE_TYPE := ""
LOCAL_SPF_MODULE_AMDB_FMT_ID1     := "MODULE_ID_MFC"
LOCAL_SPF_MODULE_H2XML_HEADERS    := "$(LOCAL_PATH)/capi/mfc/api/mfc_api.h"

include $(BUILD_ARE_MODULES)
