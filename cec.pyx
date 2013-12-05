# distutils: language = c++
# distutils: libraries = cec
from cython cimport sizeof
from libcpp cimport bool
from libc.string cimport strncpy, memcpy
from libc.stdint cimport *
from libc.stdlib cimport malloc, free

from cec_types cimport *
cimport cec_enums

include "cec_enums_py.pxi"
include "cec_callbacks.pxi"

cdef extern from "libcec/cec.h" namespace "CEC" nogil:
    cdef cppclass ICECAdapter:
        bool Open(const char*, uint32_t)
        void Close()
        bool PingAdapter()
        bool StartBootloader()
        int8_t DetectAdapters(cec_adapter_descriptor*, uint8_t)
        void EnableCallbacks(void* param, ICECCallbacks* callbacks)
        void InitVideoStandalone()

cdef extern from "libcec/cec.h" nogil:
    cdef void* CECInitialise(libcec_configuration*)
    cdef void CECDestroy(ICECAdapter*)

# Global
cdef bool _video_initialized = False

cdef class AdapterDescriptor:
    cdef readonly str com_path
    cdef readonly str com_name

    cdef fill(self, const cec_adapter_descriptor* desc):
        self.com_path = bytes(desc.strComPath).decode("utf-8")
        self.com_name = bytes(desc.strComName).decode("utf-8")

cdef class Adapter:
    cdef ICECAdapter* _adapter
    cdef ICECCallbacks* _callbacks

    # TODO: Only replace if the state actually changes
    cdef void _toggle_callback(self, cec_enums.callback_type tp, bool state):
        cdef ICECCallbacks* new_callbacks = new ICECCallbacks()
        if self._callbacks:
            memcpy(new_callbacks, self._callbacks, sizeof(ICECCallbacks))

        toggle_callback(new_callbacks, tp, state)

        self.disable_callbacks()
        if self._callbacks:
            del self._callbacks
        
        self._callbacks = new_callbacks
        self.enable_callbacks()

    cdef dict _callbacks_dict

    def set_callback(self, cec_enums.callback_type tp, object callback):
        if callback is None:
            self._toggle_callback(tp, False)
        elif not callable(callback):
            raise RuntimeError("Parameter not callable")
        else:
            self._callbacks_dict[tp] = callback
            self._toggle_callback(tp, True)

    def get_callback(self, cec_enums.callback_type tp):
        return self._callbacks_dict.get(tp, None)

    def unset_callback(self, cec_enums.callback_type tp):
        self.set_callback(tp, None)

    def __cinit__(self, device_name="python"):
        cdef libcec_configuration conf
        cdef bytes encoded_dn = device_name.encode("utf-8")
        cdef char* c_device_name = encoded_dn

        if len(encoded_dn) > 13:
            raise RuntimeError("Device name has to be less than 13 characters")

        strncpy(encoded_dn, conf.strDeviceName, len(encoded_dn))
        conf.bActivateSource = 0
        conf.clientVersion = 0x2103 # version 2.1.3
        conf.deviceTypes.Add(CEC_DEVICE_TYPE_PLAYBACK_DEVICE)

        self._adapter = <ICECAdapter*>CECInitialise(&conf)
        if self._adapter == NULL:
            raise RuntimeError("Couldn't initialise CEC adapter")

        global _video_initialized
        if not _video_initialized:
            self._adapter.InitVideoStandalone()
            _video_initialized = True

        self._callbacks = new ICECCallbacks()
        self._callbacks_dict = dict()
        self.enable_callbacks()

    def __dealloc__(self):
        self.disable_callbacks()

        if self._callbacks:
            del self._callbacks

        CECDestroy(self._adapter)

    def open(self, str port = "", int timeout = 1000):
        if port == "":
            l = self.list_adapters(1)
            if len(l) == 0:
                raise RuntimeError("No adapter found")
            else:
                port = l[0].com_name

        cdef bytes encoded = port.encode("utf-8")
        cdef const char* c_encoded = encoded
        cdef bool result
        with nogil:
            result = self._adapter.Open(c_encoded, timeout)
        return result

    def close(self):
        self.disable_callbacks()
        with nogil:
            self._adapter.Close()

    def enable_callbacks(self):
        with nogil:
            self._adapter.EnableCallbacks(<void*>self, self._callbacks)
    
    def disable_callbacks(self):
        with nogil:
            self._adapter.EnableCallbacks(NULL, NULL)

    def list_adapters(self, uint8_t max_count=10):
        cdef cec_adapter_descriptor* device_descs = \
                <cec_adapter_descriptor*>malloc(max_count *
                        sizeof(cec_adapter_descriptor))

        with nogil:
            count = self._adapter.DetectAdapters(device_descs, max_count)

        result = []
        if count <= 0:
            return result

        for i in range(count):
            desc = AdapterDescriptor()
            desc.fill(&device_descs[i])
            result.append(desc)

        free(device_descs)
        return result

