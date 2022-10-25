.class Lcom/wmspanel/libstream/VideoListener16;
.super Lcom/wmspanel/libstream/VideoListener16Base;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoListener16"


# instance fields
.field private colorConverter:Lcom/wmspanel/libstream/c;

.field private mPlanar:Z

.field protected mPreviewCallback:Landroid/hardware/Camera$PreviewCallback;

.field mPreviewSurfaceHolder:Landroid/view/SurfaceHolder;


# direct methods
.method public constructor <init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V
    .locals 1
    .param p1, "streamBuffer"    # Lcom/wmspanel/libstream/StreamBuffer;
    .param p2, "listener"    # Lcom/wmspanel/libstream/Streamer$Listener;

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/wmspanel/libstream/VideoListener16Base;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V

    .line 25
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->colorConverter:Lcom/wmspanel/libstream/c;

    .line 202
    new-instance v0, Lcom/wmspanel/libstream/VideoListener16$1;

    invoke-direct {v0, p0}, Lcom/wmspanel/libstream/VideoListener16$1;-><init>(Lcom/wmspanel/libstream/VideoListener16;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mPreviewCallback:Landroid/hardware/Camera$PreviewCallback;

    .line 23
    return-void
.end method

.method static synthetic access$000(Lcom/wmspanel/libstream/VideoListener16;)Lcom/wmspanel/libstream/c;
    .locals 1
    .param p0, "x0"    # Lcom/wmspanel/libstream/VideoListener16;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->colorConverter:Lcom/wmspanel/libstream/c;

    return-object v0
.end method

.method private openCamera(Ljava/lang/String;Z)Z
    .locals 8
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "planar"    # Z

    .prologue
    const v7, 0x32315659

    const/4 v1, 0x1

    const/4 v3, -0x1

    .line 31
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener16;->mCameraId:Ljava/lang/String;

    .line 32
    const-string/jumbo v0, "VideoListener16"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "open camera#"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListener16;->mCameraId:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCameraId:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    .line 35
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListener16;->mErrorCallback:Landroid/hardware/Camera$ErrorCallback;

    invoke-virtual {v0, v2}, Landroid/hardware/Camera;->setErrorCallback(Landroid/hardware/Camera$ErrorCallback;)V

    .line 37
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v4

    .line 38
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mPreviewSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v0, v0, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListener16;->mPreviewSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v2, v2, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    invoke-virtual {v4, v0, v2}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 41
    invoke-virtual {v4}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFormats()Ljava/util/List;

    move-result-object v5

    .line 42
    if-eqz v5, :cond_9

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_9

    .line 45
    if-eqz p2, :cond_8

    .line 46
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 47
    if-ne v7, v2, :cond_0

    .line 49
    new-instance v0, Lcom/wmspanel/libstream/q;

    invoke-direct {v0}, Lcom/wmspanel/libstream/q;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->colorConverter:Lcom/wmspanel/libstream/c;

    .line 56
    :goto_0
    if-ne v3, v2, :cond_7

    .line 57
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 58
    const/16 v6, 0x11

    if-ne v6, v0, :cond_3

    .line 60
    if-eqz p2, :cond_2

    .line 61
    new-instance v2, Lcom/wmspanel/libstream/h;

    invoke-direct {v2}, Lcom/wmspanel/libstream/h;-><init>()V

    iput-object v2, p0, Lcom/wmspanel/libstream/VideoListener16;->colorConverter:Lcom/wmspanel/libstream/c;

    .line 79
    :goto_1
    if-ne v3, v0, :cond_5

    .line 80
    const-string/jumbo v0, "VideoListener16"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "failed to set preview format, camera="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListener16;->mCameraId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    const/4 v0, 0x0

    .line 105
    :goto_2
    return v0

    .line 63
    :cond_2
    new-instance v2, Lcom/wmspanel/libstream/g;

    invoke-direct {v2}, Lcom/wmspanel/libstream/g;-><init>()V

    iput-object v2, p0, Lcom/wmspanel/libstream/VideoListener16;->colorConverter:Lcom/wmspanel/libstream/c;

    goto :goto_1

    .line 66
    :cond_3
    if-ne v7, v0, :cond_1

    .line 68
    if-eqz p2, :cond_4

    .line 69
    new-instance v2, Lcom/wmspanel/libstream/q;

    invoke-direct {v2}, Lcom/wmspanel/libstream/q;-><init>()V

    iput-object v2, p0, Lcom/wmspanel/libstream/VideoListener16;->colorConverter:Lcom/wmspanel/libstream/c;

    goto :goto_1

    .line 71
    :cond_4
    new-instance v2, Lcom/wmspanel/libstream/p;

    invoke-direct {v2}, Lcom/wmspanel/libstream/p;-><init>()V

    iput-object v2, p0, Lcom/wmspanel/libstream/VideoListener16;->colorConverter:Lcom/wmspanel/libstream/c;

    goto :goto_1

    .line 83
    :cond_5
    invoke-virtual {v4, v0}, Landroid/hardware/Camera$Parameters;->setPreviewFormat(I)V

    .line 84
    const-string/jumbo v0, "VideoListener16"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "camera#"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListener16;->mCameraId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " preview_format="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v4}, Landroid/hardware/Camera$Parameters;->getPreviewFormat()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget-object v0, v0, Lcom/wmspanel/libstream/FocusMode;->focusMode16:Ljava/lang/String;

    invoke-virtual {p0, v4, v0}, Lcom/wmspanel/libstream/VideoListener16;->setFocusMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 87
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget-object v0, v0, Lcom/wmspanel/libstream/FocusMode;->awbMode16:Ljava/lang/String;

    invoke-virtual {p0, v4, v0}, Lcom/wmspanel/libstream/VideoListener16;->setAwbMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 88
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget-object v0, v0, Lcom/wmspanel/libstream/FocusMode;->antibandingMode16:Ljava/lang/String;

    invoke-virtual {p0, v4, v0}, Lcom/wmspanel/libstream/VideoListener16;->setAntibandingMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 89
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget v0, v0, Lcom/wmspanel/libstream/FocusMode;->exposureCompensation:I

    invoke-virtual {p0, v4, v0}, Lcom/wmspanel/libstream/VideoListener16;->setExposureCompensation(Landroid/hardware/Camera$Parameters;I)V

    .line 91
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0, v4}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 93
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 94
    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListener16;->mCameraId:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 97
    iget v2, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-ne v2, v1, :cond_6

    .line 98
    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    iget v2, p0, Lcom/wmspanel/libstream/VideoListener16;->mDisplayOrientation:I

    add-int/2addr v0, v2

    rem-int/lit16 v0, v0, 0x168

    .line 99
    rsub-int v0, v0, 0x168

    rem-int/lit16 v0, v0, 0x168

    .line 103
    :goto_3
    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v2, v0}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    move v0, v1

    .line 105
    goto/16 :goto_2

    .line 101
    :cond_6
    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    iget v2, p0, Lcom/wmspanel/libstream/VideoListener16;->mDisplayOrientation:I

    sub-int/2addr v0, v2

    add-int/lit16 v0, v0, 0x168

    rem-int/lit16 v0, v0, 0x168

    goto :goto_3

    :cond_7
    move v0, v2

    goto/16 :goto_1

    :cond_8
    move v2, v3

    goto/16 :goto_0

    :cond_9
    move v0, v3

    goto/16 :goto_1
.end method


# virtual methods
.method public flip()V
    .locals 3

    .prologue
    .line 251
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    if-nez v0, :cond_0

    .line 252
    const-string/jumbo v0, "VideoListener16"

    const-string/jumbo v1, "Video capture not started"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    :goto_0
    return-void

    .line 256
    :cond_0
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v1

    .line 257
    const/4 v0, 0x2

    if-ge v1, v0, :cond_1

    .line 258
    const-string/jumbo v0, "VideoListener16"

    const-string/jumbo v1, "Device has only one camera"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 262
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCameraId:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 263
    const/4 v0, 0x0

    :goto_1
    if-ge v0, v1, :cond_2

    .line 264
    if-eq v2, v0, :cond_3

    .line 265
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCameraId:Ljava/lang/String;

    .line 271
    :cond_2
    :try_start_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListener16;->releaseCamera()V

    .line 273
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCameraId:Ljava/lang/String;

    iget-boolean v1, p0, Lcom/wmspanel/libstream/VideoListener16;->mPlanar:Z

    invoke-direct {p0, v0, v1}, Lcom/wmspanel/libstream/VideoListener16;->openCamera(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_4

    .line 274
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 275
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListener16;->release()V

    .line 276
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 283
    :catch_0
    move-exception v0

    .line 284
    const-string/jumbo v1, "VideoListener16"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 286
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListener16;->release()V

    goto :goto_0

    .line 263
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 279
    :cond_4
    :try_start_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener16;->mPreviewCallback:Landroid/hardware/Camera$PreviewCallback;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 280
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener16;->mPreviewSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 281
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method focus()V
    .locals 2

    .prologue
    .line 337
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    if-nez v0, :cond_1

    .line 338
    const-string/jumbo v0, "VideoListener16"

    const-string/jumbo v1, "Video capture not started"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 362
    :cond_0
    :goto_0
    return-void

    .line 343
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListener16;->getCameraParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 344
    if-eqz v0, :cond_0

    .line 348
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->cancelAutoFocus()V

    .line 350
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener16;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget-object v1, v1, Lcom/wmspanel/libstream/FocusMode;->focusMode16:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/wmspanel/libstream/VideoListener16;->setFocusMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 351
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener16;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget-object v1, v1, Lcom/wmspanel/libstream/FocusMode;->awbMode16:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/wmspanel/libstream/VideoListener16;->setAwbMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 352
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener16;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget-object v1, v1, Lcom/wmspanel/libstream/FocusMode;->antibandingMode16:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/wmspanel/libstream/VideoListener16;->setAntibandingMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 353
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener16;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget v1, v1, Lcom/wmspanel/libstream/FocusMode;->exposureCompensation:I

    invoke-virtual {p0, v0, v1}, Lcom/wmspanel/libstream/VideoListener16;->setExposureCompensation(Landroid/hardware/Camera$Parameters;I)V

    .line 355
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener16;->setCameraParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 357
    :catch_0
    move-exception v0

    .line 358
    const-string/jumbo v1, "VideoListener16"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 360
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListener16;->release()V

    goto :goto_0
.end method

.method protected openEncoder(I)V
    .locals 4
    .param p1, "colorFormat"    # I

    .prologue
    .line 180
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getFormat()Landroid/media/MediaFormat;

    move-result-object v0

    const-string/jumbo v1, "color-format"

    invoke-virtual {v0, v1, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 181
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->configure()V

    .line 183
    new-instance v0, Lcom/wmspanel/libstream/Streamer$Size;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 184
    invoke-virtual {v1}, Lcom/wmspanel/libstream/VideoEncoder;->getFormat()Landroid/media/MediaFormat;

    move-result-object v1

    const-string/jumbo v2, "width"

    invoke-virtual {v1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListener16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 185
    invoke-virtual {v2}, Lcom/wmspanel/libstream/VideoEncoder;->getFormat()Landroid/media/MediaFormat;

    move-result-object v2

    const-string/jumbo v3, "height"

    invoke-virtual {v2, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/Streamer$Size;-><init>(II)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mPreviewSize:Lcom/wmspanel/libstream/Streamer$Size;

    .line 187
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->start()V

    .line 188
    return-void
.end method

.method public release()V
    .locals 2

    .prologue
    .line 192
    :try_start_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListener16;->resetMediaFormat()V

    .line 193
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListener16;->releaseCamera()V

    .line 194
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListener16;->releaseEncoder()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 198
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 200
    :goto_0
    return-void

    .line 195
    :catch_0
    move-exception v0

    .line 196
    :try_start_1
    const-string/jumbo v1, "VideoListener16"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 198
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v1}, Lcom/wmspanel/libstream/VideoListener16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    throw v0
.end method

.method setCameraParameters(Landroid/hardware/Camera$Parameters;)V
    .locals 2
    .param p1, "param"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 292
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    if-nez v0, :cond_0

    .line 293
    const-string/jumbo v0, "VideoListener16"

    const-string/jumbo v1, "Video capture not started"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    :goto_0
    return-void

    .line 298
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 299
    :catch_0
    move-exception v0

    .line 300
    const-string/jumbo v1, "VideoListener16"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public start(Landroid/content/Context;Ljava/lang/String;Landroid/view/SurfaceHolder;Landroid/graphics/SurfaceTexture;Lcom/wmspanel/libstream/VideoEncoder;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cameraId"    # Ljava/lang/String;
    .param p3, "previewSurfaceHolder"    # Landroid/view/SurfaceHolder;
    .param p4, "texture"    # Landroid/graphics/SurfaceTexture;
    .param p5, "encoder"    # Lcom/wmspanel/libstream/VideoEncoder;

    .prologue
    const/16 v7, 0x15

    const/4 v0, 0x0

    const/4 v3, -0x1

    .line 115
    if-nez p3, :cond_0

    .line 116
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 118
    :cond_0
    if-eqz p5, :cond_1

    invoke-virtual {p5}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v1

    if-nez v1, :cond_2

    .line 119
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 123
    :cond_2
    :try_start_0
    iput-object p3, p0, Lcom/wmspanel/libstream/VideoListener16;->mPreviewSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 125
    iput-object p5, p0, Lcom/wmspanel/libstream/VideoListener16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 127
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/wmspanel/libstream/VideoListener16;->mPlanar:Z

    .line 131
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/VideoEncoder;->getSupportedColorFormats()[I

    move-result-object v4

    array-length v5, v4

    move v2, v0

    :goto_0
    if-ge v2, v5, :cond_b

    aget v1, v4, v2

    .line 132
    const/16 v6, 0x13

    if-eq v6, v1, :cond_3

    const/16 v6, 0x14

    if-ne v6, v1, :cond_5

    .line 134
    :cond_3
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/wmspanel/libstream/VideoListener16;->mPlanar:Z

    .line 140
    :goto_1
    if-ne v1, v3, :cond_a

    .line 141
    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListener16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v2}, Lcom/wmspanel/libstream/VideoEncoder;->getSupportedColorFormats()[I

    move-result-object v4

    array-length v5, v4

    move v2, v0

    :goto_2
    if-ge v2, v5, :cond_a

    aget v0, v4, v2

    .line 142
    if-eq v7, v0, :cond_4

    const/16 v6, 0x27

    if-eq v6, v0, :cond_4

    const v6, 0x7f000100

    if-ne v6, v0, :cond_6

    .line 151
    :cond_4
    :goto_3
    if-ne v0, v3, :cond_7

    .line 152
    const-string/jumbo v0, "VideoListener16"

    const-string/jumbo v1, "can\'t find supported color format"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    :catch_0
    move-exception v0

    .line 170
    const-string/jumbo v1, "VideoListener16"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v7, :cond_9

    instance-of v0, v0, Landroid/media/MediaCodec$CodecException;

    if-eqz v0, :cond_9

    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->ENCODER_FAIL:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .line 174
    :goto_4
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 175
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListener16;->release()V

    .line 177
    :goto_5
    return-void

    .line 131
    :cond_5
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_0

    .line 141
    :cond_6
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_2

    .line 156
    :cond_7
    :try_start_1
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener16;->openEncoder(I)V

    .line 158
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 160
    iget-boolean v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mPlanar:Z

    invoke-direct {p0, p2, v0}, Lcom/wmspanel/libstream/VideoListener16;->openCamera(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_8

    .line 161
    const-string/jumbo v0, "VideoListener16"

    const-string/jumbo v1, "failed to open camera"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    throw v0

    .line 165
    :cond_8
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener16;->mPreviewSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 166
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener16;->mPreviewCallback:Landroid/hardware/Camera$PreviewCallback;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 167
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_5

    .line 171
    :cond_9
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    goto :goto_4

    :cond_a
    move v0, v1

    goto :goto_3

    :cond_b
    move v1, v3

    goto/16 :goto_1
.end method

.method toggleTorch()V
    .locals 3

    .prologue
    .line 306
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16;->mCamera:Landroid/hardware/Camera;

    if-nez v0, :cond_1

    .line 307
    const-string/jumbo v0, "VideoListener16"

    const-string/jumbo v1, "Video capture not started"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    :cond_0
    :goto_0
    return-void

    .line 312
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListener16;->getCameraParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 313
    if-eqz v0, :cond_0

    .line 316
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    move-result-object v1

    .line 317
    if-nez v1, :cond_2

    .line 318
    const-string/jumbo v0, "VideoListener16"

    const-string/jumbo v1, "Flash is not supported"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 328
    :catch_0
    move-exception v0

    .line 329
    const-string/jumbo v1, "VideoListener16"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 330
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 331
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListener16;->release()V

    goto :goto_0

    .line 321
    :cond_2
    :try_start_1
    const-string/jumbo v2, "off"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 322
    const-string/jumbo v1, "torch"

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 326
    :goto_1
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener16;->setCameraParameters(Landroid/hardware/Camera$Parameters;)V

    goto :goto_0

    .line 324
    :cond_3
    const-string/jumbo v1, "off"

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
