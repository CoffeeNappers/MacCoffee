.class public Lcom/wmspanel/libstream/StreamerCamera;
.super Lcom/wmspanel/libstream/Streamer;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "StreamerCamera"


# instance fields
.field private dI:Landroid/view/SurfaceHolder;

.field private dJ:Landroid/graphics/SurfaceTexture;

.field private mCameraId:Ljava/lang/String;

.field protected mDisplayOrientation:I


# direct methods
.method public constructor <init>(Lcom/wmspanel/libstream/Streamer$CAMERA_API;I)V
    .locals 0
    .param p1, "api"    # Lcom/wmspanel/libstream/Streamer$CAMERA_API;
    .param p2, "items"    # I

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/wmspanel/libstream/Streamer;-><init>()V

    .line 21
    invoke-virtual {p0, p1, p2}, Lcom/wmspanel/libstream/StreamerCamera;->init(Lcom/wmspanel/libstream/Streamer$CAMERA_API;I)V

    .line 22
    return-void
.end method


# virtual methods
.method protected setCameraId(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 66
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerCamera;->mCameraId:Ljava/lang/String;

    .line 67
    return-void
.end method

.method protected setDisplayRotation(I)V
    .locals 1
    .param p1, "rotation"    # I

    .prologue
    .line 74
    invoke-static {p1}, Lcom/wmspanel/libstream/StreamerCamera;->rotationToDegrees(I)I

    move-result v0

    iput v0, p0, Lcom/wmspanel/libstream/StreamerCamera;->mDisplayOrientation:I

    .line 75
    return-void
.end method

.method protected setSurfaceHolder(Landroid/view/SurfaceHolder;)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 70
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerCamera;->dI:Landroid/view/SurfaceHolder;

    .line 71
    return-void
.end method

.method protected setSurfaceTexture(Landroid/graphics/SurfaceTexture;)V
    .locals 0
    .param p1, "texture"    # Landroid/graphics/SurfaceTexture;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 78
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerCamera;->dJ:Landroid/graphics/SurfaceTexture;

    .line 79
    return-void
.end method

.method public startVideoCapture()V
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 25
    const-string/jumbo v0, "StreamerCamera"

    const-string/jumbo v1, "startVideoCapture"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCamera;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_0

    .line 60
    :goto_0
    return-void

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCamera;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_1

    .line 30
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCamera;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    if-nez v0, :cond_2

    .line 33
    invoke-virtual {p0}, Lcom/wmspanel/libstream/StreamerCamera;->createVideoEncoder()Lcom/wmspanel/libstream/VideoEncoder;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerCamera;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 34
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCamera;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    if-nez v0, :cond_2

    .line 35
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "VideoEncoder is null, check if streamer was built with AUDIO_ONLY mode"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 39
    :cond_2
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCamera;->dI:Landroid/view/SurfaceHolder;

    if-eqz v0, :cond_4

    .line 40
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCamera;->mCameraApi:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAMERA_API;->CAMERA:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    if-ne v0, v1, :cond_3

    .line 41
    new-instance v0, Lcom/wmspanel/libstream/VideoListener16;

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerCamera;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerCamera;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/VideoListener16;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerCamera;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    .line 42
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCamera;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    iget v1, p0, Lcom/wmspanel/libstream/StreamerCamera;->mDisplayOrientation:I

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener;->setDisplayOrientation(I)V

    .line 48
    :goto_1
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCamera;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerCamera;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener;->setFocusMode(Lcom/wmspanel/libstream/FocusMode;)V

    .line 49
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCamera;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerCamera;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerCamera;->mCameraId:Ljava/lang/String;

    iget-object v3, p0, Lcom/wmspanel/libstream/StreamerCamera;->dI:Landroid/view/SurfaceHolder;

    iget-object v5, p0, Lcom/wmspanel/libstream/StreamerCamera;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual/range {v0 .. v5}, Lcom/wmspanel/libstream/VideoListener;->start(Landroid/content/Context;Ljava/lang/String;Landroid/view/SurfaceHolder;Landroid/graphics/SurfaceTexture;Lcom/wmspanel/libstream/VideoEncoder;)V

    goto :goto_0

    .line 44
    :cond_3
    const-string/jumbo v0, "StreamerCamera"

    const-string/jumbo v1, "SurfaceHolder is not recommended for Camera2, use SurfaceTexture instead"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    new-instance v0, Lcom/wmspanel/libstream/VideoListener21;

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerCamera;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerCamera;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/VideoListener21;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerCamera;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    goto :goto_1

    .line 53
    :cond_4
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCamera;->dJ:Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_6

    .line 54
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerCamera;->mCameraApi:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAMERA_API;->CAMERA2:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    if-ne v0, v1, :cond_5

    .line 55
    new-instance v0, Lcom/wmspanel/libstream/VideoListener21;

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerCamera;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerCamera;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/VideoListener21;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerCamera;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    .line 59
    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerCamera;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerCamera;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/wmspanel/libstream/StreamerCamera;->mCameraId:Ljava/lang/String;

    iget-object v5, p0, Lcom/wmspanel/libstream/StreamerCamera;->dJ:Landroid/graphics/SurfaceTexture;

    iget-object v6, p0, Lcom/wmspanel/libstream/StreamerCamera;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual/range {v1 .. v6}, Lcom/wmspanel/libstream/VideoListener;->start(Landroid/content/Context;Ljava/lang/String;Landroid/view/SurfaceHolder;Landroid/graphics/SurfaceTexture;Lcom/wmspanel/libstream/VideoEncoder;)V

    goto/16 :goto_0

    .line 57
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Use SurfaceHolder for Camera preview display"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 62
    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Set SurfaceHolder or SurfaceTexture to start video capture"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
