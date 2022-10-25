.class public Lcom/wmspanel/libstream/StreamerSurfaceBuilder;
.super Lcom/wmspanel/libstream/StreamerBuilder;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "BuilderSurface"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/wmspanel/libstream/StreamerBuilder;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic build()Lcom/wmspanel/libstream/Streamer;
    .locals 1

    .prologue
    .line 7
    invoke-virtual {p0}, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;->build()Lcom/wmspanel/libstream/StreamerSurface;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/wmspanel/libstream/StreamerSurface;
    .locals 1

    .prologue
    .line 12
    sget-object v0, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;->build(Lcom/wmspanel/libstream/Streamer$MODE;)Lcom/wmspanel/libstream/StreamerSurface;

    move-result-object v0

    return-object v0
.end method

.method public build(Lcom/wmspanel/libstream/Streamer$MODE;)Lcom/wmspanel/libstream/StreamerSurface;
    .locals 6
    .param p1, "mode"    # Lcom/wmspanel/libstream/Streamer$MODE;

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 16
    new-instance v4, Lcom/wmspanel/libstream/StreamerSurface;

    iget v0, p0, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;->mMaxBufferItems:I

    invoke-direct {v4, v0}, Lcom/wmspanel/libstream/StreamerSurface;-><init>(I)V

    .line 20
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p0}, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;->verify()Z

    move-result v2

    if-nez v2, :cond_0

    .line 57
    :goto_0
    return-object v3

    .line 27
    :cond_0
    sget-object v2, Lcom/wmspanel/libstream/Streamer$MODE;->VIDEO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq p1, v2, :cond_8

    .line 28
    invoke-virtual {p0}, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;->createAudioEncoder()Lcom/wmspanel/libstream/AudioEncoder;

    move-result-object v2

    .line 29
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/wmspanel/libstream/AudioEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v5

    if-nez v5, :cond_2

    .line 31
    :cond_1
    const-string/jumbo v0, "BuilderSurface"

    const-string/jumbo v5, "Build failed: can\'t create audio encoder"

    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 34
    :cond_2
    :goto_1
    sget-object v5, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_ONLY:Lcom/wmspanel/libstream/Streamer$MODE;

    if-eq p1, v5, :cond_4

    .line 35
    invoke-virtual {p0}, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;->createVideoEncoder()Lcom/wmspanel/libstream/VideoEncoder;

    move-result-object v3

    .line 36
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Lcom/wmspanel/libstream/VideoEncoder;->getEncoder()Landroid/media/MediaCodec;

    move-result-object v5

    if-nez v5, :cond_4

    .line 38
    :cond_3
    const-string/jumbo v0, "BuilderSurface"

    const-string/jumbo v5, "Build failed: can\'t create video encoder"

    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 42
    :cond_4
    if-eqz v0, :cond_6

    .line 43
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v0}, Lcom/wmspanel/libstream/StreamerSurface;->setContext(Landroid/content/Context;)V

    .line 44
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-virtual {v4, v0}, Lcom/wmspanel/libstream/StreamerSurface;->setListener(Lcom/wmspanel/libstream/Streamer$Listener;)V

    .line 45
    invoke-virtual {v4, v3}, Lcom/wmspanel/libstream/StreamerSurface;->setVideoEncoder(Lcom/wmspanel/libstream/VideoEncoder;)V

    .line 46
    invoke-virtual {v4, v2}, Lcom/wmspanel/libstream/StreamerSurface;->setAudioEncoder(Lcom/wmspanel/libstream/AudioEncoder;)V

    .line 47
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;->mUserAgent:Ljava/lang/String;

    invoke-virtual {v4, v0}, Lcom/wmspanel/libstream/StreamerSurface;->setUserAgent(Ljava/lang/String;)V

    .line 48
    invoke-virtual {p0, v4}, Lcom/wmspanel/libstream/StreamerSurfaceBuilder;->setEncodingSetup(Lcom/wmspanel/libstream/Streamer;)V

    :cond_5
    :goto_2
    move-object v3, v4

    .line 57
    goto :goto_0

    .line 50
    :cond_6
    if-eqz v2, :cond_7

    .line 51
    invoke-virtual {v2}, Lcom/wmspanel/libstream/AudioEncoder;->release()V

    .line 53
    :cond_7
    if-eqz v3, :cond_5

    .line 54
    invoke-virtual {v3}, Lcom/wmspanel/libstream/VideoEncoder;->release()V

    goto :goto_2

    :cond_8
    move-object v2, v3

    goto :goto_1
.end method
