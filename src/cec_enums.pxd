cdef enum callback_type:
    CB_LOG
    CB_KEY
    CB_COMMAND
    CB_CONFIG
    CB_ALERT
    CB_MENU
    CB_SOURCE

cdef extern from "libcec/cectypes.h" namespace "CEC":
    enum cec_log_level:
        CEC_LOG_ERROR   = 1
        CEC_LOG_WARNING = 2
        CEC_LOG_NOTICE  = 4
        CEC_LOG_TRAFFIC = 8
        CEC_LOG_DEBUG   = 16
        CEC_LOG_ALL     = 31

    enum cec_user_control_code:
        CEC_USER_CONTROL_CODE_SELECT                      = 0x00
        CEC_USER_CONTROL_CODE_UP                          = 0x01
        CEC_USER_CONTROL_CODE_DOWN                        = 0x02
        CEC_USER_CONTROL_CODE_LEFT                        = 0x03
        CEC_USER_CONTROL_CODE_RIGHT                       = 0x04
        CEC_USER_CONTROL_CODE_RIGHT_UP                    = 0x05
        CEC_USER_CONTROL_CODE_RIGHT_DOWN                  = 0x06
        CEC_USER_CONTROL_CODE_LEFT_UP                     = 0x07
        CEC_USER_CONTROL_CODE_LEFT_DOWN                   = 0x08
        CEC_USER_CONTROL_CODE_ROOT_MENU                   = 0x09
        CEC_USER_CONTROL_CODE_SETUP_MENU                  = 0x0A
        CEC_USER_CONTROL_CODE_CONTENTS_MENU               = 0x0B
        CEC_USER_CONTROL_CODE_FAVORITE_MENU               = 0x0C
        CEC_USER_CONTROL_CODE_EXIT                        = 0x0D
        CEC_USER_CONTROL_CODE_NUMBER0                     = 0x20
        CEC_USER_CONTROL_CODE_NUMBER1                     = 0x21
        CEC_USER_CONTROL_CODE_NUMBER2                     = 0x22
        CEC_USER_CONTROL_CODE_NUMBER3                     = 0x23
        CEC_USER_CONTROL_CODE_NUMBER4                     = 0x24
        CEC_USER_CONTROL_CODE_NUMBER5                     = 0x25
        CEC_USER_CONTROL_CODE_NUMBER6                     = 0x26
        CEC_USER_CONTROL_CODE_NUMBER7                     = 0x27
        CEC_USER_CONTROL_CODE_NUMBER8                     = 0x28
        CEC_USER_CONTROL_CODE_NUMBER9                     = 0x29
        CEC_USER_CONTROL_CODE_DOT                         = 0x2A
        CEC_USER_CONTROL_CODE_ENTER                       = 0x2B
        CEC_USER_CONTROL_CODE_CLEAR                       = 0x2C
        CEC_USER_CONTROL_CODE_NEXT_FAVORITE               = 0x2F
        CEC_USER_CONTROL_CODE_CHANNEL_UP                  = 0x30
        CEC_USER_CONTROL_CODE_CHANNEL_DOWN                = 0x31
        CEC_USER_CONTROL_CODE_PREVIOUS_CHANNEL            = 0x32
        CEC_USER_CONTROL_CODE_SOUND_SELECT                = 0x33
        CEC_USER_CONTROL_CODE_INPUT_SELECT                = 0x34
        CEC_USER_CONTROL_CODE_DISPLAY_INFORMATION         = 0x35
        CEC_USER_CONTROL_CODE_HELP                        = 0x36
        CEC_USER_CONTROL_CODE_PAGE_UP                     = 0x37
        CEC_USER_CONTROL_CODE_PAGE_DOWN                   = 0x38
        CEC_USER_CONTROL_CODE_POWER                       = 0x40
        CEC_USER_CONTROL_CODE_VOLUME_UP                   = 0x41
        CEC_USER_CONTROL_CODE_VOLUME_DOWN                 = 0x42
        CEC_USER_CONTROL_CODE_MUTE                        = 0x43
        CEC_USER_CONTROL_CODE_PLAY                        = 0x44
        CEC_USER_CONTROL_CODE_STOP                        = 0x45
        CEC_USER_CONTROL_CODE_PAUSE                       = 0x46
        CEC_USER_CONTROL_CODE_RECORD                      = 0x47
        CEC_USER_CONTROL_CODE_REWIND                      = 0x48
        CEC_USER_CONTROL_CODE_FAST_FORWARD                = 0x49
        CEC_USER_CONTROL_CODE_EJECT                       = 0x4A
        CEC_USER_CONTROL_CODE_FORWARD                     = 0x4B
        CEC_USER_CONTROL_CODE_BACKWARD                    = 0x4C
        CEC_USER_CONTROL_CODE_STOP_RECORD                 = 0x4D
        CEC_USER_CONTROL_CODE_PAUSE_RECORD                = 0x4E
        CEC_USER_CONTROL_CODE_ANGLE                       = 0x50
        CEC_USER_CONTROL_CODE_SUB_PICTURE                 = 0x51
        CEC_USER_CONTROL_CODE_VIDEO_ON_DEMAND             = 0x52
        CEC_USER_CONTROL_CODE_ELECTRONIC_PROGRAM_GUIDE    = 0x53
        CEC_USER_CONTROL_CODE_TIMER_PROGRAMMING           = 0x54
        CEC_USER_CONTROL_CODE_INITIAL_CONFIGURATION       = 0x55
        CEC_USER_CONTROL_CODE_PLAY_FUNCTION               = 0x60
        CEC_USER_CONTROL_CODE_PAUSE_PLAY_FUNCTION         = 0x61
        CEC_USER_CONTROL_CODE_RECORD_FUNCTION             = 0x62
        CEC_USER_CONTROL_CODE_PAUSE_RECORD_FUNCTION       = 0x63
        CEC_USER_CONTROL_CODE_STOP_FUNCTION               = 0x64
        CEC_USER_CONTROL_CODE_MUTE_FUNCTION               = 0x65
        CEC_USER_CONTROL_CODE_RESTORE_VOLUME_FUNCTION     = 0x66
        CEC_USER_CONTROL_CODE_TUNE_FUNCTION               = 0x67
        CEC_USER_CONTROL_CODE_SELECT_MEDIA_FUNCTION       = 0x68
        CEC_USER_CONTROL_CODE_SELECT_AV_INPUT_FUNCTION    = 0x69
        CEC_USER_CONTROL_CODE_SELECT_AUDIO_INPUT_FUNCTION = 0x6A
        CEC_USER_CONTROL_CODE_POWER_TOGGLE_FUNCTION       = 0x6B
        CEC_USER_CONTROL_CODE_POWER_OFF_FUNCTION          = 0x6C
        CEC_USER_CONTROL_CODE_POWER_ON_FUNCTION           = 0x6D
        CEC_USER_CONTROL_CODE_F1_BLUE                     = 0x71
        CEC_USER_CONTROL_CODE_F2_RED                      = 0X72
        CEC_USER_CONTROL_CODE_F3_GREEN                    = 0x73
        CEC_USER_CONTROL_CODE_F4_YELLOW                   = 0x74
        CEC_USER_CONTROL_CODE_F5                          = 0x75
        CEC_USER_CONTROL_CODE_DATA                        = 0x76
        CEC_USER_CONTROL_CODE_AN_RETURN                   = 0x91
        CEC_USER_CONTROL_CODE_AN_CHANNELS_LIST            = 0x96
        CEC_USER_CONTROL_CODE_MAX                         = 0x96
        CEC_USER_CONTROL_CODE_UNKNOWN                     = 0xFF
    
    enum libcec_alert:
        CEC_ALERT_SERVICE_DEVICE
        CEC_ALERT_CONNECTION_LOST
        CEC_ALERT_PERMISSION_ERROR
        CEC_ALERT_PORT_BUSY
        CEC_ALERT_PHYSICAL_ADDRESS_ERROR
        CEC_ALERT_TV_POLL_FAILED

    enum cec_menu_state:
        CEC_MENU_STATE_ACTIVATED = 0
        CEC_MENU_STATE_DEACTIVATED = 1

    enum cec_logical_address:
        CECDEVICE_UNKNOWN          = -1 # not a valid logical address
        CECDEVICE_TV               = 0
        CECDEVICE_RECORDINGDEVICE1 = 1
        CECDEVICE_RECORDINGDEVICE2 = 2
        CECDEVICE_TUNER1           = 3
        CECDEVICE_PLAYBACKDEVICE1  = 4
        CECDEVICE_AUDIOSYSTEM      = 5
        CECDEVICE_TUNER2           = 6
        CECDEVICE_TUNER3           = 7
        CECDEVICE_PLAYBACKDEVICE2  = 8
        CECDEVICE_RECORDINGDEVICE3 = 9
        CECDEVICE_TUNER4           = 10
        CECDEVICE_PLAYBACKDEVICE3  = 11
        CECDEVICE_RESERVED1        = 12
        CECDEVICE_RESERVED2        = 13
        CECDEVICE_FREEUSE          = 14
        CECDEVICE_UNREGISTERED     = 15
        CECDEVICE_BROADCAST        = 15

    enum cec_adapter_type:
        ADAPTERTYPE_UNKNOWN          = 0
        ADAPTERTYPE_P8_EXTERNAL      = 0x1
        ADAPTERTYPE_P8_DAUGHTERBOARD = 0x2
        ADAPTERTYPE_RPI              = 0x100
        ADAPTERTYPE_TDA995x          = 0x200

    enum cec_device_type:
        CEC_DEVICE_TYPE_TV               = 0
        CEC_DEVICE_TYPE_RECORDING_DEVICE = 1
        CEC_DEVICE_TYPE_RESERVED         = 2
        CEC_DEVICE_TYPE_TUNER            = 3
        CEC_DEVICE_TYPE_PLAYBACK_DEVICE  = 4
        CEC_DEVICE_TYPE_AUDIO_SYSTEM     = 5
