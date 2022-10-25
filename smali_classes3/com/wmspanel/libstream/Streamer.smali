.class public abstract Lcom/wmspanel/libstream/Streamer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wmspanel/libstream/Streamer$a;,
        Lcom/wmspanel/libstream/Streamer$FpsRange;,
        Lcom/wmspanel/libstream/Streamer$Size;,
        Lcom/wmspanel/libstream/Streamer$Listener;,
        Lcom/wmspanel/libstream/Streamer$CAMERA_API;,
        Lcom/wmspanel/libstream/Streamer$RECORD_STATE;,
        Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;,
        Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;,
        Lcom/wmspanel/libstream/Streamer$STATUS;,
        Lcom/wmspanel/libstream/Streamer$AUTH;,
        Lcom/wmspanel/libstream/Streamer$MODE;
    }
.end annotation


# static fields
.field public static final MAX_BUFFER_ITEMS:I = 0xc8

.field private static final TAG:Ljava/lang/String; = "Streamer"

.field public static final VERSION_NAME:Ljava/lang/String; = "1.0.28"


# instance fields
.field private dy:Lcom/wmspanel/libstream/d;

.field private dz:Lcom/wmspanel/libstream/StreamRecorder;

.field mAudioConfig:Lcom/wmspanel/libstream/AudioConfig;

.field protected mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

.field protected mAudioListener:Lcom/wmspanel/libstream/AudioListener;

.field protected mCameraApi:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

.field protected mContext:Landroid/content/Context;

.field protected mFocusMode:Lcom/wmspanel/libstream/FocusMode;

.field protected mListener:Lcom/wmspanel/libstream/Streamer$Listener;

.field protected mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

.field mVideoConfig:Lcom/wmspanel/libstream/VideoConfig;

.field protected mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

.field protected mVideoListener:Lcom/wmspanel/libstream/VideoListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    new-instance v0, Lcom/wmspanel/libstream/FocusMode;

    invoke-direct {v0}, Lcom/wmspanel/libstream/FocusMode;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    .line 155
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAMERA_API;->CAMERA:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    iput-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mCameraApi:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    return-void
.end method

.method public static rotationToDegrees(I)I
    .locals 1
    .param p0, "rotation"    # I

    .prologue
    const/4 v0, 0x0

    .line 496
    .line 497
    packed-switch p0, :pswitch_data_0

    .line 511
    :goto_0
    :pswitch_0
    return v0

    .line 502
    :pswitch_1
    const/16 v0, 0x5a

    .line 503
    goto :goto_0

    .line 505
    :pswitch_2
    const/16 v0, 0xb4

    .line 506
    goto :goto_0

    .line 508
    :pswitch_3
    const/16 v0, 0x10e

    goto :goto_0

    .line 497
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public changeAudioConfig(Lcom/wmspanel/libstream/AudioConfig;)V
    .locals 2
    .param p1, "audioConfig"    # Lcom/wmspanel/libstream/AudioConfig;

    .prologue
    .line 570
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mAudioListener:Lcom/wmspanel/libstream/AudioListener;

    if-eqz v0, :cond_0

    .line 571
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Stop audio capture to change config"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 573
    :cond_0
    if-nez p1, :cond_1

    .line 574
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Function parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 576
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/d;->y()Z

    move-result v0

    if-nez v0, :cond_2

    .line 577
    const-string/jumbo v0, "Streamer"

    const-string/jumbo v1, "Release connection to change config"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    :cond_2
    invoke-virtual {p0, p1}, Lcom/wmspanel/libstream/Streamer;->setAudioConfig(Lcom/wmspanel/libstream/AudioConfig;)V

    .line 580
    return-void
.end method

.method public changeBitRate(I)V
    .locals 2
    .param p1, "bitRate"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 535
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_0

    .line 536
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 539
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    if-eqz v0, :cond_1

    .line 540
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/VideoEncoder;->changeBitRate(I)V

    .line 542
    :cond_1
    return-void
.end method

.method public changeVideoConfig(Lcom/wmspanel/libstream/VideoConfig;)V
    .locals 2
    .param p1, "videoConfig"    # Lcom/wmspanel/libstream/VideoConfig;

    .prologue
    .line 588
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_0

    .line 589
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Stop video capture to change config"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 591
    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p1, Lcom/wmspanel/libstream/VideoConfig;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    if-nez v0, :cond_2

    .line 592
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Function parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 594
    :cond_2
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/d;->y()Z

    move-result v0

    if-nez v0, :cond_3

    .line 595
    const-string/jumbo v0, "Streamer"

    const-string/jumbo v1, "Release connection to change config"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 597
    :cond_3
    invoke-virtual {p0, p1}, Lcom/wmspanel/libstream/Streamer;->setVideoConfig(Lcom/wmspanel/libstream/VideoConfig;)V

    .line 598
    return-void
.end method

.method public createConnection(Lcom/wmspanel/libstream/ConnectionConfig;)I
    .locals 2
    .param p1, "config"    # Lcom/wmspanel/libstream/ConnectionConfig;

    .prologue
    .line 259
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    if-nez v0, :cond_0

    .line 260
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 263
    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p1, Lcom/wmspanel/libstream/ConnectionConfig;->uri:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/wmspanel/libstream/ConnectionConfig;->mode:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/wmspanel/libstream/ConnectionConfig;->auth:Lcom/wmspanel/libstream/Streamer$AUTH;

    if-nez v0, :cond_2

    .line 264
    :cond_1
    const-string/jumbo v0, "Streamer"

    const-string/jumbo v1, "Function parameter is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    const/4 v0, -0x1

    .line 271
    :goto_0
    return v0

    .line 269
    :cond_2
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    iget-object v1, p0, Lcom/wmspanel/libstream/Streamer;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-virtual {v0, p1, v1}, Lcom/wmspanel/libstream/d;->a(Lcom/wmspanel/libstream/ConnectionConfig;Lcom/wmspanel/libstream/Streamer$Listener;)I

    move-result v0

    goto :goto_0
.end method

.method protected createVideoEncoder()Lcom/wmspanel/libstream/VideoEncoder;
    .locals 2

    .prologue
    .line 601
    new-instance v0, Lcom/wmspanel/libstream/VideoEncoderBuilder;

    invoke-direct {v0}, Lcom/wmspanel/libstream/VideoEncoderBuilder;-><init>()V

    .line 602
    iget-object v1, p0, Lcom/wmspanel/libstream/Streamer;->mVideoConfig:Lcom/wmspanel/libstream/VideoConfig;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoEncoderBuilder;->setConfig(Lcom/wmspanel/libstream/VideoConfig;)V

    .line 603
    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoderBuilder;->build()Lcom/wmspanel/libstream/VideoEncoder;

    move-result-object v0

    return-object v0
.end method

.method public flip()V
    .locals 2

    .prologue
    .line 413
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_0

    .line 414
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 417
    :cond_0
    const-string/jumbo v0, "Streamer"

    const-string/jumbo v1, "flip Camera"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 418
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-nez v0, :cond_1

    .line 419
    const-string/jumbo v0, "Streamer"

    const-string/jumbo v1, "Video capture not started"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 423
    :goto_0
    return-void

    .line 422
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener;->flip()V

    goto :goto_0
.end method

.method public focus(Lcom/wmspanel/libstream/FocusMode;)V
    .locals 2
    .param p1, "mode"    # Lcom/wmspanel/libstream/FocusMode;

    .prologue
    .line 549
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_0

    .line 550
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 553
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-nez v0, :cond_2

    .line 554
    const-string/jumbo v0, "Streamer"

    const-string/jumbo v1, "Video capture not started"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 562
    :cond_1
    :goto_0
    return-void

    .line 558
    :cond_2
    if-eqz p1, :cond_1

    .line 559
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/VideoListener;->setFocusMode(Lcom/wmspanel/libstream/FocusMode;)V

    .line 560
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener;->focus()V

    goto :goto_0
.end method

.method public getAudioPacketsLost(I)J
    .locals 2
    .param p1, "connectionId"    # I

    .prologue
    .line 296
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    if-nez v0, :cond_0

    .line 297
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 299
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/d;->getAudioPacketsLost(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getAudioPacketsSent(I)J
    .locals 2
    .param p1, "connectionId"    # I

    .prologue
    .line 289
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    if-nez v0, :cond_0

    .line 290
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 292
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/d;->getAudioPacketsSent(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getBytesRecv(I)J
    .locals 2
    .param p1, "connectionId"    # I

    .prologue
    .line 282
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    if-nez v0, :cond_0

    .line 283
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 285
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/d;->getBytesRecv(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getBytesSent(I)J
    .locals 2
    .param p1, "connectionId"    # I

    .prologue
    .line 275
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    if-nez v0, :cond_0

    .line 276
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 278
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/d;->getBytesSent(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getCameraApi()Lcom/wmspanel/libstream/Streamer$CAMERA_API;
    .locals 2

    .prologue
    .line 362
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_0

    .line 363
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 365
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mCameraApi:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    return-object v0
.end method

.method public getCameraParameters()Landroid/hardware/Camera$Parameters;
    .locals 2

    .prologue
    .line 387
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_0

    .line 388
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 391
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mCameraApi:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAMERA_API;->CAMERA:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    if-eq v0, v1, :cond_1

    .line 392
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Camera api required"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 394
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-nez v0, :cond_2

    .line 395
    const-string/jumbo v0, "Streamer"

    const-string/jumbo v1, "Video capture not started"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    const/4 v0, 0x0

    .line 398
    :goto_0
    return-object v0

    :cond_2
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener;->getCameraParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    goto :goto_0
.end method

.method public getFps()D
    .locals 2

    .prologue
    .line 355
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_0

    .line 356
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 358
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/StreamBuffer;->getFps()D

    move-result-wide v0

    return-wide v0
.end method

.method public getProfileLevelId()[B
    .locals 3

    .prologue
    .line 343
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_0

    .line 344
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 346
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/StreamBuffer;->ac()Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    move-result-object v0

    .line 347
    if-eqz v0, :cond_1

    iget-object v1, v0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_buf:[B

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_buf:[B

    array-length v1, v1

    const/4 v2, 0x3

    if-le v1, v2, :cond_1

    .line 349
    iget-object v0, v0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_buf:[B

    const/4 v1, 0x1

    const/4 v2, 0x4

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    .line 351
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getUserAgent()V
    .locals 2

    .prologue
    .line 334
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    if-nez v0, :cond_0

    .line 335
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 337
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/d;->z()Ljava/lang/String;

    .line 338
    return-void
.end method

.method public getVideoPacketsLost(I)J
    .locals 2
    .param p1, "connectionId"    # I

    .prologue
    .line 310
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    if-nez v0, :cond_0

    .line 311
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 313
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/d;->getVideoPacketsLost(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getVideoPacketsSent(I)J
    .locals 2
    .param p1, "connectionId"    # I

    .prologue
    .line 303
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    if-nez v0, :cond_0

    .line 304
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 306
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/d;->getVideoPacketsSent(I)J

    move-result-wide v0

    return-wide v0
.end method

.method protected init(I)V
    .locals 2
    .param p1, "items"    # I

    .prologue
    .line 151
    new-instance v0, Lcom/wmspanel/libstream/StreamBuffer;

    div-int/lit8 v1, p1, 0x2

    invoke-direct {v0, p1, v1}, Lcom/wmspanel/libstream/StreamBuffer;-><init>(II)V

    iput-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    .line 152
    new-instance v0, Lcom/wmspanel/libstream/d;

    iget-object v1, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    invoke-direct {v0, v1}, Lcom/wmspanel/libstream/d;-><init>(Lcom/wmspanel/libstream/StreamBuffer;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    .line 153
    return-void
.end method

.method protected init(Lcom/wmspanel/libstream/Streamer$CAMERA_API;I)V
    .locals 2
    .param p1, "api"    # Lcom/wmspanel/libstream/Streamer$CAMERA_API;
    .param p2, "items"    # I

    .prologue
    .line 158
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_0

    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAMERA_API;->CAMERA2:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    if-ne p1, v0, :cond_0

    .line 159
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Need at least Android 5.0 to use Camera2"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 161
    :cond_0
    iput-object p1, p0, Lcom/wmspanel/libstream/Streamer;->mCameraApi:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    .line 162
    invoke-virtual {p0, p2}, Lcom/wmspanel/libstream/Streamer;->init(I)V

    .line 163
    return-void
.end method

.method public release()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 168
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_0

    .line 169
    const-string/jumbo v0, "Streamer"

    const-string/jumbo v1, "Streamer is already released, skipping release()"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    :goto_0
    return-void

    .line 173
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    if-eqz v0, :cond_1

    .line 174
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/d;->release()V

    .line 175
    iput-object v1, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    .line 178
    :cond_1
    invoke-virtual {p0}, Lcom/wmspanel/libstream/Streamer;->stopRecord()V

    .line 179
    invoke-virtual {p0}, Lcom/wmspanel/libstream/Streamer;->stopVideoCapture()V

    .line 180
    invoke-virtual {p0}, Lcom/wmspanel/libstream/Streamer;->stopAudioCapture()V

    .line 182
    iput-object v1, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    goto :goto_0
.end method

.method public releaseConnection(I)V
    .locals 2
    .param p1, "connectionId"    # I

    .prologue
    .line 317
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    if-nez v0, :cond_0

    .line 318
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 320
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/d;->releaseConnection(I)V

    .line 321
    return-void
.end method

.method setAudioConfig(Lcom/wmspanel/libstream/AudioConfig;)V
    .locals 0
    .param p1, "config"    # Lcom/wmspanel/libstream/AudioConfig;

    .prologue
    .line 566
    iput-object p1, p0, Lcom/wmspanel/libstream/Streamer;->mAudioConfig:Lcom/wmspanel/libstream/AudioConfig;

    .line 567
    return-void
.end method

.method protected setAudioEncoder(Lcom/wmspanel/libstream/AudioEncoder;)V
    .locals 0
    .param p1, "audioEncoder"    # Lcom/wmspanel/libstream/AudioEncoder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 530
    iput-object p1, p0, Lcom/wmspanel/libstream/Streamer;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    .line 531
    return-void
.end method

.method public setCameraParameters(Landroid/hardware/Camera$Parameters;)V
    .locals 2
    .param p1, "param"    # Landroid/hardware/Camera$Parameters;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 369
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_0

    .line 370
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 373
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mCameraApi:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAMERA_API;->CAMERA:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    if-eq v0, v1, :cond_1

    .line 374
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Camera api required"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 376
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-nez v0, :cond_3

    .line 377
    const-string/jumbo v0, "Streamer"

    const-string/jumbo v1, "Video capture not started"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 384
    :cond_2
    :goto_0
    return-void

    .line 381
    :cond_3
    if-eqz p1, :cond_2

    .line 382
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/VideoListener;->setCameraParameters(Landroid/hardware/Camera$Parameters;)V

    goto :goto_0
.end method

.method protected setContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 517
    iput-object p1, p0, Lcom/wmspanel/libstream/Streamer;->mContext:Landroid/content/Context;

    .line 518
    return-void
.end method

.method protected setFocusMode(Lcom/wmspanel/libstream/FocusMode;)V
    .locals 0
    .param p1, "mode"    # Lcom/wmspanel/libstream/FocusMode;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 545
    iput-object p1, p0, Lcom/wmspanel/libstream/Streamer;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    .line 546
    return-void
.end method

.method protected setListener(Lcom/wmspanel/libstream/Streamer$Listener;)V
    .locals 1
    .param p1, "listener"    # Lcom/wmspanel/libstream/Streamer$Listener;

    .prologue
    .line 521
    iput-object p1, p0, Lcom/wmspanel/libstream/Streamer;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    .line 522
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/d;->setListener(Lcom/wmspanel/libstream/Streamer$Listener;)V

    .line 523
    return-void
.end method

.method public setUserAgent(Ljava/lang/String;)V
    .locals 2
    .param p1, "userAgent"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 324
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    if-nez v0, :cond_0

    .line 325
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 328
    :cond_0
    if-eqz p1, :cond_1

    .line 329
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dy:Lcom/wmspanel/libstream/d;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/d;->setUserAgent(Ljava/lang/String;)V

    .line 331
    :cond_1
    return-void
.end method

.method setVideoConfig(Lcom/wmspanel/libstream/VideoConfig;)V
    .locals 0
    .param p1, "config"    # Lcom/wmspanel/libstream/VideoConfig;

    .prologue
    .line 584
    iput-object p1, p0, Lcom/wmspanel/libstream/Streamer;->mVideoConfig:Lcom/wmspanel/libstream/VideoConfig;

    .line 585
    return-void
.end method

.method protected setVideoEncoder(Lcom/wmspanel/libstream/VideoEncoder;)V
    .locals 0
    .param p1, "videoEncoder"    # Lcom/wmspanel/libstream/VideoEncoder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 526
    iput-object p1, p0, Lcom/wmspanel/libstream/Streamer;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 527
    return-void
.end method

.method public startAudioCapture()V
    .locals 5

    .prologue
    .line 188
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_0

    .line 189
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 191
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    if-nez v0, :cond_1

    .line 192
    new-instance v0, Lcom/wmspanel/libstream/AudioEncoderBuilder;

    invoke-direct {v0}, Lcom/wmspanel/libstream/AudioEncoderBuilder;-><init>()V

    .line 193
    iget-object v1, p0, Lcom/wmspanel/libstream/Streamer;->mAudioConfig:Lcom/wmspanel/libstream/AudioConfig;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/AudioEncoderBuilder;->setConfig(Lcom/wmspanel/libstream/AudioConfig;)V

    .line 194
    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoderBuilder;->build()Lcom/wmspanel/libstream/AudioEncoder;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    .line 196
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    if-nez v0, :cond_1

    .line 197
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "AudioEncoder is null, check if streamer was built with VIDEO_ONLY mode"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 201
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mAudioListener:Lcom/wmspanel/libstream/AudioListener;

    if-eqz v0, :cond_2

    .line 208
    :goto_0
    return-void

    .line 204
    :cond_2
    const-string/jumbo v0, "Streamer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "startAudioCapture, source is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/Streamer;->mAudioConfig:Lcom/wmspanel/libstream/AudioConfig;

    iget v2, v2, Lcom/wmspanel/libstream/AudioConfig;->audioSource:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    new-instance v0, Lcom/wmspanel/libstream/AudioListener;

    iget-object v1, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    iget-object v2, p0, Lcom/wmspanel/libstream/Streamer;->mAudioConfig:Lcom/wmspanel/libstream/AudioConfig;

    iget v2, v2, Lcom/wmspanel/libstream/AudioConfig;->audioSource:I

    iget-object v3, p0, Lcom/wmspanel/libstream/Streamer;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    iget-object v4, p0, Lcom/wmspanel/libstream/Streamer;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/wmspanel/libstream/AudioListener;-><init>(Lcom/wmspanel/libstream/StreamBuffer;ILcom/wmspanel/libstream/AudioEncoder;Lcom/wmspanel/libstream/Streamer$Listener;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mAudioListener:Lcom/wmspanel/libstream/AudioListener;

    .line 207
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mAudioListener:Lcom/wmspanel/libstream/AudioListener;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioListener;->start()V

    goto :goto_0
.end method

.method public startRecord(Ljava/io/File;)V
    .locals 4
    .param p1, "file"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    .line 429
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-ge v0, v1, :cond_1

    .line 465
    :cond_0
    :goto_0
    return-void

    .line 435
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_2

    .line 436
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 439
    :cond_2
    if-nez p1, :cond_3

    .line 440
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Function parameter is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 442
    :cond_3
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mAudioListener:Lcom/wmspanel/libstream/AudioListener;

    if-nez v0, :cond_4

    .line 443
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "start audio or video capture first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 445
    :cond_4
    const-string/jumbo v0, "Streamer"

    const-string/jumbo v1, "startRecord"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 446
    sget-object v0, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    .line 447
    iget-object v1, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-nez v1, :cond_6

    .line 448
    sget-object v0, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    .line 452
    :cond_5
    :goto_1
    new-instance v1, Lcom/wmspanel/libstream/StreamRecorder;

    iget-object v2, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    iget-object v3, p0, Lcom/wmspanel/libstream/Streamer;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-direct {v1, v2, v3, p1, v0}, Lcom/wmspanel/libstream/StreamRecorder;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;Ljava/io/File;Lcom/wmspanel/libstream/Streamer$MODE;)V

    iput-object v1, p0, Lcom/wmspanel/libstream/Streamer;->dz:Lcom/wmspanel/libstream/StreamRecorder;

    .line 453
    iget-object v1, p0, Lcom/wmspanel/libstream/Streamer;->dz:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/StreamRecorder;->start()Z

    move-result v1

    if-nez v1, :cond_7

    .line 454
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dz:Lcom/wmspanel/libstream/StreamRecorder;

    goto :goto_0

    .line 449
    :cond_6
    iget-object v1, p0, Lcom/wmspanel/libstream/Streamer;->mAudioListener:Lcom/wmspanel/libstream/AudioListener;

    if-nez v1, :cond_5

    .line 450
    sget-object v0, Lcom/wmspanel/libstream/Streamer$MODE;->VIDEO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    goto :goto_1

    .line 457
    :cond_7
    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq v0, v1, :cond_8

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->VIDEO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v0, v1, :cond_9

    .line 458
    :cond_8
    const-string/jumbo v1, "Streamer"

    const-string/jumbo v2, "start mp4 video record"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 459
    iget-object v1, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    iget-object v2, p0, Lcom/wmspanel/libstream/Streamer;->dz:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-virtual {v1, v2}, Lcom/wmspanel/libstream/VideoListener;->startRecord(Lcom/wmspanel/libstream/StreamRecorder;)V

    .line 461
    :cond_9
    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq v0, v1, :cond_a

    sget-object v1, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v0, v1, :cond_0

    .line 462
    :cond_a
    const-string/jumbo v0, "Streamer"

    const-string/jumbo v1, "start mp4 audio record"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 463
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mAudioListener:Lcom/wmspanel/libstream/AudioListener;

    iget-object v1, p0, Lcom/wmspanel/libstream/Streamer;->dz:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/AudioListener;->startRecord(Lcom/wmspanel/libstream/StreamRecorder;)V

    goto/16 :goto_0
.end method

.method public abstract startVideoCapture()V
.end method

.method public stopAudioCapture()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 211
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_0

    .line 212
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 214
    :cond_0
    const-string/jumbo v0, "Streamer"

    const-string/jumbo v1, "stopAudioCapture"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mAudioListener:Lcom/wmspanel/libstream/AudioListener;

    if-eqz v0, :cond_1

    .line 218
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mAudioListener:Lcom/wmspanel/libstream/AudioListener;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioListener;->interrupt()V

    .line 219
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mAudioListener:Lcom/wmspanel/libstream/AudioListener;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioListener;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 223
    iput-object v2, p0, Lcom/wmspanel/libstream/Streamer;->mAudioListener:Lcom/wmspanel/libstream/AudioListener;

    .line 224
    iput-object v2, p0, Lcom/wmspanel/libstream/Streamer;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    .line 228
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    if-eqz v0, :cond_2

    .line 229
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->release()V

    .line 230
    iput-object v2, p0, Lcom/wmspanel/libstream/Streamer;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    .line 232
    :cond_2
    return-void

    .line 220
    :catch_0
    move-exception v0

    .line 221
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 223
    iput-object v2, p0, Lcom/wmspanel/libstream/Streamer;->mAudioListener:Lcom/wmspanel/libstream/AudioListener;

    .line 224
    iput-object v2, p0, Lcom/wmspanel/libstream/Streamer;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    goto :goto_0

    .line 223
    :catchall_0
    move-exception v0

    iput-object v2, p0, Lcom/wmspanel/libstream/Streamer;->mAudioListener:Lcom/wmspanel/libstream/AudioListener;

    .line 224
    iput-object v2, p0, Lcom/wmspanel/libstream/Streamer;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    throw v0
.end method

.method public stopRecord()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    .line 469
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-ge v0, v1, :cond_1

    .line 490
    :cond_0
    :goto_0
    return-void

    .line 475
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_2

    .line 476
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 479
    :cond_2
    const-string/jumbo v0, "Streamer"

    const-string/jumbo v1, "stopRecord"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 480
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_3

    .line 481
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener;->stopRecord()V

    .line 483
    :cond_3
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mAudioListener:Lcom/wmspanel/libstream/AudioListener;

    if-eqz v0, :cond_4

    .line 484
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mAudioListener:Lcom/wmspanel/libstream/AudioListener;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioListener;->stopRecord()V

    .line 486
    :cond_4
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dz:Lcom/wmspanel/libstream/StreamRecorder;

    if-eqz v0, :cond_0

    .line 487
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dz:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/StreamRecorder;->stop()V

    .line 488
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/Streamer;->dz:Lcom/wmspanel/libstream/StreamRecorder;

    goto :goto_0
.end method

.method public stopVideoCapture()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 239
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_0

    .line 240
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 242
    :cond_0
    const-string/jumbo v0, "Streamer"

    const-string/jumbo v1, "stopVideoCapture"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-eqz v0, :cond_1

    .line 245
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener;->release()V

    .line 246
    iput-object v2, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    .line 247
    iput-object v2, p0, Lcom/wmspanel/libstream/Streamer;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 250
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    if-eqz v0, :cond_2

    .line 251
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoder;->release()V

    .line 252
    iput-object v2, p0, Lcom/wmspanel/libstream/Streamer;->mVideoEncoder:Lcom/wmspanel/libstream/VideoEncoder;

    .line 254
    :cond_2
    return-void
.end method

.method public toggleTorch()V
    .locals 2

    .prologue
    .line 402
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-nez v0, :cond_0

    .line 403
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "After release(), the streamer is no longer available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 405
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    if-nez v0, :cond_1

    .line 406
    const-string/jumbo v0, "Streamer"

    const-string/jumbo v1, "Video capture not started"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 410
    :goto_0
    return-void

    .line 409
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/Streamer;->mVideoListener:Lcom/wmspanel/libstream/VideoListener;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener;->toggleTorch()V

    goto :goto_0
.end method
