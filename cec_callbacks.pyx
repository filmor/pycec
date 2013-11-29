# distutils: language = c++
# distutils: libraries = cec

from libc.stdint cimport uint8_t
from cec_types cimport *

cdef int log_message_cb(void* context, cec_log_message msg):
    try:
        self = <object>context
        self.log_callback()
    finally:
        return 1

cdef int key_press_cb(void* context, cec_keypress msg):
    try:
        self = <object>context
        self.key_callback()
    finally:
        return 1

cdef int command_cb(void* context, cec_command msg):
    try:
        self = <object>context
        self.command_callback()
    finally:
        return 1

cdef int config_cb(void* context, const libcec_configuration msg):
    try:
        self = <object>context
        self.config_callback()
    finally:
        return 1

cdef int alert_cb(void* context, const libcec_alert msg1, const libcec_parameter msg2):
    try:
        self = <object>context
        self.alert_callback()
    finally:
        return 1

cdef int menu_cb(void* context, const cec_menu_state msg):
    try:
        self = <object>context
        self.menu_callback()
    finally:
        return 1

cdef void source_cb(void* context, const cec_logical_address msg1, const uint8_t msg2):
    try:
        self = <object>context
        self.source_callback()
    except:
        pass

cdef void fill_callbacks_struct(ICECCallbacks* ptr):
    ptr.CBCecLogMessage = &log_message_cb
    ptr.CBCecKeyPress = &key_press_cb
    ptr.CBCecCommand = &command_cb
    ptr.CBCecConfigurationChanged = &config_cb
    ptr.CBCecAlert = &alert_cb
    ptr.CBCecMenuStateChanged = &menu_cb
    ptr.CBCecSourceActivated = &source_cb

