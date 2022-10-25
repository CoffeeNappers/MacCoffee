.class public final Lcom/google/android/exoplayer2/audio/AudioTrack;
.super Ljava/lang/Object;
.source "AudioTrack.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtilV23;,
        Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtilV19;,
        Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;,
        Lcom/google/android/exoplayer2/audio/AudioTrack$InvalidAudioTrackTimestampException;,
        Lcom/google/android/exoplayer2/audio/AudioTrack$WriteException;,
        Lcom/google/android/exoplayer2/audio/AudioTrack$InitializationException;,
        Lcom/google/android/exoplayer2/audio/AudioTrack$Listener;
    }
.end annotation


# static fields
.field private static final BUFFER_MULTIPLICATION_FACTOR:I = 0x4

.field public static final CURRENT_POSITION_NOT_SET:J = -0x8000000000000000L

.field private static final ERROR_BAD_VALUE:I = -0x2

.field private static final MAX_AUDIO_TIMESTAMP_OFFSET_US:J = 0x4c4b40L

.field private static final MAX_BUFFER_DURATION_US:J = 0xb71b0L

.field private static final MAX_LATENCY_US:J = 0x4c4b40L

.field private static final MAX_PLAYHEAD_OFFSET_COUNT:I = 0xa

.field private static final MIN_BUFFER_DURATION_US:J = 0x3d090L

.field private static final MIN_PLAYHEAD_OFFSET_SAMPLE_INTERVAL_US:I = 0x7530

.field private static final MIN_TIMESTAMP_SAMPLE_INTERVAL_US:I = 0x7a120

.field private static final MODE_STATIC:I = 0x0

.field private static final MODE_STREAM:I = 0x1

.field private static final PASSTHROUGH_BUFFER_DURATION_US:J = 0x3d090L

.field private static final PLAYSTATE_PAUSED:I = 0x2

.field private static final PLAYSTATE_PLAYING:I = 0x3

.field private static final PLAYSTATE_STOPPED:I = 0x1

.field private static final START_IN_SYNC:I = 0x1

.field private static final START_NEED_SYNC:I = 0x2

.field private static final START_NOT_SET:I = 0x0

.field private static final STATE_INITIALIZED:I = 0x1

.field private static final TAG:Ljava/lang/String; = "AudioTrack"

.field private static final WRITE_NON_BLOCKING:I = 0x1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation
.end field

.field public static enablePreV21AudioSessionWorkaround:Z

.field public static failOnSpuriousAudioTimestamp:Z


# instance fields
.field private final audioCapabilities:Lcom/google/android/exoplayer2/audio/AudioCapabilities;

.field private audioSessionId:I

.field private audioTimestampSet:Z

.field private audioTrack:Landroid/media/AudioTrack;

.field private final audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

.field private avSyncHeader:Ljava/nio/ByteBuffer;

.field private bufferSize:I

.field private bufferSizeUs:J

.field private bytesUntilNextAvSync:I

.field private channelConfig:I

.field private currentSourceBuffer:Ljava/nio/ByteBuffer;

.field private framesPerEncodedSample:I

.field private getLatencyMethod:Ljava/lang/reflect/Method;

.field private hasData:Z

.field private keepSessionIdAudioTrack:Landroid/media/AudioTrack;

.field private lastFeedElapsedRealtimeMs:J

.field private lastPlayheadSampleTimeUs:J

.field private lastTimestampSampleTimeUs:J

.field private latencyUs:J

.field private final listener:Lcom/google/android/exoplayer2/audio/AudioTrack$Listener;

.field private nextPlayheadOffsetIndex:I

.field private passthrough:Z

.field private pcmFrameSize:I

.field private playheadOffsetCount:I

.field private final playheadOffsets:[J

.field private playing:Z

.field private final releasingConditionVariable:Landroid/os/ConditionVariable;

.field private resampledBuffer:Ljava/nio/ByteBuffer;

.field private resumeSystemTimeUs:J

.field private sampleRate:I

.field private smoothedPlayheadOffsetUs:J

.field private sourceEncoding:I

.field private startMediaTimeState:I

.field private startMediaTimeUs:J

.field private streamType:I

.field private submittedEncodedFrames:J

.field private submittedPcmBytes:J

.field private targetEncoding:I

.field private temporaryBuffer:[B

.field private temporaryBufferOffset:I

.field private tunneling:Z

.field private useResampledBuffer:Z

.field private volume:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 246
    sput-boolean v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->enablePreV21AudioSessionWorkaround:Z

    .line 255
    sput-boolean v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->failOnSpuriousAudioTimestamp:Z

    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/audio/AudioCapabilities;Lcom/google/android/exoplayer2/audio/AudioTrack$Listener;)V
    .locals 5
    .param p1, "audioCapabilities"    # Lcom/google/android/exoplayer2/audio/AudioCapabilities;
    .param p2, "listener"    # Lcom/google/android/exoplayer2/audio/AudioTrack$Listener;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 319
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 320
    iput-object p1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioCapabilities:Lcom/google/android/exoplayer2/audio/AudioCapabilities;

    .line 321
    iput-object p2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->listener:Lcom/google/android/exoplayer2/audio/AudioTrack$Listener;

    .line 322
    new-instance v0, Landroid/os/ConditionVariable;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/os/ConditionVariable;-><init>(Z)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->releasingConditionVariable:Landroid/os/ConditionVariable;

    .line 323
    sget v0, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_0

    .line 325
    :try_start_0
    const-class v1, Landroid/media/AudioTrack;

    const-string/jumbo v2, "getLatency"

    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/Class;

    .line 326
    invoke-virtual {v1, v2, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->getLatencyMethod:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 331
    :cond_0
    :goto_0
    sget v0, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_1

    .line 332
    new-instance v0, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtilV23;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtilV23;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    .line 338
    :goto_1
    const/16 v0, 0xa

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->playheadOffsets:[J

    .line 339
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->volume:F

    .line 340
    iput v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeState:I

    .line 341
    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->streamType:I

    .line 342
    iput v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioSessionId:I

    .line 343
    return-void

    .line 333
    :cond_1
    sget v0, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_2

    .line 334
    new-instance v0, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtilV19;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtilV19;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    goto :goto_1

    .line 336
    :cond_2
    new-instance v0, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    invoke-direct {v0, v4}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;-><init>(Lcom/google/android/exoplayer2/audio/AudioTrack$1;)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    goto :goto_1

    .line 327
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method static synthetic access$100(Lcom/google/android/exoplayer2/audio/AudioTrack;)Landroid/os/ConditionVariable;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/audio/AudioTrack;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->releasingConditionVariable:Landroid/os/ConditionVariable;

    return-object v0
.end method

.method private checkAudioTrackInitialized()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/audio/AudioTrack$InitializationException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1045
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->getState()I

    move-result v0

    .line 1046
    .local v0, "state":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 1047
    return-void

    .line 1051
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1056
    iput-object v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 1059
    :goto_0
    new-instance v1, Lcom/google/android/exoplayer2/audio/AudioTrack$InitializationException;

    iget v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->sampleRate:I

    iget v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->channelConfig:I

    iget v4, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bufferSize:I

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/google/android/exoplayer2/audio/AudioTrack$InitializationException;-><init>(IIII)V

    throw v1

    .line 1052
    :catch_0
    move-exception v1

    .line 1056
    iput-object v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    goto :goto_0

    :catchall_0
    move-exception v1

    iput-object v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    throw v1
.end method

.method private static createHwAvSyncAudioTrackV21(IIIII)Landroid/media/AudioTrack;
    .locals 6
    .param p0, "sampleRate"    # I
    .param p1, "channelConfig"    # I
    .param p2, "encoding"    # I
    .param p3, "bufferSize"    # I
    .param p4, "sessionId"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 1118
    new-instance v0, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 1119
    invoke-virtual {v0, v4}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    const/4 v3, 0x3

    .line 1120
    invoke-virtual {v0, v3}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    const/16 v3, 0x10

    .line 1121
    invoke-virtual {v0, v3}, Landroid/media/AudioAttributes$Builder;->setFlags(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    .line 1122
    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v1

    .line 1123
    .local v1, "attributesBuilder":Landroid/media/AudioAttributes;
    new-instance v0, Landroid/media/AudioFormat$Builder;

    invoke-direct {v0}, Landroid/media/AudioFormat$Builder;-><init>()V

    .line 1124
    invoke-virtual {v0, p1}, Landroid/media/AudioFormat$Builder;->setChannelMask(I)Landroid/media/AudioFormat$Builder;

    move-result-object v0

    .line 1125
    invoke-virtual {v0, p2}, Landroid/media/AudioFormat$Builder;->setEncoding(I)Landroid/media/AudioFormat$Builder;

    move-result-object v0

    .line 1126
    invoke-virtual {v0, p0}, Landroid/media/AudioFormat$Builder;->setSampleRate(I)Landroid/media/AudioFormat$Builder;

    move-result-object v0

    .line 1127
    invoke-virtual {v0}, Landroid/media/AudioFormat$Builder;->build()Landroid/media/AudioFormat;

    move-result-object v2

    .line 1128
    .local v2, "format":Landroid/media/AudioFormat;
    new-instance v0, Landroid/media/AudioTrack;

    move v3, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Landroid/media/AudioTrack;-><init>(Landroid/media/AudioAttributes;Landroid/media/AudioFormat;III)V

    return-object v0
.end method

.method private durationUsToFrames(J)J
    .locals 5
    .param p1, "durationUs"    # J

    .prologue
    .line 1075
    iget v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->sampleRate:I

    int-to-long v0, v0

    mul-long/2addr v0, p1

    const-wide/32 v2, 0xf4240

    div-long/2addr v0, v2

    return-wide v0
.end method

.method private framesToDurationUs(J)J
    .locals 5
    .param p1, "frameCount"    # J

    .prologue
    .line 1071
    const-wide/32 v0, 0xf4240

    mul-long/2addr v0, p1

    iget v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->sampleRate:I

    int-to-long v2, v2

    div-long/2addr v0, v2

    return-wide v0
.end method

.method private static getEncodingForMimeType(Ljava/lang/String;)I
    .locals 3
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 1210
    const/4 v1, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 1220
    :goto_1
    return v0

    .line 1210
    :sswitch_0
    const-string/jumbo v2, "audio/ac3"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v1, v0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v2, "audio/eac3"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :sswitch_2
    const-string/jumbo v2, "audio/vnd.dts"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x2

    goto :goto_0

    :sswitch_3
    const-string/jumbo v2, "audio/vnd.dts.hd"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x3

    goto :goto_0

    .line 1212
    :pswitch_0
    const/4 v0, 0x5

    goto :goto_1

    .line 1214
    :pswitch_1
    const/4 v0, 0x6

    goto :goto_1

    .line 1216
    :pswitch_2
    const/4 v0, 0x7

    goto :goto_1

    .line 1218
    :pswitch_3
    const/16 v0, 0x8

    goto :goto_1

    .line 1210
    :sswitch_data_0
    .sparse-switch
        -0x41455b98 -> :sswitch_2
        0xb269698 -> :sswitch_0
        0x59ae0c65 -> :sswitch_1
        0x59c2dc42 -> :sswitch_3
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private static getFramesPerEncodedSample(ILjava/nio/ByteBuffer;)I
    .locals 3
    .param p0, "encoding"    # I
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 1225
    const/4 v0, 0x7

    if-eq p0, v0, :cond_0

    const/16 v0, 0x8

    if-ne p0, v0, :cond_1

    .line 1226
    :cond_0
    invoke-static {p1}, Lcom/google/android/exoplayer2/audio/DtsUtil;->parseDtsAudioSampleCount(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 1230
    :goto_0
    return v0

    .line 1227
    :cond_1
    const/4 v0, 0x5

    if-ne p0, v0, :cond_2

    .line 1228
    invoke-static {}, Lcom/google/android/exoplayer2/audio/Ac3Util;->getAc3SyncframeAudioSampleCount()I

    move-result v0

    goto :goto_0

    .line 1229
    :cond_2
    const/4 v0, 0x6

    if-ne p0, v0, :cond_3

    .line 1230
    invoke-static {p1}, Lcom/google/android/exoplayer2/audio/Ac3Util;->parseEAc3SyncframeAudioSampleCount(Ljava/nio/ByteBuffer;)I

    move-result v0

    goto :goto_0

    .line 1232
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unexpected audio encoding: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private getSubmittedFrames()J
    .locals 2

    .prologue
    .line 1079
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->passthrough:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->submittedEncodedFrames:J

    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->submittedPcmBytes:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer2/audio/AudioTrack;->pcmBytesToFrames(J)J

    move-result-wide v0

    goto :goto_0
.end method

.method private hasCurrentPositionUs()Z
    .locals 1

    .prologue
    .line 950
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeState:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private initialize()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/audio/AudioTrack$InitializationException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v10, 0x0

    .line 531
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->releasingConditionVariable:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 533
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->tunneling:Z

    if-eqz v0, :cond_3

    .line 534
    iget v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->sampleRate:I

    iget v1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->channelConfig:I

    iget v6, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->targetEncoding:I

    iget v8, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bufferSize:I

    iget v9, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioSessionId:I

    invoke-static {v0, v1, v6, v8, v9}, Lcom/google/android/exoplayer2/audio/AudioTrack;->createHwAvSyncAudioTrackV21(IIIII)Landroid/media/AudioTrack;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 544
    :goto_0
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->checkAudioTrackInitialized()V

    .line 546
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getAudioSessionId()I

    move-result v7

    .line 547
    .local v7, "audioSessionId":I
    sget-boolean v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->enablePreV21AudioSessionWorkaround:Z

    if-eqz v0, :cond_1

    .line 548
    sget v0, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_1

    .line 551
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->keepSessionIdAudioTrack:Landroid/media/AudioTrack;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->keepSessionIdAudioTrack:Landroid/media/AudioTrack;

    .line 552
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getAudioSessionId()I

    move-result v0

    if-eq v7, v0, :cond_0

    .line 553
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->releaseKeepSessionIdAudioTrack()V

    .line 555
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->keepSessionIdAudioTrack:Landroid/media/AudioTrack;

    if-nez v0, :cond_1

    .line 556
    const/16 v2, 0xfa0

    .line 557
    .local v2, "sampleRate":I
    const/4 v3, 0x4

    .line 558
    .local v3, "channelConfig":I
    const/4 v4, 0x2

    .line 559
    .local v4, "encoding":I
    const/4 v5, 0x2

    .line 560
    .local v5, "bufferSize":I
    new-instance v0, Landroid/media/AudioTrack;

    iget v1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->streamType:I

    move v6, v10

    invoke-direct/range {v0 .. v7}, Landroid/media/AudioTrack;-><init>(IIIIIII)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->keepSessionIdAudioTrack:Landroid/media/AudioTrack;

    .line 565
    .end local v2    # "sampleRate":I
    .end local v3    # "channelConfig":I
    .end local v4    # "encoding":I
    .end local v5    # "bufferSize":I
    :cond_1
    iget v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioSessionId:I

    if-eq v0, v7, :cond_2

    .line 566
    iput v7, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioSessionId:I

    .line 567
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->listener:Lcom/google/android/exoplayer2/audio/AudioTrack$Listener;

    invoke-interface {v0, v7}, Lcom/google/android/exoplayer2/audio/AudioTrack$Listener;->onAudioSessionId(I)V

    .line 570
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->needsPassthroughWorkarounds()Z

    move-result v6

    invoke-virtual {v0, v1, v6}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;->reconfigure(Landroid/media/AudioTrack;Z)V

    .line 571
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->setVolumeInternal()V

    .line 572
    iput-boolean v10, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->hasData:Z

    .line 573
    return-void

    .line 536
    .end local v7    # "audioSessionId":I
    :cond_3
    iget v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioSessionId:I

    if-nez v0, :cond_4

    .line 537
    new-instance v0, Landroid/media/AudioTrack;

    iget v1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->streamType:I

    iget v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->sampleRate:I

    iget v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->channelConfig:I

    iget v4, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->targetEncoding:I

    iget v5, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bufferSize:I

    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    goto :goto_0

    .line 541
    :cond_4
    new-instance v0, Landroid/media/AudioTrack;

    iget v1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->streamType:I

    iget v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->sampleRate:I

    iget v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->channelConfig:I

    iget v4, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->targetEncoding:I

    iget v5, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bufferSize:I

    iget v7, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioSessionId:I

    invoke-direct/range {v0 .. v7}, Landroid/media/AudioTrack;-><init>(IIIIIII)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    goto :goto_0
.end method

.method private isInitialized()Z
    .locals 1

    .prologue
    .line 1063
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private maybeSampleSyncParams()V
    .locals 20

    .prologue
    .line 957
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v9}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;->getPlaybackHeadPositionUs()J

    move-result-wide v10

    .line 958
    .local v10, "playbackPositionUs":J
    const-wide/16 v14, 0x0

    cmp-long v9, v10, v14

    if-nez v9, :cond_1

    .line 1035
    :cond_0
    :goto_0
    return-void

    .line 962
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    div-long v12, v14, v16

    .line 963
    .local v12, "systemClockUs":J
    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->lastPlayheadSampleTimeUs:J

    sub-long v14, v12, v14

    const-wide/16 v16, 0x7530

    cmp-long v9, v14, v16

    if-ltz v9, :cond_3

    .line 965
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->playheadOffsets:[J

    move-object/from16 v0, p0

    iget v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->nextPlayheadOffsetIndex:I

    sub-long v16, v10, v12

    aput-wide v16, v9, v14

    .line 966
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->nextPlayheadOffsetIndex:I

    add-int/lit8 v9, v9, 0x1

    rem-int/lit8 v9, v9, 0xa

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->nextPlayheadOffsetIndex:I

    .line 967
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->playheadOffsetCount:I

    const/16 v14, 0xa

    if-ge v9, v14, :cond_2

    .line 968
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->playheadOffsetCount:I

    add-int/lit8 v9, v9, 0x1

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->playheadOffsetCount:I

    .line 970
    :cond_2
    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->lastPlayheadSampleTimeUs:J

    .line 971
    const-wide/16 v14, 0x0

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->smoothedPlayheadOffsetUs:J

    .line 972
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->playheadOffsetCount:I

    if-ge v7, v9, :cond_3

    .line 973
    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->smoothedPlayheadOffsetUs:J

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->playheadOffsets:[J

    aget-wide v16, v9, v7

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->playheadOffsetCount:I

    int-to-long v0, v9

    move-wide/from16 v18, v0

    div-long v16, v16, v18

    add-long v14, v14, v16

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->smoothedPlayheadOffsetUs:J

    .line 972
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 977
    .end local v7    # "i":I
    :cond_3
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->needsPassthroughWorkarounds()Z

    move-result v9

    if-nez v9, :cond_0

    .line 983
    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->lastTimestampSampleTimeUs:J

    sub-long v14, v12, v14

    const-wide/32 v16, 0x7a120

    cmp-long v9, v14, v16

    if-ltz v9, :cond_0

    .line 984
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v9}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;->updateTimestamp()Z

    move-result v9

    move-object/from16 v0, p0

    iput-boolean v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTimestampSet:Z

    .line 985
    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTimestampSet:Z

    if-eqz v9, :cond_4

    .line 987
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v9}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;->getTimestampNanoTime()J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    div-long v4, v14, v16

    .line 988
    .local v4, "audioTimestampUs":J
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v9}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;->getTimestampFramePosition()J

    move-result-wide v2

    .line 989
    .local v2, "audioTimestampFramePosition":J
    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->resumeSystemTimeUs:J

    cmp-long v9, v4, v14

    if-gez v9, :cond_6

    .line 991
    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput-boolean v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTimestampSet:Z

    .line 1015
    .end local v2    # "audioTimestampFramePosition":J
    .end local v4    # "audioTimestampUs":J
    :cond_4
    :goto_2
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->getLatencyMethod:Ljava/lang/reflect/Method;

    if-eqz v9, :cond_5

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->passthrough:Z

    if-nez v9, :cond_5

    .line 1019
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->getLatencyMethod:Ljava/lang/reflect/Method;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    const/4 v9, 0x0

    check-cast v9, [Ljava/lang/Object;

    invoke-virtual {v14, v15, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    int-to-long v14, v9

    const-wide/16 v16, 0x3e8

    mul-long v14, v14, v16

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bufferSizeUs:J

    move-wide/from16 v16, v0

    sub-long v14, v14, v16

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->latencyUs:J

    .line 1022
    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->latencyUs:J

    const-wide/16 v16, 0x0

    invoke-static/range {v14 .. v17}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v14

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->latencyUs:J

    .line 1024
    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->latencyUs:J

    const-wide/32 v16, 0x4c4b40

    cmp-long v9, v14, v16

    if-lez v9, :cond_5

    .line 1025
    const-string/jumbo v9, "AudioTrack"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Ignoring impossibly large audio latency: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->latencyUs:J

    move-wide/from16 v16, v0

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v9, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1026
    const-wide/16 v14, 0x0

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->latencyUs:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1033
    :cond_5
    :goto_3
    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->lastTimestampSampleTimeUs:J

    goto/16 :goto_0

    .line 992
    .restart local v2    # "audioTimestampFramePosition":J
    .restart local v4    # "audioTimestampUs":J
    :cond_6
    sub-long v14, v4, v12

    invoke-static {v14, v15}, Ljava/lang/Math;->abs(J)J

    move-result-wide v14

    const-wide/32 v16, 0x4c4b40

    cmp-long v9, v14, v16

    if-lez v9, :cond_8

    .line 994
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Spurious audio timestamp (system clock mismatch): "

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v14, ", "

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v14, ", "

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v14, ", "

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 997
    .local v8, "message":Ljava/lang/String;
    sget-boolean v9, Lcom/google/android/exoplayer2/audio/AudioTrack;->failOnSpuriousAudioTimestamp:Z

    if-eqz v9, :cond_7

    .line 998
    new-instance v9, Lcom/google/android/exoplayer2/audio/AudioTrack$InvalidAudioTrackTimestampException;

    invoke-direct {v9, v8}, Lcom/google/android/exoplayer2/audio/AudioTrack$InvalidAudioTrackTimestampException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 1000
    :cond_7
    const-string/jumbo v9, "AudioTrack"

    invoke-static {v9, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1001
    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput-boolean v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTimestampSet:Z

    goto/16 :goto_2

    .line 1002
    .end local v8    # "message":Ljava/lang/String;
    :cond_8
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/google/android/exoplayer2/audio/AudioTrack;->framesToDurationUs(J)J

    move-result-wide v14

    sub-long/2addr v14, v10

    invoke-static {v14, v15}, Ljava/lang/Math;->abs(J)J

    move-result-wide v14

    const-wide/32 v16, 0x4c4b40

    cmp-long v9, v14, v16

    if-lez v9, :cond_4

    .line 1005
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Spurious audio timestamp (frame position mismatch): "

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v14, ", "

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v14, ", "

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v14, ", "

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1008
    .restart local v8    # "message":Ljava/lang/String;
    sget-boolean v9, Lcom/google/android/exoplayer2/audio/AudioTrack;->failOnSpuriousAudioTimestamp:Z

    if-eqz v9, :cond_9

    .line 1009
    new-instance v9, Lcom/google/android/exoplayer2/audio/AudioTrack$InvalidAudioTrackTimestampException;

    invoke-direct {v9, v8}, Lcom/google/android/exoplayer2/audio/AudioTrack$InvalidAudioTrackTimestampException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 1011
    :cond_9
    const-string/jumbo v9, "AudioTrack"

    invoke-static {v9, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1012
    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput-boolean v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTimestampSet:Z

    goto/16 :goto_2

    .line 1028
    .end local v2    # "audioTimestampFramePosition":J
    .end local v4    # "audioTimestampUs":J
    .end local v8    # "message":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 1030
    .local v6, "e":Ljava/lang/Exception;
    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput-object v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->getLatencyMethod:Ljava/lang/reflect/Method;

    goto/16 :goto_3
.end method

.method private needsPassthroughWorkarounds()Z
    .locals 2

    .prologue
    .line 1096
    sget v0, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_1

    iget v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->targetEncoding:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->targetEncoding:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private overrideHasPendingData()Z
    .locals 2

    .prologue
    .line 1107
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->needsPassthroughWorkarounds()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 1108
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 1109
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private pcmBytesToFrames(J)J
    .locals 3
    .param p1, "byteCount"    # J

    .prologue
    .line 1067
    iget v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->pcmFrameSize:I

    int-to-long v0, v0

    div-long v0, p1, v0

    return-wide v0
.end method

.method private releaseKeepSessionIdAudioTrack()V
    .locals 2

    .prologue
    .line 931
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->keepSessionIdAudioTrack:Landroid/media/AudioTrack;

    if-nez v1, :cond_0

    .line 944
    :goto_0
    return-void

    .line 936
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->keepSessionIdAudioTrack:Landroid/media/AudioTrack;

    .line 937
    .local v0, "toRelease":Landroid/media/AudioTrack;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->keepSessionIdAudioTrack:Landroid/media/AudioTrack;

    .line 938
    new-instance v1, Lcom/google/android/exoplayer2/audio/AudioTrack$2;

    invoke-direct {v1, p0, v0}, Lcom/google/android/exoplayer2/audio/AudioTrack$2;-><init>(Lcom/google/android/exoplayer2/audio/AudioTrack;Landroid/media/AudioTrack;)V

    .line 943
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/AudioTrack$2;->start()V

    goto :goto_0
.end method

.method private static resampleTo16BitPcm(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 8
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;
    .param p1, "sourceEncoding"    # I
    .param p2, "out"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v7, 0x0

    .line 1143
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    .line 1144
    .local v2, "offset":I
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    .line 1145
    .local v1, "limit":I
    sub-int v5, v1, v2

    .line 1148
    .local v5, "size":I
    sparse-switch p1, :sswitch_data_0

    .line 1163
    new-instance v6, Ljava/lang/IllegalStateException;

    invoke-direct {v6}, Ljava/lang/IllegalStateException;-><init>()V

    throw v6

    .line 1150
    :sswitch_0
    mul-int/lit8 v4, v5, 0x2

    .line 1166
    .local v4, "resampledSize":I
    :goto_0
    move-object v3, p2

    .line 1167
    .local v3, "resampledBuffer":Ljava/nio/ByteBuffer;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v6

    if-ge v6, v4, :cond_1

    .line 1168
    :cond_0
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 1170
    :cond_1
    invoke-virtual {v3, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 1171
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 1174
    sparse-switch p1, :sswitch_data_1

    .line 1201
    new-instance v6, Ljava/lang/IllegalStateException;

    invoke-direct {v6}, Ljava/lang/IllegalStateException;-><init>()V

    throw v6

    .line 1153
    .end local v3    # "resampledBuffer":Ljava/nio/ByteBuffer;
    .end local v4    # "resampledSize":I
    :sswitch_1
    div-int/lit8 v6, v5, 0x3

    mul-int/lit8 v4, v6, 0x2

    .line 1154
    .restart local v4    # "resampledSize":I
    goto :goto_0

    .line 1156
    .end local v4    # "resampledSize":I
    :sswitch_2
    div-int/lit8 v4, v5, 0x2

    .line 1157
    .restart local v4    # "resampledSize":I
    goto :goto_0

    .line 1177
    .restart local v3    # "resampledBuffer":Ljava/nio/ByteBuffer;
    :sswitch_3
    move v0, v2

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_2

    .line 1178
    invoke-virtual {v3, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1179
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v6

    and-int/lit16 v6, v6, 0xff

    add-int/lit8 v6, v6, -0x80

    int-to-byte v6, v6

    invoke-virtual {v3, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1177
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1184
    .end local v0    # "i":I
    :sswitch_4
    move v0, v2

    .restart local v0    # "i":I
    :goto_2
    if-ge v0, v1, :cond_2

    .line 1185
    add-int/lit8 v6, v0, 0x1

    invoke-virtual {p0, v6}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v6

    invoke-virtual {v3, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1186
    add-int/lit8 v6, v0, 0x2

    invoke-virtual {p0, v6}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v6

    invoke-virtual {v3, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1184
    add-int/lit8 v0, v0, 0x3

    goto :goto_2

    .line 1191
    .end local v0    # "i":I
    :sswitch_5
    move v0, v2

    .restart local v0    # "i":I
    :goto_3
    if-ge v0, v1, :cond_2

    .line 1192
    add-int/lit8 v6, v0, 0x2

    invoke-virtual {p0, v6}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v6

    invoke-virtual {v3, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1193
    add-int/lit8 v6, v0, 0x3

    invoke-virtual {p0, v6}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v6

    invoke-virtual {v3, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1191
    add-int/lit8 v0, v0, 0x4

    goto :goto_3

    .line 1204
    :cond_2
    invoke-virtual {v3, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 1205
    return-object v3

    .line 1148
    nop

    :sswitch_data_0
    .sparse-switch
        -0x80000000 -> :sswitch_1
        0x3 -> :sswitch_0
        0x40000000 -> :sswitch_2
    .end sparse-switch

    .line 1174
    :sswitch_data_1
    .sparse-switch
        -0x80000000 -> :sswitch_4
        0x3 -> :sswitch_3
        0x40000000 -> :sswitch_5
    .end sparse-switch
.end method

.method private resetSyncParams()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    const/4 v0, 0x0

    .line 1083
    iput-wide v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->smoothedPlayheadOffsetUs:J

    .line 1084
    iput v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->playheadOffsetCount:I

    .line 1085
    iput v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->nextPlayheadOffsetIndex:I

    .line 1086
    iput-wide v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->lastPlayheadSampleTimeUs:J

    .line 1087
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTimestampSet:Z

    .line 1088
    iput-wide v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->lastTimestampSampleTimeUs:J

    .line 1089
    return-void
.end method

.method private setVolumeInternal()V
    .locals 2

    .prologue
    .line 856
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 863
    :goto_0
    return-void

    .line 858
    :cond_0
    sget v0, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_1

    .line 859
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    iget v1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->volume:F

    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/audio/AudioTrack;->setVolumeInternalV21(Landroid/media/AudioTrack;F)V

    goto :goto_0

    .line 861
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    iget v1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->volume:F

    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/audio/AudioTrack;->setVolumeInternalV3(Landroid/media/AudioTrack;F)V

    goto :goto_0
.end method

.method private static setVolumeInternalV21(Landroid/media/AudioTrack;F)V
    .locals 0
    .param p0, "audioTrack"    # Landroid/media/AudioTrack;
    .param p1, "volume"    # F
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 1283
    invoke-virtual {p0, p1}, Landroid/media/AudioTrack;->setVolume(F)I

    .line 1284
    return-void
.end method

.method private static setVolumeInternalV3(Landroid/media/AudioTrack;F)V
    .locals 0
    .param p0, "audioTrack"    # Landroid/media/AudioTrack;
    .param p1, "volume"    # F

    .prologue
    .line 1288
    invoke-virtual {p0, p1, p1}, Landroid/media/AudioTrack;->setStereoVolume(FF)I

    .line 1289
    return-void
.end method

.method private writeBuffer(Ljava/nio/ByteBuffer;J)Z
    .locals 18
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "presentationTimeUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/audio/AudioTrack$WriteException;
        }
    .end annotation

    .prologue
    .line 636
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->currentSourceBuffer:Ljava/nio/ByteBuffer;

    if-nez v2, :cond_1

    const/4 v11, 0x1

    .line 637
    .local v11, "isNewSourceBuffer":Z
    :goto_0
    if-nez v11, :cond_0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->currentSourceBuffer:Ljava/nio/ByteBuffer;

    move-object/from16 v0, p1

    if-ne v2, v0, :cond_2

    :cond_0
    const/4 v2, 0x1

    :goto_1
    invoke-static {v2}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 638
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer2/audio/AudioTrack;->currentSourceBuffer:Ljava/nio/ByteBuffer;

    .line 640
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->needsPassthroughWorkarounds()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 643
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v2}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_3

    .line 644
    const/4 v2, 0x0

    .line 747
    :goto_2
    return v2

    .line 636
    .end local v11    # "isNewSourceBuffer":Z
    :cond_1
    const/4 v11, 0x0

    goto :goto_0

    .line 637
    .restart local v11    # "isNewSourceBuffer":Z
    :cond_2
    const/4 v2, 0x0

    goto :goto_1

    .line 650
    :cond_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v2}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    .line 651
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;->getPlaybackHeadPosition()J

    move-result-wide v2

    const-wide/16 v6, 0x0

    cmp-long v2, v2, v6

    if-eqz v2, :cond_4

    .line 652
    const/4 v2, 0x0

    goto :goto_2

    .line 656
    :cond_4
    if-eqz v11, :cond_b

    .line 659
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->currentSourceBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-nez v2, :cond_5

    .line 661
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->currentSourceBuffer:Ljava/nio/ByteBuffer;

    .line 662
    const/4 v2, 0x1

    goto :goto_2

    .line 665
    :cond_5
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->targetEncoding:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->sourceEncoding:I

    if-eq v2, v3, :cond_f

    const/4 v2, 0x1

    :goto_3
    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->useResampledBuffer:Z

    .line 666
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->useResampledBuffer:Z

    if-eqz v2, :cond_6

    .line 667
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->targetEncoding:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_10

    const/4 v2, 0x1

    :goto_4
    invoke-static {v2}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 669
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->currentSourceBuffer:Ljava/nio/ByteBuffer;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->sourceEncoding:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->resampledBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v2, v3, v4}, Lcom/google/android/exoplayer2/audio/AudioTrack;->resampleTo16BitPcm(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->resampledBuffer:Ljava/nio/ByteBuffer;

    .line 670
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->resampledBuffer:Ljava/nio/ByteBuffer;

    move-object/from16 p1, v0

    .line 673
    :cond_6
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->passthrough:Z

    if-eqz v2, :cond_7

    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->framesPerEncodedSample:I

    if-nez v2, :cond_7

    .line 675
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->targetEncoding:I

    move-object/from16 v0, p1

    invoke-static {v2, v0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->getFramesPerEncodedSample(ILjava/nio/ByteBuffer;)I

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->framesPerEncodedSample:I

    .line 677
    :cond_7
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeState:I

    if-nez v2, :cond_11

    .line 678
    const-wide/16 v2, 0x0

    move-wide/from16 v0, p2

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeUs:J

    .line 679
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeState:I

    .line 698
    :cond_8
    :goto_5
    sget v2, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v3, 0x15

    if-ge v2, v3, :cond_b

    .line 700
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    .line 701
    .local v5, "bytesRemaining":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->temporaryBuffer:[B

    if-eqz v2, :cond_9

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->temporaryBuffer:[B

    array-length v2, v2

    if-ge v2, v5, :cond_a

    .line 702
    :cond_9
    new-array v2, v5, [B

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->temporaryBuffer:[B

    .line 704
    :cond_a
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v14

    .line 705
    .local v14, "originalPosition":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->temporaryBuffer:[B

    const/4 v3, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v5}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 706
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 707
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->temporaryBufferOffset:I

    .line 711
    .end local v5    # "bytesRemaining":I
    .end local v14    # "originalPosition":I
    :cond_b
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->useResampledBuffer:Z

    if-eqz v2, :cond_c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->resampledBuffer:Ljava/nio/ByteBuffer;

    move-object/from16 p1, v0

    .line 712
    :cond_c
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    .line 713
    .restart local v5    # "bytesRemaining":I
    const/4 v10, 0x0

    .line 714
    .local v10, "bytesWritten":I
    sget v2, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v3, 0x15

    if-ge v2, v3, :cond_13

    .line 716
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->submittedPcmBytes:J

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    .line 717
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;->getPlaybackHeadPosition()J

    move-result-wide v6

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->pcmFrameSize:I

    int-to-long v0, v4

    move-wide/from16 v16, v0

    mul-long v6, v6, v16

    sub-long/2addr v2, v6

    long-to-int v8, v2

    .line 718
    .local v8, "bytesPending":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bufferSize:I

    sub-int v9, v2, v8

    .line 719
    .local v9, "bytesToWrite":I
    if-lez v9, :cond_e

    .line 720
    invoke-static {v5, v9}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 721
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->temporaryBuffer:[B

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->temporaryBufferOffset:I

    invoke-virtual {v2, v3, v4, v9}, Landroid/media/AudioTrack;->write([BII)I

    move-result v10

    .line 722
    if-ltz v10, :cond_d

    .line 723
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->temporaryBufferOffset:I

    add-int/2addr v2, v10

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->temporaryBufferOffset:I

    .line 725
    :cond_d
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/2addr v2, v10

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 733
    .end local v8    # "bytesPending":I
    .end local v9    # "bytesToWrite":I
    :cond_e
    :goto_6
    if-gez v10, :cond_15

    .line 734
    new-instance v2, Lcom/google/android/exoplayer2/audio/AudioTrack$WriteException;

    invoke-direct {v2, v10}, Lcom/google/android/exoplayer2/audio/AudioTrack$WriteException;-><init>(I)V

    throw v2

    .line 665
    .end local v5    # "bytesRemaining":I
    .end local v10    # "bytesWritten":I
    :cond_f
    const/4 v2, 0x0

    goto/16 :goto_3

    .line 667
    :cond_10
    const/4 v2, 0x0

    goto/16 :goto_4

    .line 682
    :cond_11
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeUs:J

    .line 683
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->getSubmittedFrames()J

    move-result-wide v6

    move-object/from16 v0, p0

    invoke-direct {v0, v6, v7}, Lcom/google/android/exoplayer2/audio/AudioTrack;->framesToDurationUs(J)J

    move-result-wide v6

    add-long v12, v2, v6

    .line 684
    .local v12, "expectedPresentationTimeUs":J
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeState:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_12

    sub-long v2, v12, p2

    .line 685
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/32 v6, 0x30d40

    cmp-long v2, v2, v6

    if-lez v2, :cond_12

    .line 686
    const-string/jumbo v2, "AudioTrack"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Discontinuity detected [expected "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", got "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p2

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 688
    const/4 v2, 0x2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeState:I

    .line 690
    :cond_12
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeState:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_8

    .line 693
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeUs:J

    sub-long v6, p2, v12

    add-long/2addr v2, v6

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeUs:J

    .line 694
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeState:I

    .line 695
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->listener:Lcom/google/android/exoplayer2/audio/AudioTrack$Listener;

    invoke-interface {v2}, Lcom/google/android/exoplayer2/audio/AudioTrack$Listener;->onPositionDiscontinuity()V

    goto/16 :goto_5

    .line 728
    .end local v12    # "expectedPresentationTimeUs":J
    .restart local v5    # "bytesRemaining":I
    .restart local v10    # "bytesWritten":I
    :cond_13
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->tunneling:Z

    if-eqz v2, :cond_14

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    move-object/from16 v2, p0

    move-object/from16 v4, p1

    move-wide/from16 v6, p2

    .line 729
    invoke-direct/range {v2 .. v7}, Lcom/google/android/exoplayer2/audio/AudioTrack;->writeNonBlockingWithAvSyncV21(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;IJ)I

    move-result v10

    .line 730
    :goto_7
    goto/16 :goto_6

    .line 729
    :cond_14
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 730
    move-object/from16 v0, p1

    invoke-static {v2, v0, v5}, Lcom/google/android/exoplayer2/audio/AudioTrack;->writeNonBlockingV21(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I

    move-result v10

    goto :goto_7

    .line 737
    :cond_15
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->passthrough:Z

    if-nez v2, :cond_16

    .line 738
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->submittedPcmBytes:J

    int-to-long v6, v10

    add-long/2addr v2, v6

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->submittedPcmBytes:J

    .line 740
    :cond_16
    if-ne v10, v5, :cond_18

    .line 741
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->passthrough:Z

    if-eqz v2, :cond_17

    .line 742
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->submittedEncodedFrames:J

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->framesPerEncodedSample:I

    int-to-long v6, v4

    add-long/2addr v2, v6

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->submittedEncodedFrames:J

    .line 744
    :cond_17
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->currentSourceBuffer:Ljava/nio/ByteBuffer;

    .line 745
    const/4 v2, 0x1

    goto/16 :goto_2

    .line 747
    :cond_18
    const/4 v2, 0x0

    goto/16 :goto_2
.end method

.method private static writeNonBlockingV21(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I
    .locals 1
    .param p0, "audioTrack"    # Landroid/media/AudioTrack;
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "size"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 1239
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I

    move-result v0

    return v0
.end method

.method private writeNonBlockingWithAvSyncV21(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;IJ)I
    .locals 8
    .param p1, "audioTrack"    # Landroid/media/AudioTrack;
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;
    .param p3, "size"    # I
    .param p4, "presentationTimeUs"    # J
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1250
    iget-object v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->avSyncHeader:Ljava/nio/ByteBuffer;

    if-nez v3, :cond_0

    .line 1251
    const/16 v3, 0x10

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->avSyncHeader:Ljava/nio/ByteBuffer;

    .line 1252
    iget-object v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->avSyncHeader:Ljava/nio/ByteBuffer;

    sget-object v4, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 1253
    iget-object v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->avSyncHeader:Ljava/nio/ByteBuffer;

    const v4, 0x55550001

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1255
    :cond_0
    iget v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bytesUntilNextAvSync:I

    if-nez v3, :cond_1

    .line 1256
    iget-object v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->avSyncHeader:Ljava/nio/ByteBuffer;

    const/4 v4, 0x4

    invoke-virtual {v3, v4, p3}, Ljava/nio/ByteBuffer;->putInt(II)Ljava/nio/ByteBuffer;

    .line 1257
    iget-object v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->avSyncHeader:Ljava/nio/ByteBuffer;

    const/16 v4, 0x8

    const-wide/16 v6, 0x3e8

    mul-long/2addr v6, p4

    invoke-virtual {v3, v4, v6, v7}, Ljava/nio/ByteBuffer;->putLong(IJ)Ljava/nio/ByteBuffer;

    .line 1258
    iget-object v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->avSyncHeader:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 1259
    iput p3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bytesUntilNextAvSync:I

    .line 1261
    :cond_1
    iget-object v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->avSyncHeader:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    .line 1262
    .local v0, "avSyncHeaderBytesRemaining":I
    if-lez v0, :cond_4

    .line 1263
    iget-object v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->avSyncHeader:Ljava/nio/ByteBuffer;

    const/4 v4, 0x1

    invoke-virtual {p1, v3, v0, v4}, Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I

    move-result v1

    .line 1264
    .local v1, "result":I
    if-gez v1, :cond_3

    .line 1265
    iput v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bytesUntilNextAvSync:I

    move v2, v1

    .line 1278
    :cond_2
    :goto_0
    return v2

    .line 1268
    :cond_3
    if-lt v1, v0, :cond_2

    .line 1272
    .end local v1    # "result":I
    :cond_4
    invoke-static {p1, p2, p3}, Lcom/google/android/exoplayer2/audio/AudioTrack;->writeNonBlockingV21(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I

    move-result v1

    .line 1273
    .restart local v1    # "result":I
    if-gez v1, :cond_5

    .line 1274
    iput v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bytesUntilNextAvSync:I

    move v2, v1

    .line 1275
    goto :goto_0

    .line 1277
    :cond_5
    iget v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bytesUntilNextAvSync:I

    sub-int/2addr v2, v1

    iput v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bytesUntilNextAvSync:I

    move v2, v1

    .line 1278
    goto :goto_0
.end method


# virtual methods
.method public configure(Ljava/lang/String;IIII)V
    .locals 16
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "channelCount"    # I
    .param p3, "sampleRate"    # I
    .param p4, "pcmEncoding"    # I
    .param p5, "specifiedBufferSize"    # I

    .prologue
    .line 421
    packed-switch p2, :pswitch_data_0

    .line 447
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Unsupported channel count: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move/from16 v0, p2

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 423
    :pswitch_0
    const/4 v2, 0x4

    .line 451
    .local v2, "channelConfig":I
    :goto_0
    sget v9, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v10, 0x17

    if-gt v9, v10, :cond_0

    const-string/jumbo v9, "foster"

    sget-object v10, Lcom/google/android/exoplayer2/util/Util;->DEVICE:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    const-string/jumbo v9, "NVIDIA"

    sget-object v10, Lcom/google/android/exoplayer2/util/Util;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 452
    packed-switch p2, :pswitch_data_1

    .line 465
    :cond_0
    :goto_1
    :pswitch_1
    const-string/jumbo v9, "audio/raw"

    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    const/4 v7, 0x1

    .line 469
    .local v7, "passthrough":Z
    :goto_2
    sget v9, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v10, 0x19

    if-gt v9, v10, :cond_1

    const-string/jumbo v9, "fugu"

    sget-object v10, Lcom/google/android/exoplayer2/util/Util;->DEVICE:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    if-eqz v7, :cond_1

    const/4 v9, 0x1

    move/from16 v0, p2

    if-ne v0, v9, :cond_1

    .line 470
    const/16 v2, 0xc

    .line 474
    :cond_1
    if-eqz v7, :cond_3

    .line 475
    invoke-static/range {p1 .. p1}, Lcom/google/android/exoplayer2/audio/AudioTrack;->getEncodingForMimeType(Ljava/lang/String;)I

    move-result v8

    .line 483
    .local v8, "sourceEncoding":I
    :goto_3
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->isInitialized()Z

    move-result v9

    if-eqz v9, :cond_6

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->sourceEncoding:I

    if-ne v9, v8, :cond_6

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->sampleRate:I

    move/from16 v0, p3

    if-ne v9, v0, :cond_6

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->channelConfig:I

    if-ne v9, v2, :cond_6

    .line 523
    .end local v8    # "sourceEncoding":I
    :goto_4
    return-void

    .line 426
    .end local v2    # "channelConfig":I
    .end local v7    # "passthrough":Z
    :pswitch_2
    const/16 v2, 0xc

    .line 427
    .restart local v2    # "channelConfig":I
    goto :goto_0

    .line 429
    .end local v2    # "channelConfig":I
    :pswitch_3
    const/16 v2, 0x1c

    .line 430
    .restart local v2    # "channelConfig":I
    goto :goto_0

    .line 432
    .end local v2    # "channelConfig":I
    :pswitch_4
    const/16 v2, 0xcc

    .line 433
    .restart local v2    # "channelConfig":I
    goto :goto_0

    .line 435
    .end local v2    # "channelConfig":I
    :pswitch_5
    const/16 v2, 0xdc

    .line 436
    .restart local v2    # "channelConfig":I
    goto :goto_0

    .line 438
    .end local v2    # "channelConfig":I
    :pswitch_6
    const/16 v2, 0xfc

    .line 439
    .restart local v2    # "channelConfig":I
    goto :goto_0

    .line 441
    .end local v2    # "channelConfig":I
    :pswitch_7
    const/16 v2, 0x4fc

    .line 442
    .restart local v2    # "channelConfig":I
    goto :goto_0

    .line 444
    .end local v2    # "channelConfig":I
    :pswitch_8
    sget v2, Lcom/google/android/exoplayer2/C;->CHANNEL_OUT_7POINT1_SURROUND:I

    .line 445
    .restart local v2    # "channelConfig":I
    goto :goto_0

    .line 454
    :pswitch_9
    sget v2, Lcom/google/android/exoplayer2/C;->CHANNEL_OUT_7POINT1_SURROUND:I

    .line 455
    goto :goto_1

    .line 458
    :pswitch_a
    const/16 v2, 0xfc

    .line 459
    goto :goto_1

    .line 465
    :cond_2
    const/4 v7, 0x0

    goto :goto_2

    .line 476
    .restart local v7    # "passthrough":Z
    :cond_3
    const/4 v9, 0x3

    move/from16 v0, p4

    if-eq v0, v9, :cond_4

    const/4 v9, 0x2

    move/from16 v0, p4

    if-eq v0, v9, :cond_4

    const/high16 v9, -0x80000000

    move/from16 v0, p4

    if-eq v0, v9, :cond_4

    const/high16 v9, 0x40000000    # 2.0f

    move/from16 v0, p4

    if-ne v0, v9, :cond_5

    .line 478
    :cond_4
    move/from16 v8, p4

    .restart local v8    # "sourceEncoding":I
    goto :goto_3

    .line 480
    .end local v8    # "sourceEncoding":I
    :cond_5
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Unsupported PCM encoding: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move/from16 v0, p4

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 489
    .restart local v8    # "sourceEncoding":I
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->reset()V

    .line 491
    move-object/from16 v0, p0

    iput v8, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->sourceEncoding:I

    .line 492
    move-object/from16 v0, p0

    iput-boolean v7, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->passthrough:Z

    .line 493
    move/from16 v0, p3

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer2/audio/AudioTrack;->sampleRate:I

    .line 494
    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->channelConfig:I

    .line 495
    if-eqz v7, :cond_7

    .end local v8    # "sourceEncoding":I
    :goto_5
    move-object/from16 v0, p0

    iput v8, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->targetEncoding:I

    .line 496
    mul-int/lit8 v9, p2, 0x2

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->pcmFrameSize:I

    .line 498
    if-eqz p5, :cond_8

    .line 499
    move/from16 v0, p5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer2/audio/AudioTrack;->bufferSize:I

    .line 522
    :goto_6
    if-eqz v7, :cond_f

    const-wide v10, -0x7fffffffffffffffL    # -4.9E-324

    :goto_7
    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bufferSizeUs:J

    goto/16 :goto_4

    .line 495
    .restart local v8    # "sourceEncoding":I
    :cond_7
    const/4 v8, 0x2

    goto :goto_5

    .line 500
    .end local v8    # "sourceEncoding":I
    :cond_8
    if-eqz v7, :cond_b

    .line 503
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->targetEncoding:I

    const/4 v10, 0x5

    if-eq v9, v10, :cond_9

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->targetEncoding:I

    const/4 v10, 0x6

    if-ne v9, v10, :cond_a

    .line 505
    :cond_9
    const/16 v9, 0x5000

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bufferSize:I

    goto :goto_6

    .line 508
    :cond_a
    const v9, 0xc000

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bufferSize:I

    goto :goto_6

    .line 511
    :cond_b
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->targetEncoding:I

    .line 512
    move/from16 v0, p3

    invoke-static {v0, v2, v9}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v5

    .line 513
    .local v5, "minBufferSize":I
    const/4 v9, -0x2

    if-eq v5, v9, :cond_c

    const/4 v9, 0x1

    :goto_8
    invoke-static {v9}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 514
    mul-int/lit8 v6, v5, 0x4

    .line 515
    .local v6, "multipliedBufferSize":I
    const-wide/32 v10, 0x3d090

    move-object/from16 v0, p0

    invoke-direct {v0, v10, v11}, Lcom/google/android/exoplayer2/audio/AudioTrack;->durationUsToFrames(J)J

    move-result-wide v10

    long-to-int v9, v10

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->pcmFrameSize:I

    mul-int v4, v9, v10

    .line 516
    .local v4, "minAppBufferSize":I
    int-to-long v10, v5

    const-wide/32 v12, 0xb71b0

    .line 517
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lcom/google/android/exoplayer2/audio/AudioTrack;->durationUsToFrames(J)J

    move-result-wide v12

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->pcmFrameSize:I

    int-to-long v14, v9

    mul-long/2addr v12, v14

    .line 516
    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    long-to-int v3, v10

    .line 518
    .local v3, "maxAppBufferSize":I
    if-ge v6, v4, :cond_d

    .end local v4    # "minAppBufferSize":I
    :goto_9
    move-object/from16 v0, p0

    iput v4, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bufferSize:I

    goto :goto_6

    .line 513
    .end local v3    # "maxAppBufferSize":I
    .end local v6    # "multipliedBufferSize":I
    :cond_c
    const/4 v9, 0x0

    goto :goto_8

    .line 518
    .restart local v3    # "maxAppBufferSize":I
    .restart local v4    # "minAppBufferSize":I
    .restart local v6    # "multipliedBufferSize":I
    :cond_d
    if-le v6, v3, :cond_e

    move v4, v3

    goto :goto_9

    :cond_e
    move v4, v6

    goto :goto_9

    .line 522
    .end local v3    # "maxAppBufferSize":I
    .end local v4    # "minAppBufferSize":I
    .end local v5    # "minBufferSize":I
    .end local v6    # "multipliedBufferSize":I
    :cond_f
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bufferSize:I

    int-to-long v10, v9

    move-object/from16 v0, p0

    invoke-direct {v0, v10, v11}, Lcom/google/android/exoplayer2/audio/AudioTrack;->pcmBytesToFrames(J)J

    move-result-wide v10

    move-object/from16 v0, p0

    invoke-direct {v0, v10, v11}, Lcom/google/android/exoplayer2/audio/AudioTrack;->framesToDurationUs(J)J

    move-result-wide v10

    goto :goto_7

    .line 421
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch

    .line 452
    :pswitch_data_1
    .packed-switch 0x3
        :pswitch_a
        :pswitch_1
        :pswitch_a
        :pswitch_1
        :pswitch_9
    .end packed-switch
.end method

.method public disableTunneling()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 836
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->tunneling:Z

    if-eqz v0, :cond_0

    .line 837
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->tunneling:Z

    .line 838
    iput v1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioSessionId:I

    .line 839
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->reset()V

    .line 841
    :cond_0
    return-void
.end method

.method public enableTunnelingV21(I)V
    .locals 3
    .param p1, "tunnelingAudioSessionId"    # I

    .prologue
    const/4 v1, 0x1

    .line 823
    sget v0, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v0, v2, :cond_2

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 824
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->tunneling:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioSessionId:I

    if-eq v0, p1, :cond_1

    .line 825
    :cond_0
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->tunneling:Z

    .line 826
    iput p1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioSessionId:I

    .line 827
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->reset()V

    .line 829
    :cond_1
    return-void

    .line 823
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCurrentPositionUs(Z)J
    .locals 18
    .param p1, "sourceEnded"    # Z

    .prologue
    .line 368
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->hasCurrentPositionUs()Z

    move-result v14

    if-nez v14, :cond_1

    .line 369
    const-wide/high16 v6, -0x8000000000000000L

    .line 403
    :cond_0
    :goto_0
    return-wide v6

    .line 372
    :cond_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v14}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v14

    const/4 v15, 0x3

    if-ne v14, v15, :cond_2

    .line 373
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->maybeSampleSyncParams()V

    .line 376
    :cond_2
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    div-long v12, v14, v16

    .line 378
    .local v12, "systemClockUs":J
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTimestampSet:Z

    if-eqz v14, :cond_3

    .line 380
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v14}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;->getTimestampNanoTime()J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    div-long v14, v14, v16

    sub-long v10, v12, v14

    .line 382
    .local v10, "presentationDiff":J
    long-to-float v14, v10

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    .line 383
    invoke-virtual {v15}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;->getPlaybackSpeed()F

    move-result v15

    mul-float/2addr v14, v15

    float-to-long v2, v14

    .line 384
    .local v2, "actualSpeedPresentationDiff":J
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/google/android/exoplayer2/audio/AudioTrack;->durationUsToFrames(J)J

    move-result-wide v8

    .line 386
    .local v8, "framesDiff":J
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v14}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;->getTimestampFramePosition()J

    move-result-wide v14

    add-long v4, v14, v8

    .line 387
    .local v4, "currentFramePosition":J
    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/google/android/exoplayer2/audio/AudioTrack;->framesToDurationUs(J)J

    move-result-wide v14

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeUs:J

    move-wide/from16 v16, v0

    add-long v6, v14, v16

    .line 388
    .local v6, "currentPositionUs":J
    goto :goto_0

    .line 389
    .end local v2    # "actualSpeedPresentationDiff":J
    .end local v4    # "currentFramePosition":J
    .end local v6    # "currentPositionUs":J
    .end local v8    # "framesDiff":J
    .end local v10    # "presentationDiff":J
    :cond_3
    move-object/from16 v0, p0

    iget v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->playheadOffsetCount:I

    if-nez v14, :cond_4

    .line 391
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v14}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;->getPlaybackHeadPositionUs()J

    move-result-wide v14

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeUs:J

    move-wide/from16 v16, v0

    add-long v6, v14, v16

    .line 398
    .restart local v6    # "currentPositionUs":J
    :goto_1
    if-nez p1, :cond_0

    .line 399
    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->latencyUs:J

    sub-long/2addr v6, v14

    goto :goto_0

    .line 396
    .end local v6    # "currentPositionUs":J
    :cond_4
    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->smoothedPlayheadOffsetUs:J

    add-long/2addr v14, v12

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeUs:J

    move-wide/from16 v16, v0

    add-long v6, v14, v16

    .restart local v6    # "currentPositionUs":J
    goto :goto_1
.end method

.method public handleBuffer(Ljava/nio/ByteBuffer;J)Z
    .locals 8
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "presentationTimeUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/audio/AudioTrack$InitializationException;,
            Lcom/google/android/exoplayer2/audio/AudioTrack$WriteException;
        }
    .end annotation

    .prologue
    .line 616
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 617
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->initialize()V

    .line 618
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->playing:Z

    if-eqz v0, :cond_0

    .line 619
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->play()V

    .line 623
    :cond_0
    iget-boolean v6, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->hasData:Z

    .line 624
    .local v6, "hadData":Z
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->hasPendingData()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->hasData:Z

    .line 625
    if-eqz v6, :cond_1

    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->hasData:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    .line 626
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->lastFeedElapsedRealtimeMs:J

    sub-long v4, v0, v2

    .line 627
    .local v4, "elapsedSinceLastFeedMs":J
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->listener:Lcom/google/android/exoplayer2/audio/AudioTrack$Listener;

    iget v1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bufferSize:I

    iget-wide v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bufferSizeUs:J

    invoke-static {v2, v3}, Lcom/google/android/exoplayer2/C;->usToMs(J)J

    move-result-wide v2

    invoke-interface/range {v0 .. v5}, Lcom/google/android/exoplayer2/audio/AudioTrack$Listener;->onUnderrun(IJJ)V

    .line 629
    .end local v4    # "elapsedSinceLastFeedMs":J
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/exoplayer2/audio/AudioTrack;->writeBuffer(Ljava/nio/ByteBuffer;J)Z

    move-result v7

    .line 630
    .local v7, "result":Z
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->lastFeedElapsedRealtimeMs:J

    .line 631
    return v7
.end method

.method public handleDiscontinuity()V
    .locals 2

    .prologue
    .line 591
    iget v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 592
    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeState:I

    .line 594
    :cond_0
    return-void
.end method

.method public handleEndOfStream()V
    .locals 4

    .prologue
    .line 754
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 755
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->getSubmittedFrames()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;->handleEndOfStream(J)V

    .line 756
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bytesUntilNextAvSync:I

    .line 758
    :cond_0
    return-void
.end method

.method public hasPendingData()Z
    .locals 4

    .prologue
    .line 764
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 765
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->getSubmittedFrames()J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v2}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;->getPlaybackHeadPosition()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 766
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->overrideHasPendingData()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPassthroughSupported(Ljava/lang/String;)Z
    .locals 2
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 352
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioCapabilities:Lcom/google/android/exoplayer2/audio/AudioCapabilities;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioCapabilities:Lcom/google/android/exoplayer2/audio/AudioCapabilities;

    .line 353
    invoke-static {p1}, Lcom/google/android/exoplayer2/audio/AudioTrack;->getEncodingForMimeType(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/audio/AudioCapabilities;->supportsEncoding(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public pause()V
    .locals 1

    .prologue
    .line 869
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->playing:Z

    .line 870
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 871
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->resetSyncParams()V

    .line 872
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;->pause()V

    .line 874
    :cond_0
    return-void
.end method

.method public play()V
    .locals 4

    .prologue
    .line 579
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->playing:Z

    .line 580
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 581
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->resumeSystemTimeUs:J

    .line 582
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 584
    :cond_0
    return-void
.end method

.method public release()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 921
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->reset()V

    .line 922
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->releaseKeepSessionIdAudioTrack()V

    .line 923
    iput v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioSessionId:I

    .line 924
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->playing:Z

    .line 925
    return-void
.end method

.method public reset()V
    .locals 8

    .prologue
    const-wide/16 v6, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 884
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->isInitialized()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 885
    iput-wide v6, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->submittedPcmBytes:J

    .line 886
    iput-wide v6, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->submittedEncodedFrames:J

    .line 887
    iput v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->framesPerEncodedSample:I

    .line 888
    iput-object v4, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->currentSourceBuffer:Ljava/nio/ByteBuffer;

    .line 889
    iput-object v4, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->avSyncHeader:Ljava/nio/ByteBuffer;

    .line 890
    iput v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->bytesUntilNextAvSync:I

    .line 891
    iput v3, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->startMediaTimeState:I

    .line 892
    iput-wide v6, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->latencyUs:J

    .line 893
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->resetSyncParams()V

    .line 894
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v2}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v0

    .line 895
    .local v0, "playState":I
    const/4 v2, 0x3

    if-ne v0, v2, :cond_0

    .line 896
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v2}, Landroid/media/AudioTrack;->pause()V

    .line 899
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 900
    .local v1, "toRelease":Landroid/media/AudioTrack;
    iput-object v4, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 901
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v2, v4, v3}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;->reconfigure(Landroid/media/AudioTrack;Z)V

    .line 902
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->releasingConditionVariable:Landroid/os/ConditionVariable;

    invoke-virtual {v2}, Landroid/os/ConditionVariable;->close()V

    .line 903
    new-instance v2, Lcom/google/android/exoplayer2/audio/AudioTrack$1;

    invoke-direct {v2, p0, v1}, Lcom/google/android/exoplayer2/audio/AudioTrack$1;-><init>(Lcom/google/android/exoplayer2/audio/AudioTrack;Landroid/media/AudioTrack;)V

    .line 913
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/audio/AudioTrack$1;->start()V

    .line 915
    .end local v0    # "playState":I
    .end local v1    # "toRelease":Landroid/media/AudioTrack;
    :cond_1
    return-void
.end method

.method public setAudioSessionId(I)V
    .locals 1
    .param p1, "audioSessionId"    # I

    .prologue
    .line 809
    iget v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioSessionId:I

    if-eq v0, p1, :cond_0

    .line 810
    iput p1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioSessionId:I

    .line 811
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->reset()V

    .line 813
    :cond_0
    return-void
.end method

.method public setPlaybackParams(Landroid/media/PlaybackParams;)V
    .locals 1
    .param p1, "playbackParams"    # Landroid/media/PlaybackParams;

    .prologue
    .line 778
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/audio/AudioTrack$AudioTrackUtil;->setPlaybackParams(Landroid/media/PlaybackParams;)V

    .line 779
    return-void
.end method

.method public setStreamType(I)V
    .locals 1
    .param p1, "streamType"    # I

    .prologue
    .line 793
    iget v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->streamType:I

    if-ne v0, p1, :cond_1

    .line 803
    :cond_0
    :goto_0
    return-void

    .line 796
    :cond_1
    iput p1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->streamType:I

    .line 797
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->tunneling:Z

    if-nez v0, :cond_0

    .line 801
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->reset()V

    .line 802
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->audioSessionId:I

    goto :goto_0
.end method

.method public setVolume(F)V
    .locals 1
    .param p1, "volume"    # F

    .prologue
    .line 849
    iget v0, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->volume:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 850
    iput p1, p0, Lcom/google/android/exoplayer2/audio/AudioTrack;->volume:F

    .line 851
    invoke-direct {p0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->setVolumeInternal()V

    .line 853
    :cond_0
    return-void
.end method
