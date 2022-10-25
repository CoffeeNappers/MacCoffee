.class public abstract Lcom/wmspanel/libstream/Messages;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final err_after_release:Ljava/lang/String; = "After release(), the streamer is no longer available"

.field public static final err_audio_capture_running:Ljava/lang/String; = "Stop audio capture to change config"

.field public static final err_build_audio_config_null:Ljava/lang/String; = "Build failed: audio config is null"

.field public static final err_build_audio_enc:Ljava/lang/String; = "Build failed: can\'t create audio encoder"

.field public static final err_build_camera_id_null:Ljava/lang/String; = "Build failed: camera id is null"

.field public static final err_build_context_null:Ljava/lang/String; = "Build failed: context is null"

.field public static final err_build_focus_mode_null:Ljava/lang/String; = "Build failed: focus mode is null"

.field public static final err_build_handler_null:Ljava/lang/String; = "Build failed: Listener.getHandler() must return nonnull handler"

.field public static final err_build_listener_null:Ljava/lang/String; = "Build failed: Listener is null"

.field public static final err_build_no_camera_info:Ljava/lang/String; = "Build failed: add at least one camera"

.field public static final err_build_surface_null:Ljava/lang/String; = "Build failed: preview surface is null"

.field public static final err_build_surface_size_null:Ljava/lang/String; = "Build failed: preview surface size is null"

.field public static final err_build_video_config_null:Ljava/lang/String; = "Build failed: video config is null"

.field public static final err_build_video_enc:Ljava/lang/String; = "Build failed: can\'t create video encoder"

.field public static final err_build_video_size_null:Ljava/lang/String; = "Build failed: video size is null"

.field public static final err_camera_opened:Ljava/lang/String; = "Camera already opened"

.field public static final err_connection_running:Ljava/lang/String; = "Release connection to change config"

.field public static final err_double_release:Ljava/lang/String; = "Streamer is already released, skipping release()"

.field public static final err_need_camera:Ljava/lang/String; = "This class does not support camera operations"

.field public static final err_need_camera1:Ljava/lang/String; = "Camera api required"

.field public static final err_need_camera2:Ljava/lang/String; = "Camera2 api required"

.field public static final err_no_audio_encoder:Ljava/lang/String; = "AudioEncoder is null, check if streamer was built with VIDEO_ONLY mode"

.field public static final err_no_camera_info:Ljava/lang/String; = "Camera info not found"

.field public static final err_no_flash:Ljava/lang/String; = "Flash is not supported"

.field public static final err_no_video_encoder:Ljava/lang/String; = "VideoEncoder is null, check if streamer was built with AUDIO_ONLY mode"

.field public static final err_param_is_null:Ljava/lang/String; = "Function parameter is null"

.field public static final err_set_video_size_first:Ljava/lang/String; = "Video size is not set, you should specify stream resolution before you can add camera"

.field public static final err_ua_null:Ljava/lang/String; = "Build failed: user agent is null"

.field public static final err_unknown_orientation:Ljava/lang/String; = "Unknown video orientation"

.field public static final err_video_capture_not_started:Ljava/lang/String; = "Video capture not started"

.field public static final err_video_capture_running:Ljava/lang/String; = "Stop video capture to change config"

.field public static final err_video_size_not_set:Ljava/lang/String; = "Video size is not set"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
