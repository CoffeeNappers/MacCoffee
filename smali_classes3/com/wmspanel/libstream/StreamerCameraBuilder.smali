.class public Lcom/wmspanel/libstream/StreamerCameraBuilder;
.super Lcom/wmspanel/libstream/StreamerCameraBuilderBase;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "BuilderCamera"


# instance fields
.field private dI:Landroid/view/SurfaceHolder;

.field private dJ:Landroid/graphics/SurfaceTexture;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/wmspanel/libstream/StreamerCameraBuilderBase;-><init>()V

    .line 19
    return-void
.end method


# virtual methods
.method public bridge synthetic build()Lcom/wmspanel/libstream/Streamer;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 8
    invoke-virtual {p0}, Lcom/wmspanel/libstream/StreamerCameraBuilder;->build()Lcom/wmspanel/libstream/StreamerCamera;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/wmspanel/libstream/StreamerCamera;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 23
    sget-object v0, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/StreamerCameraBuilder;->build(Lcom/wmspanel/libstream/Streamer$MODE;)Lcom/wmspanel/libstream/StreamerCamera;

    move-result-object v0

    return-object v0
.end method

.method public build(Lcom/wmspanel/libstream/Streamer$MODE;)Lcom/wmspanel/libstream/StreamerCamera;
    .locals 7
    .param p1, "mode"    # Lcom/wmspanel/libstream/Streamer$MODE;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x0

    .line 28
    .line 32
    const/4 v0, 0x1

    .line 35
    invoke-virtual {p0}, Lcom/wmspanel/libstream/StreamerCameraBuilder;->verify()Z

    move-result v2

    if-nez v2, :cond_1

    .line 112
    :cond_0
    :goto_0
    return-object v3

    .line 40
    :cond_1
    sget-object v2, Lcom/wmspanel/libstream/Streamer$MODE;->VIDEO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq p1, v2, :cond_e

    .line 41
    invoke-virtual {p0}, Lcom/wmspanel/libstream/StreamerCameraBuilder;->createAudioEncoder()Lcom/wmspanel/libstream/AudioEncoder;

    move-result-object v2

    .line 42
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/wmspanel/libstream/AudioEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v4

    if-nez v4, :cond_3

    .line 44
    :cond_2
    const-string/jumbo v0, "BuilderCamera"

    const-string/jumbo v4, "Build failed: can\'t create audio encoder"

    invoke-static {v0, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 49
    :cond_3
    :goto_1
    sget-object v4, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq p1, v4, :cond_d

    .line 51
    invoke-virtual {p0}, Lcom/wmspanel/libstream/StreamerCameraBuilder;->createVideoEncoder()Lcom/wmspanel/libstream/VideoEncoder;

    move-result-object v4

    .line 52
    if-eqz v4, :cond_4

    invoke-virtual {v4}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v5

    if-nez v5, :cond_5

    .line 54
    :cond_4
    const-string/jumbo v0, "BuilderCamera"

    const-string/jumbo v5, "Build failed: can\'t create video encoder"

    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 57
    :cond_5
    iget-object v5, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->dI:Landroid/view/SurfaceHolder;

    if-nez v5, :cond_6

    iget-object v5, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->dJ:Landroid/graphics/SurfaceTexture;

    if-nez v5, :cond_6

    .line 59
    const-string/jumbo v0, "BuilderCamera"

    const-string/jumbo v5, "Build failed: preview surface is null"

    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 62
    :cond_6
    iget-object v5, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->mCameraApi:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    sget-object v6, Lcom/wmspanel/libstream/Streamer$CAMERA_API;->CAMERA2:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    if-ne v5, v6, :cond_7

    iget-object v5, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->dI:Landroid/view/SurfaceHolder;

    if-eqz v5, :cond_7

    .line 63
    const-string/jumbo v5, "BuilderCamera"

    const-string/jumbo v6, "SurfaceHolder is not recommended for Camera2, use SurfaceTexture instead"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    :cond_7
    iget-object v5, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->mCameraApi:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    sget-object v6, Lcom/wmspanel/libstream/Streamer$CAMERA_API;->CAMERA:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    if-ne v5, v6, :cond_8

    iget-object v5, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->dJ:Landroid/graphics/SurfaceTexture;

    if-eqz v5, :cond_8

    .line 68
    const-string/jumbo v0, "BuilderCamera"

    const-string/jumbo v5, "Use SurfaceHolder for Camera preview display"

    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 71
    :cond_8
    iget-object v5, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->mCameraId:Ljava/lang/String;

    if-nez v5, :cond_9

    .line 73
    const-string/jumbo v0, "BuilderCamera"

    const-string/jumbo v5, "Build failed: camera id is null"

    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 76
    :cond_9
    iget-object v5, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    if-nez v5, :cond_c

    .line 78
    const-string/jumbo v0, "BuilderCamera"

    const-string/jumbo v5, "Build failed: focus mode is null"

    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    move-object v1, v4

    .line 82
    :goto_2
    if-eqz v0, :cond_a

    .line 83
    new-instance v3, Lcom/wmspanel/libstream/StreamerCamera;

    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->mCameraApi:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    iget v4, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->mMaxBufferItems:I

    invoke-direct {v3, v0, v4}, Lcom/wmspanel/libstream/StreamerCamera;-><init>(Lcom/wmspanel/libstream/Streamer$CAMERA_API;I)V

    .line 86
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v0}, Lcom/wmspanel/libstream/StreamerCamera;->setContext(Landroid/content/Context;)V

    .line 87
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-virtual {v3, v0}, Lcom/wmspanel/libstream/StreamerCamera;->setListener(Lcom/wmspanel/libstream/Streamer$Listener;)V

    .line 88
    invoke-virtual {v3, v1}, Lcom/wmspanel/libstream/StreamerCamera;->setVideoEncoder(Lcom/wmspanel/libstream/VideoEncoder;)V

    .line 89
    invoke-virtual {v3, v2}, Lcom/wmspanel/libstream/StreamerCamera;->setAudioEncoder(Lcom/wmspanel/libstream/AudioEncoder;)V

    .line 90
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->mUserAgent:Ljava/lang/String;

    invoke-virtual {v3, v0}, Lcom/wmspanel/libstream/StreamerCamera;->setUserAgent(Ljava/lang/String;)V

    .line 93
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->dI:Landroid/view/SurfaceHolder;

    invoke-virtual {v3, v0}, Lcom/wmspanel/libstream/StreamerCamera;->setSurfaceHolder(Landroid/view/SurfaceHolder;)V

    .line 94
    iget v0, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->mDisplayRotation:I

    invoke-virtual {v3, v0}, Lcom/wmspanel/libstream/StreamerCamera;->setDisplayRotation(I)V

    .line 96
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->mCameraId:Ljava/lang/String;

    invoke-virtual {v3, v0}, Lcom/wmspanel/libstream/StreamerCamera;->setCameraId(Ljava/lang/String;)V

    .line 97
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    invoke-virtual {v3, v0}, Lcom/wmspanel/libstream/StreamerCamera;->setFocusMode(Lcom/wmspanel/libstream/FocusMode;)V

    .line 100
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->dJ:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v3, v0}, Lcom/wmspanel/libstream/StreamerCamera;->setSurfaceTexture(Landroid/graphics/SurfaceTexture;)V

    .line 102
    invoke-virtual {p0, v3}, Lcom/wmspanel/libstream/StreamerCameraBuilder;->setEncodingSetup(Lcom/wmspanel/libstream/Streamer;)V

    goto/16 :goto_0

    .line 105
    :cond_a
    if-eqz v2, :cond_b

    .line 106
    invoke-virtual {v2}, Lcom/wmspanel/libstream/AudioEncoder;->release()V

    .line 108
    :cond_b
    if-eqz v1, :cond_0

    .line 109
    invoke-virtual {v1}, Lcom/wmspanel/libstream/VideoEncoder;->release()V

    goto/16 :goto_0

    :cond_c
    move-object v1, v4

    goto :goto_2

    :cond_d
    move-object v1, v3

    goto :goto_2

    :cond_e
    move-object v2, v3

    goto/16 :goto_1
.end method

.method public setSurfaceHolder(Landroid/view/SurfaceHolder;)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 116
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->dI:Landroid/view/SurfaceHolder;

    .line 117
    return-void
.end method

.method public setSurfaceTexture(Landroid/graphics/SurfaceTexture;)V
    .locals 0
    .param p1, "texture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 120
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerCameraBuilder;->dJ:Landroid/graphics/SurfaceTexture;

    .line 121
    return-void
.end method
