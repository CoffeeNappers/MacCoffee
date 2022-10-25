.class public Lcom/wmspanel/libstream/AudioEncoder;
.super Lcom/wmspanel/libstream/MediaCodecState;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioEncoder"


# direct methods
.method private constructor <init>(Landroid/media/MediaCodec;Landroid/media/MediaFormat;Landroid/media/MediaCodecInfo$CodecCapabilities;)V
    .locals 1
    .param p1, "encoder"    # Landroid/media/MediaCodec;
    .param p2, "format"    # Landroid/media/MediaFormat;
    .param p3, "cap"    # Landroid/media/MediaCodecInfo$CodecCapabilities;

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/wmspanel/libstream/MediaCodecState;-><init>()V

    .line 17
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    if-nez p3, :cond_1

    .line 18
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 20
    :cond_1
    iput-object p1, p0, Lcom/wmspanel/libstream/AudioEncoder;->mEncoder:Landroid/media/MediaCodec;

    .line 21
    iput-object p2, p0, Lcom/wmspanel/libstream/AudioEncoder;->mFormat:Landroid/media/MediaFormat;

    .line 22
    iput-object p3, p0, Lcom/wmspanel/libstream/AudioEncoder;->mCap:Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 23
    return-void
.end method

.method public static createAudioEncoder()Lcom/wmspanel/libstream/AudioEncoder;
    .locals 2

    .prologue
    .line 126
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-ge v0, v1, :cond_0

    .line 127
    invoke-static {}, Lcom/wmspanel/libstream/AudioEncoder;->createAudioEncoder16()Lcom/wmspanel/libstream/AudioEncoder;

    move-result-object v0

    .line 131
    :goto_0
    return-object v0

    .line 129
    :cond_0
    invoke-static {}, Lcom/wmspanel/libstream/AudioEncoder;->createAudioEncoder18()Lcom/wmspanel/libstream/AudioEncoder;

    move-result-object v0

    goto :goto_0
.end method

.method private static createAudioEncoder16()Lcom/wmspanel/libstream/AudioEncoder;
    .locals 11

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x0

    .line 30
    :try_start_0
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    move-result v5

    move v4, v3

    move-object v0, v1

    .line 31
    :goto_0
    if-ge v4, v5, :cond_2

    .line 33
    invoke-static {v4}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    move-result-object v6

    .line 34
    invoke-virtual {v6}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v2

    if-nez v2, :cond_1

    .line 31
    :cond_0
    add-int/lit8 v2, v4, 0x1

    move v4, v2

    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {v6}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v7

    array-length v8, v7

    move v2, v3

    :goto_1
    if-ge v2, v8, :cond_6

    aget-object v9, v7, v2

    .line 39
    const-string/jumbo v10, "audio/mp4a-latm"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 40
    const-string/jumbo v0, "audio/mp4a-latm"

    invoke-virtual {v6, v0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v2

    .line 41
    if-nez v2, :cond_3

    .line 42
    const-string/jumbo v0, "AudioEncoder"

    const-string/jumbo v2, "AudioEncoder16: failed to get aac codec capabilities"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v1

    .line 77
    :cond_2
    :goto_2
    return-object v0

    .line 51
    :cond_3
    const-string/jumbo v0, "audio/mp4a-latm"

    invoke-static {v0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v6

    .line 52
    if-nez v6, :cond_4

    .line 53
    const-string/jumbo v0, "AudioEncoder"

    const-string/jumbo v2, "AudioEncoder16: failed to create aac encoder"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v1

    .line 54
    goto :goto_2

    .line 57
    :cond_4
    const-string/jumbo v0, "audio/mp4a-latm"

    const v7, 0xac44

    const/4 v8, 0x1

    invoke-static {v0, v7, v8}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v7

    .line 58
    if-nez v7, :cond_5

    .line 59
    const-string/jumbo v0, "AudioEncoder"

    const-string/jumbo v2, "AudioEncoder16: failed to create audio format"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    invoke-virtual {v6}, Landroid/media/MediaCodec;->release()V

    move-object v0, v1

    .line 61
    goto :goto_2

    .line 64
    :cond_5
    new-instance v0, Lcom/wmspanel/libstream/AudioEncoder;

    invoke-direct {v0, v6, v7, v2}, Lcom/wmspanel/libstream/AudioEncoder;-><init>(Landroid/media/MediaCodec;Landroid/media/MediaFormat;Landroid/media/MediaCodecInfo$CodecCapabilities;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    :cond_6
    if-eqz v0, :cond_0

    goto :goto_2

    .line 38
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 73
    :catch_0
    move-exception v0

    .line 74
    const-string/jumbo v2, "AudioEncoder"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v1

    .line 75
    goto :goto_2
.end method

.method private static createAudioEncoder18()Lcom/wmspanel/libstream/AudioEncoder;
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 88
    :try_start_0
    const-string/jumbo v0, "audio/mp4a-latm"

    invoke-static {v0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v2

    .line 89
    if-nez v2, :cond_0

    .line 90
    const-string/jumbo v0, "AudioEncoder"

    const-string/jumbo v2, "AudioEncoder18: failed to create aac encoder"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    :goto_0
    return-object v1

    .line 94
    :cond_0
    invoke-virtual {v2}, Landroid/media/MediaCodec;->getCodecInfo()Landroid/media/MediaCodecInfo;

    move-result-object v0

    .line 95
    if-nez v0, :cond_1

    .line 96
    const-string/jumbo v0, "AudioEncoder"

    const-string/jumbo v3, "AudioEncoder18: failed to get aac codec info"

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    invoke-virtual {v2}, Landroid/media/MediaCodec;->release()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 117
    :catch_0
    move-exception v0

    .line 118
    const-string/jumbo v2, "AudioEncoder"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v1

    :goto_1
    move-object v1, v0

    .line 121
    goto :goto_0

    .line 101
    :cond_1
    :try_start_1
    const-string/jumbo v3, "audio/mp4a-latm"

    invoke-virtual {v0, v3}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v3

    .line 102
    if-nez v3, :cond_2

    .line 103
    const-string/jumbo v0, "AudioEncoder"

    const-string/jumbo v3, "AudioEncoder18: failed to get aac codec capabilities"

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    invoke-virtual {v2}, Landroid/media/MediaCodec;->release()V

    goto :goto_0

    .line 108
    :cond_2
    const-string/jumbo v0, "audio/mp4a-latm"

    const v4, 0xac44

    const/4 v5, 0x1

    invoke-static {v0, v4, v5}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v4

    .line 109
    if-nez v4, :cond_3

    .line 110
    const-string/jumbo v0, "AudioEncoder"

    const-string/jumbo v3, "AudioEncoder18: failed to create audio format"

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    invoke-virtual {v2}, Landroid/media/MediaCodec;->release()V

    goto :goto_0

    .line 115
    :cond_3
    new-instance v0, Lcom/wmspanel/libstream/AudioEncoder;

    invoke-direct {v0, v2, v4, v3}, Lcom/wmspanel/libstream/AudioEncoder;-><init>(Landroid/media/MediaCodec;Landroid/media/MediaFormat;Landroid/media/MediaCodecInfo$CodecCapabilities;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method


# virtual methods
.method public getChannelCount()I
    .locals 2

    .prologue
    .line 163
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioEncoder;->mFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "channel-count"

    invoke-virtual {v0, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getMaxInputChannelCount()I
    .locals 2

    .prologue
    .line 151
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_0

    .line 152
    const/4 v0, 0x1

    .line 154
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioEncoder;->mCap:Landroid/media/MediaCodecInfo$CodecCapabilities;

    invoke-virtual {v0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getAudioCapabilities()Landroid/media/MediaCodecInfo$AudioCapabilities;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaCodecInfo$AudioCapabilities;->getMaxInputChannelCount()I

    move-result v0

    goto :goto_0
.end method

.method public getSampleRate()I
    .locals 2

    .prologue
    .line 147
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioEncoder;->mFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "sample-rate"

    invoke-virtual {v0, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getSupportedSampleRates()[I
    .locals 3

    .prologue
    .line 135
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_0

    .line 136
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0xac44

    aput v2, v0, v1

    .line 138
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioEncoder;->mCap:Landroid/media/MediaCodecInfo$CodecCapabilities;

    invoke-virtual {v0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getAudioCapabilities()Landroid/media/MediaCodecInfo$AudioCapabilities;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaCodecInfo$AudioCapabilities;->getSupportedSampleRates()[I

    move-result-object v0

    goto :goto_0
.end method

.method public bridge synthetic release()V
    .locals 0

    .prologue
    .line 13
    invoke-super {p0}, Lcom/wmspanel/libstream/MediaCodecState;->release()V

    return-void
.end method

.method public setAACProfile(I)V
    .locals 2
    .param p1, "aacProfile"    # I

    .prologue
    .line 171
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioEncoder;->mFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "aac-profile"

    invoke-virtual {v0, v1, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 172
    return-void
.end method

.method public setBitRate(I)V
    .locals 2
    .param p1, "bitRate"    # I

    .prologue
    .line 167
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioEncoder;->mFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "bitrate"

    invoke-virtual {v0, v1, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 168
    return-void
.end method

.method setBufferSize(I)V
    .locals 2
    .param p1, "bufferSize"    # I

    .prologue
    .line 175
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioEncoder;->mFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "max-input-size"

    invoke-virtual {v0, v1, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 176
    return-void
.end method

.method public setChannelCount(I)V
    .locals 2
    .param p1, "channelCount"    # I

    .prologue
    .line 159
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioEncoder;->mFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "channel-count"

    invoke-virtual {v0, v1, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 160
    return-void
.end method

.method public setSampleRate(I)V
    .locals 2
    .param p1, "sampleRate"    # I

    .prologue
    .line 143
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioEncoder;->mFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "sample-rate"

    invoke-virtual {v0, v1, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 144
    return-void
.end method
