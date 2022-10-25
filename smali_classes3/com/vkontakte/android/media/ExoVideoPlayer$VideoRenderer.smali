.class Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer;
.super Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;
.source "ExoVideoPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/ExoVideoPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "VideoRenderer"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;JLcom/google/android/exoplayer2/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer2/video/VideoRendererEventListener;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mediaCodecSelector"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;
    .param p3, "allowedJoiningTimeMs"    # J
    .param p6, "playClearSamplesWithoutKeys"    # Z
    .param p7, "eventHandler"    # Landroid/os/Handler;
    .param p8, "eventListener"    # Lcom/google/android/exoplayer2/video/VideoRendererEventListener;
    .param p9, "maxDroppedFramesToNotify"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;",
            "J",
            "Lcom/google/android/exoplayer2/drm/DrmSessionManager",
            "<",
            "Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;",
            ">;Z",
            "Landroid/os/Handler;",
            "Lcom/google/android/exoplayer2/video/VideoRendererEventListener;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 606
    .local p5, "drmSessionManager":Lcom/google/android/exoplayer2/drm/DrmSessionManager;, "Lcom/google/android/exoplayer2/drm/DrmSessionManager<Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;>;"
    invoke-direct/range {p0 .. p9}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;JLcom/google/android/exoplayer2/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer2/video/VideoRendererEventListener;I)V

    .line 608
    return-void
.end method


# virtual methods
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
    .line 613
    invoke-super {p0, p1, p2, p3}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getDecoderInfo(Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;Lcom/google/android/exoplayer2/Format;Z)Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;

    move-result-object v0

    .line 614
    .local v0, "info":Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;
    sget-object v1, Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;->instance:Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;

    iget-boolean v1, v1, Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;->adaptiveDisable:Z

    if-eqz v1, :cond_0

    .line 615
    iget-object v1, v0, Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;->name:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;->newPassthroughInstance(Ljava/lang/String;)Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;

    move-result-object v0

    .line 617
    .end local v0    # "info":Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;
    :cond_0
    return-object v0
.end method
