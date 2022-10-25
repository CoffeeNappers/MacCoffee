.class public Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;
.super Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;
.source "MediaCodecAudioRenderer.java"

# interfaces
.implements Lcom/google/android/exoplayer2/util/MediaClock;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer$AudioTrackListener;
    }
.end annotation


# instance fields
.field private allowPositionDiscontinuity:Z

.field private final audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

.field private currentPositionUs:J

.field private final eventDispatcher:Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;

.field private passthroughEnabled:Z

.field private passthroughMediaFormat:Landroid/media/MediaFormat;

.field private pcmEncoding:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;)V
    .locals 2
    .param p1, "mediaCodecSelector"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;

    .prologue
    .line 59
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;-><init>(Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;Lcom/google/android/exoplayer2/drm/DrmSessionManager;Z)V

    .line 60
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;Landroid/os/Handler;Lcom/google/android/exoplayer2/audio/AudioRendererEventListener;)V
    .locals 6
    .param p1, "mediaCodecSelector"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;
    .param p2, "eventHandler"    # Landroid/os/Handler;
    .param p3, "eventListener"    # Lcom/google/android/exoplayer2/audio/AudioRendererEventListener;

    .prologue
    .line 86
    const/4 v2, 0x0

    const/4 v3, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;-><init>(Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;Lcom/google/android/exoplayer2/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer2/audio/AudioRendererEventListener;)V

    .line 87
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;Lcom/google/android/exoplayer2/drm/DrmSessionManager;Z)V
    .locals 6
    .param p1, "mediaCodecSelector"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;
    .param p3, "playClearSamplesWithoutKeys"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;",
            "Lcom/google/android/exoplayer2/drm/DrmSessionManager",
            "<",
            "Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p2, "drmSessionManager":Lcom/google/android/exoplayer2/drm/DrmSessionManager;, "Lcom/google/android/exoplayer2/drm/DrmSessionManager<Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;>;"
    const/4 v4, 0x0

    .line 75
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;-><init>(Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;Lcom/google/android/exoplayer2/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer2/audio/AudioRendererEventListener;)V

    .line 76
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;Lcom/google/android/exoplayer2/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer2/audio/AudioRendererEventListener;)V
    .locals 7
    .param p1, "mediaCodecSelector"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;
    .param p3, "playClearSamplesWithoutKeys"    # Z
    .param p4, "eventHandler"    # Landroid/os/Handler;
    .param p5, "eventListener"    # Lcom/google/android/exoplayer2/audio/AudioRendererEventListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;",
            "Lcom/google/android/exoplayer2/drm/DrmSessionManager",
            "<",
            "Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;",
            ">;Z",
            "Landroid/os/Handler;",
            "Lcom/google/android/exoplayer2/audio/AudioRendererEventListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 106
    .local p2, "drmSessionManager":Lcom/google/android/exoplayer2/drm/DrmSessionManager;, "Lcom/google/android/exoplayer2/drm/DrmSessionManager<Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;>;"
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;-><init>(Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;Lcom/google/android/exoplayer2/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer2/audio/AudioRendererEventListener;Lcom/google/android/exoplayer2/audio/AudioCapabilities;)V

    .line 108
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;Lcom/google/android/exoplayer2/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer2/audio/AudioRendererEventListener;Lcom/google/android/exoplayer2/audio/AudioCapabilities;)V
    .locals 3
    .param p1, "mediaCodecSelector"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;
    .param p3, "playClearSamplesWithoutKeys"    # Z
    .param p4, "eventHandler"    # Landroid/os/Handler;
    .param p5, "eventListener"    # Lcom/google/android/exoplayer2/audio/AudioRendererEventListener;
    .param p6, "audioCapabilities"    # Lcom/google/android/exoplayer2/audio/AudioCapabilities;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;",
            "Lcom/google/android/exoplayer2/drm/DrmSessionManager",
            "<",
            "Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;",
            ">;Z",
            "Landroid/os/Handler;",
            "Lcom/google/android/exoplayer2/audio/AudioRendererEventListener;",
            "Lcom/google/android/exoplayer2/audio/AudioCapabilities;",
            ")V"
        }
    .end annotation

    .prologue
    .line 129
    .local p2, "drmSessionManager":Lcom/google/android/exoplayer2/drm/DrmSessionManager;, "Lcom/google/android/exoplayer2/drm/DrmSessionManager<Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;>;"
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;-><init>(ILcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;Lcom/google/android/exoplayer2/drm/DrmSessionManager;Z)V

    .line 130
    new-instance v0, Lcom/google/android/exoplayer2/audio/AudioTrack;

    new-instance v1, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer$AudioTrackListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer$AudioTrackListener;-><init>(Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer$1;)V

    invoke-direct {v0, p6, v1}, Lcom/google/android/exoplayer2/audio/AudioTrack;-><init>(Lcom/google/android/exoplayer2/audio/AudioCapabilities;Lcom/google/android/exoplayer2/audio/AudioTrack$Listener;)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    .line 131
    new-instance v0, Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;

    invoke-direct {v0, p4, p5}, Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;-><init>(Landroid/os/Handler;Lcom/google/android/exoplayer2/audio/AudioRendererEventListener;)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;

    .line 132
    return-void
.end method

.method static synthetic access$100(Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;)Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;

    return-object v0
.end method

.method static synthetic access$202(Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;
    .param p1, "x1"    # Z

    .prologue
    .line 44
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->allowPositionDiscontinuity:Z

    return p1
.end method


# virtual methods
.method protected allowPassthrough(Ljava/lang/String;)Z
    .locals 1
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 182
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/audio/AudioTrack;->isPassthroughSupported(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected configureCodec(Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;Landroid/media/MediaCodec;Lcom/google/android/exoplayer2/Format;Landroid/media/MediaCrypto;)V
    .locals 5
    .param p1, "codecInfo"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;
    .param p2, "codec"    # Landroid/media/MediaCodec;
    .param p3, "format"    # Lcom/google/android/exoplayer2/Format;
    .param p4, "crypto"    # Landroid/media/MediaCrypto;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 188
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->passthroughEnabled:Z

    if-eqz v0, :cond_0

    .line 190
    invoke-virtual {p3}, Lcom/google/android/exoplayer2/Format;->getFrameworkMediaFormatV16()Landroid/media/MediaFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->passthroughMediaFormat:Landroid/media/MediaFormat;

    .line 191
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->passthroughMediaFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "mime"

    const-string/jumbo v2, "audio/raw"

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->passthroughMediaFormat:Landroid/media/MediaFormat;

    invoke-virtual {p2, v0, v3, p4, v4}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 193
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->passthroughMediaFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "mime"

    iget-object v2, p3, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    :goto_0
    return-void

    .line 195
    :cond_0
    invoke-virtual {p3}, Lcom/google/android/exoplayer2/Format;->getFrameworkMediaFormatV16()Landroid/media/MediaFormat;

    move-result-object v0

    invoke-virtual {p2, v0, v3, p4, v4}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 196
    iput-object v3, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->passthroughMediaFormat:Landroid/media/MediaFormat;

    goto :goto_0
.end method

.method protected getDecoderInfo(Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;Lcom/google/android/exoplayer2/Format;Z)Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;
    .locals 2
    .param p1, "mediaCodecSelector"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;
    .param p2, "format"    # Lcom/google/android/exoplayer2/Format;
    .param p3, "requiresSecureDecoder"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/mediacodec/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    .line 162
    iget-object v1, p2, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->allowPassthrough(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 163
    invoke-interface {p1}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;->getPassthroughDecoderInfo()Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;

    move-result-object v0

    .line 164
    .local v0, "passthroughDecoderInfo":Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;
    if-eqz v0, :cond_0

    .line 165
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->passthroughEnabled:Z

    .line 170
    .end local v0    # "passthroughDecoderInfo":Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;
    :goto_0
    return-object v0

    .line 169
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->passthroughEnabled:Z

    .line 170
    invoke-super {p0, p1, p2, p3}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->getDecoderInfo(Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;Lcom/google/android/exoplayer2/Format;Z)Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;

    move-result-object v0

    goto :goto_0
.end method

.method public getMediaClock()Lcom/google/android/exoplayer2/util/MediaClock;
    .locals 0

    .prologue
    .line 202
    return-object p0
.end method

.method public getPositionUs()J
    .locals 4

    .prologue
    .line 317
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->isEnded()Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/audio/AudioTrack;->getCurrentPositionUs(Z)J

    move-result-wide v0

    .line 318
    .local v0, "newCurrentPositionUs":J
    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 319
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->allowPositionDiscontinuity:Z

    if-eqz v2, :cond_1

    .line 320
    .end local v0    # "newCurrentPositionUs":J
    :goto_0
    iput-wide v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->currentPositionUs:J

    .line 321
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->allowPositionDiscontinuity:Z

    .line 323
    :cond_0
    iget-wide v2, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->currentPositionUs:J

    return-wide v2

    .line 319
    .restart local v0    # "newCurrentPositionUs":J
    :cond_1
    iget-wide v2, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->currentPositionUs:J

    .line 320
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    goto :goto_0
.end method

.method public handleMessage(ILjava/lang/Object;)V
    .locals 3
    .param p1, "messageType"    # I
    .param p2, "message"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 362
    packed-switch p1, :pswitch_data_0

    .line 374
    invoke-super {p0, p1, p2}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->handleMessage(ILjava/lang/Object;)V

    .line 377
    .end local p2    # "message":Ljava/lang/Object;
    :goto_0
    return-void

    .line 364
    .restart local p2    # "message":Ljava/lang/Object;
    :pswitch_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    check-cast p2, Ljava/lang/Float;

    .end local p2    # "message":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/audio/AudioTrack;->setVolume(F)V

    goto :goto_0

    .line 367
    .restart local p2    # "message":Ljava/lang/Object;
    :pswitch_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    check-cast p2, Landroid/media/PlaybackParams;

    .end local p2    # "message":Ljava/lang/Object;
    invoke-virtual {v1, p2}, Lcom/google/android/exoplayer2/audio/AudioTrack;->setPlaybackParams(Landroid/media/PlaybackParams;)V

    goto :goto_0

    .line 370
    .restart local p2    # "message":Ljava/lang/Object;
    :pswitch_2
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "message":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 371
    .local v0, "streamType":I
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->setStreamType(I)V

    goto :goto_0

    .line 362
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public isEnded()Z
    .locals 1

    .prologue
    .line 307
    invoke-super {p0}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->isEnded()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->hasPendingData()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isReady()Z
    .locals 1

    .prologue
    .line 312
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->hasPendingData()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->isReady()Z

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

.method protected onAudioSessionId(I)V
    .locals 0
    .param p1, "audioSessionId"    # I

    .prologue
    .line 242
    return-void
.end method

.method protected onAudioTrackPositionDiscontinuity()V
    .locals 0

    .prologue
    .line 249
    return-void
.end method

.method protected onAudioTrackUnderrun(IJJ)V
    .locals 0
    .param p1, "bufferSize"    # I
    .param p2, "bufferSizeMs"    # J
    .param p4, "elapsedSinceLastFeedMs"    # J

    .prologue
    .line 257
    return-void
.end method

.method protected onCodecInitialized(Ljava/lang/String;JJ)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "initializedTimestampMs"    # J
    .param p4, "initializationDurationMs"    # J

    .prologue
    .line 208
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;->decoderInitialized(Ljava/lang/String;JJ)V

    .line 209
    return-void
.end method

.method protected onDisabled()V
    .locals 3

    .prologue
    .line 294
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->release()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 297
    :try_start_1
    invoke-super {p0}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->onDisabled()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 299
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->ensureUpdated()V

    .line 300
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;

    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;->disabled(Lcom/google/android/exoplayer2/decoder/DecoderCounters;)V

    .line 303
    return-void

    .line 299
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->ensureUpdated()V

    .line 300
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;

    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;->disabled(Lcom/google/android/exoplayer2/decoder/DecoderCounters;)V

    throw v0

    .line 296
    :catchall_1
    move-exception v0

    .line 297
    :try_start_2
    invoke-super {p0}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->onDisabled()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 299
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->ensureUpdated()V

    .line 300
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;

    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;->disabled(Lcom/google/android/exoplayer2/decoder/DecoderCounters;)V

    throw v0

    .line 299
    :catchall_2
    move-exception v0

    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->ensureUpdated()V

    .line 300
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;

    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;->disabled(Lcom/google/android/exoplayer2/decoder/DecoderCounters;)V

    throw v0
.end method

.method protected onEnabled(Z)V
    .locals 3
    .param p1, "joining"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 261
    invoke-super {p0, p1}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->onEnabled(Z)V

    .line 262
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;

    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;->enabled(Lcom/google/android/exoplayer2/decoder/DecoderCounters;)V

    .line 263
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->getConfiguration()Lcom/google/android/exoplayer2/RendererConfiguration;

    move-result-object v1

    iget v0, v1, Lcom/google/android/exoplayer2/RendererConfiguration;->tunnelingAudioSessionId:I

    .line 264
    .local v0, "tunnelingAudioSessionId":I
    if-eqz v0, :cond_0

    .line 265
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->enableTunnelingV21(I)V

    .line 269
    :goto_0
    return-void

    .line 267
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/audio/AudioTrack;->disableTunneling()V

    goto :goto_0
.end method

.method protected onInputFormatChanged(Lcom/google/android/exoplayer2/Format;)V
    .locals 2
    .param p1, "newFormat"    # Lcom/google/android/exoplayer2/Format;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 213
    invoke-super {p0, p1}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->onInputFormatChanged(Lcom/google/android/exoplayer2/Format;)V

    .line 214
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/audio/AudioRendererEventListener$EventDispatcher;->inputFormatChanged(Lcom/google/android/exoplayer2/Format;)V

    .line 217
    const-string/jumbo v0, "audio/raw"

    iget-object v1, p1, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p1, Lcom/google/android/exoplayer2/Format;->pcmEncoding:I

    :goto_0
    iput v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->pcmEncoding:I

    .line 219
    return-void

    .line 217
    :cond_0
    const/4 v0, 0x2

    goto :goto_0
.end method

.method protected onOutputFormatChanged(Landroid/media/MediaCodec;Landroid/media/MediaFormat;)V
    .locals 8
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "outputFormat"    # Landroid/media/MediaFormat;

    .prologue
    const/4 v5, 0x0

    .line 223
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->passthroughMediaFormat:Landroid/media/MediaFormat;

    if-eqz v0, :cond_0

    const/4 v7, 0x1

    .line 224
    .local v7, "passthrough":Z
    :goto_0
    if-eqz v7, :cond_1

    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->passthroughMediaFormat:Landroid/media/MediaFormat;

    const-string/jumbo v4, "mime"

    invoke-virtual {v0, v4}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 226
    .local v1, "mimeType":Ljava/lang/String;
    :goto_1
    if-eqz v7, :cond_2

    iget-object v6, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->passthroughMediaFormat:Landroid/media/MediaFormat;

    .line 227
    .local v6, "format":Landroid/media/MediaFormat;
    :goto_2
    const-string/jumbo v0, "channel-count"

    invoke-virtual {v6, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v2

    .line 228
    .local v2, "channelCount":I
    const-string/jumbo v0, "sample-rate"

    invoke-virtual {v6, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v3

    .line 229
    .local v3, "sampleRate":I
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    iget v4, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->pcmEncoding:I

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/audio/AudioTrack;->configure(Ljava/lang/String;IIII)V

    .line 230
    return-void

    .end local v1    # "mimeType":Ljava/lang/String;
    .end local v2    # "channelCount":I
    .end local v3    # "sampleRate":I
    .end local v6    # "format":Landroid/media/MediaFormat;
    .end local v7    # "passthrough":Z
    :cond_0
    move v7, v5

    .line 223
    goto :goto_0

    .line 224
    .restart local v7    # "passthrough":Z
    :cond_1
    const-string/jumbo v1, "audio/raw"

    goto :goto_1

    .restart local v1    # "mimeType":Ljava/lang/String;
    :cond_2
    move-object v6, p2

    .line 226
    goto :goto_2
.end method

.method protected onOutputStreamEnded()V
    .locals 1

    .prologue
    .line 357
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->handleEndOfStream()V

    .line 358
    return-void
.end method

.method protected onPositionReset(JZ)V
    .locals 1
    .param p1, "positionUs"    # J
    .param p3, "joining"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 273
    invoke-super {p0, p1, p2, p3}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->onPositionReset(JZ)V

    .line 274
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->reset()V

    .line 275
    iput-wide p1, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->currentPositionUs:J

    .line 276
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->allowPositionDiscontinuity:Z

    .line 277
    return-void
.end method

.method protected onStarted()V
    .locals 1

    .prologue
    .line 281
    invoke-super {p0}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->onStarted()V

    .line 282
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->play()V

    .line 283
    return-void
.end method

.method protected onStopped()V
    .locals 1

    .prologue
    .line 287
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/audio/AudioTrack;->pause()V

    .line 288
    invoke-super {p0}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->onStopped()V

    .line 289
    return-void
.end method

.method protected processOutputBuffer(JJLandroid/media/MediaCodec;Ljava/nio/ByteBuffer;IIJZ)Z
    .locals 5
    .param p1, "positionUs"    # J
    .param p3, "elapsedRealtimeUs"    # J
    .param p5, "codec"    # Landroid/media/MediaCodec;
    .param p6, "buffer"    # Ljava/nio/ByteBuffer;
    .param p7, "bufferIndex"    # I
    .param p8, "bufferFlags"    # I
    .param p9, "bufferPresentationTimeUs"    # J
    .param p11, "shouldSkip"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 330
    iget-boolean v3, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->passthroughEnabled:Z

    if-eqz v3, :cond_0

    and-int/lit8 v3, p8, 0x2

    if-eqz v3, :cond_0

    .line 332
    invoke-virtual {p5, p7, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 352
    :goto_0
    return v1

    .line 336
    :cond_0
    if-eqz p11, :cond_1

    .line 337
    invoke-virtual {p5, p7, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 338
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    iget v3, v2, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->skippedOutputBufferCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->skippedOutputBufferCount:I

    .line 339
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    invoke-virtual {v2}, Lcom/google/android/exoplayer2/audio/AudioTrack;->handleDiscontinuity()V

    goto :goto_0

    .line 344
    :cond_1
    :try_start_0
    iget-object v3, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->audioTrack:Lcom/google/android/exoplayer2/audio/AudioTrack;

    invoke-virtual {v3, p6, p9, p10}, Lcom/google/android/exoplayer2/audio/AudioTrack;->handleBuffer(Ljava/nio/ByteBuffer;J)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 345
    const/4 v2, 0x0

    invoke-virtual {p5, p7, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 346
    iget-object v2, p0, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    iget v3, v2, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->renderedOutputBufferCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->renderedOutputBufferCount:I
    :try_end_0
    .catch Lcom/google/android/exoplayer2/audio/AudioTrack$InitializationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/google/android/exoplayer2/audio/AudioTrack$WriteException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 349
    :catch_0
    move-exception v0

    .line 350
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->getIndex()I

    move-result v1

    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/ExoPlaybackException;->createForRenderer(Ljava/lang/Exception;I)Lcom/google/android/exoplayer2/ExoPlaybackException;

    move-result-object v1

    throw v1

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    move v1, v2

    .line 352
    goto :goto_0

    .line 349
    :catch_1
    move-exception v0

    goto :goto_1
.end method

.method protected supportsFormat(Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;Lcom/google/android/exoplayer2/Format;)I
    .locals 10
    .param p1, "mediaCodecSelector"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;
    .param p2, "format"    # Lcom/google/android/exoplayer2/Format;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/mediacodec/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x15

    const/4 v6, 0x1

    const/4 v8, -0x1

    const/4 v5, 0x0

    .line 137
    iget-object v3, p2, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    .line 138
    .local v3, "mimeType":Ljava/lang/String;
    invoke-static {v3}, Lcom/google/android/exoplayer2/util/MimeTypes;->isAudio(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 156
    :goto_0
    return v5

    .line 141
    :cond_0
    sget v7, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    if-lt v7, v9, :cond_1

    const/16 v4, 0x10

    .line 142
    .local v4, "tunnelingSupport":I
    :goto_1
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer2/audio/MediaCodecAudioRenderer;->allowPassthrough(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {p1}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;->getPassthroughDecoderInfo()Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 143
    or-int/lit8 v5, v4, 0x4

    or-int/lit8 v5, v5, 0x3

    goto :goto_0

    .end local v4    # "tunnelingSupport":I
    :cond_1
    move v4, v5

    .line 141
    goto :goto_1

    .line 145
    .restart local v4    # "tunnelingSupport":I
    :cond_2
    invoke-interface {p1, v3, v5}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;->getDecoderInfo(Ljava/lang/String;Z)Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;

    move-result-object v1

    .line 146
    .local v1, "decoderInfo":Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;
    if-nez v1, :cond_3

    move v5, v6

    .line 147
    goto :goto_0

    .line 150
    :cond_3
    sget v7, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    if-lt v7, v9, :cond_5

    iget v7, p2, Lcom/google/android/exoplayer2/Format;->sampleRate:I

    if-eq v7, v8, :cond_4

    iget v7, p2, Lcom/google/android/exoplayer2/Format;->sampleRate:I

    .line 152
    invoke-virtual {v1, v7}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;->isAudioSampleRateSupportedV21(I)Z

    move-result v7

    if-eqz v7, :cond_6

    :cond_4
    iget v7, p2, Lcom/google/android/exoplayer2/Format;->channelCount:I

    if-eq v7, v8, :cond_5

    iget v7, p2, Lcom/google/android/exoplayer2/Format;->channelCount:I

    .line 154
    invoke-virtual {v1, v7}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;->isAudioChannelCountSupportedV21(I)Z

    move-result v7

    if-eqz v7, :cond_6

    :cond_5
    move v0, v6

    .line 155
    .local v0, "decoderCapable":Z
    :goto_2
    if-eqz v0, :cond_7

    const/4 v2, 0x3

    .line 156
    .local v2, "formatSupport":I
    :goto_3
    or-int/lit8 v5, v4, 0x4

    or-int/2addr v5, v2

    goto :goto_0

    .end local v0    # "decoderCapable":Z
    .end local v2    # "formatSupport":I
    :cond_6
    move v0, v5

    .line 154
    goto :goto_2

    .line 155
    .restart local v0    # "decoderCapable":Z
    :cond_7
    const/4 v2, 0x2

    goto :goto_3
.end method
