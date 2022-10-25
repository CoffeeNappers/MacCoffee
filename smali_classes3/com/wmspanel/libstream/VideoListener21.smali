.class Lcom/wmspanel/libstream/VideoListener21;
.super Lcom/wmspanel/libstream/VideoListener21Base;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoListener21"


# instance fields
.field private mRecordingSurface:Landroid/view/Surface;


# direct methods
.method public constructor <init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V
    .locals 1
    .param p1, "streamBuffer"    # Lcom/wmspanel/libstream/StreamBuffer;
    .param p2, "listener"    # Lcom/wmspanel/libstream/Streamer$Listener;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lcom/wmspanel/libstream/VideoListener21Base;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V

    .line 33
    new-instance v0, Lcom/wmspanel/libstream/VideoListener21$1;

    invoke-direct {v0, p0}, Lcom/wmspanel/libstream/VideoListener21$1;-><init>(Lcom/wmspanel/libstream/VideoListener21;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraStateCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 76
    new-instance v0, Lcom/wmspanel/libstream/VideoListener21$2;

    invoke-direct {v0, p0}, Lcom/wmspanel/libstream/VideoListener21$2;-><init>(Lcom/wmspanel/libstream/VideoListener21;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mSessionStateCallback:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 109
    return-void
.end method

.method static synthetic access$000(Lcom/wmspanel/libstream/VideoListener21;)Landroid/view/Surface;
    .locals 1
    .param p0, "x0"    # Lcom/wmspanel/libstream/VideoListener21;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mRecordingSurface:Landroid/view/Surface;

    return-object v0
.end method

.method static synthetic access$100(Lcom/wmspanel/libstream/VideoListener21;)V
    .locals 0
    .param p0, "x0"    # Lcom/wmspanel/libstream/VideoListener21;

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/wmspanel/libstream/VideoListener21;->stopCameraThread()V

    return-void
.end method

.method private openCamera(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cameraId"    # Ljava/lang/String;

    .prologue
    .line 113
    iput-object p2, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraId:Ljava/lang/String;

    .line 114
    const-string/jumbo v0, "camera"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/CameraManager;

    .line 116
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraHandler:Landroid/os/Handler;

    new-instance v2, Lcom/wmspanel/libstream/VideoListener21$3;

    invoke-direct {v2, p0, v0}, Lcom/wmspanel/libstream/VideoListener21$3;-><init>(Lcom/wmspanel/libstream/VideoListener21;Landroid/hardware/camera2/CameraManager;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 135
    return-void
.end method

.method private stopCameraThread()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 227
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraThread:Landroid/os/HandlerThread;

    if-nez v0, :cond_0

    .line 240
    :goto_0
    return-void

    .line 231
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 233
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 237
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraThread:Landroid/os/HandlerThread;

    .line 238
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraHandler:Landroid/os/Handler;

    goto :goto_0

    .line 234
    :catch_0
    move-exception v0

    .line 235
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 237
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraThread:Landroid/os/HandlerThread;

    .line 238
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraHandler:Landroid/os/Handler;

    goto :goto_0

    .line 237
    :catchall_0
    move-exception v0

    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraThread:Landroid/os/HandlerThread;

    .line 238
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraHandler:Landroid/os/Handler;

    throw v0
.end method


# virtual methods
.method public openEncoder()V
    .locals 3

    .prologue
    .line 179
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getFormat()Landroid/media/MediaFormat;

    move-result-object v0

    const-string/jumbo v1, "color-format"

    const v2, 0x7f000789

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 180
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener21;->mMediaCodecCallback:Landroid/media/MediaCodec$Callback;

    invoke-virtual {v0, v1}, Landroid/media/MediaCodec;->setCallback(Landroid/media/MediaCodec$Callback;)V

    .line 181
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->configure()V

    .line 182
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mRecordingSurface:Landroid/view/Surface;

    .line 183
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->start()V

    .line 184
    return-void
.end method

.method public release()V
    .locals 2

    .prologue
    .line 188
    :try_start_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListener21;->resetMediaFormat()V

    .line 190
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v0, :cond_0

    .line 192
    :try_start_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->abortCaptures()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 196
    :goto_0
    :try_start_2
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->close()V

    .line 197
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 200
    :cond_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListener21;->releaseEncoder()V

    .line 202
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mRecordingSurface:Landroid/view/Surface;

    if-eqz v0, :cond_1

    .line 203
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mRecordingSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 204
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mRecordingSurface:Landroid/view/Surface;

    .line 207
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraHandler:Landroid/os/Handler;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_2

    .line 208
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraHandler:Landroid/os/Handler;

    new-instance v1, Lcom/wmspanel/libstream/VideoListener21$4;

    invoke-direct {v1, p0}, Lcom/wmspanel/libstream/VideoListener21$4;-><init>(Lcom/wmspanel/libstream/VideoListener21;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 224
    :goto_1
    return-void

    .line 193
    :catch_0
    move-exception v0

    .line 194
    const-string/jumbo v1, "VideoListener21"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 220
    :catch_1
    move-exception v0

    .line 221
    const-string/jumbo v1, "VideoListener21"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    goto :goto_1

    .line 218
    :cond_2
    :try_start_3
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1
.end method

.method public start(Landroid/content/Context;Ljava/lang/String;Landroid/view/SurfaceHolder;Landroid/graphics/SurfaceTexture;Lcom/wmspanel/libstream/VideoEncoder;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cameraIdStr"    # Ljava/lang/String;
    .param p3, "previewSurface"    # Landroid/view/SurfaceHolder;
    .param p4, "texture"    # Landroid/graphics/SurfaceTexture;
    .param p5, "videoEncoder"    # Lcom/wmspanel/libstream/VideoEncoder;

    .prologue
    .line 143
    if-eqz p3, :cond_0

    .line 144
    invoke-interface {p3}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mPreviewSurface:Landroid/view/Surface;

    .line 151
    :goto_0
    if-nez p1, :cond_2

    .line 152
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 145
    :cond_0
    if-eqz p4, :cond_1

    .line 146
    new-instance v0, Landroid/view/Surface;

    invoke-direct {v0, p4}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mPreviewSurface:Landroid/view/Surface;

    goto :goto_0

    .line 148
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 155
    :cond_2
    if-eqz p5, :cond_3

    invoke-virtual {p5}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    if-nez v0, :cond_4

    .line 156
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 160
    :cond_4
    :try_start_0
    new-instance v0, Landroid/os/HandlerThread;

    const-string/jumbo v1, "com.wmspanel.streamer.camera2"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraThread:Landroid/os/HandlerThread;

    .line 161
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 162
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener21;->mCameraHandler:Landroid/os/Handler;

    .line 164
    iput-object p5, p0, Lcom/wmspanel/libstream/VideoListener21;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 166
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListener21;->openEncoder()V

    .line 167
    invoke-direct {p0, p1, p2}, Lcom/wmspanel/libstream/VideoListener21;->openCamera(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    :goto_1
    return-void

    .line 169
    :catch_0
    move-exception v0

    .line 170
    const-string/jumbo v1, "VideoListener21"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    instance-of v0, v0, Landroid/media/MediaCodec$CodecException;

    if-eqz v0, :cond_5

    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->ENCODER_FAIL:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .line 173
    :goto_2
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 174
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListener21;->release()V

    goto :goto_1

    .line 171
    :cond_5
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    goto :goto_2
.end method

.method toggleTorch()V
    .locals 2

    .prologue
    .line 244
    const-string/jumbo v0, "VideoListener21"

    const-string/jumbo v1, "not supported"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    return-void
.end method
