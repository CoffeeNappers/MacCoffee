.class Lcom/wmspanel/libstream/VideoListenerGLES21;
.super Lcom/wmspanel/libstream/VideoListener21Base;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoListenerGLES21"


# instance fields
.field private mAeRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mAvailAntibandingModes:[I

.field private mAvailAwbModes:[I

.field private mAvailFocusModes:[I

.field private mBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

.field private mCameraTexture:Landroid/graphics/SurfaceTexture;

.field private mCloseCameraRunnable:Ljava/lang/Runnable;

.field private mContext:Landroid/content/Context;

.field private mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

.field private mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

.field private mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

.field private mFlashAvailable:Z

.field private mFlashMode:I

.field private mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

.field private mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

.field private mIsCameraClosing:Z

.field private mLensFacingBack:Z

.field private mTextureId:I

.field private final mTmpMatrix:[F


# direct methods
.method public constructor <init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V
    .locals 1
    .param p1, "streamBuffer"    # Lcom/wmspanel/libstream/StreamBuffer;
    .param p2, "listener"    # Lcom/wmspanel/libstream/Streamer$Listener;

    .prologue
    .line 61
    invoke-direct {p0, p1, p2}, Lcom/wmspanel/libstream/VideoListener21Base;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V

    .line 44
    const/4 v0, 0x0

    iput v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFlashMode:I

    .line 55
    const/16 v0, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTmpMatrix:[F

    .line 434
    new-instance v0, Lcom/wmspanel/libstream/VideoListenerGLES21$4;

    invoke-direct {v0, p0}, Lcom/wmspanel/libstream/VideoListenerGLES21$4;-><init>(Lcom/wmspanel/libstream/VideoListenerGLES21;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCloseCameraRunnable:Ljava/lang/Runnable;

    .line 63
    new-instance v0, Lcom/wmspanel/libstream/VideoListenerGLES21$1;

    invoke-direct {v0, p0}, Lcom/wmspanel/libstream/VideoListenerGLES21$1;-><init>(Lcom/wmspanel/libstream/VideoListenerGLES21;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraStateCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 111
    new-instance v0, Lcom/wmspanel/libstream/VideoListenerGLES21$2;

    invoke-direct {v0, p0}, Lcom/wmspanel/libstream/VideoListenerGLES21$2;-><init>(Lcom/wmspanel/libstream/VideoListenerGLES21;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mSessionStateCallback:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 136
    return-void
.end method

.method private abortCaptureSession()V
    .locals 2

    .prologue
    .line 422
    const-string/jumbo v0, "VideoListenerGLES21"

    const-string/jumbo v1, "abortCaptureSession"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 423
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-eqz v0, :cond_0

    .line 425
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->abortCaptures()V

    .line 426
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 430
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 432
    :cond_0
    return-void

    .line 427
    :catch_0
    move-exception v0

    .line 428
    const-string/jumbo v1, "VideoListenerGLES21"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/wmspanel/libstream/VideoListenerGLES21;)Z
    .locals 1
    .param p0, "x0"    # Lcom/wmspanel/libstream/VideoListenerGLES21;

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mIsCameraClosing:Z

    return v0
.end method

.method static synthetic access$100(Lcom/wmspanel/libstream/VideoListenerGLES21;)V
    .locals 0
    .param p0, "x0"    # Lcom/wmspanel/libstream/VideoListenerGLES21;

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->stopCameraThread()V

    return-void
.end method

.method static synthetic access$200(Lcom/wmspanel/libstream/VideoListenerGLES21;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/wmspanel/libstream/VideoListenerGLES21;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300(Lcom/wmspanel/libstream/VideoListenerGLES21;Landroid/content/Context;Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Lcom/wmspanel/libstream/VideoListenerGLES21;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lcom/wmspanel/libstream/VideoListenerGLES21;->openCamera(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/wmspanel/libstream/VideoListenerGLES21;)V
    .locals 0
    .param p0, "x0"    # Lcom/wmspanel/libstream/VideoListenerGLES21;

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->startPreview()V

    return-void
.end method

.method private drawFrame()V
    .locals 12

    .prologue
    const/16 v9, 0x10e

    const/16 v8, 0x5a

    const/high16 v11, 0x3f800000    # 1.0f

    const/16 v10, 0xb4

    const/4 v7, 0x0

    .line 473
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    if-nez v0, :cond_0

    .line 474
    const-string/jumbo v0, "VideoListenerGLES21"

    const-string/jumbo v1, "Skipping drawFrame after shutdown"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 578
    :goto_0
    return-void

    .line 479
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->makeCurrent()V

    .line 480
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 481
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTmpMatrix:[F

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 483
    iget-boolean v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTakeSnapshot:Z

    if-eqz v0, :cond_1

    .line 484
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->readPixels()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 485
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->getWidth()I

    move-result v4

    .line 486
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->getHeight()I

    move-result v5

    .line 488
    new-instance v0, Lcom/wmspanel/libstream/SnapshotWriter;

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mSnapshotCallback:Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mSnapshot:Ljava/io/File;

    iget-boolean v6, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mLensFacingBack:Z

    if-nez v6, :cond_2

    const/4 v6, 0x1

    :goto_1
    invoke-direct/range {v0 .. v6}, Lcom/wmspanel/libstream/SnapshotWriter;-><init>(Ljava/nio/ByteBuffer;Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;Ljava/io/File;IIZ)V

    .line 496
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 497
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 499
    iput-boolean v7, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTakeSnapshot:Z

    .line 500
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mSnapshotCallback:Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;

    .line 501
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mSnapshot:Ljava/io/File;

    .line 505
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mSurfaceSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v0, v0, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mSurfaceSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v1, v1, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    invoke-static {v7, v7, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 506
    iget v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mVideoOrientation:I

    sget v1, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->HORIZON:I

    if-ne v0, v1, :cond_3

    .line 507
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTmpMatrix:[F

    iget v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplayOrientation:I

    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v4, v4, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_horizon:F

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameY(I[FIF)V

    .line 511
    :goto_2
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->swapBuffers()Z

    .line 514
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->makeCurrent()V

    .line 515
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mPreviewSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v0, v0, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mPreviewSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v1, v1, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    invoke-static {v7, v7, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 520
    iget-boolean v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mLensFacingBack:Z

    if-eqz v0, :cond_d

    .line 521
    iget v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mVideoOrientation:I

    sget v1, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->LANDSCAPE:I

    if-ne v0, v1, :cond_7

    .line 522
    iget v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplayOrientation:I

    if-ge v0, v10, :cond_4

    move v0, v8

    .line 523
    :goto_3
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v1, v1, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_letterbox:F

    cmpl-float v1, v1, v11

    if-eqz v1, :cond_5

    .line 524
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTextureId:I

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTmpMatrix:[F

    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v4, v4, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_letterbox:F

    invoke-virtual {v1, v2, v3, v0, v4}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameX(I[FIF)V

    .line 572
    :goto_4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-le v0, v1, :cond_17

    .line 573
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/wmspanel/libstream/gles/WindowSurface;->setPresentationTime(J)V

    .line 577
    :goto_5
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->swapBuffers()Z

    goto/16 :goto_0

    :cond_2
    move v6, v7

    .line 488
    goto/16 :goto_1

    .line 509
    :cond_3
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTmpMatrix:[F

    iget v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplayOrientation:I

    invoke-virtual {v0, v1, v2, v3, v11}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameY(I[FIF)V

    goto :goto_2

    :cond_4
    move v0, v9

    .line 522
    goto :goto_3

    .line 525
    :cond_5
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v1, v1, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_pillarbox:F

    cmpl-float v1, v1, v11

    if-eqz v1, :cond_6

    .line 526
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTextureId:I

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTmpMatrix:[F

    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v4, v4, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_pillarbox:F

    invoke-virtual {v1, v2, v3, v0, v4}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameY(I[FIF)V

    goto :goto_4

    .line 528
    :cond_6
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTextureId:I

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTmpMatrix:[F

    invoke-virtual {v1, v2, v3, v0, v11}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameX(I[FIF)V

    goto :goto_4

    .line 530
    :cond_7
    iget v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mVideoOrientation:I

    sget v1, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->PORTRAIT:I

    if-ne v0, v1, :cond_a

    .line 531
    iget v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplayOrientation:I

    if-ge v0, v10, :cond_8

    .line 532
    :goto_6
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_letterbox:F

    cmpl-float v0, v0, v11

    if-eqz v0, :cond_9

    .line 533
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTmpMatrix:[F

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_letterbox:F

    invoke-virtual {v0, v1, v2, v7, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameY(I[FIF)V

    goto :goto_4

    :cond_8
    move v7, v10

    .line 531
    goto :goto_6

    .line 535
    :cond_9
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTmpMatrix:[F

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale:F

    invoke-virtual {v0, v1, v2, v7, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameX(I[FIF)V

    goto :goto_4

    .line 537
    :cond_a
    iget v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mVideoOrientation:I

    sget v1, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->HORIZON:I

    if-ne v0, v1, :cond_c

    .line 538
    iget v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplayOrientation:I

    if-ge v0, v10, :cond_b

    .line 539
    :goto_7
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTmpMatrix:[F

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_horizon:F

    invoke-virtual {v0, v1, v2, v7, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameY(I[FIF)V

    goto/16 :goto_4

    :cond_b
    move v7, v10

    .line 538
    goto :goto_7

    .line 542
    :cond_c
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Unknown video orientation"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 547
    :cond_d
    iget v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mVideoOrientation:I

    sget v1, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->LANDSCAPE:I

    if-ne v0, v1, :cond_11

    .line 548
    iget v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplayOrientation:I

    if-ge v0, v10, :cond_e

    .line 549
    :goto_8
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_letterbox:F

    cmpl-float v0, v0, v11

    if-eqz v0, :cond_f

    .line 550
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTmpMatrix:[F

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_letterbox:F

    invoke-virtual {v0, v1, v2, v8, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameMirrorX(I[FIF)V

    goto/16 :goto_4

    :cond_e
    move v8, v9

    .line 548
    goto :goto_8

    .line 551
    :cond_f
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_pillarbox:F

    cmpl-float v0, v0, v11

    if-eqz v0, :cond_10

    .line 552
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTmpMatrix:[F

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_pillarbox:F

    invoke-virtual {v0, v1, v2, v8, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameMirrorY(I[FIF)V

    goto/16 :goto_4

    .line 554
    :cond_10
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTmpMatrix:[F

    invoke-virtual {v0, v1, v2, v8, v11}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameMirrorX(I[FIF)V

    goto/16 :goto_4

    .line 556
    :cond_11
    iget v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mVideoOrientation:I

    sget v1, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->PORTRAIT:I

    if-ne v0, v1, :cond_14

    .line 557
    iget v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplayOrientation:I

    if-ge v0, v10, :cond_12

    .line 558
    :goto_9
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_letterbox:F

    cmpl-float v0, v0, v11

    if-eqz v0, :cond_13

    .line 559
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTmpMatrix:[F

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_letterbox:F

    invoke-virtual {v0, v1, v2, v7, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameMirrorY(I[FIF)V

    goto/16 :goto_4

    :cond_12
    move v7, v10

    .line 557
    goto :goto_9

    .line 561
    :cond_13
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTmpMatrix:[F

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale:F

    invoke-virtual {v0, v1, v2, v7, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameMirrorX(I[FIF)V

    goto/16 :goto_4

    .line 563
    :cond_14
    iget v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mVideoOrientation:I

    sget v1, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->HORIZON:I

    if-ne v0, v1, :cond_16

    .line 564
    iget v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplayOrientation:I

    if-ge v0, v10, :cond_15

    .line 565
    :goto_a
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTmpMatrix:[F

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_horizon:F

    invoke-virtual {v0, v1, v2, v7, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameMirrorY(I[FIF)V

    goto/16 :goto_4

    :cond_15
    move v7, v10

    .line 564
    goto :goto_a

    .line 568
    :cond_16
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Unknown video orientation"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 575
    :cond_17
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->getTimestamp()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/wmspanel/libstream/gles/WindowSurface;->setPresentationTime(J)V

    goto/16 :goto_5
.end method

.method private openCamera(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cameraId"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 283
    :try_start_0
    iput-object p2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraId:Ljava/lang/String;

    .line 284
    const-string/jumbo v0, "VideoListenerGLES21"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "open camera#"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraId:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    .line 287
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFlipCameraInfo:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    .line 288
    iget-object v4, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->cameraId:Ljava/lang/String;

    iget-object v5, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraId:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 289
    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    .line 294
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    if-nez v0, :cond_2

    .line 295
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Camera info not found"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 330
    :catch_0
    move-exception v0

    .line 331
    const-string/jumbo v1, "VideoListenerGLES21"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v3

    .line 334
    :goto_0
    return v0

    .line 298
    :cond_2
    :try_start_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget-object v1, v1, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v1, v1, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget-object v4, v4, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v4, v4, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    invoke-virtual {v0, v1, v4}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 300
    const-string/jumbo v0, "camera"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/CameraManager;

    .line 302
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v4

    .line 303
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v4, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, v2, :cond_3

    move v1, v2

    :goto_1
    iput-boolean v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mLensFacingBack:Z

    .line 304
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->FLASH_INFO_AVAILABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v4, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFlashAvailable:Z

    .line 305
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AF_AVAILABLE_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v4, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mAvailFocusModes:[I

    .line 306
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AWB_AVAILABLE_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v4, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mAvailAwbModes:[I

    .line 307
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_ANTIBANDING_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v4, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mAvailAntibandingModes:[I

    .line 308
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_COMPENSATION_RANGE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v4, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Range;

    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mAeRange:Landroid/util/Range;

    .line 310
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    new-instance v4, Lcom/wmspanel/libstream/VideoListenerGLES21$3;

    invoke-direct {v4, p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES21$3;-><init>(Lcom/wmspanel/libstream/VideoListenerGLES21;Landroid/hardware/camera2/CameraManager;)V

    invoke-virtual {v1, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move v0, v2

    .line 334
    goto :goto_0

    :cond_3
    move v1, v3

    .line 303
    goto :goto_1
.end method

.method private releaseEgl()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 581
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    if-eqz v0, :cond_0

    .line 582
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->release()V

    .line 583
    iput-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    .line 585
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mPreviewSurface:Landroid/view/Surface;

    if-eqz v0, :cond_1

    .line 586
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 587
    iput-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mPreviewSurface:Landroid/view/Surface;

    .line 589
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_2

    .line 590
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 591
    iput-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    .line 593
    :cond_2
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    if-eqz v0, :cond_3

    .line 594
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->release()V

    .line 595
    iput-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    .line 597
    :cond_3
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    if-eqz v0, :cond_4

    .line 598
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->release(Z)V

    .line 599
    iput-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    .line 601
    :cond_4
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    if-eqz v0, :cond_5

    .line 602
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/EglCore;->release()V

    .line 603
    iput-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    .line 605
    :cond_5
    return-void
.end method

.method private setAntibandingMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 7
    .param p1, "requestBuilder"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 167
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_ANTIBANDING_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget v3, v0, Lcom/wmspanel/libstream/FocusMode;->antibandingMode:I

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mAvailAntibandingModes:[I

    const-string/jumbo v6, "antibanding_mode"

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/wmspanel/libstream/VideoListenerGLES21;->setControlMode(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CaptureRequest$Key;II[ILjava/lang/String;)Z

    .line 174
    return-void
.end method

.method private setAwbMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 7
    .param p1, "requestBuilder"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 157
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AWB_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget v3, v0, Lcom/wmspanel/libstream/FocusMode;->awbMode:I

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mAvailAwbModes:[I

    const-string/jumbo v6, "awb_mode"

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/wmspanel/libstream/VideoListenerGLES21;->setControlMode(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CaptureRequest$Key;II[ILjava/lang/String;)Z

    .line 164
    return-void
.end method

.method private setControlMode(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CaptureRequest$Key;II[ILjava/lang/String;)Z
    .locals 7
    .param p1, "requestBuilder"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "key"    # Landroid/hardware/camera2/CaptureRequest$Key;
    .param p3, "newMode"    # I
    .param p4, "defMode"    # I
    .param p5, "availModes"    # [I
    .param p6, "name"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 197
    .line 200
    if-eqz p5, :cond_6

    .line 203
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 204
    array-length v4, p5

    move v0, v1

    :goto_0
    if-ge v0, v4, :cond_0

    aget v5, p5, v0

    .line 205
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ";"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 211
    :cond_0
    array-length v3, p5

    move v0, v1

    :goto_1
    if-ge v0, v3, :cond_5

    aget v4, p5, v0

    .line 212
    if-ne v4, p3, :cond_2

    move v3, v2

    move v0, v2

    .line 221
    .end local p3    # "newMode":I
    :goto_2
    if-nez v3, :cond_4

    .line 222
    array-length v4, p5

    :goto_3
    if-ge v1, v4, :cond_4

    aget v5, p5, v1

    .line 223
    if-ne v5, p4, :cond_3

    move v1, v2

    .line 231
    :goto_4
    if-eqz v1, :cond_1

    .line 232
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 236
    :cond_1
    :goto_5
    return v0

    .line 211
    .restart local p3    # "newMode":I
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 222
    .end local p3    # "newMode":I
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_4
    move v1, v3

    goto :goto_4

    .restart local p3    # "newMode":I
    :cond_5
    move v3, v1

    move p3, p4

    move v0, v1

    goto :goto_2

    :cond_6
    move v0, v1

    goto :goto_5
.end method

.method private setExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2
    .param p1, "requestBuilder"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 177
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mAeRange:Landroid/util/Range;

    if-eqz v0, :cond_2

    .line 178
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget v1, v0, Lcom/wmspanel/libstream/FocusMode;->exposureCompensation:I

    .line 179
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mAeRange:Landroid/util/Range;

    invoke-virtual {v0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v1, v0, :cond_0

    .line 180
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mAeRange:Landroid/util/Range;

    invoke-virtual {v0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    move v1, v0

    .line 182
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mAeRange:Landroid/util/Range;

    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v1, v0, :cond_1

    .line 183
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mAeRange:Landroid/util/Range;

    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 185
    :cond_1
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 188
    :cond_2
    return-void
.end method

.method private setFocusMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 7
    .param p1, "requestBuilder"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 140
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget v3, v0, Lcom/wmspanel/libstream/FocusMode;->focusMode:I

    const/4 v4, 0x3

    iget-object v5, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mAvailFocusModes:[I

    const-string/jumbo v6, "focus_mode"

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/wmspanel/libstream/VideoListenerGLES21;->setControlMode(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CaptureRequest$Key;II[ILjava/lang/String;)Z

    move-result v0

    .line 148
    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget v0, v0, Lcom/wmspanel/libstream/FocusMode;->focusMode:I

    if-nez v0, :cond_0

    .line 150
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->LENS_FOCUS_DISTANCE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget v1, v1, Lcom/wmspanel/libstream/FocusMode;->focusDistance:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 154
    :cond_0
    return-void
.end method

.method private startPreview()V
    .locals 4

    .prologue
    .line 243
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    if-eqz v0, :cond_0

    .line 244
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 245
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 246
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 279
    :goto_0
    return-void

    .line 250
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 251
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 253
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 255
    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->setFocusMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 256
    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->setAwbMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 257
    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->setAntibandingMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 258
    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->setExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 260
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget-object v1, v1, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->fpsRange:Lcom/wmspanel/libstream/Streamer$FpsRange;

    if-eqz v1, :cond_1

    .line 261
    new-instance v1, Landroid/util/Range;

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget-object v2, v2, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->fpsRange:Lcom/wmspanel/libstream/Streamer$FpsRange;

    iget v2, v2, Lcom/wmspanel/libstream/Streamer$FpsRange;->fpsMin:F

    float-to-int v2, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget-object v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->fpsRange:Lcom/wmspanel/libstream/Streamer$FpsRange;

    iget v3, v3, Lcom/wmspanel/libstream/Streamer$FpsRange;->fpsMax:F

    float-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 262
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v0, v2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 265
    :cond_1
    iget-boolean v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFlashAvailable:Z

    if-eqz v1, :cond_2

    .line 266
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFlashMode:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 271
    :goto_1
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    .line 272
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0, v2, v3}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 274
    :catch_0
    move-exception v0

    .line 275
    const-string/jumbo v1, "VideoListenerGLES21"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 277
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->release()V

    goto :goto_0

    .line 268
    :cond_2
    const/4 v1, 0x0

    :try_start_1
    iput v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFlashMode:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private stopCameraThread()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 444
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraThread:Landroid/os/HandlerThread;

    if-nez v0, :cond_0

    .line 457
    :goto_0
    return-void

    .line 448
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 450
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 454
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraThread:Landroid/os/HandlerThread;

    .line 455
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    goto :goto_0

    .line 451
    :catch_0
    move-exception v0

    .line 452
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 454
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraThread:Landroid/os/HandlerThread;

    .line 455
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    goto :goto_0

    .line 454
    :catchall_0
    move-exception v0

    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraThread:Landroid/os/HandlerThread;

    .line 455
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    throw v0
.end method


# virtual methods
.method createCaptureRequest()Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 6

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 668
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-nez v0, :cond_3

    .line 669
    :cond_0
    const-string/jumbo v0, "VideoListenerGLES21"

    const-string/jumbo v4, "Video capture not started"

    invoke-static {v0, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 670
    const-string/jumbo v4, "VideoListenerGLES21"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "mCamera2 is null: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    if-nez v0, :cond_1

    move v0, v1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v5, ", mCameraHandler is null: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v5, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    if-nez v5, :cond_2

    .line 671
    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 670
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v3

    .line 678
    :goto_2
    return-object v0

    :cond_1
    move v0, v2

    .line 670
    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1

    .line 675
    :cond_3
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_2

    .line 677
    :catch_0
    move-exception v0

    move-object v0, v3

    .line 678
    goto :goto_2
.end method

.method flip()V
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 609
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    if-nez v0, :cond_3

    .line 610
    :cond_0
    const-string/jumbo v0, "VideoListenerGLES21"

    const-string/jumbo v3, "Video capture not started"

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 611
    const-string/jumbo v3, "VideoListenerGLES21"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "mCamera2 is null: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    if-nez v0, :cond_1

    move v0, v1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v4, ", mCameraHandler is null: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    if-nez v4, :cond_2

    .line 612
    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 611
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 626
    :goto_2
    return-void

    :cond_1
    move v0, v2

    .line 611
    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1

    .line 616
    :cond_3
    iput-boolean v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mIsCameraClosing:Z

    .line 618
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFlipCameraInfo:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    .line 619
    iget-object v2, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->cameraId:Ljava/lang/String;

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 620
    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->cameraId:Ljava/lang/String;

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraId:Ljava/lang/String;

    .line 624
    :cond_5
    invoke-direct {p0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->abortCaptureSession()V

    .line 625
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCloseCameraRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_2
.end method

.method focus()V
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 653
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-nez v0, :cond_3

    .line 654
    :cond_0
    const-string/jumbo v0, "VideoListenerGLES21"

    const-string/jumbo v3, "Video capture not started"

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 655
    const-string/jumbo v3, "VideoListenerGLES21"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "mCamera2 is null: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    if-nez v0, :cond_1

    move v0, v1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v4, ", mCameraHandler is null: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    if-nez v4, :cond_2

    .line 656
    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 655
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 664
    :goto_2
    return-void

    :cond_1
    move v0, v2

    .line 655
    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1

    .line 660
    :cond_3
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 661
    :catch_0
    move-exception v0

    .line 662
    const-string/jumbo v1, "VideoListenerGLES21"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 2
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 463
    :try_start_0
    invoke-direct {p0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->drawFrame()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 469
    :goto_0
    return-void

    .line 464
    :catch_0
    move-exception v0

    .line 465
    const-string/jumbo v1, "VideoListenerGLES21"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 467
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->release()V

    goto :goto_0
.end method

.method public openEgl()V
    .locals 4

    .prologue
    .line 388
    new-instance v0, Lcom/wmspanel/libstream/gles/WindowSurface;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mSurface:Landroid/view/Surface;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/wmspanel/libstream/gles/WindowSurface;-><init>(Lcom/wmspanel/libstream/gles/EglCore;Landroid/view/Surface;Z)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    .line 389
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->makeCurrent()V

    .line 391
    new-instance v0, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    new-instance v1, Lcom/wmspanel/libstream/gles/Texture2dProgram;

    sget-object v2, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;->TEXTURE_EXT:Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    invoke-direct {v1, v2}, Lcom/wmspanel/libstream/gles/Texture2dProgram;-><init>(Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;)V

    invoke-direct {v0, v1}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;-><init>(Lcom/wmspanel/libstream/gles/Texture2dProgram;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    .line 393
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->createTextureObject()I

    move-result v0

    iput v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTextureId:I

    .line 394
    new-instance v0, Landroid/graphics/SurfaceTexture;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mTextureId:I

    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    .line 395
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 396
    new-instance v0, Landroid/view/Surface;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mPreviewSurface:Landroid/view/Surface;

    .line 397
    return-void
.end method

.method public openEncoder()V
    .locals 4

    .prologue
    .line 377
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getFormat()Landroid/media/MediaFormat;

    move-result-object v0

    const-string/jumbo v1, "color-format"

    const v2, 0x7f000789

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 378
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mMediaCodecCallback:Landroid/media/MediaCodec$Callback;

    invoke-virtual {v0, v1}, Landroid/media/MediaCodec;->setCallback(Landroid/media/MediaCodec$Callback;)V

    .line 379
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->configure()V

    .line 380
    new-instance v0, Lcom/wmspanel/libstream/gles/WindowSurface;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v2}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object v2

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/wmspanel/libstream/gles/WindowSurface;-><init>(Lcom/wmspanel/libstream/gles/EglCore;Landroid/view/Surface;Z)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    .line 381
    new-instance v0, Lcom/wmspanel/libstream/Streamer$Size;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 382
    invoke-virtual {v1}, Lcom/wmspanel/libstream/VideoEncoder;->getFormat()Landroid/media/MediaFormat;

    move-result-object v1

    const-string/jumbo v2, "width"

    invoke-virtual {v1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 383
    invoke-virtual {v2}, Lcom/wmspanel/libstream/VideoEncoder;->getFormat()Landroid/media/MediaFormat;

    move-result-object v2

    const-string/jumbo v3, "height"

    invoke-virtual {v2, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/Streamer$Size;-><init>(II)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mPreviewSize:Lcom/wmspanel/libstream/Streamer$Size;

    .line 384
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->start()V

    .line 385
    return-void
.end method

.method public release()V
    .locals 2

    .prologue
    .line 401
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mIsCameraClosing:Z

    .line 403
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 404
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->resetMediaFormat()V

    .line 405
    invoke-direct {p0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->abortCaptureSession()V

    .line 406
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->releaseEncoder()V

    .line 407
    invoke-direct {p0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->releaseEgl()V

    .line 409
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_0

    .line 410
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCloseCameraRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 419
    :goto_0
    return-void

    .line 413
    :cond_0
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 415
    :catch_0
    move-exception v0

    .line 416
    const-string/jumbo v1, "VideoListenerGLES21"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 417
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    goto :goto_0
.end method

.method setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 5
    .param p1, "builder"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 684
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-nez v0, :cond_4

    .line 685
    :cond_0
    const-string/jumbo v0, "VideoListenerGLES21"

    const-string/jumbo v3, "Video capture not started"

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 686
    const-string/jumbo v3, "VideoListenerGLES21"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "mCamera2 is null: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    if-nez v0, :cond_2

    move v0, v1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v4, ", mCameraHandler is null: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    if-nez v4, :cond_3

    .line 687
    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 686
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 699
    :cond_1
    :goto_2
    return-void

    :cond_2
    move v0, v2

    .line 686
    goto :goto_0

    :cond_3
    move v1, v2

    goto :goto_1

    .line 690
    :cond_4
    if-eqz p1, :cond_1

    .line 694
    :try_start_0
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 695
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 696
    :catch_0
    move-exception v0

    .line 697
    const-string/jumbo v1, "VideoListenerGLES21"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method public start(Landroid/content/Context;Ljava/lang/String;Landroid/view/SurfaceHolder;Landroid/graphics/SurfaceTexture;Lcom/wmspanel/libstream/VideoEncoder;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cameraId"    # Ljava/lang/String;
    .param p3, "previewSurface"    # Landroid/view/SurfaceHolder;
    .param p4, "texture"    # Landroid/graphics/SurfaceTexture;
    .param p5, "videoEncoder"    # Lcom/wmspanel/libstream/VideoEncoder;

    .prologue
    .line 343
    if-nez p1, :cond_0

    .line 344
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 346
    :cond_0
    if-eqz p5, :cond_1

    invoke-virtual {p5}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    if-nez v0, :cond_2

    .line 347
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 351
    :cond_2
    :try_start_0
    new-instance v0, Landroid/os/HandlerThread;

    const-string/jumbo v1, "com.wmspanel.streamer.camera2"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraThread:Landroid/os/HandlerThread;

    .line 352
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 353
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    .line 355
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mContext:Landroid/content/Context;

    .line 356
    iput-object p5, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 358
    new-instance v0, Lcom/wmspanel/libstream/gles/EglCore;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/gles/EglCore;-><init>(Landroid/opengl/EGLContext;I)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    .line 359
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->openEncoder()V

    .line 360
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->openEgl()V

    .line 362
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mContext:Landroid/content/Context;

    invoke-direct {p0, v0, p2}, Lcom/wmspanel/libstream/VideoListenerGLES21;->openCamera(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 363
    const-string/jumbo v0, "VideoListenerGLES21"

    const-string/jumbo v1, "failed to open camera"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 367
    :catch_0
    move-exception v0

    .line 368
    const-string/jumbo v1, "VideoListenerGLES21"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 369
    instance-of v0, v0, Landroid/media/MediaCodec$CodecException;

    if-eqz v0, :cond_4

    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->ENCODER_FAIL:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .line 371
    :goto_0
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 372
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerGLES21;->release()V

    .line 374
    :cond_3
    return-void

    .line 369
    :cond_4
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    goto :goto_0
.end method

.method toggleTorch()V
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 630
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-nez v0, :cond_4

    .line 631
    :cond_0
    const-string/jumbo v0, "VideoListenerGLES21"

    const-string/jumbo v3, "Video capture not started"

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 632
    const-string/jumbo v3, "VideoListenerGLES21"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "mCamera2 is null: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    if-nez v0, :cond_2

    move v0, v1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v4, ", mCameraHandler is null: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCameraHandler:Landroid/os/Handler;

    if-nez v4, :cond_3

    .line 633
    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 632
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 649
    :cond_1
    :goto_2
    return-void

    :cond_2
    move v0, v2

    .line 632
    goto :goto_0

    :cond_3
    move v1, v2

    goto :goto_1

    .line 637
    :cond_4
    iget-boolean v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFlashAvailable:Z

    if-eqz v0, :cond_1

    .line 638
    iget v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFlashMode:I

    if-nez v0, :cond_5

    .line 639
    const/4 v0, 0x2

    iput v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFlashMode:I

    .line 644
    :goto_3
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 645
    :catch_0
    move-exception v0

    .line 646
    const-string/jumbo v1, "VideoListenerGLES21"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 641
    :cond_5
    iput v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mFlashMode:I

    goto :goto_3
.end method
