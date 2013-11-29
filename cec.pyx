# distutils: language = c++
# distutils: libraries = cec
from cython cimport sizeof
from libcpp cimport bool
from libc.string cimport strncpy, memcpy
from libc.stdint cimport *
from libc.stdlib cimport malloc, free

from cec_types cimport *
from cec_callbacks cimport fill_callbacks_struct

cdef extern from "libcec/cec.h" namespace "CEC" nogil:
    cdef cppclass ICECAdapter:
        bool Open(const char*, uint32_t)
        void Close()
        bool PingAdapter()
        bool StartBootloader()
        int8_t DetectAdapters(cec_adapter_descriptor*, uint8_t)
        void EnableCallbacks(void* param, ICECCallbacks* callbacks)


cdef extern from "libcec/cec.h" nogil:
    cdef void* CECInitialise(libcec_configuration*)
    cdef void CECDestroy(ICECAdapter*)

cdef class AdapterDescriptor:
    cdef bytes com_path
    cdef bytes com_name

    cdef fill(self, const cec_adapter_descriptor* desc):
        self.com_path = desc.strComPath
        self.com_name = desc.strComName

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
        
        self._adapter = <ICECAdapter*>CECInitialise(&conf)
        if self._adapter == NULL:
            raise RuntimeError("Couldn't initialise CEC adapter")

    def __dealloc__(self):
        if self._callbacks:
            del self._callbacks

        CECDestroy(self._adapter)

    def open(self, char* port, int timeout = 1000):
        cdef bool result = self._adapter.Open(port, timeout)
        return result

    def close(self):
        self.disable_callbacks()
        self._adapter.Close()

    def enable_callbacks(self):
        self._adapter.EnableCallbacks(<void*>self, self._callbacks)
    
    def disable_callbacks(self):
        self._adapter.EnableCallbacks(NULL, NULL)

    def list_adapters(self, uint8_t max_count=10):
        cdef cec_adapter_descriptor* device_descs = \
                <cec_adapter_descriptor*>malloc(max_count *
                        sizeof(cec_adapter_descriptor))

        count = self._adapter.DetectAdapters(device_descs, max_count)
        result = []
        for i in range(count):
            desc = AdapterDescriptor()
            desc.fill(&device_descs[i])
            result.append(desc)

        free(device_descs)
        return result

