# distutils: language = c++
# distutils: libraries = cec

from libc.stdint cimport uint8_t
from cec_types cimport *
# Imported for PyEval_InitThreads
cimport cython.parallel

cdef int log_message_cb(void* context, cec_log_message msg) with gil:
    print("Log:", msg.message)
    try:
        self = <object>context
        self.log_callback(msg.level, msg.message)
    except:
        pass
    return 0

cdef int key_press_cb(void* context, cec_keypress msg) with gil:
    print("Keypress")
    try:
        self = <object>context
        self.key_callback()
    except:
        pass
    return 0

cdef int command_cb(void* context, cec_command msg) with gil:
    print("Command")
    try:
        self = <object>context
        self.command_callback()
    except:
        pass
    return 0

cdef int config_cb(void* context, const libcec_configuration msg) with gil:
    print("Config")
    try:
        self = <object>context
        self.config_callback()
    except:
        pass
    return 0

cdef int alert_cb(void* context, const libcec_alert msg1, const libcec_parameter
        msg2) with gil:
    print("Alert")
    try:
        self = <object>context
        self.alert_callback()
    except:
        pass
    return 0

cdef int menu_cb(void* context, const cec_menu_state msg) with gil:
    print("Menu")
    try:
        self = <object>context
        self.menu_callback()
    except:
        pass
    return 0

cdef void source_cb(void* context, const cec_logical_address msg1, const uint8_t
        msg2) with gil:
    print("Source")
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

