.class public Lcom/vkontakte/android/media/ExoVideoPlayer;
.super Lcom/vkontakte/android/media/TextureVideoPlayer;
.source "ExoVideoPlayer.java"

# interfaces
.implements Lcom/google/android/exoplayer2/ExoPlayer$EventListener;
.implements Lcom/google/android/exoplayer2/video/VideoRendererEventListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;,
        Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;,
        Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;,
        Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer;,
        Lcom/vkontakte/android/media/ExoVideoPlayer$ExoPlayerHolder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static final benchmarkTracker:Lcom/vkontakte/android/data/BenchmarkTracker;

.field private static final mainHandler:Landroid/os/Handler;

.field private static final sBandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

.field private static final sExtractorFactory:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;


# instance fields
.field private mBuffering:Z

.field private mCompleted:Z

.field private final mDataSourceFactory:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

.field private mLastException:Lcom/google/android/exoplayer2/ExoPlaybackException;

.field private final mLiveHeartbeat:Ljava/lang/Runnable;

.field private final mLiveStopHeartbeat:Ljava/lang/Runnable;

.field private volatile mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private mPrepared:Z

.field private mQuality:I

.field private mSource:Lcom/google/android/exoplayer2/source/MediaSource;

.field private mSourceFactory:Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;

.field private mSurface:Landroid/view/Surface;

.field private mTrackFormat:Lcom/google/android/exoplayer2/Format;

.field private final mUpdateTimingsAction:Ljava/lang/Runnable;

.field private final mVideoTrackSelectionFactory:Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;

.field private final mVigo:Lcom/vkontakte/android/media/VigoDelegate;

.field private final mediaSourceListener:Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 75
    const-class v0, Lcom/vkontakte/android/media/ExoVideoPlayer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/media/ExoVideoPlayer;->TAG:Ljava/lang/String;

    .line 76
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mainHandler:Landroid/os/Handler;

    .line 77
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->getInstance()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/media/ExoVideoPlayer;->benchmarkTracker:Lcom/vkontakte/android/data/BenchmarkTracker;

    .line 79
    new-instance v0, Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;-><init>()V

    sput-object v0, Lcom/vkontakte/android/media/ExoVideoPlayer;->sBandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    .line 80
    new-instance v0, Lcom/google/android/exoplayer2/extractor/DefaultExtractorsFactory;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/extractor/DefaultExtractorsFactory;-><init>()V

    sput-object v0, Lcom/vkontakte/android/media/ExoVideoPlayer;->sExtractorFactory:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "file"    # Lcom/vkontakte/android/api/VideoFile;
    .param p3, "referrer"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 127
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/media/TextureVideoPlayer;-><init>(Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)V

    .line 82
    new-instance v0, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;

    sget-object v1, Lcom/vkontakte/android/media/ExoVideoPlayer;->sBandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;-><init>(Lcom/google/android/exoplayer2/upstream/TransferListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mSourceFactory:Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;

    .line 83
    new-instance v0, Lcom/google/android/exoplayer2/upstream/DefaultDataSourceFactory;

    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->context:Landroid/content/Context;

    sget-object v2, Lcom/vkontakte/android/media/ExoVideoPlayer;->sBandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    iget-object v3, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mSourceFactory:Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/exoplayer2/upstream/DefaultDataSourceFactory;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/upstream/TransferListener;Lcom/google/android/exoplayer2/upstream/DataSource$Factory;)V

    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mDataSourceFactory:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    .line 85
    new-instance v0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;

    sget-object v1, Lcom/vkontakte/android/media/ExoVideoPlayer;->sBandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;-><init>(Lcom/vkontakte/android/media/ExoVideoPlayer;Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;)V

    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVideoTrackSelectionFactory:Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;

    .line 90
    iput-object v4, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mSurface:Landroid/view/Surface;

    .line 92
    new-instance v0, Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;

    invoke-direct {v0, p0, v4}, Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;-><init>(Lcom/vkontakte/android/media/ExoVideoPlayer;Lcom/vkontakte/android/media/ExoVideoPlayer$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mediaSourceListener:Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;

    .line 93
    new-instance v0, Lcom/vkontakte/android/media/VigoDelegate;

    invoke-direct {v0}, Lcom/vkontakte/android/media/VigoDelegate;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    .line 95
    iput-boolean v5, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPrepared:Z

    .line 96
    iput-boolean v5, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mBuffering:Z

    .line 98
    iput-object v4, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mLastException:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 104
    invoke-static {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/media/ExoVideoPlayer;)Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mUpdateTimingsAction:Ljava/lang/Runnable;

    .line 128
    sget-object v0, Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;->instance:Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;

    invoke-static {}, Lcom/vkontakte/android/auth/configs/VideoConfig;->getInstance()Lcom/vkontakte/android/auth/configs/VideoConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/configs/VideoConfig;->isDecoderAdaptiveDisable()Z

    move-result v1

    iput-boolean v1, v0, Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;->adaptiveDisable:Z

    .line 130
    invoke-static {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/media/ExoVideoPlayer;)Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mLiveHeartbeat:Ljava/lang/Runnable;

    .line 134
    invoke-static {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/media/ExoVideoPlayer;)Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mLiveStopHeartbeat:Ljava/lang/Runnable;

    .line 135
    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/media/ExoVideoPlayer;)Lcom/vkontakte/android/media/VigoDelegate;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/ExoVideoPlayer;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    return-object v0
.end method

.method static synthetic access$302(Lcom/vkontakte/android/media/ExoVideoPlayer;Lcom/google/android/exoplayer2/Format;)Lcom/google/android/exoplayer2/Format;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/media/ExoVideoPlayer;
    .param p1, "x1"    # Lcom/google/android/exoplayer2/Format;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mTrackFormat:Lcom/google/android/exoplayer2/Format;

    return-object p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/media/ExoVideoPlayer;)Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/ExoVideoPlayer;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVideoTrackSelectionFactory:Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/media/ExoVideoPlayer;)Lcom/google/android/exoplayer2/SimpleExoPlayer;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/ExoVideoPlayer;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    return-object v0
.end method

.method static synthetic access$600()Lcom/vkontakte/android/data/BenchmarkTracker;
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lcom/vkontakte/android/media/ExoVideoPlayer;->benchmarkTracker:Lcom/vkontakte/android/data/BenchmarkTracker;

    return-object v0
.end method

.method static synthetic access$700()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lcom/vkontakte/android/media/ExoVideoPlayer;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private cancelRunnable(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 572
    sget-object v0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mainHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 573
    return-void
.end method

.method private create(IIII)Lcom/google/android/exoplayer2/SimpleExoPlayer;
    .locals 10
    .param p1, "minBufferMs"    # I
    .param p2, "maxBufferMs"    # I
    .param p3, "bufferForPlaybackMs"    # I
    .param p4, "bufferForPlaybackAfterRebufferMs"    # I

    .prologue
    .line 483
    new-instance v9, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;

    iget-object v2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVideoTrackSelectionFactory:Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;

    invoke-direct {v9, v2}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;-><init>(Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;)V

    .line 484
    .local v9, "trackSelector":Lcom/google/android/exoplayer2/trackselection/TrackSelector;
    new-instance v1, Lcom/google/android/exoplayer2/upstream/DefaultAllocator;

    const/4 v2, 0x1

    const/high16 v3, 0x10000

    invoke-direct {v1, v2, v3}, Lcom/google/android/exoplayer2/upstream/DefaultAllocator;-><init>(ZI)V

    .line 485
    .local v1, "allocator":Lcom/google/android/exoplayer2/upstream/DefaultAllocator;
    new-instance v0, Lcom/google/android/exoplayer2/DefaultLoadControl;

    int-to-long v4, p3

    int-to-long v6, p4

    move v2, p1

    move v3, p2

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer2/DefaultLoadControl;-><init>(Lcom/google/android/exoplayer2/upstream/DefaultAllocator;IIJJ)V

    .line 487
    .local v0, "loadControl":Lcom/google/android/exoplayer2/LoadControl;
    new-instance v8, Lcom/vkontakte/android/media/ExoVideoPlayer$ExoPlayerHolder;

    iget-object v2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->context:Landroid/content/Context;

    const/4 v3, 0x0

    invoke-direct {v8, v2, v9, v0, v3}, Lcom/vkontakte/android/media/ExoVideoPlayer$ExoPlayerHolder;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/trackselection/TrackSelector;Lcom/google/android/exoplayer2/LoadControl;Lcom/vkontakte/android/media/ExoVideoPlayer$1;)V

    .line 488
    .local v8, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    invoke-virtual {v8, p0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->addListener(Lcom/google/android/exoplayer2/ExoPlayer$EventListener;)V

    .line 489
    invoke-virtual {v8, p0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVideoDebugListener(Lcom/google/android/exoplayer2/video/VideoRendererEventListener;)V

    .line 490
    return-object v8
.end method

.method private dispatchBufferingEnd(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 6
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 544
    iget-boolean v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mBuffering:Z

    if-eqz v0, :cond_0

    .line 545
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mBuffering:Z

    .line 546
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onPlaybackResumed(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    .line 547
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {p1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getDuration()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v4

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/media/VigoDelegate;->onBufferingEnd(JJ)V

    .line 549
    :cond_0
    return-void
.end method

.method private dispatchBufferingStart(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 6
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 536
    iget-boolean v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mBuffering:Z

    if-nez v0, :cond_0

    .line 537
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mBuffering:Z

    .line 538
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onEndOfBuffer(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    .line 539
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {p1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getDuration()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v4

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/media/VigoDelegate;->onBufferingStart(JJ)V

    .line 541
    :cond_0
    return-void
.end method

.method private dispatchEnd(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 6
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 522
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mCompleted:Z

    .line 523
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {p1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getDuration()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v4

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/media/VigoDelegate;->onPlaybackComplete(JJ)V

    .line 524
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onPlaybackCompleted(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    .line 525
    return-void
.end method

.method private dispatchError(Lcom/google/android/exoplayer2/ExoPlaybackException;)I
    .locals 5
    .param p1, "error"    # Lcom/google/android/exoplayer2/ExoPlaybackException;

    .prologue
    const/4 v1, 0x1

    .line 552
    const/4 v0, -0x1

    .line 553
    .local v0, "errorCode":I
    iget v2, p1, Lcom/google/android/exoplayer2/ExoPlaybackException;->type:I

    if-ne v2, v1, :cond_1

    .line 554
    const/4 v0, 0x1

    .line 563
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    invoke-virtual {v1, p0, v0}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onError(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V

    .line 564
    return v0

    .line 555
    :cond_1
    iget v2, p1, Lcom/google/android/exoplayer2/ExoPlaybackException;->type:I

    if-nez v2, :cond_2

    .line 556
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/ExoPlaybackException;->getSourceException()Ljava/io/IOException;

    move-result-object v2

    instance-of v2, v2, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;

    if-eqz v2, :cond_2

    .line 557
    const/4 v0, 0x2

    goto :goto_0

    .line 558
    :cond_2
    iget v2, p1, Lcom/google/android/exoplayer2/ExoPlaybackException;->type:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 559
    const/16 v0, 0x8

    .line 560
    sget-object v2, Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;->instance:Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;

    iget-object v3, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVideoTrackSelectionFactory:Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;

    iget-object v4, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mTrackFormat:Lcom/google/android/exoplayer2/Format;

    .line 561
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;->checkVideoFormat(Lcom/google/android/exoplayer2/Format;)Z

    move-result v3

    if-nez v3, :cond_3

    :goto_1
    iput-boolean v1, v2, Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;->aboveScreenResolutionDisable:Z

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private dispatchPreparedOnce(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 6
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 528
    iget-boolean v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPrepared:Z

    if-nez v0, :cond_0

    .line 529
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPrepared:Z

    .line 530
    invoke-direct {p0, p1}, Lcom/vkontakte/android/media/ExoVideoPlayer;->notifyPreparedIfReady(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    .line 531
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {p1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getDuration()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v4

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/media/VigoDelegate;->vigoOnPrepared(JJ)V

    .line 533
    :cond_0
    return-void
.end method

.method private doSetDataSource(Landroid/graphics/SurfaceTexture;)V
    .locals 5
    .param p1, "texture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 464
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoDelegate;->beforeSetDataSource()V

    .line 465
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 466
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-nez v0, :cond_0

    .line 467
    const/16 v1, 0x3a98

    const/16 v2, 0x7530

    const/16 v3, 0x9c4

    const/16 v4, 0x1388

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/vkontakte/android/media/ExoVideoPlayer;->create(IIII)Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    .line 470
    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 472
    :cond_0
    if-eqz p1, :cond_1

    .line 473
    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/media/ExoVideoPlayer;->updateTexture(Lcom/google/android/exoplayer2/SimpleExoPlayer;Landroid/graphics/SurfaceTexture;)V

    .line 475
    :cond_1
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->isLoading()Z

    move-result v1

    if-nez v1, :cond_2

    .line 476
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mSource:Lcom/google/android/exoplayer2/source/MediaSource;

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->prepare(Lcom/google/android/exoplayer2/source/MediaSource;)V

    .line 478
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/VigoDelegate;->afterSetDataSource()V

    .line 479
    return-void
.end method

.method private notifyPreparedIfReady(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 4
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    const/4 v2, -0x1

    .line 507
    if-eqz p1, :cond_1

    iget-boolean v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPrepared:Z

    if-eqz v1, :cond_1

    .line 508
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getVideoFormat()Lcom/google/android/exoplayer2/Format;

    move-result-object v0

    .line 509
    .local v0, "videoFormat":Lcom/google/android/exoplayer2/Format;
    if-eqz v0, :cond_4

    .line 510
    iget v1, v0, Lcom/google/android/exoplayer2/Format;->rotationDegrees:I

    if-eq v1, v2, :cond_0

    iget v1, v0, Lcom/google/android/exoplayer2/Format;->rotationDegrees:I

    if-eqz v1, :cond_0

    iget v1, v0, Lcom/google/android/exoplayer2/Format;->rotationDegrees:I

    const/16 v2, 0xb4

    if-ne v1, v2, :cond_2

    .line 511
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    iget v2, v0, Lcom/google/android/exoplayer2/Format;->width:I

    iget v3, v0, Lcom/google/android/exoplayer2/Format;->height:I

    invoke-virtual {v1, p0, v2, v3}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onPlayerReady(Lcom/vkontakte/android/media/AbsVideoPlayer;II)V

    .line 519
    .end local v0    # "videoFormat":Lcom/google/android/exoplayer2/Format;
    :cond_1
    :goto_0
    return-void

    .line 512
    .restart local v0    # "videoFormat":Lcom/google/android/exoplayer2/Format;
    :cond_2
    iget v1, v0, Lcom/google/android/exoplayer2/Format;->rotationDegrees:I

    const/16 v2, 0x5a

    if-eq v1, v2, :cond_3

    iget v1, v0, Lcom/google/android/exoplayer2/Format;->rotationDegrees:I

    const/16 v2, 0x10e

    if-ne v1, v2, :cond_1

    .line 513
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    iget v2, v0, Lcom/google/android/exoplayer2/Format;->height:I

    iget v3, v0, Lcom/google/android/exoplayer2/Format;->width:I

    invoke-virtual {v1, p0, v2, v3}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onPlayerReady(Lcom/vkontakte/android/media/AbsVideoPlayer;II)V

    goto :goto_0

    .line 516
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    invoke-virtual {v1, p0, v2, v2}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onPlayerReady(Lcom/vkontakte/android/media/AbsVideoPlayer;II)V

    goto :goto_0
.end method

.method private postRunnable(Ljava/lang/Runnable;I)V
    .locals 4
    .param p1, "runnable"    # Ljava/lang/Runnable;
    .param p2, "delayMillis"    # I

    .prologue
    .line 568
    sget-object v0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mainHandler:Landroid/os/Handler;

    int-to-long v2, p2

    invoke-virtual {v0, p1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 569
    return-void
.end method

.method private release(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 1
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    const/4 v0, 0x0

    .line 402
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->release()V

    .line 403
    invoke-virtual {p1, p0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->removeListener(Lcom/google/android/exoplayer2/ExoPlayer$EventListener;)V

    .line 404
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVideoDebugListener(Lcom/google/android/exoplayer2/video/VideoRendererEventListener;)V

    .line 405
    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 406
    return-void
.end method

.method private releaseSurface()V
    .locals 1

    .prologue
    .line 451
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_0

    .line 452
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 453
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mSurface:Landroid/view/Surface;

    .line 455
    :cond_0
    return-void
.end method

.method private scheduleUpdateTimings(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 4
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 494
    if-eqz p1, :cond_0

    .line 495
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getPlaybackState()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getPlayWhenReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 496
    sget-object v0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mUpdateTimingsAction:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 497
    sget-object v0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mUpdateTimingsAction:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 500
    :cond_0
    return-void
.end method

.method private startHeartBeatSending()V
    .locals 2

    .prologue
    .line 436
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mFile:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->isLive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 437
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mLiveHeartbeat:Ljava/lang/Runnable;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->cancelRunnable(Ljava/lang/Runnable;)V

    .line 438
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mLiveHeartbeat:Ljava/lang/Runnable;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/media/ExoVideoPlayer;->postRunnable(Ljava/lang/Runnable;I)V

    .line 440
    :cond_0
    return-void
.end method

.method private stopHeartBeatSending()V
    .locals 2

    .prologue
    .line 443
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mFile:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->isLive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 444
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mLiveHeartbeat:Ljava/lang/Runnable;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->cancelRunnable(Ljava/lang/Runnable;)V

    .line 445
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mLiveStopHeartbeat:Ljava/lang/Runnable;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->cancelRunnable(Ljava/lang/Runnable;)V

    .line 446
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mLiveStopHeartbeat:Ljava/lang/Runnable;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/media/ExoVideoPlayer;->postRunnable(Ljava/lang/Runnable;I)V

    .line 448
    :cond_0
    return-void
.end method

.method private unscheduleUpdateTimings()V
    .locals 2

    .prologue
    .line 503
    sget-object v0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mUpdateTimingsAction:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 504
    return-void
.end method

.method private updateTexture(Lcom/google/android/exoplayer2/SimpleExoPlayer;Landroid/graphics/SurfaceTexture;)V
    .locals 1
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;
    .param p2, "texture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 458
    invoke-direct {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->releaseSurface()V

    .line 459
    new-instance v0, Landroid/view/Surface;

    invoke-direct {v0, p2}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mSurface:Landroid/view/Surface;

    .line 460
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mSurface:Landroid/view/Surface;

    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVideoSurface(Landroid/view/Surface;)V

    .line 461
    return-void
.end method


# virtual methods
.method public createPlayer(IIII)V
    .locals 2
    .param p1, "minBufferMs"    # I
    .param p2, "maxBufferMs"    # I
    .param p3, "bufferForPlaybackMs"    # I
    .param p4, "bufferForPlaybackAfterRebufferMs"    # I

    .prologue
    .line 152
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 153
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-nez v0, :cond_0

    .line 154
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/vkontakte/android/media/ExoVideoPlayer;->create(IIII)Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    .line 155
    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 157
    :cond_0
    iget-boolean v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPrepared:Z

    if-nez v1, :cond_1

    .line 158
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mSource:Lcom/google/android/exoplayer2/source/MediaSource;

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->prepare(Lcom/google/android/exoplayer2/source/MediaSource;)V

    .line 160
    :cond_1
    return-void
.end method

.method public getPosition()I
    .locals 4

    .prologue
    .line 220
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 221
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 222
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v2

    long-to-int v1, v2

    .line 224
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getQuality()I
    .locals 1

    .prologue
    .line 383
    iget v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mQuality:I

    return v0
.end method

.method public isCompleted()Z
    .locals 1

    .prologue
    .line 229
    iget-boolean v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mCompleted:Z

    return v0
.end method

.method synthetic lambda$new$0()V
    .locals 10

    .prologue
    .line 105
    iget-object v8, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 106
    .local v8, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v8, :cond_1

    .line 107
    invoke-virtual {v8}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getBufferedPercentage()I

    move-result v1

    .line 108
    .local v1, "bufferedPercentage":I
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onUpdateBuffered(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V

    .line 109
    invoke-virtual {v8}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getDuration()J

    move-result-wide v2

    .line 110
    .local v2, "duration":J
    const/4 v9, 0x1

    .line 111
    .local v9, "schedule":Z
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v8}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/media/VigoDelegate;->onBufferingUpdate(IJJ)V

    .line 113
    invoke-virtual {v8}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v6

    .line 114
    .local v6, "currentPosition":J
    cmp-long v0, v6, v2

    if-lez v0, :cond_0

    .line 115
    move-wide v6, v2

    .line 116
    const/4 v9, 0x0

    .line 118
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    long-to-int v4, v6

    invoke-virtual {v0, p0, v4}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onUpdatePlaybackPosition(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V

    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v0, v2, v3, v6, v7}, Lcom/vkontakte/android/media/VigoDelegate;->onUpdatePlaybackPosition(JJ)V

    .line 120
    if-eqz v9, :cond_1

    .line 121
    invoke-direct {p0, v8}, Lcom/vkontakte/android/media/ExoVideoPlayer;->scheduleUpdateTimings(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    .line 124
    .end local v1    # "bufferedPercentage":I
    .end local v2    # "duration":J
    .end local v6    # "currentPosition":J
    .end local v9    # "schedule":Z
    :cond_1
    return-void
.end method

.method synthetic lambda$new$1()V
    .locals 3

    .prologue
    .line 131
    new-instance v0, Lcom/vkontakte/android/api/video/VideoLiveHeartbeat;

    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mFile:Lcom/vkontakte/android/api/VideoFile;

    iget v1, v1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget-object v2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mFile:Lcom/vkontakte/android/api/VideoFile;

    iget v2, v2, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/video/VideoLiveHeartbeat;-><init>(II)V

    invoke-virtual {v0}, Lcom/vkontakte/android/api/video/VideoLiveHeartbeat;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 132
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mLiveHeartbeat:Ljava/lang/Runnable;

    const/16 v1, 0x1388

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/media/ExoVideoPlayer;->postRunnable(Ljava/lang/Runnable;I)V

    .line 133
    return-void
.end method

.method synthetic lambda$new$2()V
    .locals 3

    .prologue
    .line 134
    new-instance v0, Lcom/vkontakte/android/api/video/VideoStopHeartbeat;

    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mFile:Lcom/vkontakte/android/api/VideoFile;

    iget v1, v1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget-object v2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mFile:Lcom/vkontakte/android/api/VideoFile;

    iget v2, v2, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/video/VideoStopHeartbeat;-><init>(II)V

    invoke-virtual {v0}, Lcom/vkontakte/android/api/video/VideoStopHeartbeat;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    return-void
.end method

.method synthetic lambda$onSurfaceTextureAvailable$3(Landroid/graphics/SurfaceTexture;)V
    .locals 5
    .param p1, "texture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 411
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 412
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "AUTOPLAY"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "surfaceTextureReady "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " p="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 413
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mSource:Lcom/google/android/exoplayer2/source/MediaSource;

    if-eqz v1, :cond_0

    if-nez v0, :cond_0

    .line 414
    invoke-direct {p0, p1}, Lcom/vkontakte/android/media/ExoVideoPlayer;->doSetDataSource(Landroid/graphics/SurfaceTexture;)V

    .line 418
    :goto_0
    return-void

    .line 416
    :cond_0
    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/media/ExoVideoPlayer;->updateTexture(Lcom/google/android/exoplayer2/SimpleExoPlayer;Landroid/graphics/SurfaceTexture;)V

    goto :goto_0
.end method

.method synthetic lambda$onSurfaceTextureDestroyed$4(Landroid/graphics/SurfaceTexture;)V
    .locals 5
    .param p1, "texture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 425
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 426
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 427
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "AUTOPLAY"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "surfaceTextureDestroyed "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " p="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 428
    invoke-direct {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->releaseSurface()V

    .line 429
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->clearVideoSurface()V

    .line 431
    :cond_0
    return-void
.end method

.method public onDroppedFrames(IJ)V
    .locals 0
    .param p1, "count"    # I
    .param p2, "elapsedMs"    # J

    .prologue
    .line 342
    return-void
.end method

.method public onLoadingChanged(Z)V
    .locals 0
    .param p1, "isLoading"    # Z

    .prologue
    .line 251
    return-void
.end method

.method public onPlayerError(Lcom/google/android/exoplayer2/ExoPlaybackException;)V
    .locals 10
    .param p1, "error"    # Lcom/google/android/exoplayer2/ExoPlaybackException;

    .prologue
    const/4 v9, 0x2

    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 285
    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    sget-object v7, Lcom/vkontakte/android/media/ExoVideoPlayer;->TAG:Ljava/lang/String;

    aput-object v7, v6, v5

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "onPlayerError "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v3

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Lcom/google/android/exoplayer2/ExoPlaybackException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v6}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 286
    iput-object p1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mLastException:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 287
    invoke-direct {p0, p1}, Lcom/vkontakte/android/media/ExoVideoPlayer;->dispatchError(Lcom/google/android/exoplayer2/ExoPlaybackException;)I

    move-result v1

    .line 288
    .local v1, "errorCode":I
    iget-object v6, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v6, v1, v5}, Lcom/vkontakte/android/media/VigoDelegate;->onError(II)V

    .line 290
    invoke-static {}, Lcom/vk/analytics/Analytics;->isEnabled()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 291
    const/4 v2, 0x0

    .line 292
    .local v2, "event":Lcom/vk/analytics/AnalyticsEvent;
    iget v6, p1, Lcom/google/android/exoplayer2/ExoPlaybackException;->type:I

    if-ne v6, v3, :cond_3

    .line 293
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/ExoPlaybackException;->getRendererException()Ljava/lang/Exception;

    move-result-object v0

    .line 294
    .local v0, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 295
    .local v4, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    if-eqz v4, :cond_0

    .line 296
    iget v6, p1, Lcom/google/android/exoplayer2/ExoPlaybackException;->rendererIndex:I

    invoke-virtual {v4, v6}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getRendererType(I)I

    move-result v6

    if-ne v9, v6, :cond_2

    .line 297
    .local v3, "isVideo":Z
    :goto_0
    new-instance v2, Lcom/vk/analytics/AnalyticsEvent$MediaDecoderErrorEvent;

    .end local v2    # "event":Lcom/vk/analytics/AnalyticsEvent;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v3, v5}, Lcom/vk/analytics/AnalyticsEvent$MediaDecoderErrorEvent;-><init>(ZLjava/lang/String;)V

    .line 310
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v3    # "isVideo":Z
    .end local v4    # "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    .restart local v2    # "event":Lcom/vk/analytics/AnalyticsEvent;
    :cond_0
    :goto_1
    invoke-static {v2}, Lcom/vk/analytics/Analytics;->log(Lcom/vk/analytics/AnalyticsEvent;)V

    .line 312
    .end local v2    # "event":Lcom/vk/analytics/AnalyticsEvent;
    :cond_1
    return-void

    .restart local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "event":Lcom/vk/analytics/AnalyticsEvent;
    .restart local v4    # "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    :cond_2
    move v3, v5

    .line 296
    goto :goto_0

    .line 299
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v4    # "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    :cond_3
    iget v5, p1, Lcom/google/android/exoplayer2/ExoPlaybackException;->type:I

    if-nez v5, :cond_4

    .line 300
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/ExoPlaybackException;->getSourceException()Ljava/io/IOException;

    move-result-object v0

    .line 301
    .local v0, "e":Ljava/io/IOException;
    if-eqz v0, :cond_0

    .line 302
    new-instance v2, Lcom/vk/analytics/AnalyticsEvent$MediaPlayerErrorEvent;

    .end local v2    # "event":Lcom/vk/analytics/AnalyticsEvent;
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Lcom/vk/analytics/AnalyticsEvent$MediaPlayerErrorEvent;-><init>(Ljava/lang/String;)V

    .restart local v2    # "event":Lcom/vk/analytics/AnalyticsEvent;
    goto :goto_1

    .line 304
    .end local v0    # "e":Ljava/io/IOException;
    :cond_4
    iget v5, p1, Lcom/google/android/exoplayer2/ExoPlaybackException;->type:I

    if-ne v5, v9, :cond_0

    .line 305
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/ExoPlaybackException;->getUnexpectedException()Ljava/lang/RuntimeException;

    move-result-object v0

    .line 306
    .local v0, "e":Ljava/lang/RuntimeException;
    if-eqz v0, :cond_0

    .line 307
    new-instance v2, Lcom/vk/analytics/AnalyticsEvent$MediaPlayerErrorEvent;

    .end local v2    # "event":Lcom/vk/analytics/AnalyticsEvent;
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Lcom/vk/analytics/AnalyticsEvent$MediaPlayerErrorEvent;-><init>(Ljava/lang/String;)V

    .restart local v2    # "event":Lcom/vk/analytics/AnalyticsEvent;
    goto :goto_1
.end method

.method public onPlayerStateChanged(ZI)V
    .locals 1
    .param p1, "playWhenReady"    # Z
    .param p2, "playbackState"    # I

    .prologue
    .line 255
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 256
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 257
    packed-switch p2, :pswitch_data_0

    .line 273
    :cond_0
    :goto_0
    return-void

    .line 259
    :pswitch_0
    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->dispatchBufferingStart(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    goto :goto_0

    .line 262
    :pswitch_1
    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->dispatchPreparedOnce(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    .line 263
    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->dispatchBufferingEnd(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    .line 264
    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->scheduleUpdateTimings(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    goto :goto_0

    .line 267
    :pswitch_2
    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->dispatchEnd(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    goto :goto_0

    .line 257
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onPositionDiscontinuity()V
    .locals 0

    .prologue
    .line 316
    return-void
.end method

.method public onRenderedFirstFrame(Landroid/view/Surface;)V
    .locals 1
    .param p1, "surface"    # Landroid/view/Surface;

    .prologue
    .line 351
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onRenderedFirstFrame(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    .line 352
    new-instance v0, Lcom/vk/analytics/AnalyticsEvent$MediaPlayerSuccessEvent;

    invoke-direct {v0}, Lcom/vk/analytics/AnalyticsEvent$MediaPlayerSuccessEvent;-><init>()V

    invoke-static {v0}, Lcom/vk/analytics/Analytics;->logOnce(Lcom/vk/analytics/AnalyticsEvent;)V

    .line 353
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 2
    .param p1, "texture"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 410
    sget-object v0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mainHandler:Landroid/os/Handler;

    invoke-static {p0, p1}, Lcom/vkontakte/android/media/ExoVideoPlayer$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/media/ExoVideoPlayer;Landroid/graphics/SurfaceTexture;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 419
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/media/TextureVideoPlayer;->onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V

    .line 420
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 2
    .param p1, "texture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 424
    sget-object v0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mainHandler:Landroid/os/Handler;

    invoke-static {p0, p1}, Lcom/vkontakte/android/media/ExoVideoPlayer$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/media/ExoVideoPlayer;Landroid/graphics/SurfaceTexture;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 432
    invoke-super {p0, p1}, Lcom/vkontakte/android/media/TextureVideoPlayer;->onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z

    move-result v0

    return v0
.end method

.method public onTimelineChanged(Lcom/google/android/exoplayer2/Timeline;Ljava/lang/Object;)V
    .locals 0
    .param p1, "timeline"    # Lcom/google/android/exoplayer2/Timeline;
    .param p2, "manifest"    # Ljava/lang/Object;

    .prologue
    .line 277
    return-void
.end method

.method public onTracksChanged(Lcom/google/android/exoplayer2/source/TrackGroupArray;Lcom/google/android/exoplayer2/trackselection/TrackSelectionArray;)V
    .locals 0
    .param p1, "trackGroups"    # Lcom/google/android/exoplayer2/source/TrackGroupArray;
    .param p2, "trackSelections"    # Lcom/google/android/exoplayer2/trackselection/TrackSelectionArray;

    .prologue
    .line 281
    return-void
.end method

.method public onVideoDecoderInitialized(Ljava/lang/String;JJ)V
    .locals 0
    .param p1, "decoderName"    # Ljava/lang/String;
    .param p2, "initializedTimestampMs"    # J
    .param p4, "initializationDurationMs"    # J

    .prologue
    .line 324
    return-void
.end method

.method public onVideoDisabled(Lcom/google/android/exoplayer2/decoder/DecoderCounters;)V
    .locals 0
    .param p1, "counters"    # Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    .prologue
    .line 357
    return-void
.end method

.method public onVideoEnabled(Lcom/google/android/exoplayer2/decoder/DecoderCounters;)V
    .locals 0
    .param p1, "counters"    # Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    .prologue
    .line 320
    return-void
.end method

.method public onVideoInputFormatChanged(Lcom/google/android/exoplayer2/Format;)V
    .locals 8
    .param p1, "format"    # Lcom/google/android/exoplayer2/Format;

    .prologue
    .line 328
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVideoTrackSelectionFactory:Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;->getSelection()Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;

    move-result-object v7

    .line 329
    .local v7, "s":Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;
    if-eqz v7, :cond_0

    .line 330
    invoke-virtual {v7, p1}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->checkVideoFormat(Lcom/google/android/exoplayer2/Format;)V

    .line 333
    :cond_0
    iget-object v6, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 334
    .local v6, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v6, :cond_1

    .line 335
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    iget v1, p1, Lcom/google/android/exoplayer2/Format;->bitrate:I

    invoke-virtual {v6}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getDuration()J

    move-result-wide v2

    invoke-virtual {v6}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/media/VigoDelegate;->bitrateChange(IJJ)V

    .line 337
    :cond_1
    return-void
.end method

.method public onVideoSizeChanged(IIIF)V
    .locals 4
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "unappliedRotationDegrees"    # I
    .param p4, "pixelWidthHeightRatio"    # F

    .prologue
    .line 346
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    sget-object v2, Lcom/vkontakte/android/media/ExoVideoPlayer;->TAG:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onVideoSizeChanged "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->i([Ljava/lang/Object;)V

    .line 347
    return-void
.end method

.method public pause()V
    .locals 10

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 189
    iget-object v6, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 190
    .local v6, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v6, :cond_2

    .line 191
    invoke-virtual {v6}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getPlaybackState()I

    move-result v7

    .line 192
    .local v7, "state":I
    const/4 v0, 0x3

    if-ne v7, v0, :cond_0

    invoke-virtual {v6}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getPlayWhenReady()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x2

    if-ne v7, v0, :cond_3

    :cond_1
    move v1, v8

    .line 194
    .local v1, "isPlaying":Z
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v6}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getDuration()J

    move-result-wide v2

    invoke-virtual {v6}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/media/VigoDelegate;->pause(ZJJ)V

    .line 195
    invoke-virtual {v6, v9}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setPlayWhenReady(Z)V

    .line 196
    invoke-direct {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->unscheduleUpdateTimings()V

    .line 197
    invoke-virtual {v6}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getDuration()J

    move-result-wide v2

    invoke-virtual {v6}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x3e8

    cmp-long v0, v2, v4

    if-gez v0, :cond_2

    .line 198
    iput-boolean v8, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mCompleted:Z

    .line 199
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->onPlaybackCompleted(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    .line 202
    .end local v1    # "isPlaying":Z
    .end local v7    # "state":I
    :cond_2
    invoke-direct {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->stopHeartBeatSending()V

    .line 203
    return-void

    .restart local v7    # "state":I
    :cond_3
    move v1, v9

    .line 192
    goto :goto_0
.end method

.method public play(Z)V
    .locals 6
    .param p1, "replay"    # Z

    .prologue
    .line 172
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 173
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_2

    .line 174
    iget-boolean v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mCompleted:Z

    if-eqz v1, :cond_0

    .line 175
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mCompleted:Z

    .line 176
    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->seekTo(J)V

    .line 178
    :cond_0
    if-nez p1, :cond_1

    .line 179
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getDuration()J

    move-result-wide v2

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v4

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/vkontakte/android/media/VigoDelegate;->play(JJ)V

    .line 181
    :cond_1
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setPlayWhenReady(Z)V

    .line 182
    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->scheduleUpdateTimings(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    .line 183
    invoke-direct {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->startHeartBeatSending()V

    .line 185
    :cond_2
    return-void
.end method

.method public recallReady()V
    .locals 1

    .prologue
    .line 242
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 243
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 244
    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->notifyPreparedIfReady(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    .line 246
    :cond_0
    return-void
.end method

.method public replay(I)V
    .locals 6
    .param p1, "position"    # I

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 165
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 166
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getDuration()J

    move-result-wide v2

    int-to-long v4, p1

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/vkontakte/android/media/VigoDelegate;->play(JJ)V

    .line 168
    :cond_0
    return-void
.end method

.method public seek(I)V
    .locals 9
    .param p1, "offset"    # I

    .prologue
    const/4 v3, 0x0

    .line 207
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 208
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_3

    .line 209
    iput-boolean v3, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mCompleted:Z

    .line 210
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getPlaybackState()I

    move-result v8

    .line 211
    .local v8, "state":I
    const/4 v1, 0x3

    if-ne v8, v1, :cond_0

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getPlayWhenReady()Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const/4 v1, 0x2

    if-ne v8, v1, :cond_2

    :cond_1
    const/4 v3, 0x1

    .line 213
    .local v3, "isPlaying":Z
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    int-to-float v2, p1

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getDuration()J

    move-result-wide v4

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v6

    invoke-virtual/range {v1 .. v7}, Lcom/vkontakte/android/media/VigoDelegate;->seek(FZJJ)V

    .line 214
    int-to-long v4, p1

    invoke-virtual {v0, v4, v5}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->seekTo(J)V

    .line 216
    .end local v3    # "isPlaying":Z
    .end local v8    # "state":I
    :cond_3
    return-void
.end method

.method public setDataSourceAndPrepare(Ljava/lang/String;IZZ)V
    .locals 8
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "quality"    # I
    .param p3, "useVigo"    # Z
    .param p4, "autoplay"    # Z

    .prologue
    .line 361
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPrepared:Z

    .line 362
    iput p2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mQuality:I

    .line 363
    iput-boolean p4, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->isAutoplay:Z

    .line 364
    invoke-static {p4}, Lcom/vkontakte/android/media/VigoDelegate;->getSVCid(Z)Ljava/lang/String;

    move-result-object v7

    .line 365
    .local v7, "svcid":Ljava/lang/String;
    iget-object v6, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 366
    .local v6, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v6, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mSource:Lcom/google/android/exoplayer2/source/MediaSource;

    if-eqz v0, :cond_0

    .line 367
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v6}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getDuration()J

    move-result-wide v2

    invoke-virtual {v6}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v4

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/media/VigoDelegate;->release(JJ)V

    .line 369
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mediaSourceListener:Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;->setUrl(Ljava/lang/String;)V

    .line 370
    const/4 v0, -0x2

    if-ne p2, v0, :cond_1

    .line 371
    new-instance v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mDataSourceFactory:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    sget-object v3, Lcom/vkontakte/android/media/ExoVideoPlayer;->mainHandler:Landroid/os/Handler;

    iget-object v4, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mediaSourceListener:Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource;-><init>(Landroid/net/Uri;Lcom/google/android/exoplayer2/upstream/DataSource$Factory;Landroid/os/Handler;Lcom/google/android/exoplayer2/source/AdaptiveMediaSourceEventListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mSource:Lcom/google/android/exoplayer2/source/MediaSource;

    .line 372
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    const/16 v1, 0x64

    invoke-virtual {v0, p1, v1, v7}, Lcom/vkontakte/android/media/VigoDelegate;->setDataSourceAndPrepare(Ljava/lang/String;ILjava/lang/String;)V

    .line 378
    .end local p2    # "quality":I
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->renderView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->renderView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    :goto_1
    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->doSetDataSource(Landroid/graphics/SurfaceTexture;)V

    .line 379
    return-void

    .line 374
    .restart local p2    # "quality":I
    :cond_1
    new-instance v0, Lcom/google/android/exoplayer2/source/ExtractorMediaSource;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mDataSourceFactory:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    sget-object v3, Lcom/vkontakte/android/media/ExoVideoPlayer;->sExtractorFactory:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;

    sget-object v4, Lcom/vkontakte/android/media/ExoVideoPlayer;->mainHandler:Landroid/os/Handler;

    iget-object v5, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mediaSourceListener:Lcom/vkontakte/android/media/ExoVideoPlayer$MediaSourceEventListener;

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/source/ExtractorMediaSource;-><init>(Landroid/net/Uri;Lcom/google/android/exoplayer2/upstream/DataSource$Factory;Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;Landroid/os/Handler;Lcom/google/android/exoplayer2/source/ExtractorMediaSource$EventListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mSource:Lcom/google/android/exoplayer2/source/MediaSource;

    .line 376
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    if-eqz p3, :cond_2

    .end local p2    # "quality":I
    :goto_2
    invoke-virtual {v0, p1, p2, v7}, Lcom/vkontakte/android/media/VigoDelegate;->setDataSourceAndPrepare(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_0

    .restart local p2    # "quality":I
    :cond_2
    const/4 p2, -0x1

    goto :goto_2

    .line 378
    .end local p2    # "quality":I
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public setPlayerStateListener(Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;)V
    .locals 1
    .param p1, "l"    # Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;

    .prologue
    .line 139
    invoke-super {p0, p1}, Lcom/vkontakte/android/media/TextureVideoPlayer;->setPlayerStateListener(Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;)V

    .line 140
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mLastException:Lcom/google/android/exoplayer2/ExoPlaybackException;

    if-eqz v0, :cond_1

    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mLastException:Lcom/google/android/exoplayer2/ExoPlaybackException;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->dispatchError(Lcom/google/android/exoplayer2/ExoPlaybackException;)I

    .line 148
    :cond_0
    :goto_0
    return-void

    .line 143
    :cond_1
    if-eqz p1, :cond_0

    .line 147
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->notifyPreparedIfReady(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    goto :goto_0
.end method

.method public setVolume(F)V
    .locals 1
    .param p1, "gain"    # F

    .prologue
    .line 234
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 235
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 236
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVolume(F)V

    .line 238
    :cond_0
    return-void
.end method

.method public stopAndRelease()V
    .locals 6

    .prologue
    .line 388
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 389
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 390
    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mVigo:Lcom/vkontakte/android/media/VigoDelegate;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getDuration()J

    move-result-wide v2

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v4

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/vkontakte/android/media/VigoDelegate;->release(JJ)V

    .line 391
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->stop()V

    .line 392
    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->release(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    .line 393
    invoke-direct {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->unscheduleUpdateTimings()V

    .line 394
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mPrepared:Z

    .line 395
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer;->mLastException:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 397
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer;->stopHeartBeatSending()V

    .line 398
    invoke-super {p0}, Lcom/vkontakte/android/media/TextureVideoPlayer;->stopAndRelease()V

    .line 399
    return-void
.end method
