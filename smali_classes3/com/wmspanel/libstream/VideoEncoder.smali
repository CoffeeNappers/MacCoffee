.class public Lcom/wmspanel/libstream/VideoEncoder;
.super Lcom/wmspanel/libstream/MediaCodecState;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoEncoder"


# direct methods
.method constructor <init>(Landroid/media/MediaCodec;Landroid/media/MediaFormat;Landroid/media/MediaCodecInfo$CodecCapabilities;)V
    .locals 1
    .param p1, "encoder"    # Landroid/media/MediaCodec;
    .param p2, "format"    # Landroid/media/MediaFormat;
    .param p3, "cap"    # Landroid/media/MediaCodecInfo$CodecCapabilities;

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/wmspanel/libstream/MediaCodecState;-><init>()V

    .line 16
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    if-nez p3, :cond_1

    .line 17
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 19
    :cond_1
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoEncoder;->mEncoder:Landroid/media/MediaCodec;

    .line 20
    iput-object p2, p0, Lcom/wmspanel/libstream/VideoEncoder;->mFormat:Landroid/media/MediaFormat;

    .line 21
    iput-object p3, p0, Lcom/wmspanel/libstream/VideoEncoder;->mCap:Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 22
    return-void
.end method

.method static createVideoEncoder(Lcom/wmspanel/libstream/Streamer$Size;)Lcom/wmspanel/libstream/VideoEncoder;
    .locals 2
    .param p0, "res"    # Lcom/wmspanel/libstream/Streamer$Size;

    .prologue
    .line 25
    .line 27
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-ge v0, v1, :cond_0

    .line 28
    invoke-static {p0}, Lcom/wmspanel/libstream/VideoEncoder;->createVideoEncoder16(Lcom/wmspanel/libstream/Streamer$Size;)Lcom/wmspanel/libstream/VideoEncoder;

    move-result-object v0

    .line 32
    :goto_0
    return-object v0

    .line 30
    :cond_0
    invoke-static {p0}, Lcom/wmspanel/libstream/VideoEncoder;->createVideoEncoder18(Lcom/wmspanel/libstream/Streamer$Size;)Lcom/wmspanel/libstream/VideoEncoder;

    move-result-object v0

    goto :goto_0
.end method

.method private static createVideoEncoder16(Lcom/wmspanel/libstream/Streamer$Size;)Lcom/wmspanel/libstream/VideoEncoder;
    .locals 11
    .param p0, "res"    # Lcom/wmspanel/libstream/Streamer$Size;

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x0

    .line 85
    .line 89
    :try_start_0
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    move-result v5

    move v4, v3

    move-object v0, v1

    .line 90
    :goto_0
    if-ge v4, v5, :cond_2

    .line 92
    invoke-static {v4}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    move-result-object v6

    .line 93
    invoke-virtual {v6}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v2

    if-nez v2, :cond_1

    .line 90
    :cond_0
    add-int/lit8 v2, v4, 0x1

    move v4, v2

    goto :goto_0

    .line 97
    :cond_1
    invoke-virtual {v6}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v7

    array-length v8, v7

    move v2, v3

    :goto_1
    if-ge v2, v8, :cond_6

    aget-object v9, v7, v2

    .line 98
    const-string/jumbo v10, "video/avc"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 99
    const-string/jumbo v0, "video/avc"

    invoke-virtual {v6, v0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v2

    .line 100
    if-nez v2, :cond_3

    .line 101
    const-string/jumbo v0, "VideoEncoder"

    const-string/jumbo v2, "VideoEncoder16: failed to get codec capabilities"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v1

    .line 137
    :cond_2
    :goto_2
    return-object v0

    .line 110
    :cond_3
    const-string/jumbo v0, "video/avc"

    invoke-static {v0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v6

    .line 111
    if-nez v6, :cond_4

    .line 112
    const-string/jumbo v0, "VideoEncoder"

    const-string/jumbo v2, "VideoEncoder16: failed to create video/avc encoder"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v1

    .line 113
    goto :goto_2

    .line 116
    :cond_4
    const-string/jumbo v0, "video/avc"

    iget v7, p0, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    iget v8, p0, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    invoke-static {v0, v7, v8}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v7

    .line 117
    if-nez v7, :cond_5

    .line 118
    const-string/jumbo v0, "VideoEncoder"

    const-string/jumbo v2, "VideoEncoder16: failed to create video format"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    invoke-virtual {v6}, Landroid/media/MediaCodec;->release()V

    move-object v0, v1

    .line 120
    goto :goto_2

    .line 123
    :cond_5
    new-instance v0, Lcom/wmspanel/libstream/VideoEncoder;

    invoke-direct {v0, v6, v7, v2}, Lcom/wmspanel/libstream/VideoEncoder;-><init>(Landroid/media/MediaCodec;Landroid/media/MediaFormat;Landroid/media/MediaCodecInfo$CodecCapabilities;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    :cond_6
    if-eqz v0, :cond_0

    goto :goto_2

    .line 97
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 133
    :catch_0
    move-exception v0

    .line 134
    const-string/jumbo v2, "VideoEncoder"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v1

    .line 135
    goto :goto_2
.end method

.method private static createVideoEncoder18(Lcom/wmspanel/libstream/Streamer$Size;)Lcom/wmspanel/libstream/VideoEncoder;
    .locals 6
    .param p0, "res"    # Lcom/wmspanel/libstream/Streamer$Size;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 38
    .line 43
    :try_start_0
    const-string/jumbo v1, "video/avc"

    invoke-static {v1}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    .line 44
    if-nez v2, :cond_1

    .line 45
    :try_start_1
    const-string/jumbo v1, "VideoEncoder"

    const-string/jumbo v3, "VideoEncoder18: failed to create video/avc encoder"

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    :cond_0
    :goto_0
    return-object v0

    .line 49
    :cond_1
    invoke-virtual {v2}, Landroid/media/MediaCodec;->getCodecInfo()Landroid/media/MediaCodecInfo;

    move-result-object v1

    .line 50
    if-nez v1, :cond_2

    .line 51
    const-string/jumbo v1, "VideoEncoder"

    const-string/jumbo v3, "VideoEncoder18: failed to get codec info"

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    invoke-virtual {v2}, Landroid/media/MediaCodec;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 72
    :catch_0
    move-exception v1

    .line 73
    :goto_1
    const-string/jumbo v3, "VideoEncoder"

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    if-eqz v2, :cond_0

    .line 75
    invoke-virtual {v2}, Landroid/media/MediaCodec;->release()V

    goto :goto_0

    .line 56
    :cond_2
    :try_start_2
    const-string/jumbo v3, "video/avc"

    invoke-virtual {v1, v3}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v3

    .line 57
    if-nez v3, :cond_3

    .line 58
    const-string/jumbo v1, "VideoEncoder"

    const-string/jumbo v3, "VideoEncoder18: failed to get codec capabilities"

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    invoke-virtual {v2}, Landroid/media/MediaCodec;->release()V

    goto :goto_0

    .line 63
    :cond_3
    const-string/jumbo v1, "video/avc"

    iget v4, p0, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    iget v5, p0, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    invoke-static {v1, v4, v5}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v4

    .line 64
    if-nez v4, :cond_4

    .line 65
    const-string/jumbo v1, "VideoEncoder"

    const-string/jumbo v3, "VideoEncoder18: failed to create video format"

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    invoke-virtual {v2}, Landroid/media/MediaCodec;->release()V

    goto :goto_0

    .line 70
    :cond_4
    new-instance v1, Lcom/wmspanel/libstream/VideoEncoder;

    invoke-direct {v1, v2, v4, v3}, Lcom/wmspanel/libstream/VideoEncoder;-><init>(Landroid/media/MediaCodec;Landroid/media/MediaFormat;Landroid/media/MediaCodecInfo$CodecCapabilities;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-object v0, v1

    .line 80
    goto :goto_0

    .line 72
    :catch_1
    move-exception v1

    move-object v2, v0

    goto :goto_1
.end method

.method private static getCompression(I)I
    .locals 1
    .param p0, "profile"    # I

    .prologue
    .line 148
    .line 153
    sparse-switch p0, :sswitch_data_0

    .line 164
    const/16 v0, 0x1964

    .line 167
    :goto_0
    return v0

    .line 155
    :sswitch_0
    const/16 v0, 0x203a

    .line 156
    goto :goto_0

    .line 159
    :sswitch_1
    const/16 v0, 0x1f40

    .line 160
    goto :goto_0

    .line 153
    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_1
        0x8 -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method changeBitRate(I)V
    .locals 2
    .param p1, "bitRate"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 202
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoEncoder;->mEncoder:Landroid/media/MediaCodec;

    if-eqz v0, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 204
    :try_start_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 205
    const-string/jumbo v1, "video-bitrate"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 206
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoEncoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v1, v0}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 211
    :cond_0
    :goto_0
    return-void

    .line 207
    :catch_0
    move-exception v0

    .line 208
    const-string/jumbo v1, "VideoEncoder"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method getSupportedColorFormats()[I
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoEncoder;->mCap:Landroid/media/MediaCodecInfo$CodecCapabilities;

    iget-object v0, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    return-object v0
.end method

.method public bridge synthetic release()V
    .locals 0

    .prologue
    .line 12
    invoke-super {p0}, Lcom/wmspanel/libstream/MediaCodecState;->release()V

    return-void
.end method

.method setBitRate(I)V
    .locals 2
    .param p1, "bitRate"    # I

    .prologue
    .line 177
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoEncoder;->mFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "bitrate"

    invoke-virtual {v0, v1, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 178
    return-void
.end method

.method setFrameRate(F)V
    .locals 2
    .param p1, "fps"    # F

    .prologue
    .line 141
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoEncoder;->mFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "frame-rate"

    invoke-virtual {v0, v1, p1}, Landroid/media/MediaFormat;->setFloat(Ljava/lang/String;F)V

    .line 142
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 143
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoEncoder;->mFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "capture-rate"

    invoke-virtual {v0, v1, p1}, Landroid/media/MediaFormat;->setFloat(Ljava/lang/String;F)V

    .line 145
    :cond_0
    return-void
.end method

.method setKeyFrameInterval(I)V
    .locals 2
    .param p1, "keyFrameInterval"    # I

    .prologue
    .line 181
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoEncoder;->mFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "i-frame-interval"

    invoke-virtual {v0, v1, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 182
    return-void
.end method

.method setProfile(Landroid/media/MediaCodecInfo$CodecProfileLevel;)V
    .locals 3
    .param p1, "profileLevel"    # Landroid/media/MediaCodecInfo$CodecProfileLevel;

    .prologue
    .line 185
    if-nez p1, :cond_1

    .line 194
    :cond_0
    :goto_0
    return-void

    .line 188
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_2

    .line 189
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoEncoder;->mFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "profile"

    iget v2, p1, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 191
    :cond_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 192
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoEncoder;->mFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "level"

    iget v2, p1, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    goto :goto_0
.end method
