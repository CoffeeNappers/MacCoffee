.class public Lcom/wmspanel/libstream/StreamerGLBuilder;
.super Lcom/wmspanel/libstream/StreamerCameraBuilderBase;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "BuilderGL"


# instance fields
.field private mFlipCameraInfo:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mSurface:Landroid/view/Surface;

.field private mSurfaceSize:Lcom/wmspanel/libstream/Streamer$Size;

.field private mVideoOrientation:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/wmspanel/libstream/StreamerCameraBuilderBase;-><init>()V

    .line 19
    sget v0, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->LANDSCAPE:I

    iput v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mVideoOrientation:I

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mFlipCameraInfo:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addCamera(Lcom/wmspanel/libstream/CameraConfig;)V
    .locals 5
    .param p1, "cameraConfig"    # Lcom/wmspanel/libstream/CameraConfig;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mVideoConfig:Lcom/wmspanel/libstream/VideoConfig;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mVideoConfig:Lcom/wmspanel/libstream/VideoConfig;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoConfig;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    if-nez v0, :cond_1

    .line 24
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Video size is not set, you should specify stream resolution before you can add camera"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 26
    :cond_1
    if-eqz p1, :cond_2

    iget-object v0, p1, Lcom/wmspanel/libstream/CameraConfig;->cameraId:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/wmspanel/libstream/CameraConfig;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    if-nez v0, :cond_4

    .line 27
    :cond_2
    const-string/jumbo v0, "BuilderGL"

    const-string/jumbo v1, "Function parameter is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    :cond_3
    :goto_0
    return-void

    .line 31
    :cond_4
    new-instance v2, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    invoke-direct {v2}, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;-><init>()V

    .line 33
    iget-object v0, p1, Lcom/wmspanel/libstream/CameraConfig;->cameraId:Ljava/lang/String;

    iput-object v0, v2, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->cameraId:Ljava/lang/String;

    .line 34
    iget-object v0, p1, Lcom/wmspanel/libstream/CameraConfig;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    iput-object v0, v2, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    .line 35
    iget-object v0, p1, Lcom/wmspanel/libstream/CameraConfig;->fpsRange:Lcom/wmspanel/libstream/Streamer$FpsRange;

    iput-object v0, v2, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->fpsRange:Lcom/wmspanel/libstream/Streamer$FpsRange;

    .line 37
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mVideoConfig:Lcom/wmspanel/libstream/VideoConfig;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoConfig;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    invoke-static {v2, v0}, Lcom/wmspanel/libstream/VideoLetterboxCalc;->calculateLetterboxing(Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;Lcom/wmspanel/libstream/Streamer$Size;)V

    .line 39
    const/4 v0, 0x0

    .line 40
    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mFlipCameraInfo:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v0

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    .line 41
    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->cameraId:Ljava/lang/String;

    iget-object v4, v2, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->cameraId:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 42
    const/4 v0, 0x1

    :goto_2
    move v1, v0

    .line 44
    goto :goto_1

    .line 46
    :cond_5
    if-nez v1, :cond_6

    .line 47
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mFlipCameraInfo:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    :goto_3
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mFlipCameraInfo:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_3

    .line 53
    const-string/jumbo v0, "BuilderGL"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "More than 2 cameras: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mFlipCameraInfo:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 49
    :cond_6
    const-string/jumbo v0, "BuilderGL"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Camera already added: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v2, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->cameraId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    :cond_7
    move v0, v1

    goto :goto_2
.end method

.method public bridge synthetic build()Lcom/wmspanel/libstream/Streamer;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 13
    invoke-virtual {p0}, Lcom/wmspanel/libstream/StreamerGLBuilder;->build()Lcom/wmspanel/libstream/StreamerGL;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/wmspanel/libstream/StreamerGL;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 71
    sget-object v0, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/StreamerGLBuilder;->build(Lcom/wmspanel/libstream/Streamer$MODE;)Lcom/wmspanel/libstream/StreamerGL;

    move-result-object v0

    return-object v0
.end method

.method public build(Lcom/wmspanel/libstream/Streamer$MODE;)Lcom/wmspanel/libstream/StreamerGL;
    .locals 10
    .param p1, "mode"    # Lcom/wmspanel/libstream/Streamer$MODE;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x0

    const/4 v2, 0x0

    .line 76
    .line 82
    invoke-virtual {p0}, Lcom/wmspanel/libstream/StreamerGLBuilder;->verify()Z

    move-result v0

    if-nez v0, :cond_1

    .line 171
    :cond_0
    :goto_0
    return-object v4

    .line 87
    :cond_1
    sget-object v0, Lcom/wmspanel/libstream/Streamer$MODE;->VIDEO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq p1, v0, :cond_11

    .line 88
    invoke-virtual {p0}, Lcom/wmspanel/libstream/StreamerGLBuilder;->createAudioEncoder()Lcom/wmspanel/libstream/AudioEncoder;

    move-result-object v0

    .line 89
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v3

    if-nez v3, :cond_10

    .line 91
    :cond_2
    const-string/jumbo v3, "BuilderGL"

    const-string/jumbo v5, "Build failed: can\'t create audio encoder"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v3, v0

    move v0, v2

    .line 96
    :goto_1
    sget-object v5, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq p1, v5, :cond_f

    .line 98
    invoke-virtual {p0}, Lcom/wmspanel/libstream/StreamerGLBuilder;->createVideoEncoder()Lcom/wmspanel/libstream/VideoEncoder;

    move-result-object v7

    .line 99
    if-eqz v7, :cond_3

    invoke-virtual {v7}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v5

    if-nez v5, :cond_4

    .line 101
    :cond_3
    const-string/jumbo v0, "BuilderGL"

    const-string/jumbo v5, "Build failed: can\'t create video encoder"

    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v2

    .line 104
    :cond_4
    iget-object v5, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mSurface:Landroid/view/Surface;

    if-nez v5, :cond_5

    .line 106
    const-string/jumbo v0, "BuilderGL"

    const-string/jumbo v5, "Build failed: preview surface is null"

    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v2

    .line 109
    :cond_5
    iget-object v5, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mSurfaceSize:Lcom/wmspanel/libstream/Streamer$Size;

    if-nez v5, :cond_6

    .line 111
    const-string/jumbo v0, "BuilderGL"

    const-string/jumbo v5, "Build failed: preview surface size is null"

    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v2

    .line 114
    :cond_6
    iget-object v5, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mCameraId:Ljava/lang/String;

    if-nez v5, :cond_7

    .line 116
    const-string/jumbo v0, "BuilderGL"

    const-string/jumbo v5, "Build failed: camera id is null"

    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v2

    .line 119
    :cond_7
    iget-object v5, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mFlipCameraInfo:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_e

    .line 121
    const-string/jumbo v0, "BuilderGL"

    const-string/jumbo v5, "Build failed: add at least one camera"

    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v5, v2

    .line 125
    :goto_2
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mFlipCameraInfo:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    move v6, v2

    :goto_3
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    .line 126
    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->cameraId:Ljava/lang/String;

    iget-object v9, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mCameraId:Ljava/lang/String;

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    move v0, v1

    :goto_4
    move v6, v0

    .line 129
    goto :goto_3

    .line 131
    :cond_8
    if-nez v6, :cond_9

    .line 133
    const-string/jumbo v0, "BuilderGL"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Build failed: add at least one camera, CameraId: "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v5, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mCameraId:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v5, v2

    .line 136
    :cond_9
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    if-nez v0, :cond_c

    .line 138
    const-string/jumbo v0, "BuilderGL"

    const-string/jumbo v1, "Build failed: focus mode is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v7

    .line 142
    :goto_5
    if-eqz v2, :cond_a

    .line 143
    new-instance v4, Lcom/wmspanel/libstream/StreamerGL;

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mCameraApi:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    iget v2, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mMaxBufferItems:I

    invoke-direct {v4, v1, v2}, Lcom/wmspanel/libstream/StreamerGL;-><init>(Lcom/wmspanel/libstream/Streamer$CAMERA_API;I)V

    .line 145
    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v1}, Lcom/wmspanel/libstream/StreamerGL;->setContext(Landroid/content/Context;)V

    .line 146
    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-virtual {v4, v1}, Lcom/wmspanel/libstream/StreamerGL;->setListener(Lcom/wmspanel/libstream/Streamer$Listener;)V

    .line 147
    invoke-virtual {v4, v0}, Lcom/wmspanel/libstream/StreamerGL;->setVideoEncoder(Lcom/wmspanel/libstream/VideoEncoder;)V

    .line 148
    invoke-virtual {v4, v3}, Lcom/wmspanel/libstream/StreamerGL;->setAudioEncoder(Lcom/wmspanel/libstream/AudioEncoder;)V

    .line 149
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mUserAgent:Ljava/lang/String;

    invoke-virtual {v4, v0}, Lcom/wmspanel/libstream/StreamerGL;->setUserAgent(Ljava/lang/String;)V

    .line 151
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mSurface:Landroid/view/Surface;

    invoke-virtual {v4, v0}, Lcom/wmspanel/libstream/StreamerGL;->setSurface(Landroid/view/Surface;)V

    .line 152
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mSurfaceSize:Lcom/wmspanel/libstream/Streamer$Size;

    invoke-virtual {v4, v0}, Lcom/wmspanel/libstream/StreamerGL;->setSurfaceSize(Lcom/wmspanel/libstream/Streamer$Size;)V

    .line 153
    iget v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mDisplayRotation:I

    invoke-virtual {v4, v0}, Lcom/wmspanel/libstream/StreamerGL;->setDisplayRotation(I)V

    .line 154
    iget v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mVideoOrientation:I

    invoke-virtual {v4, v0}, Lcom/wmspanel/libstream/StreamerGL;->setVideoOrientation(I)V

    .line 156
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mCameraId:Ljava/lang/String;

    invoke-virtual {v4, v0}, Lcom/wmspanel/libstream/StreamerGL;->setCameraId(Ljava/lang/String;)V

    .line 157
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mFlipCameraInfo:Ljava/util/List;

    invoke-virtual {v4, v0}, Lcom/wmspanel/libstream/StreamerGL;->setFlipCameraInfo(Ljava/util/List;)V

    .line 159
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    invoke-virtual {v4, v0}, Lcom/wmspanel/libstream/StreamerGL;->setFocusMode(Lcom/wmspanel/libstream/FocusMode;)V

    .line 161
    invoke-virtual {p0, v4}, Lcom/wmspanel/libstream/StreamerGLBuilder;->setEncodingSetup(Lcom/wmspanel/libstream/Streamer;)V

    goto/16 :goto_0

    .line 164
    :cond_a
    if-eqz v3, :cond_b

    .line 165
    invoke-virtual {v3}, Lcom/wmspanel/libstream/AudioEncoder;->release()V

    .line 167
    :cond_b
    if-eqz v0, :cond_0

    .line 168
    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->release()V

    goto/16 :goto_0

    :cond_c
    move v2, v5

    move-object v0, v7

    goto :goto_5

    :cond_d
    move v0, v6

    goto/16 :goto_4

    :cond_e
    move v5, v0

    goto/16 :goto_2

    :cond_f
    move v2, v0

    move-object v0, v4

    goto :goto_5

    :cond_10
    move-object v3, v0

    move v0, v1

    goto/16 :goto_1

    :cond_11
    move v0, v1

    move-object v3, v4

    goto/16 :goto_1
.end method

.method public setSurface(Landroid/view/Surface;)V
    .locals 0
    .param p1, "surface"    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 58
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mSurface:Landroid/view/Surface;

    .line 59
    return-void
.end method

.method public setSurfaceSize(Lcom/wmspanel/libstream/Streamer$Size;)V
    .locals 0
    .param p1, "size"    # Lcom/wmspanel/libstream/Streamer$Size;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 62
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mSurfaceSize:Lcom/wmspanel/libstream/Streamer$Size;

    .line 63
    return-void
.end method

.method public setVideoOrientation(I)V
    .locals 0
    .param p1, "orientation"    # I

    .prologue
    .line 66
    iput p1, p0, Lcom/wmspanel/libstream/StreamerGLBuilder;->mVideoOrientation:I

    .line 67
    return-void
.end method
