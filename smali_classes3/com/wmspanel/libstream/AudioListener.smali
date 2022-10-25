.class Lcom/wmspanel/libstream/AudioListener;
.super Ljava/lang/Thread;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioListener"


# instance fields
.field private mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

.field private mAudioFormat:Landroid/media/MediaFormat;

.field private mAudioRecord:Landroid/media/AudioRecord;

.field private mAudioSource:I

.field private final mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private mFrameId:J

.field private mListener:Lcom/wmspanel/libstream/Streamer$Listener;

.field private mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

.field private mStartPTS:J

.field private mState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

.field private mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

.field private mTotalSamplesNum:J


# direct methods
.method public constructor <init>(Lcom/wmspanel/libstream/StreamBuffer;ILcom/wmspanel/libstream/AudioEncoder;Lcom/wmspanel/libstream/Streamer$Listener;)V
    .locals 1
    .param p1, "streamBuffer"    # Lcom/wmspanel/libstream/StreamBuffer;
    .param p2, "audioSource"    # I
    .param p3, "audioEncoder"    # Lcom/wmspanel/libstream/AudioEncoder;
    .param p4, "listener"    # Lcom/wmspanel/libstream/Streamer$Listener;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 18
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 28
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    iput-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .line 37
    if-nez p1, :cond_0

    .line 38
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 40
    :cond_0
    if-eqz p3, :cond_1

    invoke-virtual {p3}, Lcom/wmspanel/libstream/AudioEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    if-nez v0, :cond_2

    .line 41
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 44
    :cond_2
    iput-object p1, p0, Lcom/wmspanel/libstream/AudioListener;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    .line 45
    iput p2, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioSource:I

    .line 46
    iput-object p3, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    .line 47
    iput-object p4, p0, Lcom/wmspanel/libstream/AudioListener;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    .line 48
    return-void
.end method

.method static synthetic access$000(Lcom/wmspanel/libstream/AudioListener;)Lcom/wmspanel/libstream/Streamer$Listener;
    .locals 1
    .param p0, "x0"    # Lcom/wmspanel/libstream/AudioListener;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    return-object v0
.end method

.method private addAudioTrack(Landroid/media/MediaFormat;)V
    .locals 1
    .param p1, "format"    # Landroid/media/MediaFormat;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    .line 284
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

    if-eqz v0, :cond_0

    .line 285
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/StreamRecorder;->addAudioTrack(Landroid/media/MediaFormat;)V

    .line 290
    :goto_0
    return-void

    .line 287
    :cond_0
    iput-object p1, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioFormat:Landroid/media/MediaFormat;

    goto :goto_0
.end method

.method private getAudioFrame()V
    .locals 9

    .prologue
    const/16 v8, 0x15

    const/4 v1, 0x0

    .line 224
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    iget-object v2, p0, Lcom/wmspanel/libstream/AudioListener;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    const-wide/16 v4, 0x0

    invoke-virtual {v0, v2, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v2

    .line 226
    const/4 v0, -0x2

    if-ne v0, v2, :cond_1

    .line 227
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v0

    .line 229
    new-instance v2, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    invoke-direct {v2}, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;-><init>()V

    .line 230
    const-string/jumbo v3, "csd-0"

    invoke-virtual {v0, v3}, Landroid/media/MediaFormat;->getByteBuffer(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    iput-object v3, v2, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configBuf:[B

    .line 231
    iget-object v3, v2, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configBuf:[B

    array-length v3, v3

    iput v3, v2, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configLen:I

    .line 232
    const-string/jumbo v3, "sample-rate"

    invoke-virtual {v0, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    .line 233
    const-string/jumbo v3, "channel-count"

    invoke-virtual {v0, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->channelCount:I

    .line 234
    iget-object v3, p0, Lcom/wmspanel/libstream/AudioListener;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    invoke-virtual {v3, v2}, Lcom/wmspanel/libstream/StreamBuffer;->a(Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;)V

    .line 235
    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/AudioListener;->addAudioTrack(Landroid/media/MediaFormat;)V

    .line 236
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STARTED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/AudioListener;->setAudioCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 272
    :catch_0
    move-exception v0

    .line 273
    const-string/jumbo v2, "AudioListener"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v8, :cond_5

    instance-of v0, v0, Landroid/media/MediaCodec$CodecException;

    if-eqz v0, :cond_5

    .line 276
    const/4 v0, 0x1

    .line 278
    :goto_1
    if-eqz v0, :cond_4

    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->ENCODER_FAIL:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    :goto_2
    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/AudioListener;->setAudioCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 280
    :cond_0
    return-void

    .line 238
    :cond_1
    if-ltz v2, :cond_0

    .line 244
    :try_start_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v0, v8, :cond_2

    .line 245
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    aget-object v0, v0, v2

    .line 250
    :goto_3
    iget-object v3, p0, Lcom/wmspanel/libstream/AudioListener;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v3, v3, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_3

    .line 251
    new-instance v3, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    invoke-direct {v3}, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;-><init>()V

    .line 252
    iget-object v4, p0, Lcom/wmspanel/libstream/AudioListener;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    new-array v4, v4, [B

    iput-object v4, v3, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configBuf:[B

    .line 253
    iget-object v4, p0, Lcom/wmspanel/libstream/AudioListener;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    iput v4, v3, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configLen:I

    .line 254
    iget-object v4, v3, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configBuf:[B

    const/4 v5, 0x0

    iget v6, v3, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configLen:I

    invoke-virtual {v0, v4, v5, v6}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 255
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    invoke-virtual {v0, v3}, Lcom/wmspanel/libstream/StreamBuffer;->a(Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;)V

    .line 256
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STARTED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/AudioListener;->setAudioCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 268
    :goto_4
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    goto/16 :goto_0

    .line 247
    :cond_2
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    goto :goto_3

    .line 260
    :cond_3
    iget-wide v4, p0, Lcom/wmspanel/libstream/AudioListener;->mFrameId:J

    const-wide/16 v6, 0x1

    add-long/2addr v6, v4

    iput-wide v6, p0, Lcom/wmspanel/libstream/AudioListener;->mFrameId:J

    iget-object v3, p0, Lcom/wmspanel/libstream/AudioListener;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    invoke-static {v4, v5, v3}, Lcom/wmspanel/libstream/BufferItem;->a(JI)Lcom/wmspanel/libstream/BufferItem;

    move-result-object v3

    .line 261
    iget-object v4, p0, Lcom/wmspanel/libstream/AudioListener;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v4, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v3, v4, v5}, Lcom/wmspanel/libstream/BufferItem;->setTimestamp(J)V

    .line 262
    iget-object v4, p0, Lcom/wmspanel/libstream/AudioListener;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->flags:I

    invoke-virtual {v3, v4}, Lcom/wmspanel/libstream/BufferItem;->setFlags(I)V

    .line 264
    invoke-virtual {v3}, Lcom/wmspanel/libstream/BufferItem;->getData()[B

    move-result-object v4

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/wmspanel/libstream/AudioListener;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v6, v6, Landroid/media/MediaCodec$BufferInfo;->size:I

    invoke-virtual {v0, v4, v5, v6}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 265
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    invoke-virtual {v0, v3}, Lcom/wmspanel/libstream/StreamBuffer;->i(Lcom/wmspanel/libstream/BufferItem;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_4

    .line 278
    :cond_4
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    goto/16 :goto_2

    :cond_5
    move v0, v1

    goto/16 :goto_1
.end method

.method private getJitterFreePTS(JJ)J
    .locals 11
    .param p1, "bufferPts"    # J
    .param p3, "bufferSamplesNum"    # J

    .prologue
    const-wide/32 v6, 0xf4240

    const-wide/16 v8, 0x0

    .line 93
    mul-long v0, v6, p3

    iget-object v2, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v2}, Lcom/wmspanel/libstream/AudioEncoder;->getSampleRate()I

    move-result v2

    int-to-long v2, v2

    div-long v2, v0, v2

    .line 94
    sub-long/2addr p1, v2

    .line 95
    iget-wide v0, p0, Lcom/wmspanel/libstream/AudioListener;->mTotalSamplesNum:J

    cmp-long v0, v0, v8

    if-nez v0, :cond_0

    .line 97
    iput-wide p1, p0, Lcom/wmspanel/libstream/AudioListener;->mStartPTS:J

    .line 98
    iput-wide v8, p0, Lcom/wmspanel/libstream/AudioListener;->mTotalSamplesNum:J

    .line 100
    :cond_0
    iget-wide v0, p0, Lcom/wmspanel/libstream/AudioListener;->mStartPTS:J

    iget-wide v4, p0, Lcom/wmspanel/libstream/AudioListener;->mTotalSamplesNum:J

    mul-long/2addr v4, v6

    iget-object v6, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v6}, Lcom/wmspanel/libstream/AudioEncoder;->getSampleRate()I

    move-result v6

    int-to-long v6, v6

    div-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 101
    sub-long v4, p1, v0

    const-wide/16 v6, 0x2

    mul-long/2addr v2, v6

    cmp-long v2, v4, v2

    if-ltz v2, :cond_1

    .line 103
    iput-wide p1, p0, Lcom/wmspanel/libstream/AudioListener;->mStartPTS:J

    .line 104
    iput-wide v8, p0, Lcom/wmspanel/libstream/AudioListener;->mTotalSamplesNum:J

    .line 105
    iget-wide v0, p0, Lcom/wmspanel/libstream/AudioListener;->mStartPTS:J

    .line 107
    :cond_1
    iget-wide v2, p0, Lcom/wmspanel/libstream/AudioListener;->mTotalSamplesNum:J

    add-long/2addr v2, p3

    iput-wide v2, p0, Lcom/wmspanel/libstream/AudioListener;->mTotalSamplesNum:J

    .line 108
    return-wide v0
.end method

.method private openEncoder(I)Z
    .locals 2
    .param p1, "bufferSize"    # I

    .prologue
    .line 75
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/AudioEncoder;->setBufferSize(I)V

    .line 76
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->configure()V

    .line 77
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    const/4 v0, 0x1

    :goto_0
    return v0

    .line 78
    :catch_0
    move-exception v0

    .line 79
    const-string/jumbo v1, "AudioListener"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private setAudioCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V
    .locals 2
    .param p1, "audioCaptureState"    # Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    if-ne p1, v0, :cond_1

    .line 71
    :cond_0
    :goto_0
    return-void

    .line 54
    :cond_1
    iput-object p1, p0, Lcom/wmspanel/libstream/AudioListener;->mState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .line 56
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    if-eqz v0, :cond_0

    .line 60
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-interface {v0}, Lcom/wmspanel/libstream/Streamer$Listener;->getHandler()Landroid/os/Handler;

    move-result-object v0

    .line 61
    if-eqz v0, :cond_0

    .line 65
    new-instance v1, Lcom/wmspanel/libstream/AudioListener$1;

    invoke-direct {v1, p0, p1}, Lcom/wmspanel/libstream/AudioListener$1;-><init>(Lcom/wmspanel/libstream/AudioListener;Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    .line 114
    const/4 v8, 0x0

    .line 115
    sget-object v7, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .line 119
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->getChannelCount()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_4

    const/16 v3, 0x10

    .line 122
    :goto_0
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    .line 123
    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->getSampleRate()I

    move-result v0

    const/4 v1, 0x2

    .line 122
    invoke-static {v0, v3, v1}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v5

    .line 127
    if-gtz v5, :cond_5

    .line 128
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    :catch_0
    move-exception v0

    move v1, v8

    .line 191
    :goto_1
    const-string/jumbo v2, "AudioListener"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_0

    instance-of v0, v0, Landroid/media/MediaCodec$CodecException;

    if-eqz v0, :cond_0

    .line 193
    const/4 v1, 0x1

    .line 195
    :cond_0
    if-eqz v1, :cond_c

    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->ENCODER_FAIL:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    .line 198
    :goto_2
    iget-object v1, p0, Lcom/wmspanel/libstream/AudioListener;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    if-eqz v1, :cond_1

    .line 200
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/wmspanel/libstream/AudioListener;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    .line 202
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioFormat:Landroid/media/MediaFormat;

    .line 203
    invoke-virtual {p0}, Lcom/wmspanel/libstream/AudioListener;->stopRecord()V

    .line 205
    iget-object v1, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioRecord:Landroid/media/AudioRecord;

    if-eqz v1, :cond_2

    .line 207
    iget-object v1, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v1}, Landroid/media/AudioRecord;->release()V

    .line 208
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioRecord:Landroid/media/AudioRecord;

    .line 211
    :cond_2
    iget-object v1, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    if-eqz v1, :cond_3

    .line 212
    iget-object v1, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/AudioEncoder;->release()V

    .line 213
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    .line 215
    :cond_3
    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/AudioListener;->setAudioCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 216
    return-void

    .line 119
    :cond_4
    const/16 v3, 0xc

    goto :goto_0

    .line 132
    :cond_5
    :try_start_1
    invoke-direct {p0, v5}, Lcom/wmspanel/libstream/AudioListener;->openEncoder(I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v0

    if-nez v0, :cond_6

    .line 133
    const/4 v1, 0x1

    .line 134
    :try_start_2
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 190
    :catch_1
    move-exception v0

    goto :goto_1

    .line 137
    :cond_6
    :try_start_3
    new-instance v0, Landroid/media/AudioRecord;

    iget v1, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioSource:I

    iget-object v2, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    .line 139
    invoke-virtual {v2}, Lcom/wmspanel/libstream/AudioEncoder;->getSampleRate()I

    move-result v2

    const/4 v4, 0x2

    mul-int/lit8 v5, v5, 0x4

    invoke-direct/range {v0 .. v5}, Landroid/media/AudioRecord;-><init>(IIIII)V

    iput-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioRecord:Landroid/media/AudioRecord;

    .line 144
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->getState()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_7

    .line 145
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    throw v0

    .line 149
    :cond_7
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->getChannelCount()I

    move-result v0

    mul-int/lit8 v9, v0, 0x2

    .line 153
    mul-int/lit16 v0, v9, 0x400

    new-array v10, v0, [B

    .line 155
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->startRecording()V

    .line 157
    :cond_8
    :goto_3
    invoke-virtual {p0}, Lcom/wmspanel/libstream/AudioListener;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_b

    .line 159
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioRecord:Landroid/media/AudioRecord;

    const/4 v1, 0x0

    array-length v2, v10

    invoke-virtual {v0, v10, v1, v2}, Landroid/media/AudioRecord;->read([BII)I

    move-result v3

    .line 161
    if-lez v3, :cond_8

    .line 165
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    const-wide/16 v4, 0x3e8

    div-long/2addr v0, v4

    .line 166
    div-int v2, v3, v9

    int-to-long v4, v2

    invoke-direct {p0, v0, v1, v4, v5}, Lcom/wmspanel/libstream/AudioListener;->getJitterFreePTS(JJ)J

    move-result-wide v4

    .line 168
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    const-wide/16 v12, -0x1

    invoke-virtual {v0, v12, v13}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-result v1

    .line 169
    if-gez v1, :cond_9

    .line 170
    const/4 v1, 0x1

    .line 171
    :try_start_4
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 176
    :cond_9
    :try_start_5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-ge v0, v2, :cond_a

    .line 177
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    aget-object v0, v0, v1

    .line 178
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 183
    :goto_4
    const/4 v2, 0x0

    invoke-virtual {v0, v10, v2, v3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 184
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 187
    invoke-direct {p0}, Lcom/wmspanel/libstream/AudioListener;->getAudioFrame()V

    goto :goto_3

    .line 180
    :cond_a
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioEncoder:Lcom/wmspanel/libstream/AudioEncoder;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    move-result-object v0

    goto :goto_4

    :cond_b
    move-object v0, v7

    .line 196
    goto/16 :goto_2

    .line 195
    :cond_c
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    goto/16 :goto_2
.end method

.method startRecord(Lcom/wmspanel/libstream/StreamRecorder;)V
    .locals 2
    .param p1, "recorder"    # Lcom/wmspanel/libstream/StreamRecorder;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    .line 294
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

    if-nez v0, :cond_0

    .line 295
    iput-object p1, p0, Lcom/wmspanel/libstream/AudioListener;->mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

    .line 296
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioFormat:Landroid/media/MediaFormat;

    if-eqz v0, :cond_0

    .line 297
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

    iget-object v1, p0, Lcom/wmspanel/libstream/AudioListener;->mAudioFormat:Landroid/media/MediaFormat;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/StreamRecorder;->addAudioTrack(Landroid/media/MediaFormat;)V

    .line 300
    :cond_0
    return-void
.end method

.method stopRecord()V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    .line 304
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/AudioListener;->mRecorder:Lcom/wmspanel/libstream/StreamRecorder;

    .line 305
    return-void
.end method
