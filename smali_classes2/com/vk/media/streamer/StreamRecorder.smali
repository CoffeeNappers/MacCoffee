.class public Lcom/vk/media/streamer/StreamRecorder;
.super Lcom/vk/media/camera/CameraRecorder;
.source "StreamRecorder.java"

# interfaces
.implements Lcom/wmspanel/libstream/Streamer$Listener;


# instance fields
.field private mAudioCaptureState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

.field private mHandler:Landroid/os/Handler;

.field private mMode:Lcom/wmspanel/libstream/Streamer$MODE;

.field private mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

.field private mVideoCaptureState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/vk/media/camera/CameraRecorder;-><init>(Landroid/content/Context;)V

    .line 22
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    iput-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mVideoCaptureState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .line 23
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    iput-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mAudioCaptureState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .line 25
    sget-object v0, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    iput-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mMode:Lcom/wmspanel/libstream/Streamer$MODE;

    .line 31
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mHandler:Landroid/os/Handler;

    .line 32
    return-void
.end method

.method static synthetic access$000(Lcom/vk/media/streamer/StreamRecorder;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/streamer/StreamRecorder;

    .prologue
    .line 21
    iget v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mMaxRecordingLengthMs:I

    return v0
.end method

.method static synthetic access$100(Lcom/vk/media/streamer/StreamRecorder;)Landroid/media/MediaRecorder$OnInfoListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/streamer/StreamRecorder;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mOnInfoListener:Landroid/media/MediaRecorder$OnInfoListener;

    return-object v0
.end method

.method private startRecord()V
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 222
    const/4 v0, 0x0

    .line 223
    .local v0, "ready":Z
    iget-object v3, p0, Lcom/vk/media/streamer/StreamRecorder;->mMode:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v4, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v3, v4, :cond_2

    .line 224
    iget-object v3, p0, Lcom/vk/media/streamer/StreamRecorder;->mVideoCaptureState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    sget-object v4, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STARTED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Lcom/vk/media/streamer/StreamRecorder;->mAudioCaptureState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    sget-object v4, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STARTED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    if-ne v3, v4, :cond_1

    move v0, v1

    .line 232
    :goto_0
    if-eqz v0, :cond_0

    .line 233
    sget-object v1, Lcom/vk/media/camera/CameraRecorder$State;->PREPARED:Lcom/vk/media/camera/CameraRecorder$State;

    iput-object v1, p0, Lcom/vk/media/streamer/StreamRecorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    .line 235
    iget-object v1, p0, Lcom/vk/media/streamer/StreamRecorder;->mFile:Ljava/io/File;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vk/media/streamer/StreamRecorder;->mRecording:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/media/streamer/StreamRecorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    sget-object v2, Lcom/vk/media/camera/CameraRecorder$State;->RECORDING:Lcom/vk/media/camera/CameraRecorder$State;

    if-eq v1, v2, :cond_0

    .line 236
    sget-object v1, Lcom/vk/media/streamer/StreamRecorder;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "startRecord"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    iget-object v1, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    iget-object v2, p0, Lcom/vk/media/streamer/StreamRecorder;->mFile:Ljava/io/File;

    invoke-virtual {v1, v2}, Lcom/wmspanel/libstream/StreamerSurface;->startRecord(Ljava/io/File;)V

    .line 238
    sget-object v1, Lcom/vk/media/camera/CameraRecorder$State;->RECORDING:Lcom/vk/media/camera/CameraRecorder$State;

    iput-object v1, p0, Lcom/vk/media/streamer/StreamRecorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    .line 241
    :cond_0
    return-void

    :cond_1
    move v0, v2

    .line 224
    goto :goto_0

    .line 226
    :cond_2
    iget-object v3, p0, Lcom/vk/media/streamer/StreamRecorder;->mMode:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v4, Lcom/wmspanel/libstream/Streamer$MODE;->VIDEO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v3, v4, :cond_4

    .line 227
    iget-object v3, p0, Lcom/vk/media/streamer/StreamRecorder;->mVideoCaptureState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    sget-object v4, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STARTED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    if-ne v3, v4, :cond_3

    move v0, v1

    :goto_1
    goto :goto_0

    :cond_3
    move v0, v2

    goto :goto_1

    .line 229
    :cond_4
    invoke-virtual {p0}, Lcom/vk/media/streamer/StreamRecorder;->stop()V

    goto :goto_0
.end method


# virtual methods
.method public drainEncoder()V
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/StreamerSurface;->drainEncoder()V

    .line 83
    :cond_0
    return-void
.end method

.method public getHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getSurface()Landroid/view/Surface;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/StreamerSurface;->getEncoderSurface()Landroid/view/Surface;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onAudioCaptureStateChanged(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V
    .locals 4
    .param p1, "state"    # Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .prologue
    .line 189
    sget-object v1, Lcom/vk/media/streamer/StreamRecorder;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onAudioCaptureStateChanged: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    iput-object p1, p0, Lcom/vk/media/streamer/StreamRecorder;->mAudioCaptureState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .line 191
    sget-object v1, Lcom/vk/media/streamer/StreamRecorder$2;->$SwitchMap$com$wmspanel$libstream$Streamer$CAPTURE_STATE:[I

    invoke-virtual {p1}, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 205
    invoke-virtual {p0}, Lcom/vk/media/streamer/StreamRecorder;->stop()V

    .line 208
    :goto_0
    :pswitch_0
    return-void

    .line 193
    :pswitch_1
    invoke-direct {p0}, Lcom/vk/media/streamer/StreamRecorder;->startRecord()V

    goto :goto_0

    .line 198
    :pswitch_2
    invoke-virtual {p0}, Lcom/vk/media/streamer/StreamRecorder;->stop()V

    .line 199
    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    if-ne p1, v1, :cond_0

    const/16 v0, 0x3e8

    .line 201
    .local v0, "error":I
    :goto_1
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vk/media/streamer/StreamRecorder;->notifyError(IZ)V

    goto :goto_0

    .line 199
    .end local v0    # "error":I
    :cond_0
    const/16 v0, 0x3e9

    goto :goto_1

    .line 191
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public onConnectionStateChanged(ILcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V
    .locals 3
    .param p1, "i"    # I
    .param p2, "state"    # Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;
    .param p3, "status"    # Lcom/wmspanel/libstream/Streamer$STATUS;

    .prologue
    .line 149
    sget-object v0, Lcom/vk/media/streamer/StreamRecorder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onConnectionStateChanged: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " status: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    sget-object v0, Lcom/vk/media/streamer/StreamRecorder$2;->$SwitchMap$com$wmspanel$libstream$Streamer$CONNECTION_STATE:[I

    invoke-virtual {p2}, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 158
    invoke-virtual {p0}, Lcom/vk/media/streamer/StreamRecorder;->stop()V

    .line 161
    :pswitch_0
    return-void

    .line 150
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onRecordStateChanged(Lcom/wmspanel/libstream/Streamer$RECORD_STATE;)V
    .locals 6
    .param p1, "state"    # Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    .prologue
    const-wide/16 v4, 0x0

    .line 212
    sget-object v0, Lcom/vk/media/streamer/StreamRecorder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onRecordStateChanged "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    sget-object v0, Lcom/wmspanel/libstream/Streamer$RECORD_STATE;->STARTED:Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    if-ne p1, v0, :cond_0

    .line 214
    iget-wide v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mStartPresentationTime:J

    cmp-long v0, v0, v4

    if-gez v0, :cond_0

    iget-wide v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mLastPresentationTime:J

    cmp-long v0, v0, v4

    if-lez v0, :cond_0

    .line 215
    iget-wide v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mLastPresentationTime:J

    iput-wide v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mStartPresentationTime:J

    .line 216
    sget-object v0, Lcom/vk/media/streamer/StreamRecorder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "recording start on: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/vk/media/streamer/StreamRecorder;->mStartPresentationTime:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    :cond_0
    return-void
.end method

.method public onVideoCaptureStateChanged(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V
    .locals 4
    .param p1, "state"    # Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .prologue
    .line 165
    sget-object v1, Lcom/vk/media/streamer/StreamRecorder;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onVideoCaptureStateChanged: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    iput-object p1, p0, Lcom/vk/media/streamer/StreamRecorder;->mVideoCaptureState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .line 167
    sget-object v1, Lcom/vk/media/streamer/StreamRecorder$2;->$SwitchMap$com$wmspanel$libstream$Streamer$CAPTURE_STATE:[I

    invoke-virtual {p1}, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 182
    invoke-virtual {p0}, Lcom/vk/media/streamer/StreamRecorder;->stop()V

    .line 185
    :goto_0
    :pswitch_0
    return-void

    .line 169
    :pswitch_1
    invoke-direct {p0}, Lcom/vk/media/streamer/StreamRecorder;->startRecord()V

    goto :goto_0

    .line 175
    :pswitch_2
    invoke-virtual {p0}, Lcom/vk/media/streamer/StreamRecorder;->stop()V

    .line 176
    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    if-ne p1, v1, :cond_0

    const/16 v0, 0x3e8

    .line 178
    .local v0, "error":I
    :goto_1
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/vk/media/streamer/StreamRecorder;->notifyError(IZ)V

    goto :goto_0

    .line 176
    .end local v0    # "error":I
    :cond_0
    const/16 v0, 0x3e9

    goto :goto_1

    .line 167
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public prepare()Z
    .locals 8

    .prologue
    const/4 v4, 0x1

    .line 36
    iget-object v5, p0, Lcom/vk/media/streamer/StreamRecorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    sget-object v6, Lcom/vk/media/camera/CameraRecorder$State;->IDLE:Lcom/vk/media/camera/CameraRecorder$State;

    if-eq v5, v6, :cond_0

    .line 75
    :goto_0
    return v4

    .line 40
    :cond_0
    invoke-virtual {p0}, Lcom/vk/media/streamer/StreamRecorder;->release()V

    .line 42
    iget-object v5, p0, Lcom/vk/media/streamer/StreamRecorder;->mProfile:Landroid/media/CamcorderProfile;

    if-nez v5, :cond_1

    .line 43
    sget-object v4, Lcom/vk/media/streamer/StreamRecorder;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "can\'t create recorder on empty profile"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    const/4 v4, 0x0

    goto :goto_0

    .line 47
    :cond_1
    sget-object v5, Lcom/vk/media/streamer/StreamRecorder;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "prepare on "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/vk/media/streamer/StreamRecorder;->mProfile:Landroid/media/CamcorderProfile;

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    new-instance v0, Lcom/wmspanel/libstream/AudioConfig;

    invoke-direct {v0}, Lcom/wmspanel/libstream/AudioConfig;-><init>()V

    .line 50
    .local v0, "audioConfig":Lcom/wmspanel/libstream/AudioConfig;
    const/4 v5, 0x5

    iput v5, v0, Lcom/wmspanel/libstream/AudioConfig;->audioSource:I

    .line 51
    iget-object v5, p0, Lcom/vk/media/streamer/StreamRecorder;->mProfile:Landroid/media/CamcorderProfile;

    iget v5, v5, Landroid/media/CamcorderProfile;->audioChannels:I

    iput v5, v0, Lcom/wmspanel/libstream/AudioConfig;->channelCount:I

    .line 52
    iget-object v5, p0, Lcom/vk/media/streamer/StreamRecorder;->mProfile:Landroid/media/CamcorderProfile;

    iget v5, v5, Landroid/media/CamcorderProfile;->audioSampleRate:I

    iput v5, v0, Lcom/wmspanel/libstream/AudioConfig;->sampleRate:I

    .line 54
    new-instance v3, Lcom/wmspanel/libstream/VideoConfig;

    invoke-direct {v3}, Lcom/wmspanel/libstream/VideoConfig;-><init>()V

    .line 55
    .local v3, "videoConfig":Lcom/wmspanel/libstream/VideoConfig;
    iput v4, v3, Lcom/wmspanel/libstream/VideoConfig;->keyFrameInterval:I

    .line 56
    iget-object v5, p0, Lcom/vk/media/streamer/StreamRecorder;->mProfile:Landroid/media/CamcorderProfile;

    iget v5, v5, Landroid/media/CamcorderProfile;->videoBitRate:I

    iput v5, v3, Lcom/wmspanel/libstream/VideoConfig;->bitRate:I

    .line 57
    iget-object v5, p0, Lcom/vk/media/streamer/StreamRecorder;->mProfile:Landroid/media/CamcorderProfile;

    iget v5, v5, Landroid/media/CamcorderProfile;->videoFrameRate:I

    int-to-float v5, v5

    iput v5, v3, Lcom/wmspanel/libstream/VideoConfig;->fps:F

    .line 58
    new-instance v5, Lcom/wmspanel/libstream/Streamer$Size;

    iget-object v6, p0, Lcom/vk/media/streamer/StreamRecorder;->mProfile:Landroid/media/CamcorderProfile;

    iget v6, v6, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    iget-object v7, p0, Lcom/vk/media/streamer/StreamRecorder;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-direct {v5, v6, v7}, Lcom/wmspanel/libstream/Streamer$Size;-><init>(II)V

    iput-object v5, v3, Lcom/wmspanel/libstream/VideoConfig;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    .line 60
    new-instance v1, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;

    invoke-direct {v1}, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;-><init>()V

    .line 61
    .local v1, "builder":Lcom/wmspanel/libstream/StreamerSurfaceBuilder;
    iget-object v5, p0, Lcom/vk/media/streamer/StreamRecorder;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v5}, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;->setContext(Landroid/content/Context;)V

    .line 62
    invoke-virtual {v1, p0}, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;->setListener(Lcom/wmspanel/libstream/Streamer$Listener;)V

    .line 63
    invoke-virtual {v1, v0}, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;->setAudioConfig(Lcom/wmspanel/libstream/AudioConfig;)V

    .line 64
    invoke-virtual {v1, v3}, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;->setVideoConfig(Lcom/wmspanel/libstream/VideoConfig;)V

    .line 66
    iget-object v5, p0, Lcom/vk/media/streamer/StreamRecorder;->mMode:Lcom/wmspanel/libstream/Streamer$MODE;

    invoke-virtual {v1, v5}, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;->build(Lcom/wmspanel/libstream/Streamer$MODE;)Lcom/wmspanel/libstream/StreamerSurface;

    move-result-object v5

    iput-object v5, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    .line 68
    iget-object v5, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    invoke-virtual {v5}, Lcom/wmspanel/libstream/StreamerSurface;->startVideoCapture()V

    .line 69
    iget-object v5, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    invoke-virtual {v5}, Lcom/wmspanel/libstream/StreamerSurface;->getEncoderSurface()Landroid/view/Surface;

    move-result-object v2

    .line 70
    .local v2, "surface":Landroid/view/Surface;
    if-eqz v2, :cond_2

    iget-object v5, p0, Lcom/vk/media/streamer/StreamRecorder;->mMode:Lcom/wmspanel/libstream/Streamer$MODE;

    sget-object v6, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    if-ne v5, v6, :cond_2

    .line 71
    iget-object v5, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    invoke-virtual {v5}, Lcom/wmspanel/libstream/StreamerSurface;->startAudioCapture()V

    .line 73
    :cond_2
    sget-object v5, Lcom/vk/media/camera/CameraRecorder$State;->PREPARING:Lcom/vk/media/camera/CameraRecorder$State;

    iput-object v5, p0, Lcom/vk/media/streamer/StreamRecorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    .line 74
    sget-object v5, Lcom/vk/media/streamer/StreamRecorder;->TAG:Ljava/lang/String;

    const-string/jumbo v6, "preparing"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method public release()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 128
    invoke-super {p0}, Lcom/vk/media/camera/CameraRecorder;->release()V

    .line 129
    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    if-eqz v0, :cond_0

    .line 130
    invoke-virtual {p0}, Lcom/vk/media/streamer/StreamRecorder;->stop()V

    .line 132
    sget-object v0, Lcom/vk/media/camera/CameraRecorder$State;->IDLE:Lcom/vk/media/camera/CameraRecorder$State;

    iput-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    .line 133
    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/StreamerSurface;->stopVideoCapture()V

    .line 134
    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/StreamerSurface;->stopAudioCapture()V

    .line 135
    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/StreamerSurface;->release()V

    .line 136
    iput-object v1, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    .line 138
    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 140
    :cond_0
    return-void
.end method

.method public setPresentationTime(J)Z
    .locals 3
    .param p1, "timestamp"    # J

    .prologue
    .line 87
    invoke-super {p0, p1, p2}, Lcom/vk/media/camera/CameraRecorder;->setPresentationTime(J)Z

    move-result v0

    if-nez v0, :cond_0

    .line 88
    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/vk/media/streamer/StreamRecorder$1;

    invoke-direct {v1, p0}, Lcom/vk/media/streamer/StreamRecorder$1;-><init>(Lcom/vk/media/streamer/StreamRecorder;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 94
    invoke-virtual {p0}, Lcom/vk/media/streamer/StreamRecorder;->stop()V

    .line 95
    const/4 v0, 0x0

    .line 97
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public start()Z
    .locals 3

    .prologue
    .line 107
    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mFile:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 108
    sget-object v0, Lcom/vk/media/streamer/StreamRecorder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "start recording "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/media/streamer/StreamRecorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " file="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/media/streamer/StreamRecorder;->mFile:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mRecording:Z

    .line 110
    invoke-direct {p0}, Lcom/vk/media/streamer/StreamRecorder;->startRecord()V

    .line 112
    :cond_0
    iget-boolean v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mRecording:Z

    return v0
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 117
    invoke-super {p0}, Lcom/vk/media/camera/CameraRecorder;->stop()V

    .line 118
    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mRecording:Z

    if-eqz v0, :cond_0

    .line 119
    sget-object v0, Lcom/vk/media/streamer/StreamRecorder;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "stop recording"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mRecording:Z

    .line 121
    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mStreamer:Lcom/wmspanel/libstream/StreamerSurface;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/StreamerSurface;->stopRecord()V

    .line 122
    sget-object v0, Lcom/vk/media/camera/CameraRecorder$State;->PREPARED:Lcom/vk/media/camera/CameraRecorder$State;

    iput-object v0, p0, Lcom/vk/media/streamer/StreamRecorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    .line 124
    :cond_0
    return-void
.end method
