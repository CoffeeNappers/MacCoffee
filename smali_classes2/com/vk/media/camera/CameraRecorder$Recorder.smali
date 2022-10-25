.class Lcom/vk/media/camera/CameraRecorder$Recorder;
.super Lcom/vk/media/camera/CameraRecorder;
.source "CameraRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/camera/CameraRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Recorder"
.end annotation


# instance fields
.field private mRecorder:Landroid/media/MediaRecorder;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 217
    invoke-direct {p0, p1}, Lcom/vk/media/camera/CameraRecorder;-><init>(Landroid/content/Context;)V

    .line 218
    return-void
.end method


# virtual methods
.method public getSurface()Landroid/view/Surface;
    .locals 2

    .prologue
    .line 327
    iget-object v0, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    sget-object v1, Lcom/vk/media/camera/CameraRecorder$State;->PREPARED:Lcom/vk/media/camera/CameraRecorder$State;

    if-ne v0, v1, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 328
    iget-object v0, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mSurface:Landroid/view/Surface;

    .line 329
    iget-boolean v0, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecording:Z

    if-eqz v0, :cond_0

    .line 330
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraRecorder$Recorder;->start()Z

    .line 333
    :cond_0
    iget-object v0, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mSurface:Landroid/view/Surface;

    return-object v0
.end method

.method public prepare()Z
    .locals 5

    .prologue
    const/4 v1, 0x1

    .line 241
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    sget-object v3, Lcom/vk/media/camera/CameraRecorder$State;->IDLE:Lcom/vk/media/camera/CameraRecorder$State;

    if-eq v2, v3, :cond_0

    .line 287
    :goto_0
    return v1

    .line 245
    :cond_0
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraRecorder$Recorder;->release()V

    .line 247
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    if-nez v2, :cond_1

    .line 248
    new-instance v2, Landroid/media/MediaRecorder;

    invoke-direct {v2}, Landroid/media/MediaRecorder;-><init>()V

    iput-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    .line 252
    :cond_1
    :try_start_0
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/media/MediaRecorder;->setAudioSource(I)V

    .line 253
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/media/MediaRecorder;->setVideoSource(I)V

    .line 254
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/media/MediaRecorder;->setOutputFormat(I)V

    .line 256
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mProfile:Landroid/media/CamcorderProfile;

    if-eqz v2, :cond_3

    .line 257
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    iget-object v3, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mProfile:Landroid/media/CamcorderProfile;

    iget v3, v3, Landroid/media/CamcorderProfile;->videoBitRate:I

    invoke-virtual {v2, v3}, Landroid/media/MediaRecorder;->setVideoEncodingBitRate(I)V

    .line 258
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    iget-object v3, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mProfile:Landroid/media/CamcorderProfile;

    iget v3, v3, Landroid/media/CamcorderProfile;->videoFrameRate:I

    invoke-virtual {v2, v3}, Landroid/media/MediaRecorder;->setVideoFrameRate(I)V

    .line 259
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    iget-object v3, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mProfile:Landroid/media/CamcorderProfile;

    iget v3, v3, Landroid/media/CamcorderProfile;->audioBitRate:I

    invoke-virtual {v2, v3}, Landroid/media/MediaRecorder;->setAudioEncodingBitRate(I)V

    .line 260
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    iget-object v3, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mProfile:Landroid/media/CamcorderProfile;

    iget v3, v3, Landroid/media/CamcorderProfile;->audioSampleRate:I

    invoke-virtual {v2, v3}, Landroid/media/MediaRecorder;->setAudioSamplingRate(I)V

    .line 261
    iget v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mOrientationHint:I

    const/16 v3, 0x5a

    if-eq v2, v3, :cond_2

    iget v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mOrientationHint:I

    const/16 v3, 0x10e

    if-ne v2, v3, :cond_5

    .line 262
    :cond_2
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    iget-object v3, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mProfile:Landroid/media/CamcorderProfile;

    iget v3, v3, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    iget-object v4, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mProfile:Landroid/media/CamcorderProfile;

    iget v4, v4, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-virtual {v2, v3, v4}, Landroid/media/MediaRecorder;->setVideoSize(II)V

    .line 268
    :cond_3
    :goto_1
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/media/MediaRecorder;->setVideoEncoder(I)V

    .line 269
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/media/MediaRecorder;->setAudioEncoder(I)V

    .line 270
    iget v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mMaxRecordingLengthMs:I

    if-lez v2, :cond_4

    .line 271
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    iget v3, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mMaxRecordingLengthMs:I

    invoke-virtual {v2, v3}, Landroid/media/MediaRecorder;->setMaxDuration(I)V

    .line 274
    :cond_4
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v2, p0}, Landroid/media/MediaRecorder;->setOnInfoListener(Landroid/media/MediaRecorder$OnInfoListener;)V

    .line 275
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v2, p0}, Landroid/media/MediaRecorder;->setOnErrorListener(Landroid/media/MediaRecorder$OnErrorListener;)V

    .line 276
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    iget-object v3, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/lang/String;)V

    .line 278
    sget-object v2, Lcom/vk/media/camera/CameraRecorder$Recorder;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "preparing"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v2}, Landroid/media/MediaRecorder;->prepare()V

    .line 280
    sget-object v2, Lcom/vk/media/camera/CameraRecorder$State;->PREPARED:Lcom/vk/media/camera/CameraRecorder$State;

    iput-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    .line 281
    sget-object v2, Lcom/vk/media/camera/CameraRecorder$Recorder;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "prepared"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 283
    :catch_0
    move-exception v0

    .line 284
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/vk/media/camera/CameraRecorder$Recorder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "prepare failed: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    :goto_2
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraRecorder$Recorder;->release()V

    .line 287
    const/4 v1, 0x0

    goto/16 :goto_0

    .line 264
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_5
    :try_start_1
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    iget-object v3, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mProfile:Landroid/media/CamcorderProfile;

    iget v3, v3, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    iget-object v4, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mProfile:Landroid/media/CamcorderProfile;

    iget v4, v4, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-virtual {v2, v3, v4}, Landroid/media/MediaRecorder;->setVideoSize(II)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 284
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_6
    const-string/jumbo v1, ""

    goto :goto_2
.end method

.method public release()V
    .locals 1

    .prologue
    .line 311
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraRecorder$Recorder;->stop()V

    .line 313
    monitor-enter p0

    .line 314
    :try_start_0
    iget-object v0, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    if-eqz v0, :cond_0

    .line 315
    iget-object v0, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->release()V

    .line 316
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    .line 317
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mSurface:Landroid/view/Surface;

    .line 318
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecording:Z

    .line 319
    sget-object v0, Lcom/vk/media/camera/CameraRecorder$State;->IDLE:Lcom/vk/media/camera/CameraRecorder$State;

    iput-object v0, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    .line 321
    :cond_0
    invoke-super {p0}, Lcom/vk/media/camera/CameraRecorder;->release()V

    .line 322
    monitor-exit p0

    .line 323
    return-void

    .line 322
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public start()Z
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 222
    iget-object v1, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mFile:Ljava/io/File;

    if-eqz v1, :cond_0

    .line 223
    iput-boolean v4, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecording:Z

    .line 225
    iget-object v1, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mSurface:Landroid/view/Surface;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    sget-object v2, Lcom/vk/media/camera/CameraRecorder$State;->PREPARED:Lcom/vk/media/camera/CameraRecorder$State;

    if-ne v1, v2, :cond_0

    .line 227
    :try_start_0
    iget-object v1, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->start()V

    .line 228
    sget-object v1, Lcom/vk/media/camera/CameraRecorder$State;->RECORDING:Lcom/vk/media/camera/CameraRecorder$State;

    iput-object v1, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    .line 229
    sget-object v1, Lcom/vk/media/camera/CameraRecorder$Recorder;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "start recording"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 236
    :cond_0
    :goto_0
    return v4

    .line 230
    :catch_0
    move-exception v0

    .line 231
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/vk/media/camera/CameraRecorder$Recorder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "start failed: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const-string/jumbo v1, ""

    goto :goto_1
.end method

.method public stop()V
    .locals 4

    .prologue
    .line 292
    monitor-enter p0

    .line 293
    :try_start_0
    invoke-super {p0}, Lcom/vk/media/camera/CameraRecorder;->stop()V

    .line 294
    iget-object v1, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecording:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    sget-object v2, Lcom/vk/media/camera/CameraRecorder$State;->RECORDING:Lcom/vk/media/camera/CameraRecorder$State;

    if-ne v1, v2, :cond_0

    .line 295
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecording:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 297
    :try_start_1
    sget-object v1, Lcom/vk/media/camera/CameraRecorder$Recorder;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "stop"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    iget-object v1, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->stop()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 303
    :goto_0
    :try_start_2
    iget-object v1, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->reset()V

    .line 304
    sget-object v1, Lcom/vk/media/camera/CameraRecorder$State;->IDLE:Lcom/vk/media/camera/CameraRecorder$State;

    iput-object v1, p0, Lcom/vk/media/camera/CameraRecorder$Recorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    .line 306
    :cond_0
    monitor-exit p0

    .line 307
    return-void

    .line 299
    :catch_0
    move-exception v0

    .line 300
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/vk/media/camera/CameraRecorder$Recorder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "stop failed: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 306
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 300
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :try_start_3
    const-string/jumbo v1, ""
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method
