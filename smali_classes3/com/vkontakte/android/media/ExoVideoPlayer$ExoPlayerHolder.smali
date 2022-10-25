.class Lcom/vkontakte/android/media/ExoVideoPlayer$ExoPlayerHolder;
.super Lcom/google/android/exoplayer2/SimpleExoPlayer;
.source "ExoVideoPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/ExoVideoPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ExoPlayerHolder"
.end annotation


# static fields
.field public static final DEFAULT_ALLOWED_VIDEO_JOINING_TIME_MS:J = 0x1388L


# direct methods
.method private constructor <init>(Landroid/content/Context;Lcom/google/android/exoplayer2/trackselection/TrackSelector;Lcom/google/android/exoplayer2/LoadControl;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "trackSelector"    # Lcom/google/android/exoplayer2/trackselection/TrackSelector;
    .param p3, "loadControl"    # Lcom/google/android/exoplayer2/LoadControl;

    .prologue
    .line 579
    const/4 v4, 0x0

    const/4 v5, 0x0

    const-wide/16 v6, 0x1388

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer2/SimpleExoPlayer;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/trackselection/TrackSelector;Lcom/google/android/exoplayer2/LoadControl;Lcom/google/android/exoplayer2/drm/DrmSessionManager;IJ)V

    .line 581
    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Lcom/google/android/exoplayer2/trackselection/TrackSelector;Lcom/google/android/exoplayer2/LoadControl;Lcom/vkontakte/android/media/ExoVideoPlayer$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/content/Context;
    .param p2, "x1"    # Lcom/google/android/exoplayer2/trackselection/TrackSelector;
    .param p3, "x2"    # Lcom/google/android/exoplayer2/LoadControl;
    .param p4, "x3"    # Lcom/vkontakte/android/media/ExoVideoPlayer$1;

    .prologue
    .line 575
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/media/ExoVideoPlayer$ExoPlayerHolder;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/trackselection/TrackSelector;Lcom/google/android/exoplayer2/LoadControl;)V

    return-void
.end method


# virtual methods
.method protected buildVideoRenderers(Landroid/content/Context;Landroid/os/Handler;Lcom/google/android/exoplayer2/drm/DrmSessionManager;ILcom/google/android/exoplayer2/video/VideoRendererEventListener;JLjava/util/ArrayList;)V
    .locals 14
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mainHandler"    # Landroid/os/Handler;
    .param p4, "extensionRendererMode"    # I
    .param p5, "eventListener"    # Lcom/google/android/exoplayer2/video/VideoRendererEventListener;
    .param p6, "allowedVideoJoiningTimeMs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/os/Handler;",
            "Lcom/google/android/exoplayer2/drm/DrmSessionManager",
            "<",
            "Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;",
            ">;I",
            "Lcom/google/android/exoplayer2/video/VideoRendererEventListener;",
            "J",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/exoplayer2/Renderer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 588
    .local p3, "drmSessionManager":Lcom/google/android/exoplayer2/drm/DrmSessionManager;, "Lcom/google/android/exoplayer2/drm/DrmSessionManager<Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;>;"
    .local p8, "out":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer2/Renderer;>;"
    new-instance v3, Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer;

    sget-object v5, Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;->DEFAULT:Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;

    const/4 v9, 0x0

    const/16 v12, 0x32

    move-object v4, p1

    move-wide/from16 v6, p6

    move-object/from16 v8, p3

    move-object/from16 v10, p2

    move-object/from16 v11, p5

    invoke-direct/range {v3 .. v12}, Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;JLcom/google/android/exoplayer2/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer2/video/VideoRendererEventListener;I)V

    move-object/from16 v0, p8

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 591
    return-void
.end method
