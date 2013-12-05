# distutils: language = c++

from libcpp cimport bool
from cec_types cimport ICECCallbacks

cdef enum callback_type:
    CB_LOG
    CB_KEY
    CB_COMMAND
    CB_CONFIG
    CB_ALERT
    CB_MENU
    CB_SOURCE

cdef void toggle_callback(ICECCallbacks*, callback_type, bool state)

