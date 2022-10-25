.class abstract Lcom/wmspanel/libstream/VideoListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;
    }
.end annotation


# static fields
.field protected static final NAL_SEPARATOR:[B

.field private static final TAG:Ljava/lang/String; = "VideoListener"


# instance fields
.field protected mAbsolutePtsUs:J

.field protected mCameraId:Ljava/lang/String;

.field protected mDisplayOrientation:I

.field protected mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

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

.field protected mFocusMode:Lcom/wmspanel/libstream/FocusMode;

.field protected mFrameId:J

.field protected mGapPtsUs:J

.field protected mLastPtsUs:J

.field protected mListener:Lcom/wmspanel/libstream/Streamer$Listener;

.field protected mMediaCodecCallback:Landroid/media/MediaCodec$Callback;

.field protected mPreviewSize:Lcom/wmspanel/libstream/Streamer$Size;

.field protected mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

.field protected mSnapshot:Ljava/io/File;

.field protected mSnapshotCallback:Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;

.field protected mState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

.field protected mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

.field protected mSurface:Landroid/view/Surface;

.field protected mSurfaceSize:Lcom/wmspanel/libstream/Streamer$Size;

.field protected mTakeSnapshot:Z

.field protected mVideoFormat:Landroid/media/MediaFormat;

.field protected mVideoOrientation:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/wmspanel/libstream/VideoListener;->NAL_SEPARATOR:[B

    return-void

    nop

    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
    .end array-data
.end method

.method constructor <init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V
    .locals 2
    .param p1, "streamBuffer"    # Lcom/wmspanel/libstream/StreamBuffer;
    .param p2, "listener"    # Lcom/wmspanel/libstream/Streamer$Listener;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lcom/wmspanel/libstream/VideoListener;->mFrameId:J

    .line 41
    new-instance v0, Lcom/wmspanel/libstream/FocusMode;

    invoke-direct {v0}, Lcom/wmspanel/libstream/FocusMode;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    .line 56
    if-nez p1, :cond_0

    .line 57
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 59
    :cond_0
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    .line 60
    iput-object p2, p0, Lcom/wmspanel/libstream/VideoListener;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    .line 61
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .line 63
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_1

    .line 65
    new-instance v0, Lcom/wmspanel/libstream/VideoListener$1;

    invoke-direct {v0, p0}, Lcom/wmspanel/libstream/VideoListener$1;-><init>(Lcom/wmspanel/libstream/VideoListener;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mMediaCodecCallback:Landroid/media/MediaCodec$Callback;

    .line 157
    :cond_1
    return-void
.end method


# virtual methods
.method protected addVideoTrack(Landroid/media/MediaFormat;)V
    .locals 1
    .param p1, "format"    # Landroid/media/MediaFormat;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    .line 161
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

    if-eqz v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/StreamRecorder;->addVideoTrack(Landroid/media/MediaFormat;)V

    .line 167
    :goto_0
    return-void

    .line 164
    :cond_0
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener;->mVideoFormat:Landroid/media/MediaFormat;

    goto :goto_0
.end method

.method createCaptureRequest()Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 282
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Camera2 api required"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method flip()V
    .locals 2

    .prologue
    .line 269
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "This class does not support camera operations"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method focus()V
    .locals 2

    .prologue
    .line 309
    const-string/jumbo v0, "VideoListener"

    const-string/jumbo v1, "Focus is not supported"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 310
    return-void
.end method

.method protected getCameraId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 334
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mCameraId:Ljava/lang/String;

    return-object v0
.end method

.method getCameraParameters()Landroid/hardware/Camera$Parameters;
    .locals 2

    .prologue
    .line 273
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Camera api required"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected processOutputFormatChanged(Landroid/media/MediaFormat;)V
    .locals 5
    .param p1, "format"    # Landroid/media/MediaFormat;

    .prologue
    const/4 v4, 0x0

    .line 236
    const-string/jumbo v0, "VideoListener"

    const-string/jumbo v1, "processOutputFormatChanged"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    new-instance v0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    invoke-direct {v0}, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;-><init>()V

    .line 240
    const-string/jumbo v1, "csd-0"

    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->getByteBuffer(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 241
    sget-object v2, Lcom/wmspanel/libstream/VideoListener;->NAL_SEPARATOR:[B

    invoke-static {v1, v2}, Lcom/wmspanel/libstream/o;->b(Ljava/nio/ByteBuffer;[B)Z

    .line 242
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, v0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_len:I

    .line 243
    iget v2, v0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_len:I

    new-array v2, v2, [B

    iput-object v2, v0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_buf:[B

    .line 244
    iget-object v2, v0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_buf:[B

    iget v3, v0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_len:I

    invoke-virtual {v1, v2, v4, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 246
    const-string/jumbo v1, "csd-1"

    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->getByteBuffer(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 247
    sget-object v2, Lcom/wmspanel/libstream/VideoListener;->NAL_SEPARATOR:[B

    invoke-static {v1, v2}, Lcom/wmspanel/libstream/o;->b(Ljava/nio/ByteBuffer;[B)Z

    .line 248
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, v0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_len:I

    .line 249
    iget v2, v0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_len:I

    new-array v2, v2, [B

    iput-object v2, v0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_buf:[B

    .line 250
    iget-object v2, v0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_buf:[B

    iget v3, v0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_len:I

    invoke-virtual {v1, v2, v4, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 252
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    invoke-virtual {v1, v0}, Lcom/wmspanel/libstream/StreamBuffer;->a(Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;)V

    .line 253
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STARTED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/VideoListener;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 254
    return-void
.end method

.method abstract release()V
.end method

.method protected releaseEncoder()V
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->release()V

    .line 196
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 198
    :cond_0
    return-void
.end method

.method protected resetMediaFormat()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 185
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-eqz v0, :cond_0

    .line 186
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/StreamBuffer;->a(Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;)V

    .line 188
    :cond_0
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListener;->mVideoFormat:Landroid/media/MediaFormat;

    .line 189
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoListener;->mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

    .line 190
    return-void
.end method

.method setCameraParameters(Landroid/hardware/Camera$Parameters;)V
    .locals 2
    .param p1, "param"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 277
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Camera api required"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected setDisplayOrientation(I)V
    .locals 0
    .param p1, "rotation"    # I

    .prologue
    .line 322
    iput p1, p0, Lcom/wmspanel/libstream/VideoListener;->mDisplayOrientation:I

    .line 323
    return-void
.end method

.method protected setFlipCameraInfo(Ljava/util/List;)V
    .locals 0
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
    .line 330
    .local p1, "info":Ljava/util/List;, "Ljava/util/List<Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;>;"
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener;->mFlipCameraInfo:Ljava/util/List;

    .line 331
    return-void
.end method

.method protected setFocusMode(Lcom/wmspanel/libstream/FocusMode;)V
    .locals 0
    .param p1, "mode"    # Lcom/wmspanel/libstream/FocusMode;

    .prologue
    .line 303
    if-eqz p1, :cond_0

    .line 304
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    .line 306
    :cond_0
    return-void
.end method

.method protected setGapPts(J)V
    .locals 1
    .param p1, "gap"    # J

    .prologue
    .line 362
    iput-wide p1, p0, Lcom/wmspanel/libstream/VideoListener;->mGapPtsUs:J

    .line 363
    return-void
.end method

.method setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2
    .param p1, "builder"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 287
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Camera2 api required"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected setSurface(Landroid/view/Surface;)V
    .locals 0
    .param p1, "surface"    # Landroid/view/Surface;

    .prologue
    .line 314
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener;->mSurface:Landroid/view/Surface;

    .line 315
    return-void
.end method

.method protected setSurfaceSize(Lcom/wmspanel/libstream/Streamer$Size;)V
    .locals 0
    .param p1, "size"    # Lcom/wmspanel/libstream/Streamer$Size;

    .prologue
    .line 318
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener;->mSurfaceSize:Lcom/wmspanel/libstream/Streamer$Size;

    .line 319
    return-void
.end method

.method protected setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V
    .locals 2
    .param p1, "videoCaptureState"    # Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .prologue
    .line 213
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    if-ne p1, v0, :cond_1

    .line 233
    :cond_0
    :goto_0
    return-void

    .line 216
    :cond_1
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener;->mState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .line 218
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    if-eqz v0, :cond_0

    .line 222
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-interface {v0}, Lcom/wmspanel/libstream/Streamer$Listener;->getHandler()Landroid/os/Handler;

    move-result-object v0

    .line 223
    if-eqz v0, :cond_0

    .line 227
    new-instance v1, Lcom/wmspanel/libstream/VideoListener$2;

    invoke-direct {v1, p0, p1}, Lcom/wmspanel/libstream/VideoListener$2;-><init>(Lcom/wmspanel/libstream/VideoListener;Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method protected setVideoOrientation(I)V
    .locals 0
    .param p1, "orientation"    # I

    .prologue
    .line 326
    iput p1, p0, Lcom/wmspanel/libstream/VideoListener;->mVideoOrientation:I

    .line 327
    return-void
.end method

.method abstract start(Landroid/content/Context;Ljava/lang/String;Landroid/view/SurfaceHolder;Landroid/graphics/SurfaceTexture;Lcom/wmspanel/libstream/VideoEncoder;)V
.end method

.method protected startRecord(Lcom/wmspanel/libstream/StreamRecorder;)V
    .locals 2
    .param p1, "recorder"    # Lcom/wmspanel/libstream/StreamRecorder;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    .line 171
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

    if-nez v0, :cond_0

    .line 172
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener;->mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

    .line 173
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mVideoFormat:Landroid/media/MediaFormat;

    if-eqz v0, :cond_0

    .line 174
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener;->mVideoFormat:Landroid/media/MediaFormat;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/StreamRecorder;->addVideoTrack(Landroid/media/MediaFormat;)V

    .line 177
    :cond_0
    return-void
.end method

.method protected stopRecord()V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    .line 181
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/VideoListener;->mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

    .line 182
    return-void
.end method

.method protected takeSnapshot(Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;)V
    .locals 1
    .param p1, "callback"    # Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    .line 208
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/wmspanel/libstream/VideoListener;->mTakeSnapshot:Z

    .line 209
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener;->mSnapshotCallback:Lcom/wmspanel/libstream/SnapshotWriter$SnapshotCallback;

    .line 210
    return-void
.end method

.method protected takeSnapshot(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    .line 202
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/wmspanel/libstream/VideoListener;->mTakeSnapshot:Z

    .line 203
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener;->mSnapshot:Ljava/io/File;

    .line 204
    return-void
.end method

.method toggleTorch()V
    .locals 2

    .prologue
    .line 265
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "This class does not support camera operations"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected translatePts(J)V
    .locals 9
    .param p1, "presentationTimeUs"    # J

    .prologue
    const-wide/16 v2, 0x0

    .line 344
    iget-wide v0, p0, Lcom/wmspanel/libstream/VideoListener;->mLastPtsUs:J

    sub-long v0, p1, v0

    .line 347
    iget-wide v4, p0, Lcom/wmspanel/libstream/VideoListener;->mAbsolutePtsUs:J

    cmp-long v4, v4, v2

    if-eqz v4, :cond_0

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    const-wide/32 v6, 0x3d090

    cmp-long v4, v4, v6

    if-lez v4, :cond_1

    .line 349
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    const-wide/16 v4, 0x3e8

    div-long/2addr v0, v4

    iput-wide v0, p0, Lcom/wmspanel/libstream/VideoListener;->mAbsolutePtsUs:J

    move-wide v0, v2

    .line 353
    :cond_1
    iget-wide v2, p0, Lcom/wmspanel/libstream/VideoListener;->mAbsolutePtsUs:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/wmspanel/libstream/VideoListener;->mAbsolutePtsUs:J

    .line 354
    iput-wide p1, p0, Lcom/wmspanel/libstream/VideoListener;->mLastPtsUs:J

    .line 359
    return-void
.end method
