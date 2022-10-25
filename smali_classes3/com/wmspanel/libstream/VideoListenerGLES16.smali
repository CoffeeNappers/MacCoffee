.class Lcom/wmspanel/libstream/VideoListenerGLES16;
.super Lcom/wmspanel/libstream/VideoListener16Base;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoListenerGLES16"


# instance fields
.field private mCameraHandler:Landroid/os/Handler;

.field private mCameraInfo:Landroid/hardware/Camera$CameraInfo;

.field private mCameraTexture:Landroid/graphics/SurfaceTexture;

.field private mCameraThread:Landroid/os/HandlerThread;

.field private mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

.field private mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

.field private mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

.field private mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

.field private mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

.field private mTextureId:I

.field private final mTmpMatrix:[F


# direct methods
.method public constructor <init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V
    .locals 1
    .param p1, "streamBuffer"    # Lcom/wmspanel/libstream/StreamBuffer;
    .param p2, "listener"    # Lcom/wmspanel/libstream/Streamer$Listener;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Lcom/wmspanel/libstream/VideoListener16Base;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V

    .line 41
    const/16 v0, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    .line 34
    return-void
.end method

.method static synthetic access$000(Lcom/wmspanel/libstream/VideoListenerGLES16;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/wmspanel/libstream/VideoListenerGLES16;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/wmspanel/libstream/VideoListenerGLES16;->logThread(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/wmspanel/libstream/VideoListenerGLES16;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/wmspanel/libstream/VideoListenerGLES16;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/wmspanel/libstream/VideoListenerGLES16;->openCamera(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/wmspanel/libstream/VideoListenerGLES16;)Landroid/graphics/SurfaceTexture;
    .locals 1
    .param p0, "x0"    # Lcom/wmspanel/libstream/VideoListenerGLES16;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    return-object v0
.end method

.method static synthetic access$300(Lcom/wmspanel/libstream/VideoListenerGLES16;)V
    .locals 0
    .param p0, "x0"    # Lcom/wmspanel/libstream/VideoListenerGLES16;

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->stopCameraThread()V

    return-void
.end method

.method private drawFrame()V
    .locals 13

    .prologue
    const/16 v9, 0x10e

    const/16 v10, 0x5a

    const/16 v8, 0xb4

    const/4 v7, 0x0

    const/high16 v12, 0x3f800000    # 1.0f

    .line 167
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    if-nez v0, :cond_0

    .line 168
    const-string/jumbo v0, "VideoListenerGLES16"

    const-string/jumbo v1, "Skipping drawFrame after shutdown"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    :goto_0
    return-void

    .line 173
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->makeCurrent()V

    .line 174
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 175
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 177
    iget-boolean v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTakeSnapshot:Z

    if-eqz v0, :cond_1

    .line 178
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->readPixels()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 179
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->getWidth()I

    move-result v4

    .line 180
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->getHeight()I

    move-result v5

    .line 182
    new-instance v0, Lcom/wmspanel/libstream/SnapshotWriter;

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mSnapshotCallback:Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mSnapshot:Ljava/io/File;

    iget-object v6, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraInfo:Landroid/hardware/Camera$CameraInfo;

    iget v6, v6, Landroid/hardware/Camera$CameraInfo;->facing:I

    const/4 v11, 0x1

    if-ne v6, v11, :cond_3

    const/4 v6, 0x1

    :goto_1
    invoke-direct/range {v0 .. v6}, Lcom/wmspanel/libstream/SnapshotWriter;-><init>(Ljava/nio/ByteBuffer;Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;Ljava/io/File;IIZ)V

    .line 190
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 191
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 193
    iput-boolean v7, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTakeSnapshot:Z

    .line 194
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mSnapshotCallback:Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;

    .line 195
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mSnapshot:Ljava/io/File;

    .line 199
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mSurfaceSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v0, v0, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mSurfaceSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v1, v1, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    invoke-static {v7, v7, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 202
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraInfo:Landroid/hardware/Camera$CameraInfo;

    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_4

    .line 203
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraInfo:Landroid/hardware/Camera$CameraInfo;

    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mDisplayOrientation:I

    add-int/2addr v0, v1

    rem-int/lit16 v0, v0, 0x168

    .line 204
    rsub-int v0, v0, 0x168

    rem-int/lit16 v0, v0, 0x168

    .line 211
    :goto_2
    if-nez v0, :cond_5

    .line 213
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    invoke-virtual {v1, v2, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrame(I[F)V

    .line 222
    :goto_3
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/gles/WindowSurface;->swapBuffers()Z

    .line 225
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-ge v1, v2, :cond_2

    .line 226
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->getVideoFrame()V

    .line 230
    :cond_2
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/gles/WindowSurface;->makeCurrent()V

    .line 231
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mPreviewSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v1, v1, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mPreviewSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v2, v2, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    invoke-static {v7, v7, v1, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 234
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraInfo:Landroid/hardware/Camera$CameraInfo;

    iget v1, v1, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-nez v1, :cond_10

    .line 235
    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mVideoOrientation:I

    sget v2, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->LANDSCAPE:I

    if-ne v1, v2, :cond_a

    .line 236
    if-ge v0, v8, :cond_7

    .line 238
    :goto_4
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_letterbox:F

    cmpl-float v0, v0, v12

    if-eqz v0, :cond_8

    .line 239
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_letterbox:F

    invoke-virtual {v0, v1, v2, v7, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameY(I[FIF)V

    .line 288
    :goto_5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-le v0, v1, :cond_1a

    .line 289
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/wmspanel/libstream/gles/WindowSurface;->setPresentationTime(J)V

    .line 293
    :goto_6
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->swapBuffers()Z

    goto/16 :goto_0

    :cond_3
    move v6, v7

    .line 182
    goto/16 :goto_1

    .line 206
    :cond_4
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraInfo:Landroid/hardware/Camera$CameraInfo;

    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mDisplayOrientation:I

    sub-int/2addr v0, v1

    add-int/lit16 v0, v0, 0x168

    rem-int/lit16 v0, v0, 0x168

    goto :goto_2

    .line 216
    :cond_5
    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mVideoOrientation:I

    sget v2, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->HORIZON:I

    if-ne v1, v2, :cond_6

    .line 217
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    rsub-int v4, v0, 0x168

    iget-object v5, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v5, v5, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_horizon:F

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameX(I[FIF)V

    goto :goto_3

    .line 219
    :cond_6
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    rsub-int v4, v0, 0x168

    invoke-virtual {v1, v2, v3, v4, v12}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameY(I[FIF)V

    goto/16 :goto_3

    :cond_7
    move v7, v8

    .line 236
    goto :goto_4

    .line 240
    :cond_8
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_pillarbox:F

    cmpl-float v0, v0, v12

    if-eqz v0, :cond_9

    .line 241
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_pillarbox:F

    invoke-virtual {v0, v1, v2, v7, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameX(I[FIF)V

    goto :goto_5

    .line 243
    :cond_9
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    invoke-virtual {v0, v1, v2, v7, v12}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameY(I[FIF)V

    goto :goto_5

    .line 245
    :cond_a
    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mVideoOrientation:I

    sget v2, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->PORTRAIT:I

    if-ne v1, v2, :cond_d

    .line 246
    if-ge v0, v8, :cond_b

    move v0, v9

    .line 247
    :goto_7
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v1, v1, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_letterbox:F

    cmpl-float v1, v1, v12

    if-eqz v1, :cond_c

    .line 248
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v4, v4, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_letterbox:F

    invoke-virtual {v1, v2, v3, v0, v4}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameX(I[FIF)V

    goto/16 :goto_5

    :cond_b
    move v0, v10

    .line 246
    goto :goto_7

    .line 250
    :cond_c
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v4, v4, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale:F

    invoke-virtual {v1, v2, v3, v0, v4}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameY(I[FIF)V

    goto/16 :goto_5

    .line 252
    :cond_d
    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mVideoOrientation:I

    sget v2, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->HORIZON:I

    if-ne v1, v2, :cond_f

    .line 253
    if-ge v0, v8, :cond_e

    .line 254
    :goto_8
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_horizon:F

    invoke-virtual {v0, v1, v2, v9, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameX(I[FIF)V

    goto/16 :goto_5

    :cond_e
    move v9, v10

    .line 253
    goto :goto_8

    .line 257
    :cond_f
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Unknown video orientation"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 262
    :cond_10
    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mVideoOrientation:I

    sget v2, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->LANDSCAPE:I

    if-ne v1, v2, :cond_14

    .line 263
    if-ge v0, v8, :cond_11

    .line 265
    :goto_9
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_letterbox:F

    cmpl-float v0, v0, v12

    if-eqz v0, :cond_12

    .line 266
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_letterbox:F

    invoke-virtual {v0, v1, v2, v7, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameMirrorY(I[FIF)V

    goto/16 :goto_5

    :cond_11
    move v7, v8

    .line 263
    goto :goto_9

    .line 267
    :cond_12
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_pillarbox:F

    cmpl-float v0, v0, v12

    if-eqz v0, :cond_13

    .line 268
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_pillarbox:F

    invoke-virtual {v0, v1, v2, v7, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameMirrorX(I[FIF)V

    goto/16 :goto_5

    .line 270
    :cond_13
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    invoke-virtual {v0, v1, v2, v7, v12}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameMirrorY(I[FIF)V

    goto/16 :goto_5

    .line 272
    :cond_14
    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mVideoOrientation:I

    sget v2, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->PORTRAIT:I

    if-ne v1, v2, :cond_17

    .line 273
    if-ge v0, v8, :cond_15

    .line 274
    :goto_a
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_letterbox:F

    cmpl-float v0, v0, v12

    if-eqz v0, :cond_16

    .line 275
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_letterbox:F

    invoke-virtual {v0, v1, v2, v9, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameMirrorX(I[FIF)V

    goto/16 :goto_5

    :cond_15
    move v9, v10

    .line 273
    goto :goto_a

    .line 277
    :cond_16
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale:F

    invoke-virtual {v0, v1, v2, v9, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameMirrorY(I[FIF)V

    goto/16 :goto_5

    .line 279
    :cond_17
    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mVideoOrientation:I

    sget v2, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->HORIZON:I

    if-ne v1, v2, :cond_19

    .line 280
    if-ge v0, v8, :cond_18

    .line 281
    :goto_b
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTmpMatrix:[F

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget v3, v3, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_horizon:F

    invoke-virtual {v0, v1, v2, v9, v3}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrameMirrorX(I[FIF)V

    goto/16 :goto_5

    :cond_18
    move v9, v10

    .line 280
    goto :goto_b

    .line 284
    :cond_19
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Unknown video orientation"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 291
    :cond_1a
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->getTimestamp()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/wmspanel/libstream/gles/WindowSurface;->setPresentationTime(J)V

    goto/16 :goto_6
.end method

.method private logThread(Ljava/lang/String;)V
    .locals 0
    .param p1, "info"    # Ljava/lang/String;

    .prologue
    .line 505
    return-void
.end method

.method private openCamera(Ljava/lang/String;)V
    .locals 5
    .param p1, "cameraId"    # Ljava/lang/String;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraId:Ljava/lang/String;

    .line 63
    const-string/jumbo v0, "VideoListenerGLES16"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "open camera#"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraId:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCamera:Landroid/hardware/Camera;

    .line 66
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCamera:Landroid/hardware/Camera;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mErrorCallback:Landroid/hardware/Camera$ErrorCallback;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setErrorCallback(Landroid/hardware/Camera$ErrorCallback;)V

    .line 68
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraInfo:Landroid/hardware/Camera$CameraInfo;

    .line 69
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraId:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraInfo:Landroid/hardware/Camera$CameraInfo;

    invoke-static {v0, v1}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 71
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    .line 74
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFlipCameraInfo:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    .line 75
    iget-object v3, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->cameraId:Ljava/lang/String;

    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 76
    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    .line 81
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    if-nez v0, :cond_2

    .line 82
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Camera info not found"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_2
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v0, v0, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget-object v2, v2, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v2, v2, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    invoke-virtual {v1, v0, v2}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 87
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->fpsRange:Lcom/wmspanel/libstream/Streamer$FpsRange;

    if-eqz v0, :cond_3

    .line 88
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->fpsRange:Lcom/wmspanel/libstream/Streamer$FpsRange;

    iget v0, v0, Lcom/wmspanel/libstream/Streamer$FpsRange;->fpsMin:F

    float-to-int v0, v0

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mInfo:Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    iget-object v2, v2, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->fpsRange:Lcom/wmspanel/libstream/Streamer$FpsRange;

    iget v2, v2, Lcom/wmspanel/libstream/Streamer$FpsRange;->fpsMax:F

    float-to-int v2, v2

    invoke-virtual {v1, v0, v2}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 91
    :cond_3
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget-object v0, v0, Lcom/wmspanel/libstream/FocusMode;->focusMode16:Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setFocusMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 92
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget-object v0, v0, Lcom/wmspanel/libstream/FocusMode;->awbMode16:Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setAwbMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 93
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget-object v0, v0, Lcom/wmspanel/libstream/FocusMode;->antibandingMode16:Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setAntibandingMode(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)V

    .line 94
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    iget v0, v0, Lcom/wmspanel/libstream/FocusMode;->exposureCompensation:I

    invoke-virtual {p0, v1, v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setExposureCompensation(Landroid/hardware/Camera$Parameters;I)V

    .line 96
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 97
    return-void
.end method

.method private openEgl()V
    .locals 4

    .prologue
    .line 374
    const-string/jumbo v0, "openEgl"

    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->logThread(Ljava/lang/String;)V

    .line 375
    new-instance v0, Lcom/wmspanel/libstream/gles/WindowSurface;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mSurface:Landroid/view/Surface;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/wmspanel/libstream/gles/WindowSurface;-><init>(Lcom/wmspanel/libstream/gles/EglCore;Landroid/view/Surface;Z)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    .line 376
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->makeCurrent()V

    .line 378
    new-instance v0, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    new-instance v1, Lcom/wmspanel/libstream/gles/Texture2dProgram;

    sget-object v2, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;->TEXTURE_EXT:Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    invoke-direct {v1, v2}, Lcom/wmspanel/libstream/gles/Texture2dProgram;-><init>(Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;)V

    invoke-direct {v0, v1}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;-><init>(Lcom/wmspanel/libstream/gles/Texture2dProgram;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    .line 380
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->createTextureObject()I

    move-result v0

    iput v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    .line 381
    new-instance v0, Landroid/graphics/SurfaceTexture;

    iget v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mTextureId:I

    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    .line 382
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 383
    return-void
.end method

.method private releaseEgl()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 386
    const-string/jumbo v0, "releaseEgl"

    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->logThread(Ljava/lang/String;)V

    .line 387
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_0

    .line 388
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 389
    iput-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    .line 391
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    if-eqz v0, :cond_1

    .line 392
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->release()V

    .line 393
    iput-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mDisplaySurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    .line 395
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    if-eqz v0, :cond_2

    .line 396
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->release()V

    .line 397
    iput-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    .line 399
    :cond_2
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    if-eqz v0, :cond_3

    .line 400
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->release(Z)V

    .line 401
    iput-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFullFrameBlit:Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;

    .line 403
    :cond_3
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    if-eqz v0, :cond_4

    .line 404
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/EglCore;->release()V

    .line 405
    iput-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    .line 407
    :cond_4
    return-void
.end method

.method private stopCameraThread()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 327
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraThread:Landroid/os/HandlerThread;

    if-nez v0, :cond_0

    .line 340
    :goto_0
    return-void

    .line 330
    :cond_0
    const-string/jumbo v0, "release camera1 thread"

    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->logThread(Ljava/lang/String;)V

    .line 331
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 333
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 337
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraThread:Landroid/os/HandlerThread;

    .line 338
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraHandler:Landroid/os/Handler;

    goto :goto_0

    .line 334
    :catch_0
    move-exception v0

    .line 335
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 337
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraThread:Landroid/os/HandlerThread;

    .line 338
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraHandler:Landroid/os/Handler;

    goto :goto_0

    .line 337
    :catchall_0
    move-exception v0

    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraThread:Landroid/os/HandlerThread;

    .line 338
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraHandler:Landroid/os/Handler;

    throw v0
.end method


# virtual methods
.method public flip()V
    .locals 4

    .prologue
    .line 344
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraHandler:Landroid/os/Handler;

    if-nez v0, :cond_1

    .line 345
    :cond_0
    const-string/jumbo v0, "VideoListenerGLES16"

    const-string/jumbo v1, "Video capture not started"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 371
    :goto_0
    return-void

    .line 349
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mFlipCameraInfo:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;

    .line 350
    iget-object v2, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->cameraId:Ljava/lang/String;

    iget-object v3, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 351
    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->cameraId:Ljava/lang/String;

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraId:Ljava/lang/String;

    .line 356
    :cond_3
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraHandler:Landroid/os/Handler;

    new-instance v1, Lcom/wmspanel/libstream/VideoListenerGLES16$3;

    invoke-direct {v1, p0}, Lcom/wmspanel/libstream/VideoListenerGLES16$3;-><init>(Lcom/wmspanel/libstream/VideoListenerGLES16;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method focus()V
    .locals 2

    .prologue
    .line 466
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraHandler:Landroid/os/Handler;

    if-nez v0, :cond_1

    .line 467
    :cond_0
    const-string/jumbo v0, "VideoListenerGLES16"

    const-string/jumbo v1, "Video capture not started"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 496
    :goto_0
    return-void

    .line 471
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraHandler:Landroid/os/Handler;

    new-instance v1, Lcom/wmspanel/libstream/VideoListenerGLES16$6;

    invoke-direct {v1, p0}, Lcom/wmspanel/libstream/VideoListenerGLES16$6;-><init>(Lcom/wmspanel/libstream/VideoListenerGLES16;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 2
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 155
    :try_start_0
    invoke-direct {p0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->drawFrame()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    :goto_0
    return-void

    .line 156
    :catch_0
    move-exception v0

    .line 157
    const-string/jumbo v1, "VideoListenerGLES16"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 159
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->release()V

    goto :goto_0
.end method

.method public openEncoder()V
    .locals 4

    .prologue
    .line 48
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getFormat()Landroid/media/MediaFormat;

    move-result-object v0

    const-string/jumbo v1, "color-format"

    const v2, 0x7f000789

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 49
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 50
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mMediaCodecCallback:Landroid/media/MediaCodec$Callback;

    invoke-virtual {v0, v1}, Landroid/media/MediaCodec;->setCallback(Landroid/media/MediaCodec$Callback;)V

    .line 52
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->configure()V

    .line 53
    new-instance v0, Lcom/wmspanel/libstream/gles/WindowSurface;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v2}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object v2

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/wmspanel/libstream/gles/WindowSurface;-><init>(Lcom/wmspanel/libstream/gles/EglCore;Landroid/view/Surface;Z)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEncoderSurface:Lcom/wmspanel/libstream/gles/WindowSurface;

    .line 54
    new-instance v0, Lcom/wmspanel/libstream/Streamer$Size;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 55
    invoke-virtual {v1}, Lcom/wmspanel/libstream/VideoEncoder;->getFormat()Landroid/media/MediaFormat;

    move-result-object v1

    const-string/jumbo v2, "width"

    invoke-virtual {v1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 56
    invoke-virtual {v2}, Lcom/wmspanel/libstream/VideoEncoder;->getFormat()Landroid/media/MediaFormat;

    move-result-object v2

    const-string/jumbo v3, "height"

    invoke-virtual {v2, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/Streamer$Size;-><init>(II)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mPreviewSize:Lcom/wmspanel/libstream/Streamer$Size;

    .line 57
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->start()V

    .line 58
    return-void
.end method

.method public release()V
    .locals 2

    .prologue
    .line 299
    :try_start_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->resetMediaFormat()V

    .line 300
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->releaseEncoder()V

    .line 301
    invoke-direct {p0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->releaseEgl()V

    .line 303
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraHandler:Landroid/os/Handler;

    if-nez v0, :cond_1

    .line 304
    :cond_0
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 324
    :goto_0
    return-void

    .line 306
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraHandler:Landroid/os/Handler;

    new-instance v1, Lcom/wmspanel/libstream/VideoListenerGLES16$2;

    invoke-direct {v1, p0}, Lcom/wmspanel/libstream/VideoListenerGLES16$2;-><init>(Lcom/wmspanel/libstream/VideoListenerGLES16;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 320
    :catch_0
    move-exception v0

    .line 321
    const-string/jumbo v1, "VideoListenerGLES16"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    goto :goto_0
.end method

.method setCameraParameters(Landroid/hardware/Camera$Parameters;)V
    .locals 2
    .param p1, "param"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 411
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraHandler:Landroid/os/Handler;

    if-nez v0, :cond_1

    .line 412
    :cond_0
    const-string/jumbo v0, "VideoListenerGLES16"

    const-string/jumbo v1, "Video capture not started"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 426
    :goto_0
    return-void

    .line 416
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraHandler:Landroid/os/Handler;

    new-instance v1, Lcom/wmspanel/libstream/VideoListenerGLES16$4;

    invoke-direct {v1, p0, p1}, Lcom/wmspanel/libstream/VideoListenerGLES16$4;-><init>(Lcom/wmspanel/libstream/VideoListenerGLES16;Landroid/hardware/Camera$Parameters;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public start(Landroid/content/Context;Ljava/lang/String;Landroid/view/SurfaceHolder;Landroid/graphics/SurfaceTexture;Lcom/wmspanel/libstream/VideoEncoder;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cameraId"    # Ljava/lang/String;
    .param p3, "previewSurfaceHolder"    # Landroid/view/SurfaceHolder;
    .param p4, "texture"    # Landroid/graphics/SurfaceTexture;
    .param p5, "encoder"    # Lcom/wmspanel/libstream/VideoEncoder;

    .prologue
    const/16 v3, 0x15

    .line 106
    if-eqz p5, :cond_0

    invoke-virtual {p5}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    if-nez v0, :cond_1

    .line 107
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 111
    :cond_1
    :try_start_0
    new-instance v0, Landroid/os/HandlerThread;

    const-string/jumbo v1, "com.wmspanel.streamer.camera"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraThread:Landroid/os/HandlerThread;

    .line 112
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 113
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraHandler:Landroid/os/Handler;

    .line 115
    iput-object p5, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 117
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v0, v3, :cond_2

    .line 118
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 121
    :cond_2
    new-instance v0, Lcom/wmspanel/libstream/gles/EglCore;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/gles/EglCore;-><init>(Landroid/opengl/EGLContext;I)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    .line 122
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->openEncoder()V

    .line 123
    invoke-direct {p0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->openEgl()V

    .line 125
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraHandler:Landroid/os/Handler;

    new-instance v1, Lcom/wmspanel/libstream/VideoListenerGLES16$1;

    invoke-direct {v1, p0, p2}, Lcom/wmspanel/libstream/VideoListenerGLES16$1;-><init>(Lcom/wmspanel/libstream/VideoListenerGLES16;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    :goto_0
    return-void

    .line 140
    :catch_0
    move-exception v0

    .line 141
    const-string/jumbo v1, "VideoListenerGLES16"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v3, :cond_3

    instance-of v0, v0, Landroid/media/MediaCodec$CodecException;

    if-eqz v0, :cond_3

    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->ENCODER_FAIL:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .line 145
    :goto_1
    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 146
    invoke-virtual {p0}, Lcom/wmspanel/libstream/VideoListenerGLES16;->release()V

    goto :goto_0

    .line 142
    :cond_3
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    goto :goto_1
.end method

.method toggleTorch()V
    .locals 2

    .prologue
    .line 430
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraHandler:Landroid/os/Handler;

    if-nez v0, :cond_1

    .line 431
    :cond_0
    const-string/jumbo v0, "VideoListenerGLES16"

    const-string/jumbo v1, "Video capture not started"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 462
    :goto_0
    return-void

    .line 435
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES16;->mCameraHandler:Landroid/os/Handler;

    new-instance v1, Lcom/wmspanel/libstream/VideoListenerGLES16$5;

    invoke-direct {v1, p0}, Lcom/wmspanel/libstream/VideoListenerGLES16$5;-><init>(Lcom/wmspanel/libstream/VideoListenerGLES16;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
