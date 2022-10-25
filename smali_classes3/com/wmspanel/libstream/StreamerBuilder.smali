.class public abstract Lcom/wmspanel/libstream/StreamerBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "StreamerBuilder"


# instance fields
.field protected final MIN_BUFFER_ITEMS:I

.field protected mAudioConfig:Lcom/wmspanel/libstream/AudioConfig;

.field protected mContext:Landroid/content/Context;

.field protected mListener:Lcom/wmspanel/libstream/Streamer$Listener;

.field protected mMaxBufferItems:I

.field protected mUserAgent:Ljava/lang/String;

.field protected mVideoConfig:Lcom/wmspanel/libstream/VideoConfig;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const-string/jumbo v0, "Larix/1.0.28"

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mUserAgent:Ljava/lang/String;

    .line 23
    const/16 v0, 0xc8

    iput v0, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mMaxBufferItems:I

    .line 24
    const/16 v0, 0x46

    iput v0, p0, Lcom/wmspanel/libstream/StreamerBuilder;->MIN_BUFFER_ITEMS:I

    return-void
.end method


# virtual methods
.method public abstract build()Lcom/wmspanel/libstream/Streamer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method protected createAudioEncoder()Lcom/wmspanel/libstream/AudioEncoder;
    .locals 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mAudioConfig:Lcom/wmspanel/libstream/AudioConfig;

    if-nez v0, :cond_0

    .line 69
    const-string/jumbo v0, "StreamerBuilder"

    const-string/jumbo v1, "Build failed: audio config is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    const/4 v0, 0x0

    .line 75
    :goto_0
    return-object v0

    .line 73
    :cond_0
    new-instance v0, Lcom/wmspanel/libstream/AudioEncoderBuilder;

    invoke-direct {v0}, Lcom/wmspanel/libstream/AudioEncoderBuilder;-><init>()V

    .line 74
    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mAudioConfig:Lcom/wmspanel/libstream/AudioConfig;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/AudioEncoderBuilder;->setConfig(Lcom/wmspanel/libstream/AudioConfig;)V

    .line 75
    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoderBuilder;->build()Lcom/wmspanel/libstream/AudioEncoder;

    move-result-object v0

    goto :goto_0
.end method

.method protected createVideoEncoder()Lcom/wmspanel/libstream/VideoEncoder;
    .locals 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mVideoConfig:Lcom/wmspanel/libstream/VideoConfig;

    if-nez v0, :cond_0

    .line 58
    const-string/jumbo v0, "StreamerBuilder"

    const-string/jumbo v1, "Build failed: video config is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    const/4 v0, 0x0

    .line 64
    :goto_0
    return-object v0

    .line 62
    :cond_0
    new-instance v0, Lcom/wmspanel/libstream/VideoEncoderBuilder;

    invoke-direct {v0}, Lcom/wmspanel/libstream/VideoEncoderBuilder;-><init>()V

    .line 63
    iget-object v1, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mVideoConfig:Lcom/wmspanel/libstream/VideoConfig;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoEncoderBuilder;->setConfig(Lcom/wmspanel/libstream/VideoConfig;)V

    .line 64
    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoEncoderBuilder;->build()Lcom/wmspanel/libstream/VideoEncoder;

    move-result-object v0

    goto :goto_0
.end method

.method public setAudioConfig(Lcom/wmspanel/libstream/AudioConfig;)V
    .locals 0
    .param p1, "audioConfig"    # Lcom/wmspanel/libstream/AudioConfig;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mAudioConfig:Lcom/wmspanel/libstream/AudioConfig;

    .line 41
    return-void
.end method

.method public setContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mContext:Landroid/content/Context;

    .line 32
    return-void
.end method

.method protected setEncodingSetup(Lcom/wmspanel/libstream/Streamer;)V
    .locals 1
    .param p1, "streamer"    # Lcom/wmspanel/libstream/Streamer;

    .prologue
    .line 82
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mAudioConfig:Lcom/wmspanel/libstream/AudioConfig;

    invoke-virtual {p1, v0}, Lcom/wmspanel/libstream/Streamer;->setAudioConfig(Lcom/wmspanel/libstream/AudioConfig;)V

    .line 83
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mVideoConfig:Lcom/wmspanel/libstream/VideoConfig;

    invoke-virtual {p1, v0}, Lcom/wmspanel/libstream/Streamer;->setVideoConfig(Lcom/wmspanel/libstream/VideoConfig;)V

    .line 84
    return-void
.end method

.method public setListener(Lcom/wmspanel/libstream/Streamer$Listener;)V
    .locals 0
    .param p1, "listener"    # Lcom/wmspanel/libstream/Streamer$Listener;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    .line 36
    return-void
.end method

.method public setMaxBufferItems(I)V
    .locals 1
    .param p1, "items"    # I

    .prologue
    .line 51
    const/16 v0, 0x46

    if-lt p1, v0, :cond_0

    .line 52
    iput p1, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mMaxBufferItems:I

    .line 54
    :cond_0
    return-void
.end method

.method public setUserAgent(Ljava/lang/String;)V
    .locals 0
    .param p1, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mUserAgent:Ljava/lang/String;

    .line 28
    return-void
.end method

.method public setVideoConfig(Lcom/wmspanel/libstream/VideoConfig;)V
    .locals 0
    .param p1, "videoConfig"    # Lcom/wmspanel/libstream/VideoConfig;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mVideoConfig:Lcom/wmspanel/libstream/VideoConfig;

    .line 46
    return-void
.end method

.method protected verify()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 87
    const/4 v0, 0x1

    .line 89
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mContext:Landroid/content/Context;

    if-nez v2, :cond_0

    .line 91
    const-string/jumbo v0, "StreamerBuilder"

    const-string/jumbo v2, "Build failed: context is null"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 94
    :cond_0
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mUserAgent:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 96
    const-string/jumbo v0, "StreamerBuilder"

    const-string/jumbo v2, "Build failed: user agent is null"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 99
    :cond_1
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    if-nez v2, :cond_2

    .line 101
    const-string/jumbo v0, "StreamerBuilder"

    const-string/jumbo v2, "Build failed: Listener is null"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 104
    :cond_2
    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamerBuilder;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-interface {v2}, Lcom/wmspanel/libstream/Streamer$Listener;->getHandler()Landroid/os/Handler;

    move-result-object v2

    if-nez v2, :cond_3

    .line 106
    const-string/jumbo v0, "StreamerBuilder"

    const-string/jumbo v2, "Build failed: Listener.getHandler() must return nonnull handler"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 109
    :cond_3
    return v0
.end method
