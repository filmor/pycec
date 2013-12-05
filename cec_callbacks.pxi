# distutils: language = c++
# distutils: libraries = cec

from libc.stdint cimport uint8_t
from libcpp cimport bool
cimport cec_types
cimport cec_enums
# Imported for PyEval_InitThreads
cimport cython.parallel

cdef int log_message_cb(void* context, cec_types.cec_log_message msg) with gil:
    try:
        self = <Adapter>context
        self._callbacks_dict[CB_LOG](msg.level, msg.message)
    except:
        pass
    return 0

cdef int key_press_cb(void* context, cec_types.cec_keypress msg) with gil:
    try:
        self = <Adapter>context
        self._callbacks_dict[CB_KEY](msg.keycode, msg.duration)
    except:
        pass
    return 0

cdef int command_cb(void* context, cec_types.cec_command msg) with gil:
    try:
        self = <Adapter>context
        self._callbacks_dict[CB_COMMAND]()
    except:
        pass
    return 0

cdef int config_cb(void* context, const cec_types.libcec_configuration msg) with gil:
    try:
        self = <Adapter>context
        self._callbacks_dict[CB_CONFIG]()
    except:
        pass
    return 0

cdef int alert_cb(void* context, const cec_enums.libcec_alert msg1, const
                  cec_types.libcec_parameter msg2) with gil:
    try:
        self = <Adapter>context
        self._callbacks_dict[CB_ALERT]()
    except:
        pass
    return 0

cdef int menu_cb(void* context, const cec_enums.cec_menu_state msg) with gil:
    try:
        self = <Adapter>context
        self._callbacks_dict[CB_MENU]()
    except:
        pass
    return 0

cdef void source_cb(void* context, const cec_enums.cec_logical_address msg1,
                    const uint8_t msg2) with gil:
    try:
        self = <Adapter>context
        self._callbacks_dict[CB_SOURCE]()
    except:
        pass

cdef void toggle_callback(cec_types.ICECCallbacks* ptr,
                          cec_enums.callback_type tp, bool state) except *:
    if tp == CB_LOG:
        ptr.CBCecLogMessage = &log_message_cb if state else NULL
    elif tp == CB_KEY:
        ptr.CBCecKeyPress = &key_press_cb if state else NULL
    elif tp == CB_COMMAND:
        ptr.CBCecCommand = &command_cb if state else NULL
    elif tp == CB_CONFIG:
        ptr.CBCecConfigurationChanged = &config_cb if state else NULL
    elif tp == CB_ALERT:
        ptr.CBCecAlert = &alert_cb if state else NULL
    elif tp == CB_MENU:
        ptr.CBCecMenuStateChanged = &menu_cb if state else NULL
    elif tp == CB_SOURCE:
        ptr.CBCecSourceActivated = &source_cb if state else NULL
    else:
        raise AttributeError("Unknown callback type %s" % tp)

