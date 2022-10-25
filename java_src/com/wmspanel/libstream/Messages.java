package com.wmspanel.libstream;
/* loaded from: classes3.dex */
public abstract class Messages {
    public static final String err_after_release = "After release(), the streamer is no longer available";
    public static final String err_audio_capture_running = "Stop audio capture to change config";
    public static final String err_build_audio_config_null = "Build failed: audio config is null";
    public static final String err_build_audio_enc = "Build failed: can't create audio encoder";
    public static final String err_build_camera_id_null = "Build failed: camera id is null";
    public static final String err_build_context_null = "Build failed: context is null";
    public static final String err_build_focus_mode_null = "Build failed: focus mode is null";
    public static final String err_build_handler_null = "Build failed: Listener.getHandler() must return nonnull handler";
    public static final String err_build_listener_null = "Build failed: Listener is null";
    public static final String err_build_no_camera_info = "Build failed: add at least one camera";
    public static final String err_build_surface_null = "Build failed: preview surface is null";
    public static final String err_build_surface_size_null = "Build failed: preview surface size is null";
    public static final String err_build_video_config_null = "Build failed: video config is null";
    public static final String err_build_video_enc = "Build failed: can't create video encoder";
    public static final String err_build_video_size_null = "Build failed: video size is null";
    public static final String err_camera_opened = "Camera already opened";
    public static final String err_connection_running = "Release connection to change config";
    public static final String err_double_release = "Streamer is already released, skipping release()";
    public static final String err_need_camera = "This class does not support camera operations";
    public static final String err_need_camera1 = "Camera api required";
    public static final String err_need_camera2 = "Camera2 api required";
    public static final String err_no_audio_encoder = "AudioEncoder is null, check if streamer was built with VIDEO_ONLY mode";
    public static final String err_no_camera_info = "Camera info not found";
    public static final String err_no_flash = "Flash is not supported";
    public static final String err_no_video_encoder = "VideoEncoder is null, check if streamer was built with AUDIO_ONLY mode";
    public static final String err_param_is_null = "Function parameter is null";
    public static final String err_set_video_size_first = "Video size is not set, you should specify stream resolution before you can add camera";
    public static final String err_ua_null = "Build failed: user agent is null";
    public static final String err_unknown_orientation = "Unknown video orientation";
    public static final String err_video_capture_not_started = "Video capture not started";
    public static final String err_video_capture_running = "Stop video capture to change config";
    public static final String err_video_size_not_set = "Video size is not set";
}
