from libc.stdint cimport *
from libcpp cimport bool
from cec_enums cimport *

cdef extern from "libcec/cectypes.h" namespace "CEC":
    cdef cppclass ICECCallbacks:
        int (*CBCecLogMessage)(void*, const cec_log_message)
        int (*CBCecKeyPress)(void*, const cec_keypress)
        int (*CBCecCommand)(void*, const cec_command)
        int (*CBCecConfigurationChanged)(void*, const libcec_configuration)
        int (*CBCecAlert)(void*, const libcec_alert, const libcec_parameter)
        int (*CBCecMenuStateChanged)(void*, const cec_menu_state)
        void (*CBCecSourceActivated)(void*, const cec_logical_address, const uint8_t)

    cdef cppclass libcec_configuration:
        int clientVersion
        char strDeviceName[13]
        bool bActivateSource
        ICECCallbacks* callbacks
        void* callbackParam

    # Callback parameters
    cdef struct cec_log_message:
        char message[1024]
        cec_log_level level
        int64_t time

    cdef struct cec_keypress:
        cec_user_control_code keycode
        unsigned int duration

    cdef struct cec_command:
        pass

    cdef struct libcec_parameter:
        pass

