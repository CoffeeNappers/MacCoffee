.class public Lcom/wmspanel/libstream/StreamerGL;
.super Lcom/wmspanel/libstream/Streamer;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "StreamerGL"


# instance fields
.field protected mCameraId:Ljava/lang/String;

.field protected mDisplayOrientation:I

.field protected mFlipCameraInfo:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;",
            ">;"
        }
    .end annotation
.end field

.field protected mSurface:Landroid/view/Surface;

.field protected mSurfaceSize:Lcom/wmspanel/libstream/Streamer$Size;

.field protected mVideoOrientation:I


# direct methods
.method protected constructor <init>(Lcom/wmspanel/libstream/Streamer$CAMERA_API;I)V
    .locals 0
    .param p1, "api"    # Lcom/wmspanel/libstream/Streamer$CAMERA_API;
    .param p2, "items"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/wmspanel/libstream/Streamer;-><init>()V

    .line 36
    invoke-virtual {p0, p1, p2}, Lcom/wmspanel/libstream/StreamerGL;->init(Lcom/wmspanel/libstream/Streamer$CAMERA_API;I)V

    .line 37
    return-void
.end method


# virtual methods
.method public changeCameraConfig(Lcom/wmspanel/libstream/CameraConfig;)V
    .locals 4
    .param p1, "cameraConfig"    # Lcom/wmspanel/libstream/CameraConfig;

    .prologue
    .line 167
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_0

    .line 168
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Stop video capture to change config"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 170
    :cond_0
    if-nez p1, :cond_1

    .line 171
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Function parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 174
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mFlipCameraInfo:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    .line 175
    iget-object v2, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->cameraId:Ljava/lang/String;

    iget-object v3, p1, Lcom/wmspanel/libstream/CameraConfig;->cameraId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 176
    iget-object v2, p1, Lcom/wmspanel/libstream/CameraConfig;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    iput-object v2, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    .line 177
    iget-object v2, p1, Lcom/wmspanel/libstream/CameraConfig;->fpsRange:Lcom/wmspanel/libstream/Streamer$FpsRange;

    iput-object v2, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->fpsRange:Lcom/wmspanel/libstream/Streamer$FpsRange;

    .line 178
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoConfig:Lcom/wmspanel/libstream/VideoConfig;

    iget-object v2, v2, Lcom/wmspanel/libstream/VideoConfig;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    invoke-static {v0, v2}, Lcom/wmspanel/libstream/VideoLetterboxCalc;->calculateLetterboxing(Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;Lcom/wmspanel/libstream/Streamer$Size;)V

    goto :goto_0

    .line 181
    :cond_3
    return-void
.end method

.method public changeVideoConfig(Lcom/wmspanel/libstream/VideoConfig;)V
    .locals 3
    .param p1, "videoConfig"    # Lcom/wmspanel/libstream/VideoConfig;

    .prologue
    .line 159
    invoke-super {p0, p1}, Lcom/wmspanel/libstream/Streamer;->changeVideoConfig(Lcom/wmspanel/libstream/VideoConfig;)V

    .line 161
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mFlipCameraInfo:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    .line 162
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoConfig:Lcom/wmspanel/libstream/VideoConfig;

    iget-object v2, v2, Lcom/wmspanel/libstream/VideoConfig;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    invoke-static {v0, v2}, Lcom/wmspanel/libstream/VideoLetterboxCalc;->calculateLetterboxing(Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;Lcom/wmspanel/libstream/Streamer$Size;)V

    goto :goto_0

    .line 164
    :cond_0
    return-void
.end method

.method public createCaptureRequest()Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 185
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_0

    .line 186
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener;->createCaptureRequest()Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 188
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public flip()V
    .locals 1

    .prologue
    .line 116
    invoke-super {p0}, Lcom/wmspanel/libstream/Streamer;->flip()V

    .line 118
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener;->getCameraId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mCameraId:Ljava/lang/String;

    .line 121
    :cond_0
    return-void
.end method

.method public getActiveCameraId()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 108
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener;->getCameraId()Ljava/lang/String;

    move-result-object v0

    .line 111
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getActiveCameraVideoSize()Lcom/wmspanel/libstream/Streamer$Size;
    .locals 4
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 96
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_1

    .line 97
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mFlipCameraInfo:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    .line 98
    iget-object v2, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->cameraId:Ljava/lang/String;

    iget-object v3, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v3}, Lcom/wmspanel/libstream/VideoListener;->getCameraId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 99
    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    .line 103
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected setCameraId(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 150
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerGL;->mCameraId:Ljava/lang/String;

    .line 151
    return-void
.end method

.method public setDisplayRotation(I)V
    .locals 3
    .param p1, "rotation"    # I

    .prologue
    .line 49
    invoke-static {p1}, Lcom/wmspanel/libstream/StreamerGL;->rotationToDegrees(I)I

    move-result v0

    iput v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mDisplayOrientation:I

    .line 50
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_0

    .line 51
    const-string/jumbo v0, "StreamerGL"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "display rotation is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/wmspanel/libstream/StreamerGL;->mDisplayOrientation:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " degrees"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    iget v1, p0, Lcom/wmspanel/libstream/StreamerGL;->mDisplayOrientation:I

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener;->setDisplayOrientation(I)V

    .line 54
    :cond_0
    return-void
.end method

.method protected setFlipCameraInfo(Ljava/util/List;)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 146
    .local p1, "info":Ljava/util/List;, "Ljava/util/List<Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;>;"
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerGL;->mFlipCameraInfo:Ljava/util/List;

    .line 147
    return-void
.end method

.method public setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1
    .param p1, "builder"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 193
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_0

    .line 194
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/VideoListener;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 196
    :cond_0
    return-void
.end method

.method public setSurface(Landroid/view/Surface;)V
    .locals 0
    .param p1, "s"    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 154
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerGL;->mSurface:Landroid/view/Surface;

    .line 155
    return-void
.end method

.method public setSurfaceSize(Lcom/wmspanel/libstream/Streamer$Size;)V
    .locals 2
    .param p1, "size"    # Lcom/wmspanel/libstream/Streamer$Size;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 40
    if-eqz p1, :cond_0

    .line 41
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerGL;->mSurfaceSize:Lcom/wmspanel/libstream/Streamer$Size;

    .line 42
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_0

    .line 43
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerGL;->mSurfaceSize:Lcom/wmspanel/libstream/Streamer$Size;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener;->setSurfaceSize(Lcom/wmspanel/libstream/Streamer$Size;)V

    .line 46
    :cond_0
    return-void
.end method

.method public setVideoOrientation(I)V
    .locals 3
    .param p1, "o"    # I

    .prologue
    .line 57
    iput p1, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoOrientation:I

    .line 58
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_0

    .line 59
    const-string/jumbo v0, "StreamerGL"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "video rotation is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoOrientation:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    iget v1, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoOrientation:I

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener;->setVideoOrientation(I)V

    .line 62
    :cond_0
    return-void
.end method

.method public startVideoCapture()V
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 65
    const-string/jumbo v0, "StreamerGL"

    const-string/jumbo v1, "startVideoCapture"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_0

    .line 92
    :goto_0
    return-void

    .line 69
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_1

    .line 70
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    if-nez v0, :cond_2

    .line 73
    invoke-virtual {p0}, Lcom/wmspanel/libstream/StreamerGL;->createVideoEncoder()Lcom/wmspanel/libstream/VideoEncoder;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 74
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    if-nez v0, :cond_2

    .line 75
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "VideoEncoder is null, check if streamer was built with AUDIO_ONLY mode"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_2
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mCameraApi:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAMERA_API;->CAMERA:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    if-ne v0, v1, :cond_3

    .line 80
    new-instance v0, Lcom/wmspanel/libstream/VideoListenerGLES16;

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerGL;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerGL;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/VideoListenerGLES16;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    .line 84
    :goto_1
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerGL;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener;->setFocusMode(Lcom/wmspanel/libstream/FocusMode;)V

    .line 85
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerGL;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener;->setSurface(Landroid/view/Surface;)V

    .line 86
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerGL;->mSurfaceSize:Lcom/wmspanel/libstream/Streamer$Size;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener;->setSurfaceSize(Lcom/wmspanel/libstream/Streamer$Size;)V

    .line 87
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    iget v1, p0, Lcom/wmspanel/libstream/StreamerGL;->mDisplayOrientation:I

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener;->setDisplayOrientation(I)V

    .line 88
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    iget v1, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoOrientation:I

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener;->setVideoOrientation(I)V

    .line 89
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerGL;->mFlipCameraInfo:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener;->setFlipCameraInfo(Ljava/util/List;)V

    .line 91
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerGL;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerGL;->mCameraId:Ljava/lang/String;

    iget-object v5, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Lcom/wmspanel/libstream/VideoListener;->start(Landroid/content/Context;Ljava/lang/String;Landroid/view/SurfaceHolder;Landroid/graphics/SurfaceTexture;Lcom/wmspanel/libstream/VideoEncoder;)V

    goto :goto_0

    .line 82
    :cond_3
    new-instance v0, Lcom/wmspanel/libstream/VideoListenerGLES21;

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerGL;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerGL;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/VideoListenerGLES21;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    goto :goto_1
.end method

.method public takeSnapshot(Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;)V
    .locals 2
    .param p1, "callback"    # Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 135
    if-nez p1, :cond_0

    .line 136
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Function parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 138
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_1

    .line 139
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/VideoListener;->takeSnapshot(Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;)V

    .line 141
    :cond_1
    return-void
.end method

.method public takeSnapshot(Ljava/io/File;Landroid/graphics/Bitmap$CompressFormat;I)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "format"    # Landroid/graphics/Bitmap$CompressFormat;
    .param p3, "quality"    # I

    .prologue
    .line 124
    if-nez p1, :cond_0

    .line 125
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Function parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 127
    :cond_0
    invoke-static {p2}, Lcom/wmspanel/libstream/SnapshotWriter;->setCompressFormat(Landroid/graphics/Bitmap$CompressFormat;)V

    .line 128
    invoke-static {p3}, Lcom/wmspanel/libstream/SnapshotWriter;->setQuality(I)V

    .line 129
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_1

    .line 130
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGL;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/VideoListener;->takeSnapshot(Ljava/io/File;)V

    .line 132
    :cond_1
    return-void
.end method
