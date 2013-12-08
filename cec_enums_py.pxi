cimport cec_enums

# Enum exports
class cb_type:
    log = cec_enums.CB_LOG
    key = cec_enums.CB_KEY
    command = cec_enums.CB_COMMAND
    config = cec_enums.CB_CONFIG
    alert = cec_enums.CB_ALERT
    menu = cec_enums.CB_MENU
    source = cec_enums.CB_SOURCE

class log:
    error = cec_enums.CEC_LOG_ERROR
    warning = cec_enums.CEC_LOG_WARNING
    notice = cec_enums.CEC_LOG_NOTICE
    traffic = cec_enums.CEC_LOG_TRAFFIC
    debug = cec_enums.CEC_LOG_DEBUG
    all = cec_enums.CEC_LOG_ALL

class key_code:
    select = cec_enums.CEC_USER_CONTROL_CODE_SELECT
    up = cec_enums.CEC_USER_CONTROL_CODE_UP
    down = cec_enums.CEC_USER_CONTROL_CODE_DOWN
    left = cec_enums.CEC_USER_CONTROL_CODE_LEFT
    right = cec_enums.CEC_USER_CONTROL_CODE_RIGHT
    right_up = cec_enums.CEC_USER_CONTROL_CODE_RIGHT_UP
    right_down = cec_enums.CEC_USER_CONTROL_CODE_RIGHT_DOWN
    left_up = cec_enums.CEC_USER_CONTROL_CODE_LEFT_UP
    left_down = cec_enums.CEC_USER_CONTROL_CODE_LEFT_DOWN
    root_menu = cec_enums.CEC_USER_CONTROL_CODE_ROOT_MENU
    setup_menu = cec_enums.CEC_USER_CONTROL_CODE_SETUP_MENU
    contents_menu = cec_enums.CEC_USER_CONTROL_CODE_CONTENTS_MENU
    favorite_menu = cec_enums.CEC_USER_CONTROL_CODE_FAVORITE_MENU
    exit = cec_enums.CEC_USER_CONTROL_CODE_EXIT
    number0 = cec_enums.CEC_USER_CONTROL_CODE_NUMBER0
    number1 = cec_enums.CEC_USER_CONTROL_CODE_NUMBER1
    number2 = cec_enums.CEC_USER_CONTROL_CODE_NUMBER2
    number3 = cec_enums.CEC_USER_CONTROL_CODE_NUMBER3
    number4 = cec_enums.CEC_USER_CONTROL_CODE_NUMBER4
    number5 = cec_enums.CEC_USER_CONTROL_CODE_NUMBER5
    number6 = cec_enums.CEC_USER_CONTROL_CODE_NUMBER6
    number7 = cec_enums.CEC_USER_CONTROL_CODE_NUMBER7
    number8 = cec_enums.CEC_USER_CONTROL_CODE_NUMBER8
    number9 = cec_enums.CEC_USER_CONTROL_CODE_NUMBER9
    dot = cec_enums.CEC_USER_CONTROL_CODE_DOT
    enter = cec_enums.CEC_USER_CONTROL_CODE_ENTER
    clear = cec_enums.CEC_USER_CONTROL_CODE_CLEAR
    next_favorite = cec_enums.CEC_USER_CONTROL_CODE_NEXT_FAVORITE
    channel_up = cec_enums.CEC_USER_CONTROL_CODE_CHANNEL_UP
    channel_down = cec_enums.CEC_USER_CONTROL_CODE_CHANNEL_DOWN
    previous_channel = cec_enums.CEC_USER_CONTROL_CODE_PREVIOUS_CHANNEL
    sound_select = cec_enums.CEC_USER_CONTROL_CODE_SOUND_SELECT
    input_select = cec_enums.CEC_USER_CONTROL_CODE_INPUT_SELECT
    display_information = cec_enums.CEC_USER_CONTROL_CODE_DISPLAY_INFORMATION
    help = cec_enums.CEC_USER_CONTROL_CODE_HELP
    page_up = cec_enums.CEC_USER_CONTROL_CODE_PAGE_UP
    page_down = cec_enums.CEC_USER_CONTROL_CODE_PAGE_DOWN
    power = cec_enums.CEC_USER_CONTROL_CODE_POWER
    volume_up = cec_enums.CEC_USER_CONTROL_CODE_VOLUME_UP
    volume_down = cec_enums.CEC_USER_CONTROL_CODE_VOLUME_DOWN
    mute = cec_enums.CEC_USER_CONTROL_CODE_MUTE
    play = cec_enums.CEC_USER_CONTROL_CODE_PLAY
    stop = cec_enums.CEC_USER_CONTROL_CODE_STOP
    pause = cec_enums.CEC_USER_CONTROL_CODE_PAUSE
    record = cec_enums.CEC_USER_CONTROL_CODE_RECORD
    rewind = cec_enums.CEC_USER_CONTROL_CODE_REWIND
    fast_forward = cec_enums.CEC_USER_CONTROL_CODE_FAST_FORWARD
    eject = cec_enums.CEC_USER_CONTROL_CODE_EJECT
    forward = cec_enums.CEC_USER_CONTROL_CODE_FORWARD
    backward = cec_enums.CEC_USER_CONTROL_CODE_BACKWARD
    stop_record = cec_enums.CEC_USER_CONTROL_CODE_STOP_RECORD
    pause_record = cec_enums.CEC_USER_CONTROL_CODE_PAUSE_RECORD
    angle = cec_enums.CEC_USER_CONTROL_CODE_ANGLE
    sub_picture = cec_enums.CEC_USER_CONTROL_CODE_SUB_PICTURE
    video_on_demand = cec_enums.CEC_USER_CONTROL_CODE_VIDEO_ON_DEMAND
    electronic_program_guide = cec_enums.CEC_USER_CONTROL_CODE_ELECTRONIC_PROGRAM_GUIDE
    timer_programming = cec_enums.CEC_USER_CONTROL_CODE_TIMER_PROGRAMMING
    initial_configuration = cec_enums.CEC_USER_CONTROL_CODE_INITIAL_CONFIGURATION
    play_function = cec_enums.CEC_USER_CONTROL_CODE_PLAY_FUNCTION
    pause_play_function = cec_enums.CEC_USER_CONTROL_CODE_PAUSE_PLAY_FUNCTION
    record_function = cec_enums.CEC_USER_CONTROL_CODE_RECORD_FUNCTION
    pause_record_function = cec_enums.CEC_USER_CONTROL_CODE_PAUSE_RECORD_FUNCTION
    stop_function = cec_enums.CEC_USER_CONTROL_CODE_STOP_FUNCTION
    mute_function = cec_enums.CEC_USER_CONTROL_CODE_MUTE_FUNCTION
    restore_volume_function = cec_enums.CEC_USER_CONTROL_CODE_RESTORE_VOLUME_FUNCTION
    tune_function = cec_enums.CEC_USER_CONTROL_CODE_TUNE_FUNCTION
    select_media_function = cec_enums.CEC_USER_CONTROL_CODE_SELECT_MEDIA_FUNCTION
    select_av_input_function = cec_enums.CEC_USER_CONTROL_CODE_SELECT_AV_INPUT_FUNCTION
    select_audio_input_function = cec_enums.CEC_USER_CONTROL_CODE_SELECT_AUDIO_INPUT_FUNCTION
    power_toggle_function = cec_enums.CEC_USER_CONTROL_CODE_POWER_TOGGLE_FUNCTION
    power_off_function = cec_enums.CEC_USER_CONTROL_CODE_POWER_OFF_FUNCTION
    power_on_function = cec_enums.CEC_USER_CONTROL_CODE_POWER_ON_FUNCTION
    f1_blue = cec_enums.CEC_USER_CONTROL_CODE_F1_BLUE
    f2_red = cec_enums.CEC_USER_CONTROL_CODE_F2_RED
    f3_green = cec_enums.CEC_USER_CONTROL_CODE_F3_GREEN
    f4_yellow = cec_enums.CEC_USER_CONTROL_CODE_F4_YELLOW
    f5 = cec_enums.CEC_USER_CONTROL_CODE_F5
    data = cec_enums.CEC_USER_CONTROL_CODE_DATA
    an_return = cec_enums.CEC_USER_CONTROL_CODE_AN_RETURN
    an_channels_list = cec_enums.CEC_USER_CONTROL_CODE_AN_CHANNELS_LIST
    max = cec_enums.CEC_USER_CONTROL_CODE_MAX
    unknown = cec_enums.CEC_USER_CONTROL_CODE_UNKNOWN

class alert:
    service_device = cec_enums.CEC_ALERT_SERVICE_DEVICE
    connection_lost = cec_enums.CEC_ALERT_CONNECTION_LOST
    permission_error = cec_enums.CEC_ALERT_PERMISSION_ERROR
    port_busy = cec_enums.CEC_ALERT_PORT_BUSY
    physical_address_error = cec_enums.CEC_ALERT_PHYSICAL_ADDRESS_ERROR
    tv_poll_failed = cec_enums.CEC_ALERT_TV_POLL_FAILED

class menu_state:
    activated = cec_enums.CEC_MENU_STATE_ACTIVATED
    deactivated = cec_enums.CEC_MENU_STATE_DEACTIVATED

class device:
    unknown = cec_enums.CECDEVICE_UNKNOWN
    tv = cec_enums.CECDEVICE_TV
    recordingdevice1 = cec_enums.CECDEVICE_RECORDINGDEVICE1
    recordingdevice2 = cec_enums.CECDEVICE_RECORDINGDEVICE2
    tuner1 = cec_enums.CECDEVICE_TUNER1
    playbackdevice1 = cec_enums.CECDEVICE_PLAYBACKDEVICE1
    audiosystem = cec_enums.CECDEVICE_AUDIOSYSTEM
    tuner2 = cec_enums.CECDEVICE_TUNER2
    tuner3 = cec_enums.CECDEVICE_TUNER3
    playbackdevice2 = cec_enums.CECDEVICE_PLAYBACKDEVICE2
    recordingdevice3 = cec_enums.CECDEVICE_RECORDINGDEVICE3
    tuner4 = cec_enums.CECDEVICE_TUNER4
    playbackdevice3 = cec_enums.CECDEVICE_PLAYBACKDEVICE3
    reserved1 = cec_enums.CECDEVICE_RESERVED1
    reserved2 = cec_enums.CECDEVICE_RESERVED2
    freeuse = cec_enums.CECDEVICE_FREEUSE
    unregistered = cec_enums.CECDEVICE_UNREGISTERED
    broadcast = cec_enums.CECDEVICE_BROADCAST

class adapter_type:
    unknown = cec_enums.ADAPTERTYPE_UNKNOWN
    p8_external = cec_enums.ADAPTERTYPE_P8_EXTERNAL
    p8_daughterboard = cec_enums.ADAPTERTYPE_P8_DAUGHTERBOARD
    rpi = cec_enums.ADAPTERTYPE_RPI
    tda995x = cec_enums.ADAPTERTYPE_TDA995x

class device_type:
    tv = cec_enums.CEC_DEVICE_TYPE_TV
    recording_device = cec_enums.CEC_DEVICE_TYPE_RECORDING_DEVICE
    reserved = cec_enums.CEC_DEVICE_TYPE_RESERVED
    tuner = cec_enums.CEC_DEVICE_TYPE_TUNER
    playback_device = cec_enums.CEC_DEVICE_TYPE_PLAYBACK_DEVICE
    audio_system = cec_enums.CEC_DEVICE_TYPE_AUDIO_SYSTEM
