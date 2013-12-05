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
        void InitVideoStandalone()


cdef extern from "libcec/cec.h" nogil:
    cdef void* CECInitialise(libcec_configuration*)
    cdef void CECDestroy(ICECAdapter*)

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

    cdef public object log_callback
    cdef public object key_callback
    cdef public object command_callback
    cdef public object config_callback
    cdef public object alert_callback
    cdef public object menu_callback
    cdef public object source_callback

    def __cinit__(self, device_name="python"):
        # TODO: This should be called globally, since InitVideo may only be
        #       called once (at most)
        cdef libcec_configuration conf
        cdef bytes encoded_dn = device_name.encode("utf-8")
        cdef char* c_device_name = encoded_dn

        if len(encoded_dn) > 13:
            raise RuntimeError("Device name has to be less than 13 characters")


        strncpy(encoded_dn, conf.strDeviceName, len(encoded_dn))
        conf.bActivateSource = 0
        conf.clientVersion = 0x2103 # version 2.1.3
        conf.deviceTypes.Add(CEC_DEVICE_TYPE_PLAYBACK_DEVICE)

        self._callbacks = new ICECCallbacks()
        fill_callbacks_struct(self._callbacks)
        
        self._adapter = <ICECAdapter*>CECInitialise(&conf)
        if self._adapter == NULL:
            raise RuntimeError("Couldn't initialise CEC adapter")

        global _video_initialized
        if not _video_initialized:
            self._adapter.InitVideoStandalone()
            _video_initialized = True

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

