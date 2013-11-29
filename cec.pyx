# distutils: language = c++
# distutils: libraries = cec
from libcpp cimport bool
from libc.string cimport strncpy
from libc.stdint cimport uint32_t

from cec_types cimport *
from cec_callbacks cimport fill_callbacks_struct

cdef extern from "libcec/cec.h" namespace "CEC" nogil:
    cdef cppclass ICECAdapter:
        bool Open(const char*, uint32_t)
        void Close()
        bool PingAdapter()
        bool StartBootloader()
        void EnableCallbacks(void* param, ICECCallbacks* callbacks)


cdef extern from "libcec/cec.h" nogil:
    cdef void* CECInitialise(libcec_configuration*)
    cdef void CECDestroy(ICECAdapter*)

cdef class Adapter:
    cdef ICECAdapter* _adapter
    cdef ICECCallbacks* _callbacks

    cdef public object log_callback
    cdef public object key_callback
    cdef public object command_callback
    cdef public object config_callback
    cdef public object alert_callback
    cdef public object menu_callback
    cdef public object source_callback

    def __cinit__(self, device_name=b"python"):
        name_len = len(device_name)
        if name_len > 12:
            raise RuntimeError("Device name has to be less than 13 characters")

        cdef libcec_configuration conf
        cdef char* c_device_name = device_name

        strncpy(c_device_name, conf.strDeviceName, name_len)
        conf.strDeviceName[name_len] = '\0'
        conf.bActivateSource = 0
        conf.clientVersion = 0x2103 # version 2.1.3

        self._callbacks = new ICECCallbacks()
        fill_callbacks_struct(self._callbacks)
        conf.callbacks = self._callbacks
        conf.callbackParam = <void*>self
        
        self._adapter = <ICECAdapter*>CECInitialise(&conf)
        if self._adapter == NULL:
            raise RuntimeError("Couldn't initialise CEC adapter")

    def __dealloc__(self):
        if self._callbacks:
            del self._callbacks

        CECDestroy(self._adapter)

    def open(self, char* port, int timeout):
        cdef bool result = self._adapter.Open(port, timeout)
        if result:
            pass

    def close(self):
        self._adapter.EnableCallbacks(NULL, NULL)
        self._adapter.Close()

