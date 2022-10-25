.class Lcom/wmspanel/libstream/VideoListenerSurface;
.super Lcom/wmspanel/libstream/VideoListener16Base;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoListenerSurface"


# instance fields
.field private mRecordingSurface:Landroid/view/Surface;


# direct methods
.method public constructor <init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V
    .locals 0
    .param p1, "streamBuffer"    # Lcom/wmspanel/libstream/StreamBuffer;
    .param p2, "listener"    # Lcom/wmspanel/libstream/Streamer$Listener;

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Lcom/wmspanel/libstream/VideoListener16Base;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V

    .line 22
    return-void
.end method


# virtual methods
.method drainEncoder()V
    .locals 2

    .prologue
    .line 76
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_0

    .line 77
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerSurface;->getVideoFrame()V

    .line 79
    :cond_0
    return-void
.end method

.method getEncoderSurface()Landroid/view/Surface;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerSurface;->mRecordingSurface:Landroid/view/Surface;

    return-object v0
.end method

.method public openEncoder()V
    .locals 3

    .prologue
    .line 45
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerSurface;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getFormat()Landroid/media/MediaFormat;

    move-result-object v0

    const-string/jumbo v1, "color-format"

    const v2, 0x7f000789

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 46
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 47
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerSurface;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerSurface;->mMediaCodecCallback:Landroid/media/MediaCodec$Callback;

    invoke-virtual {v0, v1}, Landroid/media/MediaCodec;->setCallback(Landroid/media/MediaCodec$Callback;)V

    .line 49
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerSurface;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->configure()V

    .line 50
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerSurface;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerSurface;->mRecordingSurface:Landroid/view/Surface;

    .line 51
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerSurface;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->start()V

    .line 52
    return-void
.end method

.method public release()V
    .locals 2

    .prologue
    .line 56
    const-string/jumbo v0, "VideoListenerSurface"

    const-string/jumbo v1, "release"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    :try_start_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerSurface;->resetMediaFormat()V

    .line 59
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerSurface;->releaseEncoder()V

    .line 60
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerSurface;->mRecordingSurface:Landroid/view/Surface;

    if-eqz v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerSurface;->mRecordingSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 62
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerSurface;->mRecordingSurface:Landroid/view/Surface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    :cond_0
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListenerSurface;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 69
    :goto_0
    return-void

    .line 64
    :catch_0
    move-exception v0

    .line 65
    :try_start_1
    const-string/jumbo v1, "VideoListenerSurface"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 67
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListenerSurface;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v1}, Lcom/wmspanel/libstream/VideoListenerSurface;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    throw v0
.end method

.method public start(Landroid/content/Context;Ljava/lang/String;Landroid/view/SurfaceHolder;Landroid/graphics/SurfaceTexture;Lcom/wmspanel/libstream/VideoEncoder;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cameraIdStr"    # Ljava/lang/String;
    .param p3, "previewSurfaceHolder"    # Landroid/view/SurfaceHolder;
    .param p4, "texture"    # Landroid/graphics/SurfaceTexture;
    .param p5, "encoder"    # Lcom/wmspanel/libstream/VideoEncoder;

    .prologue
    .line 87
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public start(Lcom/wmspanel/libstream/VideoEncoder;)V
    .locals 3
    .param p1, "videoEncoder"    # Lcom/wmspanel/libstream/VideoEncoder;

    .prologue
    .line 25
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    if-nez v0, :cond_1

    .line 26
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 30
    :cond_1
    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_2

    .line 31
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerSurface;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 33
    :cond_2
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListenerSurface;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 34
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerSurface;->openEncoder()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    :goto_0
    return-void

    .line 35
    :catch_0
    move-exception v0

    .line 36
    const-string/jumbo v1, "VideoListenerSurface"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    instance-of v0, v0, Landroid/media/MediaCodec$CodecException;

    if-eqz v0, :cond_3

    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->ENCODER_FAIL:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .line 39
    :goto_1
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListenerSurface;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 40
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerSurface;->release()V

    goto :goto_0

    .line 37
    :cond_3
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    goto :goto_1
.end method
