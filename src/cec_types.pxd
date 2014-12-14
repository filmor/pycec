from libc.stdint cimport *
from libcpp cimport bool
cimport cec_enums

cdef extern from "libcec/cectypes.h" namespace "CEC":
    cdef cppclass ICECCallbacks:
        int (*CBCecLogMessage)(void*, const cec_log_message)
        int (*CBCecKeyPress)(void*, const cec_keypress)
        int (*CBCecCommand)(void*, const cec_command)
        int (*CBCecConfigurationChanged)(void*, const libcec_configuration)
        int (*CBCecAlert)(void*, const cec_enums.libcec_alert, const libcec_parameter)
        int (*CBCecMenuStateChanged)(void*, const cec_enums.cec_menu_state)
        void (*CBCecSourceActivated)(void*, const cec_enums.cec_logical_address,
                const uint8_t)

    cdef cppclass cec_device_type_list:
        void Clear()
        void Add(cec_enums.cec_device_type)
        void IsSet(cec_enums.cec_device_type)
        bool IsEmpty() const

    cdef cppclass libcec_configuration:
        int clientVersion
        char strDeviceName[13]
        bool bActivateSource
        ICECCallbacks* callbacks
        void* callbackParam
        cec_device_type_list deviceTypes

    # Callback parameters
    cdef struct cec_log_message:
        char message[1024]
        cec_enums.cec_log_level level
        int64_t time

    cdef struct cec_keypress:
        cec_enums.cec_user_control_code keycode
        unsigned int duration

    cdef struct cec_command:
        pass

    cdef struct libcec_parameter:
        pass

    # Adapter descriptor
    cdef struct cec_adapter_descriptor:
        char             strComPath[1024]
        char             strComName[1024]
        uint16_t         iVendorId
        uint16_t         iProductId
        uint16_t         iFirmwareVersion
        uint16_t         iPhysicalAddress
        uint32_t         iFirmwareBuildDate
        cec_enums.cec_adapter_type adapterType

