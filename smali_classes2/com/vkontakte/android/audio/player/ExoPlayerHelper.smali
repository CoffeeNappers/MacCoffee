.class Lcom/vkontakte/android/audio/player/ExoPlayerHelper;
.super Ljava/lang/Object;
.source "ExoPlayerHelper.java"

# interfaces
.implements Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/ExoPlayerHelper$ProgressRunnable;
    }
.end annotation


# static fields
.field private static factory:Lokhttp3/Call$Factory;

.field private static final sBandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

.field private static final sDataSourceFactoryCache:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

.field private static final sDataSourceFactoryLocalhost:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

.field private static final sExtractorFactory:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;

.field private static final sMainHandler:Landroid/os/Handler;

.field private static final sVideoTrackSelectionFactory:Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;


# instance fields
.field private context:Landroid/content/Context;

.field private final id:I

.field private mAudioSessionId:I

.field private final mListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

.field private mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

.field private mPrepared:Z

.field private mProgressTimer:Lcom/vkontakte/android/audio/utils/Timer;

.field private mState:Lcom/vkontakte/android/audio/player/PlayerState;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final mWakeLock:Lcom/vkontakte/android/audio/utils/WakeLockEx;

.field private refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

.field private useLocalhost:Z


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    .line 50
    invoke-static {}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$$Lambda$1;->lambdaFactory$()Lokhttp3/Call$Factory;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->factory:Lokhttp3/Call$Factory;

    .line 52
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->sMainHandler:Landroid/os/Handler;

    .line 53
    new-instance v0, Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;-><init>()V

    sput-object v0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->sBandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    .line 54
    new-instance v0, Lcom/vkontakte/android/audio/player/exo/AudioDataSourceFactory;

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    sget-object v2, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->sBandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    new-instance v3, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSourceFactory;

    sget-object v4, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->factory:Lokhttp3/Call$Factory;

    sget-object v5, Lcom/vkontakte/android/api/APIController;->USER_AGENT:Ljava/lang/String;

    sget-object v6, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->sBandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    invoke-direct {v3, v4, v5, v6}, Lcom/vkontakte/android/audio/player/exo/AudioOkHttpDataSourceFactory;-><init>(Lokhttp3/Call$Factory;Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/TransferListener;)V

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/audio/player/exo/AudioDataSourceFactory;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/upstream/TransferListener;Lcom/google/android/exoplayer2/upstream/DataSource$Factory;)V

    sput-object v0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->sDataSourceFactoryCache:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    .line 56
    new-instance v0, Lcom/google/android/exoplayer2/upstream/DefaultDataSourceFactory;

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    sget-object v2, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->sBandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    new-instance v3, Lcom/google/android/exoplayer2/upstream/DefaultHttpDataSourceFactory;

    sget-object v4, Lcom/vkontakte/android/api/APIController;->USER_AGENT:Ljava/lang/String;

    sget-object v5, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->sBandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    invoke-direct {v3, v4, v5}, Lcom/google/android/exoplayer2/upstream/DefaultHttpDataSourceFactory;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/TransferListener;)V

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/exoplayer2/upstream/DefaultDataSourceFactory;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/upstream/TransferListener;Lcom/google/android/exoplayer2/upstream/DataSource$Factory;)V

    sput-object v0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->sDataSourceFactoryLocalhost:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    .line 59
    new-instance v0, Lcom/google/android/exoplayer2/extractor/DefaultExtractorsFactory;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/extractor/DefaultExtractorsFactory;-><init>()V

    sput-object v0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->sExtractorFactory:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;

    .line 60
    new-instance v0, Lcom/google/android/exoplayer2/trackselection/AdaptiveVideoTrackSelection$Factory;

    sget-object v1, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->sBandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/trackselection/AdaptiveVideoTrackSelection$Factory;-><init>(Lcom/google/android/exoplayer2/upstream/BandwidthMeter;)V

    sput-object v0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->sVideoTrackSelectionFactory:Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;ILcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;Z)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "id"    # I
    .param p3, "listener"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;
    .param p4, "useLocalhost"    # Z

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 76
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->context:Landroid/content/Context;

    .line 77
    iput p2, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->id:I

    .line 78
    iput-object p3, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    .line 79
    iput-boolean p4, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->useLocalhost:Z

    .line 80
    new-instance v0, Lcom/vkontakte/android/audio/utils/WakeLockEx;

    const-class v1, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/audio/utils/WakeLockEx;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mWakeLock:Lcom/vkontakte/android/audio/utils/WakeLockEx;

    .line 81
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->STOPPED:Lcom/vkontakte/android/audio/player/PlayerState;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->setState(Lcom/vkontakte/android/audio/player/PlayerState;)V

    .line 82
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->init()V

    .line 83
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/google/android/exoplayer2/SimpleExoPlayer;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mListener:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPrepared:Z

    return v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/ExoPlayerHelper;
    .param p1, "x1"    # Z

    .prologue
    .line 48
    iput-boolean p1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPrepared:Z

    return p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/vkontakte/android/audio/player/PlayerState;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->startProgressTimer()V

    return-void
.end method

.method private getsDataSourceFactory()Lcom/google/android/exoplayer2/upstream/DataSource$Factory;
    .locals 1

    .prologue
    .line 127
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->useLocalhost:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->sDataSourceFactoryLocalhost:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->sDataSourceFactoryCache:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    goto :goto_0
.end method

.method private init()V
    .locals 11

    .prologue
    .line 219
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    if-nez v4, :cond_0

    .line 220
    new-instance v10, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;

    sget-object v4, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->sVideoTrackSelectionFactory:Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;

    invoke-direct {v10, v4}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;-><init>(Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;)V

    .line 221
    .local v10, "trackSelector":Lcom/google/android/exoplayer2/trackselection/TrackSelector;
    new-instance v1, Lcom/google/android/exoplayer2/upstream/DefaultAllocator;

    const/4 v4, 0x1

    const/high16 v5, 0x100000

    invoke-direct {v1, v4, v5}, Lcom/google/android/exoplayer2/upstream/DefaultAllocator;-><init>(ZI)V

    .line 222
    .local v1, "allocator":Lcom/google/android/exoplayer2/upstream/DefaultAllocator;
    const v2, 0x75300

    .line 223
    .local v2, "minBufferMs":I
    const v3, 0x927c0

    .line 224
    .local v3, "maxBufferMs":I
    const/16 v9, 0x9c4

    .line 225
    .local v9, "bufferForPlaybackMs":I
    const/16 v8, 0x1388

    .line 226
    .local v8, "bufferForPlaybackAfterRebufferMs":I
    new-instance v0, Lcom/google/android/exoplayer2/DefaultLoadControl;

    int-to-long v4, v9

    int-to-long v6, v8

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer2/DefaultLoadControl;-><init>(Lcom/google/android/exoplayer2/upstream/DefaultAllocator;IIJJ)V

    .line 227
    .local v0, "loadControl":Lcom/google/android/exoplayer2/LoadControl;
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->context:Landroid/content/Context;

    invoke-static {v4, v10, v0}, Lcom/google/android/exoplayer2/ExoPlayerFactory;->newSimpleInstance(Landroid/content/Context;Lcom/google/android/exoplayer2/trackselection/TrackSelector;Lcom/google/android/exoplayer2/LoadControl;)Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 228
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    new-instance v5, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;

    invoke-direct {v5, p0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;-><init>(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)V

    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->addListener(Lcom/google/android/exoplayer2/ExoPlayer$EventListener;)V

    .line 297
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-virtual {v4}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getAudioSessionId()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mAudioSessionId:I

    .line 299
    .end local v0    # "loadControl":Lcom/google/android/exoplayer2/LoadControl;
    .end local v1    # "allocator":Lcom/google/android/exoplayer2/upstream/DefaultAllocator;
    .end local v2    # "minBufferMs":I
    .end local v3    # "maxBufferMs":I
    .end local v8    # "bufferForPlaybackAfterRebufferMs":I
    .end local v9    # "bufferForPlaybackMs":I
    .end local v10    # "trackSelector":Lcom/google/android/exoplayer2/trackselection/TrackSelector;
    :cond_0
    return-void
.end method

.method static synthetic lambda$static$0(Lokhttp3/Request;)Lokhttp3/Call;
    .locals 1
    .param p0, "request"    # Lokhttp3/Request;

    .prologue
    .line 50
    invoke-static {}, Lcom/vk/core/network/Network;->getDefaultClient()Lokhttp3/OkHttpClient;

    move-result-object v0

    invoke-virtual {v0, p0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    return-object v0
.end method

.method private releaseInit()V
    .locals 0

    .prologue
    .line 302
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->release()V

    .line 303
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->init()V

    .line 304
    return-void
.end method

.method private setState(Lcom/vkontakte/android/audio/player/PlayerState;)V
    .locals 2
    .param p1, "state"    # Lcom/vkontakte/android/audio/player/PlayerState;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 114
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 115
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v0, v1, :cond_0

    .line 116
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mWakeLock:Lcom/vkontakte/android/audio/utils/WakeLockEx;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/utils/WakeLockEx;->acquire()V

    .line 119
    :goto_0
    return-void

    .line 118
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mWakeLock:Lcom/vkontakte/android/audio/utils/WakeLockEx;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/utils/WakeLockEx;->releaseSafety()V

    goto :goto_0
.end method

.method private startProgressTimer()V
    .locals 6

    .prologue
    .line 307
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mProgressTimer:Lcom/vkontakte/android/audio/utils/Timer;

    if-nez v0, :cond_0

    .line 308
    new-instance v0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$ProgressRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$ProgressRunnable;-><init>(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;)V

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x1f4

    invoke-static {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/audio/utils/Timer;->startNewTimer(Ljava/lang/Runnable;JJ)Lcom/vkontakte/android/audio/utils/Timer;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mProgressTimer:Lcom/vkontakte/android/audio/utils/Timer;

    .line 309
    :cond_0
    return-void
.end method

.method private stopProgressTimer()V
    .locals 1

    .prologue
    .line 312
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mProgressTimer:Lcom/vkontakte/android/audio/utils/Timer;

    if-eqz v0, :cond_0

    .line 313
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mProgressTimer:Lcom/vkontakte/android/audio/utils/Timer;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/utils/Timer;->stop()V

    .line 314
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mProgressTimer:Lcom/vkontakte/android/audio/utils/Timer;

    .line 316
    :cond_0
    return-void
.end method


# virtual methods
.method public canPlay()Z
    .locals 1

    .prologue
    .line 142
    const/4 v0, 0x1

    return v0
.end method

.method public getAudioSessionId()I
    .locals 1

    .prologue
    .line 212
    iget v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mAudioSessionId:I

    if-nez v0, :cond_0

    .line 213
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->init()V

    .line 215
    :cond_0
    iget v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mAudioSessionId:I

    return v0
.end method

.method public getCurrentPosition()J
    .locals 2

    .prologue
    .line 199
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPrepared:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public getDuration()J
    .locals 2

    .prologue
    .line 194
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPrepared:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getDuration()J

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 105
    iget v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->id:I

    return v0
.end method

.method public getRefer()Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    return-object v0
.end method

.method public getState()Lcom/vkontakte/android/audio/player/PlayerState;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 100
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    return-object v0
.end method

.method public pause()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 181
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v1, v2, :cond_1

    .line 182
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PAUSED:Lcom/vkontakte/android/audio/player/PlayerState;

    invoke-direct {p0, v1}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->setState(Lcom/vkontakte/android/audio/player/PlayerState;)V

    .line 183
    iget-boolean v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPrepared:Z

    if-eqz v1, :cond_0

    .line 184
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setPlayWhenReady(Z)V

    .line 186
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->stopProgressTimer()V

    .line 187
    const/4 v0, 0x1

    .line 189
    :cond_1
    return v0
.end method

.method public play(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 6
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    iput-object p3, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .line 133
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->releaseInit()V

    .line 134
    new-instance v0, Lcom/google/android/exoplayer2/source/ExtractorMediaSource;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->getsDataSourceFactory()Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    move-result-object v2

    sget-object v3, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->sExtractorFactory:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;

    sget-object v4, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->sMainHandler:Landroid/os/Handler;

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/source/ExtractorMediaSource;-><init>(Landroid/net/Uri;Lcom/google/android/exoplayer2/upstream/DataSource$Factory;Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;Landroid/os/Handler;Lcom/google/android/exoplayer2/source/ExtractorMediaSource$EventListener;)V

    .line 136
    .local v0, "mediaSource":Lcom/google/android/exoplayer2/source/MediaSource;
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->prepare(Lcom/google/android/exoplayer2/source/MediaSource;)V

    .line 137
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    invoke-direct {p0, v1}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->setState(Lcom/vkontakte/android/audio/player/PlayerState;)V

    .line 138
    return-void
.end method

.method public release()V
    .locals 1

    .prologue
    .line 87
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->STOPPED:Lcom/vkontakte/android/audio/player/PlayerState;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->setState(Lcom/vkontakte/android/audio/player/PlayerState;)V

    .line 88
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mWakeLock:Lcom/vkontakte/android/audio/utils/WakeLockEx;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/utils/WakeLockEx;->releaseSafety()V

    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    if-eqz v0, :cond_0

    .line 90
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->release()V

    .line 91
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .line 93
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPrepared:Z

    .line 94
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->stopProgressTimer()V

    .line 95
    return-void
.end method

.method public resume()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 168
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mState:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerState;->PAUSED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v1, v2, :cond_1

    .line 169
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    invoke-direct {p0, v1}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->setState(Lcom/vkontakte/android/audio/player/PlayerState;)V

    .line 170
    iget-boolean v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPrepared:Z

    if-eqz v1, :cond_0

    .line 171
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setPlayWhenReady(Z)V

    .line 172
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->startProgressTimer()V

    .line 176
    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public rewind()Z
    .locals 1

    .prologue
    .line 147
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->seekTo(I)Z

    move-result v0

    return v0
.end method

.method public seekTo(I)Z
    .locals 4
    .param p1, "millis"    # I

    .prologue
    .line 157
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPrepared:Z

    if-eqz v0, :cond_0

    .line 158
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->stopProgressTimer()V

    .line 159
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->seekTo(J)V

    .line 160
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->startProgressTimer()V

    .line 161
    const/4 v0, 0x1

    .line 163
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setVolume(F)V
    .locals 1
    .param p1, "volume"    # F

    .prologue
    .line 204
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    if-nez v0, :cond_0

    .line 208
    :goto_0
    return-void

    .line 207
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->mPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVolume(F)V

    goto :goto_0
.end method

.method public stop()V
    .locals 0

    .prologue
    .line 123
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->release()V

    .line 124
    return-void
.end method

.method public tryNext()Z
    .locals 1

    .prologue
    .line 152
    const/4 v0, 0x0

    return v0
.end method
