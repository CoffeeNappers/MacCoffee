.class public Lcom/vk/core/view/SimpleVideoView;
.super Landroid/view/TextureView;
.source "SimpleVideoView.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/core/view/SimpleVideoView$FocusListener;,
        Lcom/vk/core/view/SimpleVideoView$OnErrorListener;,
        Lcom/vk/core/view/SimpleVideoView$OnFirstFrameRenderedListener;,
        Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;,
        Lcom/vk/core/view/SimpleVideoView$OnEndListener;,
        Lcom/vk/core/view/SimpleVideoView$OnPreparedListener;,
        Lcom/vk/core/view/SimpleVideoView$VideoHandler;,
        Lcom/vk/core/view/SimpleVideoView$ComponentListener;
    }
.end annotation


# static fields
.field private static final STATE_ERROR:I = -0x1

.field private static final STATE_IDLE:I = 0x0

.field private static final STATE_PLAYBACK_COMPLETED:I = 0x3

.field private static final STATE_PREPARED:I = 0x2

.field private static final STATE_PREPARING:I = 0x1

.field private static final TAG:Ljava/lang/String;

.field private static final backgroundThread:Landroid/os/HandlerThread;


# instance fields
.field private final bandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

.field private final bgHandler:Landroid/os/Handler;

.field private bufferForPlaybackMs:I

.field private buffering:Z

.field private final componentListener:Lcom/vk/core/view/SimpleVideoView$ComponentListener;

.field private currentState:I

.field private final dataSourceFactory:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

.field private final extractorsFactory:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;

.field private fitVideo:Z

.field private final focusListener:Lcom/vk/core/view/SimpleVideoView$FocusListener;

.field private final handler:Landroid/os/Handler;

.field private loop:Z

.field private mute:Z

.field private onBufferingEventsListener:Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;

.field private onEndListener:Lcom/vk/core/view/SimpleVideoView$OnEndListener;

.field private onErrorListener:Lcom/vk/core/view/SimpleVideoView$OnErrorListener;

.field private onFirstFrameRenderedListener:Lcom/vk/core/view/SimpleVideoView$OnFirstFrameRenderedListener;

.field private onPreparedListener:Lcom/vk/core/view/SimpleVideoView$OnPreparedListener;

.field private playWhenReady:Z

.field private final playerRef:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/google/android/exoplayer2/SimpleExoPlayer;",
            ">;"
        }
    .end annotation
.end field

.field private sourceUri:Landroid/net/Uri;

.field private surfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

.field private unappliedRotationDegrees:I

.field private final videoHandler:Lcom/vk/core/view/SimpleVideoView$VideoHandler;

.field private videoHeight:I

.field private videoWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 51
    const-class v0, Lcom/vk/core/view/SimpleVideoView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/core/view/SimpleVideoView;->TAG:Ljava/lang/String;

    .line 53
    new-instance v0, Landroid/os/HandlerThread;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/vk/core/view/SimpleVideoView;->TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "Thread"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/core/view/SimpleVideoView;->backgroundThread:Landroid/os/HandlerThread;

    .line 55
    sget-object v0, Lcom/vk/core/view/SimpleVideoView;->backgroundThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 97
    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 64
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->handler:Landroid/os/Handler;

    .line 65
    new-instance v0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;

    invoke-direct {v0, p0}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;-><init>(Lcom/vk/core/view/SimpleVideoView;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->videoHandler:Lcom/vk/core/view/SimpleVideoView$VideoHandler;

    .line 66
    new-instance v0, Landroid/os/Handler;

    sget-object v1, Lcom/vk/core/view/SimpleVideoView;->backgroundThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->bgHandler:Landroid/os/Handler;

    .line 67
    new-instance v0, Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;-><init>()V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->bandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    .line 68
    new-instance v0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;

    invoke-direct {v0, p0, v5}, Lcom/vk/core/view/SimpleVideoView$ComponentListener;-><init>(Lcom/vk/core/view/SimpleVideoView;Lcom/vk/core/view/SimpleVideoView$1;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->componentListener:Lcom/vk/core/view/SimpleVideoView$ComponentListener;

    .line 69
    new-instance v0, Lcom/google/android/exoplayer2/upstream/DefaultDataSourceFactory;

    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 70
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/core/network/Network;->getUserAgent()Lcom/vk/core/network/NetworkUserAgent;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/core/network/NetworkUserAgent;->userAgent()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/core/view/SimpleVideoView;->bandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/exoplayer2/upstream/DefaultDataSourceFactory;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/TransferListener;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->dataSourceFactory:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    .line 71
    new-instance v0, Lcom/google/android/exoplayer2/extractor/DefaultExtractorsFactory;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/extractor/DefaultExtractorsFactory;-><init>()V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->extractorsFactory:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;

    .line 72
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->playerRef:Ljava/util/concurrent/atomic/AtomicReference;

    .line 73
    new-instance v0, Lcom/vk/core/view/SimpleVideoView$FocusListener;

    invoke-direct {v0, p0, v5}, Lcom/vk/core/view/SimpleVideoView$FocusListener;-><init>(Lcom/vk/core/view/SimpleVideoView;Lcom/vk/core/view/SimpleVideoView$1;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->focusListener:Lcom/vk/core/view/SimpleVideoView$FocusListener;

    .line 77
    iput v4, p0, Lcom/vk/core/view/SimpleVideoView;->currentState:I

    .line 78
    iput-boolean v4, p0, Lcom/vk/core/view/SimpleVideoView;->buffering:Z

    .line 88
    const/16 v0, 0x1f4

    iput v0, p0, Lcom/vk/core/view/SimpleVideoView;->bufferForPlaybackMs:I

    .line 89
    iput-boolean v4, p0, Lcom/vk/core/view/SimpleVideoView;->loop:Z

    .line 90
    iput-boolean v4, p0, Lcom/vk/core/view/SimpleVideoView;->mute:Z

    .line 91
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/core/view/SimpleVideoView;->fitVideo:Z

    .line 92
    iput-boolean v4, p0, Lcom/vk/core/view/SimpleVideoView;->playWhenReady:Z

    .line 98
    invoke-direct {p0}, Lcom/vk/core/view/SimpleVideoView;->init()V

    .line 99
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 102
    invoke-direct {p0, p1, p2}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 64
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->handler:Landroid/os/Handler;

    .line 65
    new-instance v0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;

    invoke-direct {v0, p0}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;-><init>(Lcom/vk/core/view/SimpleVideoView;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->videoHandler:Lcom/vk/core/view/SimpleVideoView$VideoHandler;

    .line 66
    new-instance v0, Landroid/os/Handler;

    sget-object v1, Lcom/vk/core/view/SimpleVideoView;->backgroundThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->bgHandler:Landroid/os/Handler;

    .line 67
    new-instance v0, Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;-><init>()V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->bandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    .line 68
    new-instance v0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;

    invoke-direct {v0, p0, v5}, Lcom/vk/core/view/SimpleVideoView$ComponentListener;-><init>(Lcom/vk/core/view/SimpleVideoView;Lcom/vk/core/view/SimpleVideoView$1;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->componentListener:Lcom/vk/core/view/SimpleVideoView$ComponentListener;

    .line 69
    new-instance v0, Lcom/google/android/exoplayer2/upstream/DefaultDataSourceFactory;

    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 70
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/core/network/Network;->getUserAgent()Lcom/vk/core/network/NetworkUserAgent;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/core/network/NetworkUserAgent;->userAgent()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/core/view/SimpleVideoView;->bandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/exoplayer2/upstream/DefaultDataSourceFactory;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/TransferListener;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->dataSourceFactory:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    .line 71
    new-instance v0, Lcom/google/android/exoplayer2/extractor/DefaultExtractorsFactory;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/extractor/DefaultExtractorsFactory;-><init>()V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->extractorsFactory:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;

    .line 72
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->playerRef:Ljava/util/concurrent/atomic/AtomicReference;

    .line 73
    new-instance v0, Lcom/vk/core/view/SimpleVideoView$FocusListener;

    invoke-direct {v0, p0, v5}, Lcom/vk/core/view/SimpleVideoView$FocusListener;-><init>(Lcom/vk/core/view/SimpleVideoView;Lcom/vk/core/view/SimpleVideoView$1;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->focusListener:Lcom/vk/core/view/SimpleVideoView$FocusListener;

    .line 77
    iput v4, p0, Lcom/vk/core/view/SimpleVideoView;->currentState:I

    .line 78
    iput-boolean v4, p0, Lcom/vk/core/view/SimpleVideoView;->buffering:Z

    .line 88
    const/16 v0, 0x1f4

    iput v0, p0, Lcom/vk/core/view/SimpleVideoView;->bufferForPlaybackMs:I

    .line 89
    iput-boolean v4, p0, Lcom/vk/core/view/SimpleVideoView;->loop:Z

    .line 90
    iput-boolean v4, p0, Lcom/vk/core/view/SimpleVideoView;->mute:Z

    .line 91
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/core/view/SimpleVideoView;->fitVideo:Z

    .line 92
    iput-boolean v4, p0, Lcom/vk/core/view/SimpleVideoView;->playWhenReady:Z

    .line 103
    invoke-direct {p0}, Lcom/vk/core/view/SimpleVideoView;->init()V

    .line 104
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 107
    invoke-direct {p0, p1, p2, p3}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 64
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->handler:Landroid/os/Handler;

    .line 65
    new-instance v0, Lcom/vk/core/view/SimpleVideoView$VideoHandler;

    invoke-direct {v0, p0}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;-><init>(Lcom/vk/core/view/SimpleVideoView;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->videoHandler:Lcom/vk/core/view/SimpleVideoView$VideoHandler;

    .line 66
    new-instance v0, Landroid/os/Handler;

    sget-object v1, Lcom/vk/core/view/SimpleVideoView;->backgroundThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->bgHandler:Landroid/os/Handler;

    .line 67
    new-instance v0, Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;-><init>()V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->bandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    .line 68
    new-instance v0, Lcom/vk/core/view/SimpleVideoView$ComponentListener;

    invoke-direct {v0, p0, v5}, Lcom/vk/core/view/SimpleVideoView$ComponentListener;-><init>(Lcom/vk/core/view/SimpleVideoView;Lcom/vk/core/view/SimpleVideoView$1;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->componentListener:Lcom/vk/core/view/SimpleVideoView$ComponentListener;

    .line 69
    new-instance v0, Lcom/google/android/exoplayer2/upstream/DefaultDataSourceFactory;

    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 70
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/core/network/Network;->getUserAgent()Lcom/vk/core/network/NetworkUserAgent;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/core/network/NetworkUserAgent;->userAgent()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/core/view/SimpleVideoView;->bandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/exoplayer2/upstream/DefaultDataSourceFactory;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/exoplayer2/upstream/TransferListener;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->dataSourceFactory:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    .line 71
    new-instance v0, Lcom/google/android/exoplayer2/extractor/DefaultExtractorsFactory;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/extractor/DefaultExtractorsFactory;-><init>()V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->extractorsFactory:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;

    .line 72
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->playerRef:Ljava/util/concurrent/atomic/AtomicReference;

    .line 73
    new-instance v0, Lcom/vk/core/view/SimpleVideoView$FocusListener;

    invoke-direct {v0, p0, v5}, Lcom/vk/core/view/SimpleVideoView$FocusListener;-><init>(Lcom/vk/core/view/SimpleVideoView;Lcom/vk/core/view/SimpleVideoView$1;)V

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->focusListener:Lcom/vk/core/view/SimpleVideoView$FocusListener;

    .line 77
    iput v4, p0, Lcom/vk/core/view/SimpleVideoView;->currentState:I

    .line 78
    iput-boolean v4, p0, Lcom/vk/core/view/SimpleVideoView;->buffering:Z

    .line 88
    const/16 v0, 0x1f4

    iput v0, p0, Lcom/vk/core/view/SimpleVideoView;->bufferForPlaybackMs:I

    .line 89
    iput-boolean v4, p0, Lcom/vk/core/view/SimpleVideoView;->loop:Z

    .line 90
    iput-boolean v4, p0, Lcom/vk/core/view/SimpleVideoView;->mute:Z

    .line 91
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/core/view/SimpleVideoView;->fitVideo:Z

    .line 92
    iput-boolean v4, p0, Lcom/vk/core/view/SimpleVideoView;->playWhenReady:Z

    .line 108
    invoke-direct {p0}, Lcom/vk/core/view/SimpleVideoView;->init()V

    .line 109
    return-void
.end method

.method private abandonAudioFocus()V
    .locals 2

    .prologue
    .line 430
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView;->focusListener:Lcom/vk/core/view/SimpleVideoView$FocusListener;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 431
    return-void
.end method

.method static synthetic access$1000(Lcom/vk/core/view/SimpleVideoView;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/vk/core/view/SimpleVideoView;->setCurrentState(I)V

    return-void
.end method

.method static synthetic access$1100(Lcom/vk/core/view/SimpleVideoView;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/vk/core/view/SimpleVideoView;->dispatchError(I)V

    return-void
.end method

.method static synthetic access$1200(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnPreparedListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->onPreparedListener:Lcom/vk/core/view/SimpleVideoView$OnPreparedListener;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->onBufferingEventsListener:Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnEndListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->onEndListener:Lcom/vk/core/view/SimpleVideoView$OnEndListener;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnFirstFrameRenderedListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->onFirstFrameRenderedListener:Lcom/vk/core/view/SimpleVideoView$OnFirstFrameRenderedListener;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vk/core/view/SimpleVideoView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;

    .prologue
    .line 49
    iget v0, p0, Lcom/vk/core/view/SimpleVideoView;->unappliedRotationDegrees:I

    return v0
.end method

.method static synthetic access$1602(Lcom/vk/core/view/SimpleVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 49
    iput p1, p0, Lcom/vk/core/view/SimpleVideoView;->unappliedRotationDegrees:I

    return p1
.end method

.method static synthetic access$1700(Lcom/vk/core/view/SimpleVideoView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/vk/core/view/SimpleVideoView;->updateMatrix()V

    return-void
.end method

.method static synthetic access$1800(Lcom/vk/core/view/SimpleVideoView;)Lcom/vk/core/view/SimpleVideoView$OnErrorListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->onErrorListener:Lcom/vk/core/view/SimpleVideoView$OnErrorListener;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/vk/core/view/SimpleVideoView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;

    .prologue
    .line 49
    iget-boolean v0, p0, Lcom/vk/core/view/SimpleVideoView;->mute:Z

    return v0
.end method

.method static synthetic access$200(Lcom/vk/core/view/SimpleVideoView;III)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .prologue
    .line 49
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/core/view/SimpleVideoView;->dispatchVideoSizeChanged(III)V

    return-void
.end method

.method static synthetic access$300(Lcom/vk/core/view/SimpleVideoView;Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;
    .param p1, "x1"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/vk/core/view/SimpleVideoView;->dispatchFirstFrameRendered(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vk/core/view/SimpleVideoView;Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;
    .param p1, "x1"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/vk/core/view/SimpleVideoView;->dispatchBufferingStart(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vk/core/view/SimpleVideoView;Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;
    .param p1, "x1"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/vk/core/view/SimpleVideoView;->dispatchPrepared(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    return-void
.end method

.method static synthetic access$600(Lcom/vk/core/view/SimpleVideoView;Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;
    .param p1, "x1"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/vk/core/view/SimpleVideoView;->dispatchBufferingEnd(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    return-void
.end method

.method static synthetic access$700(Lcom/vk/core/view/SimpleVideoView;Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;
    .param p1, "x1"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/vk/core/view/SimpleVideoView;->dispatchEnd(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    return-void
.end method

.method static synthetic access$800(Lcom/vk/core/view/SimpleVideoView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;

    .prologue
    .line 49
    iget v0, p0, Lcom/vk/core/view/SimpleVideoView;->videoWidth:I

    return v0
.end method

.method static synthetic access$802(Lcom/vk/core/view/SimpleVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 49
    iput p1, p0, Lcom/vk/core/view/SimpleVideoView;->videoWidth:I

    return p1
.end method

.method static synthetic access$900(Lcom/vk/core/view/SimpleVideoView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;

    .prologue
    .line 49
    iget v0, p0, Lcom/vk/core/view/SimpleVideoView;->videoHeight:I

    return v0
.end method

.method static synthetic access$902(Lcom/vk/core/view/SimpleVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/view/SimpleVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 49
    iput p1, p0, Lcom/vk/core/view/SimpleVideoView;->videoHeight:I

    return p1
.end method

.method private centerCrop()V
    .locals 13

    .prologue
    const/high16 v11, 0x40000000    # 2.0f

    const/high16 v12, 0x3f800000    # 1.0f

    .line 475
    :try_start_0
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 477
    .local v3, "mMatrix":Landroid/graphics/Matrix;
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getWidth()I

    move-result v8

    .line 478
    .local v8, "viewWidth":I
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getHeight()I

    move-result v7

    .line 480
    .local v7, "viewHeight":I
    iget v9, p0, Lcom/vk/core/view/SimpleVideoView;->videoWidth:I

    int-to-float v9, v9

    int-to-float v10, v8

    div-float v4, v9, v10

    .line 481
    .local v4, "mScaleX":F
    iget v9, p0, Lcom/vk/core/view/SimpleVideoView;->videoHeight:I

    int-to-float v9, v9

    int-to-float v10, v7

    div-float v5, v9, v10

    .line 483
    .local v5, "mScaleY":F
    int-to-float v9, v8

    iget v10, p0, Lcom/vk/core/view/SimpleVideoView;->videoWidth:I

    int-to-float v10, v10

    div-float/2addr v10, v5

    sub-float v1, v9, v10

    .line 484
    .local v1, "mBoundX":F
    int-to-float v9, v7

    iget v10, p0, Lcom/vk/core/view/SimpleVideoView;->videoHeight:I

    int-to-float v10, v10

    div-float/2addr v10, v4

    sub-float v2, v9, v10

    .line 486
    .local v2, "mBoundY":F
    cmpg-float v9, v4, v5

    if-gez v9, :cond_1

    .line 487
    div-float v9, v12, v4

    mul-float/2addr v5, v9

    .line 488
    const/high16 v4, 0x3f800000    # 1.0f

    .line 489
    const/4 v1, 0x0

    .line 496
    :goto_0
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 497
    div-float v9, v1, v11

    div-float v10, v2, v11

    invoke-virtual {v3, v9, v10}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 498
    iget v9, p0, Lcom/vk/core/view/SimpleVideoView;->unappliedRotationDegrees:I

    int-to-float v9, v9

    div-int/lit8 v10, v8, 0x2

    int-to-float v10, v10

    div-int/lit8 v11, v7, 0x2

    int-to-float v11, v11

    invoke-virtual {v3, v9, v10, v11}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 499
    iget v9, p0, Lcom/vk/core/view/SimpleVideoView;->unappliedRotationDegrees:I

    rem-int/lit16 v9, v9, 0xb4

    const/16 v10, 0x5a

    if-ne v9, v10, :cond_0

    .line 500
    int-to-float v9, v7

    int-to-float v10, v8

    div-float v6, v9, v10

    .line 501
    .local v6, "viewAspectRatio":F
    div-float v9, v12, v6

    div-int/lit8 v10, v8, 0x2

    int-to-float v10, v10

    div-int/lit8 v11, v7, 0x2

    int-to-float v11, v11

    invoke-virtual {v3, v9, v6, v10, v11}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 504
    .end local v6    # "viewAspectRatio":F
    :cond_0
    invoke-virtual {p0, v3}, Lcom/vk/core/view/SimpleVideoView;->setTransform(Landroid/graphics/Matrix;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 508
    .end local v1    # "mBoundX":F
    .end local v2    # "mBoundY":F
    .end local v3    # "mMatrix":Landroid/graphics/Matrix;
    .end local v4    # "mScaleX":F
    .end local v5    # "mScaleY":F
    .end local v7    # "viewHeight":I
    .end local v8    # "viewWidth":I
    :goto_1
    return-void

    .line 491
    .restart local v1    # "mBoundX":F
    .restart local v2    # "mBoundY":F
    .restart local v3    # "mMatrix":Landroid/graphics/Matrix;
    .restart local v4    # "mScaleX":F
    .restart local v5    # "mScaleY":F
    .restart local v7    # "viewHeight":I
    .restart local v8    # "viewWidth":I
    :cond_1
    div-float v9, v12, v5

    mul-float/2addr v4, v9

    .line 492
    const/high16 v5, 0x3f800000    # 1.0f

    .line 493
    const/4 v2, 0x0

    goto :goto_0

    .line 505
    .end local v1    # "mBoundX":F
    .end local v2    # "mBoundY":F
    .end local v3    # "mMatrix":Landroid/graphics/Matrix;
    .end local v4    # "mScaleX":F
    .end local v5    # "mScaleY":F
    .end local v7    # "viewHeight":I
    .end local v8    # "viewWidth":I
    :catch_0
    move-exception v0

    .line 506
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_1
.end method

.method private dispatchBufferingEnd(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 1
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 554
    iget-boolean v0, p0, Lcom/vk/core/view/SimpleVideoView;->buffering:Z

    if-eqz v0, :cond_0

    .line 555
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/core/view/SimpleVideoView;->buffering:Z

    .line 556
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->videoHandler:Lcom/vk/core/view/SimpleVideoView$VideoHandler;

    invoke-virtual {v0, p1}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->dispatchBufferingEnd(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    .line 558
    :cond_0
    return-void
.end method

.method private dispatchBufferingStart(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 1
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 547
    iget-boolean v0, p0, Lcom/vk/core/view/SimpleVideoView;->buffering:Z

    if-nez v0, :cond_0

    .line 548
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/core/view/SimpleVideoView;->buffering:Z

    .line 549
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->videoHandler:Lcom/vk/core/view/SimpleVideoView$VideoHandler;

    invoke-virtual {v0, p1}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->dispatchBufferingStart(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    .line 551
    :cond_0
    return-void
.end method

.method private dispatchEnd(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 2
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    const/4 v1, 0x3

    .line 531
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getCurrentState()I

    move-result v0

    if-ne v1, v0, :cond_0

    .line 536
    :goto_0
    return-void

    .line 534
    :cond_0
    invoke-direct {p0, v1}, Lcom/vk/core/view/SimpleVideoView;->setCurrentState(I)V

    .line 535
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->videoHandler:Lcom/vk/core/view/SimpleVideoView$VideoHandler;

    invoke-virtual {v0, p1}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->dispatchEnd(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    goto :goto_0
.end method

.method private dispatchError(I)V
    .locals 1
    .param p1, "what"    # I

    .prologue
    .line 569
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->videoHandler:Lcom/vk/core/view/SimpleVideoView$VideoHandler;

    invoke-virtual {v0, p1}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->dispatchError(I)V

    .line 570
    return-void
.end method

.method private dispatchFirstFrameRendered(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 1
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 561
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->videoHandler:Lcom/vk/core/view/SimpleVideoView$VideoHandler;

    invoke-virtual {v0, p1}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->dispatchFirstFrameRendered(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    .line 562
    return-void
.end method

.method private dispatchPrepared(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 2
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    const/4 v1, 0x2

    .line 539
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getCurrentState()I

    move-result v0

    if-ne v1, v0, :cond_0

    .line 544
    :goto_0
    return-void

    .line 542
    :cond_0
    invoke-direct {p0, v1}, Lcom/vk/core/view/SimpleVideoView;->setCurrentState(I)V

    .line 543
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->videoHandler:Lcom/vk/core/view/SimpleVideoView$VideoHandler;

    invoke-virtual {v0, p1}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->dispatchOnPrepared(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    goto :goto_0
.end method

.method private dispatchVideoSizeChanged(III)V
    .locals 1
    .param p1, "videoWidth"    # I
    .param p2, "videoHeight"    # I
    .param p3, "unappliedRotationDegrees"    # I

    .prologue
    .line 565
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->videoHandler:Lcom/vk/core/view/SimpleVideoView$VideoHandler;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vk/core/view/SimpleVideoView$VideoHandler;->dispatchVideoSizeChanged(III)V

    .line 566
    return-void
.end method

.method private fitCenter()V
    .locals 13

    .prologue
    const/high16 v11, 0x40000000    # 2.0f

    const/high16 v12, 0x3f800000    # 1.0f

    .line 438
    :try_start_0
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 440
    .local v3, "mMatrix":Landroid/graphics/Matrix;
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getWidth()I

    move-result v8

    .line 441
    .local v8, "viewWidth":I
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getHeight()I

    move-result v7

    .line 443
    .local v7, "viewHeight":I
    iget v9, p0, Lcom/vk/core/view/SimpleVideoView;->videoWidth:I

    int-to-float v9, v9

    int-to-float v10, v8

    div-float v4, v9, v10

    .line 444
    .local v4, "mScaleX":F
    iget v9, p0, Lcom/vk/core/view/SimpleVideoView;->videoHeight:I

    int-to-float v9, v9

    int-to-float v10, v7

    div-float v5, v9, v10

    .line 446
    .local v5, "mScaleY":F
    int-to-float v9, v8

    iget v10, p0, Lcom/vk/core/view/SimpleVideoView;->videoWidth:I

    int-to-float v10, v10

    div-float/2addr v10, v5

    sub-float v1, v9, v10

    .line 447
    .local v1, "mBoundX":F
    int-to-float v9, v7

    iget v10, p0, Lcom/vk/core/view/SimpleVideoView;->videoHeight:I

    int-to-float v10, v10

    div-float/2addr v10, v4

    sub-float v2, v9, v10

    .line 449
    .local v2, "mBoundY":F
    cmpl-float v9, v4, v5

    if-lez v9, :cond_1

    .line 450
    div-float v9, v12, v4

    mul-float/2addr v5, v9

    .line 451
    const/high16 v4, 0x3f800000    # 1.0f

    .line 452
    const/4 v1, 0x0

    .line 459
    :goto_0
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 460
    div-float v9, v1, v11

    div-float v10, v2, v11

    invoke-virtual {v3, v9, v10}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 461
    iget v9, p0, Lcom/vk/core/view/SimpleVideoView;->unappliedRotationDegrees:I

    int-to-float v9, v9

    div-int/lit8 v10, v8, 0x2

    int-to-float v10, v10

    div-int/lit8 v11, v7, 0x2

    int-to-float v11, v11

    invoke-virtual {v3, v9, v10, v11}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 462
    iget v9, p0, Lcom/vk/core/view/SimpleVideoView;->unappliedRotationDegrees:I

    rem-int/lit16 v9, v9, 0xb4

    const/16 v10, 0x5a

    if-ne v9, v10, :cond_0

    .line 463
    int-to-float v9, v7

    int-to-float v10, v8

    div-float v6, v9, v10

    .line 464
    .local v6, "viewAspectRatio":F
    div-float v9, v12, v6

    div-int/lit8 v10, v8, 0x2

    int-to-float v10, v10

    div-int/lit8 v11, v7, 0x2

    int-to-float v11, v11

    invoke-virtual {v3, v9, v6, v10, v11}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 467
    .end local v6    # "viewAspectRatio":F
    :cond_0
    invoke-virtual {p0, v3}, Lcom/vk/core/view/SimpleVideoView;->setTransform(Landroid/graphics/Matrix;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 471
    .end local v1    # "mBoundX":F
    .end local v2    # "mBoundY":F
    .end local v3    # "mMatrix":Landroid/graphics/Matrix;
    .end local v4    # "mScaleX":F
    .end local v5    # "mScaleY":F
    .end local v7    # "viewHeight":I
    .end local v8    # "viewWidth":I
    :goto_1
    return-void

    .line 454
    .restart local v1    # "mBoundX":F
    .restart local v2    # "mBoundY":F
    .restart local v3    # "mMatrix":Landroid/graphics/Matrix;
    .restart local v4    # "mScaleX":F
    .restart local v5    # "mScaleY":F
    .restart local v7    # "viewHeight":I
    .restart local v8    # "viewWidth":I
    :cond_1
    div-float v9, v12, v5

    mul-float/2addr v4, v9

    .line 455
    const/high16 v5, 0x3f800000    # 1.0f

    .line 456
    const/4 v2, 0x0

    goto :goto_0

    .line 468
    .end local v1    # "mBoundX":F
    .end local v2    # "mBoundY":F
    .end local v3    # "mMatrix":Landroid/graphics/Matrix;
    .end local v4    # "mScaleX":F
    .end local v5    # "mScaleY":F
    .end local v7    # "viewHeight":I
    .end local v8    # "viewWidth":I
    :catch_0
    move-exception v0

    .line 469
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_1
.end method

.method private init()V
    .locals 0

    .prologue
    .line 112
    invoke-super {p0, p0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 113
    return-void
.end method

.method private requestAudioFocus()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    .line 420
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/audio/utils/Utils;->getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/core/view/SimpleVideoView;->focusListener:Lcom/vk/core/view/SimpleVideoView$FocusListener;

    const/4 v3, 0x3

    .line 421
    invoke-virtual {v1, v2, v3, v4}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    move-result v0

    .line 422
    .local v0, "result":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 423
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView;->focusListener:Lcom/vk/core/view/SimpleVideoView$FocusListener;

    invoke-virtual {v1, v4}, Lcom/vk/core/view/SimpleVideoView$FocusListener;->onAudioFocusChange(I)V

    .line 427
    :goto_0
    return-void

    .line 425
    :cond_0
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView;->focusListener:Lcom/vk/core/view/SimpleVideoView$FocusListener;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/vk/core/view/SimpleVideoView$FocusListener;->onAudioFocusChange(I)V

    goto :goto_0
.end method

.method private declared-synchronized setCurrentState(I)V
    .locals 1
    .param p1, "state"    # I

    .prologue
    .line 527
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/vk/core/view/SimpleVideoView;->currentState:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 528
    monitor-exit p0

    return-void

    .line 527
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized setPlayer(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 1
    .param p1, "simpleExoPlayer"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 170
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->playerRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 171
    monitor-exit p0

    return-void

    .line 170
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private updateMatrix()V
    .locals 1

    .prologue
    .line 511
    iget-boolean v0, p0, Lcom/vk/core/view/SimpleVideoView;->fitVideo:Z

    if-eqz v0, :cond_0

    .line 512
    invoke-direct {p0}, Lcom/vk/core/view/SimpleVideoView;->fitCenter()V

    .line 516
    :goto_0
    return-void

    .line 514
    :cond_0
    invoke-direct {p0}, Lcom/vk/core/view/SimpleVideoView;->centerCrop()V

    goto :goto_0
.end method


# virtual methods
.method public getBufferForPlaybackMs()I
    .locals 1

    .prologue
    .line 174
    iget v0, p0, Lcom/vk/core/view/SimpleVideoView;->bufferForPlaybackMs:I

    return v0
.end method

.method public getCurrentPosition()J
    .locals 4

    .prologue
    .line 391
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    .line 392
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 393
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v2

    .line 395
    :goto_0
    return-wide v2

    :cond_0
    const-wide/16 v2, 0x0

    goto :goto_0
.end method

.method public declared-synchronized getCurrentState()I
    .locals 1

    .prologue
    .line 523
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/vk/core/view/SimpleVideoView;->currentState:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDuration()J
    .locals 4

    .prologue
    .line 400
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    .line 401
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 402
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getDuration()J

    move-result-wide v2

    .line 404
    :goto_0
    return-wide v2

    :cond_0
    const-wide/16 v2, 0x0

    goto :goto_0
.end method

.method public getOnBufferingEventsListener()Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->onBufferingEventsListener:Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;

    return-object v0
.end method

.method public getOnEndListener()Lcom/vk/core/view/SimpleVideoView$OnEndListener;
    .locals 1

    .prologue
    .line 198
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->onEndListener:Lcom/vk/core/view/SimpleVideoView$OnEndListener;

    return-object v0
.end method

.method public getOnErrorListener()Lcom/vk/core/view/SimpleVideoView$OnErrorListener;
    .locals 1

    .prologue
    .line 222
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->onErrorListener:Lcom/vk/core/view/SimpleVideoView$OnErrorListener;

    return-object v0
.end method

.method public getOnFirstFrameRenderedListener()Lcom/vk/core/view/SimpleVideoView$OnFirstFrameRenderedListener;
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->onFirstFrameRenderedListener:Lcom/vk/core/view/SimpleVideoView$OnFirstFrameRenderedListener;

    return-object v0
.end method

.method public getOnPreparedListener()Lcom/vk/core/view/SimpleVideoView$OnPreparedListener;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->onPreparedListener:Lcom/vk/core/view/SimpleVideoView$OnPreparedListener;

    return-object v0
.end method

.method public declared-synchronized getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;
    .locals 1

    .prologue
    .line 166
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->playerRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/SimpleExoPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getVideoHeight()I
    .locals 1

    .prologue
    .line 234
    iget v0, p0, Lcom/vk/core/view/SimpleVideoView;->videoHeight:I

    return v0
.end method

.method public getVideoWidth()I
    .locals 1

    .prologue
    .line 230
    iget v0, p0, Lcom/vk/core/view/SimpleVideoView;->videoWidth:I

    return v0
.end method

.method public initPlayer()V
    .locals 2

    .prologue
    .line 266
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    if-nez v0, :cond_0

    .line 267
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->bgHandler:Landroid/os/Handler;

    invoke-static {p0}, Lcom/vk/core/view/SimpleVideoView$$Lambda$1;->lambdaFactory$(Lcom/vk/core/view/SimpleVideoView;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 303
    :cond_0
    return-void
.end method

.method public isFitVideo()Z
    .locals 1

    .prologue
    .line 254
    iget-boolean v0, p0, Lcom/vk/core/view/SimpleVideoView;->fitVideo:Z

    return v0
.end method

.method public isLoop()Z
    .locals 1

    .prologue
    .line 182
    iget-boolean v0, p0, Lcom/vk/core/view/SimpleVideoView;->loop:Z

    return v0
.end method

.method public isMute()Z
    .locals 1

    .prologue
    .line 238
    iget-boolean v0, p0, Lcom/vk/core/view/SimpleVideoView;->mute:Z

    return v0
.end method

.method public isPlayWhenReady()Z
    .locals 1

    .prologue
    .line 387
    iget-boolean v0, p0, Lcom/vk/core/view/SimpleVideoView;->playWhenReady:Z

    return v0
.end method

.method synthetic lambda$initPlayer$0()V
    .locals 11

    .prologue
    .line 268
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 301
    :goto_0
    return-void

    .line 272
    :cond_0
    new-instance v10, Lcom/google/android/exoplayer2/trackselection/AdaptiveVideoTrackSelection$Factory;

    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView;->bandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    invoke-direct {v10, v1}, Lcom/google/android/exoplayer2/trackselection/AdaptiveVideoTrackSelection$Factory;-><init>(Lcom/google/android/exoplayer2/upstream/BandwidthMeter;)V

    .line 273
    .local v10, "videoTrackSelectionFactory":Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;
    new-instance v9, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;

    invoke-direct {v9, v10}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;-><init>(Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;)V

    .line 275
    .local v9, "trackSelector":Lcom/google/android/exoplayer2/trackselection/TrackSelector;
    new-instance v0, Lcom/google/android/exoplayer2/DefaultLoadControl;

    new-instance v1, Lcom/google/android/exoplayer2/upstream/DefaultAllocator;

    const/4 v2, 0x1

    const/high16 v3, 0x10000

    invoke-direct {v1, v2, v3}, Lcom/google/android/exoplayer2/upstream/DefaultAllocator;-><init>(ZI)V

    iget v2, p0, Lcom/vk/core/view/SimpleVideoView;->bufferForPlaybackMs:I

    iget v3, p0, Lcom/vk/core/view/SimpleVideoView;->bufferForPlaybackMs:I

    mul-int/lit8 v3, v3, 0x2

    iget v4, p0, Lcom/vk/core/view/SimpleVideoView;->bufferForPlaybackMs:I

    int-to-long v4, v4

    iget v6, p0, Lcom/vk/core/view/SimpleVideoView;->bufferForPlaybackMs:I

    mul-int/lit8 v6, v6, 0x2

    int-to-long v6, v6

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer2/DefaultLoadControl;-><init>(Lcom/google/android/exoplayer2/upstream/DefaultAllocator;IIJJ)V

    .line 283
    .local v0, "loadControl":Lcom/google/android/exoplayer2/LoadControl;
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v9, v0}, Lcom/google/android/exoplayer2/ExoPlayerFactory;->newSimpleInstance(Landroid/content/Context;Lcom/google/android/exoplayer2/trackselection/TrackSelector;Lcom/google/android/exoplayer2/LoadControl;)Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v8

    .line 284
    .local v8, "exoPlayer":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    iget-boolean v1, p0, Lcom/vk/core/view/SimpleVideoView;->playWhenReady:Z

    invoke-virtual {v8, v1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setPlayWhenReady(Z)V

    .line 285
    invoke-virtual {v8, p0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVideoTextureView(Landroid/view/TextureView;)V

    .line 286
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView;->componentListener:Lcom/vk/core/view/SimpleVideoView$ComponentListener;

    invoke-virtual {v8, v1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVideoListener(Lcom/google/android/exoplayer2/SimpleExoPlayer$VideoListener;)V

    .line 287
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView;->componentListener:Lcom/vk/core/view/SimpleVideoView$ComponentListener;

    invoke-virtual {v8, v1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->addListener(Lcom/google/android/exoplayer2/ExoPlayer$EventListener;)V

    .line 288
    iget-boolean v1, p0, Lcom/vk/core/view/SimpleVideoView;->mute:Z

    if-eqz v1, :cond_1

    .line 289
    const/4 v1, 0x0

    invoke-virtual {v8, v1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVolume(F)V

    .line 294
    :goto_1
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 295
    invoke-virtual {v8}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->release()V

    goto :goto_0

    .line 291
    :cond_1
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v8, v1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVolume(F)V

    goto :goto_1

    .line 299
    :cond_2
    sget-object v1, Lcom/vk/core/view/SimpleVideoView;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "initPlayer"

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    invoke-direct {p0, v8}, Lcom/vk/core/view/SimpleVideoView;->setPlayer(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    goto :goto_0
.end method

.method synthetic lambda$releasePlayer$1()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 307
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    .line 308
    .local v0, "exoPlayer":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 309
    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setTextOutput(Lcom/google/android/exoplayer2/text/TextRenderer$Output;)V

    .line 310
    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVideoListener(Lcom/google/android/exoplayer2/SimpleExoPlayer$VideoListener;)V

    .line 311
    iget-object v1, p0, Lcom/vk/core/view/SimpleVideoView;->componentListener:Lcom/vk/core/view/SimpleVideoView$ComponentListener;

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->removeListener(Lcom/google/android/exoplayer2/ExoPlayer$EventListener;)V

    .line 312
    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVideoSurface(Landroid/view/Surface;)V

    .line 313
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->release()V

    .line 314
    sget-object v1, Lcom/vk/core/view/SimpleVideoView;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "releasePlayer"

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/vk/core/view/SimpleVideoView;->setCurrentState(I)V

    .line 316
    invoke-direct {p0, v3}, Lcom/vk/core/view/SimpleVideoView;->setPlayer(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V

    .line 318
    :cond_0
    return-void
.end method

.method synthetic lambda$releasePlayer$2()V
    .locals 0

    .prologue
    .line 320
    invoke-direct {p0}, Lcom/vk/core/view/SimpleVideoView;->abandonAudioFocus()V

    .line 321
    return-void
.end method

.method synthetic lambda$setVideoUri$3(Landroid/net/Uri;)V
    .locals 8
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v4, 0x0

    .line 342
    new-instance v0, Lcom/google/android/exoplayer2/source/ExtractorMediaSource;

    iget-object v2, p0, Lcom/vk/core/view/SimpleVideoView;->dataSourceFactory:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    iget-object v3, p0, Lcom/vk/core/view/SimpleVideoView;->extractorsFactory:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;

    move-object v1, p1

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/source/ExtractorMediaSource;-><init>(Landroid/net/Uri;Lcom/google/android/exoplayer2/upstream/DataSource$Factory;Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;Landroid/os/Handler;Lcom/google/android/exoplayer2/source/ExtractorMediaSource$EventListener;)V

    .line 343
    .local v0, "videoSource":Lcom/google/android/exoplayer2/source/MediaSource;
    iget-boolean v1, p0, Lcom/vk/core/view/SimpleVideoView;->loop:Z

    if-eqz v1, :cond_0

    .line 344
    new-instance v7, Lcom/google/android/exoplayer2/source/LoopingMediaSource;

    invoke-direct {v7, v0}, Lcom/google/android/exoplayer2/source/LoopingMediaSource;-><init>(Lcom/google/android/exoplayer2/source/MediaSource;)V

    .end local v0    # "videoSource":Lcom/google/android/exoplayer2/source/MediaSource;
    .local v7, "videoSource":Lcom/google/android/exoplayer2/source/MediaSource;
    move-object v0, v7

    .line 346
    .end local v7    # "videoSource":Lcom/google/android/exoplayer2/source/MediaSource;
    .restart local v0    # "videoSource":Lcom/google/android/exoplayer2/source/MediaSource;
    :cond_0
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v6

    .line 347
    .local v6, "exoPlayer":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v6, :cond_1

    .line 348
    sget-object v1, Lcom/vk/core/view/SimpleVideoView;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "setVideoUri"

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 349
    invoke-virtual {v6, v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->prepare(Lcom/google/android/exoplayer2/source/MediaSource;)V

    .line 350
    iget-boolean v1, p0, Lcom/vk/core/view/SimpleVideoView;->playWhenReady:Z

    invoke-virtual {v6, v1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setPlayWhenReady(Z)V

    .line 352
    :cond_1
    return-void
.end method

.method synthetic lambda$stop$4()V
    .locals 1

    .prologue
    .line 368
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    .line 369
    .local v0, "exoPlayer":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 370
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->stop()V

    .line 372
    :cond_0
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 1
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;
    .param p2, "i"    # I
    .param p3, "i1"    # I

    .prologue
    .line 126
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->surfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    if-eqz v0, :cond_0

    .line 127
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->surfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-interface {v0, p1, p2, p3}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->sourceUri:Landroid/net/Uri;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getCurrentState()I

    move-result v0

    if-nez v0, :cond_1

    .line 131
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->sourceUri:Landroid/net/Uri;

    invoke-virtual {p0, v0}, Lcom/vk/core/view/SimpleVideoView;->setVideoUri(Landroid/net/Uri;)V

    .line 133
    :cond_1
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 1
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 146
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->surfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    if-eqz v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->surfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-interface {v0, p1}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z

    .line 150
    :cond_0
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->releasePlayer()V

    .line 151
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/core/view/SimpleVideoView;->setPlayWhenReady(Z)V

    .line 152
    const/4 v0, 0x1

    return v0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 1
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;
    .param p2, "i"    # I
    .param p3, "i1"    # I

    .prologue
    .line 137
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->surfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    if-eqz v0, :cond_0

    .line 138
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->surfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-interface {v0, p1, p2, p3}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V

    .line 141
    :cond_0
    invoke-direct {p0}, Lcom/vk/core/view/SimpleVideoView;->updateMatrix()V

    .line 142
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 1
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->surfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    if-eqz v0, :cond_0

    .line 158
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->surfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-interface {v0, p1}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V

    .line 160
    :cond_0
    return-void
.end method

.method public releasePlayer()V
    .locals 2

    .prologue
    .line 306
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->bgHandler:Landroid/os/Handler;

    invoke-static {p0}, Lcom/vk/core/view/SimpleVideoView$$Lambda$2;->lambdaFactory$(Lcom/vk/core/view/SimpleVideoView;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 319
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->handler:Landroid/os/Handler;

    invoke-static {p0}, Lcom/vk/core/view/SimpleVideoView$$Lambda$3;->lambdaFactory$(Lcom/vk/core/view/SimpleVideoView;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 322
    return-void
.end method

.method public seekTo(J)V
    .locals 3
    .param p1, "seekToMs"    # J

    .prologue
    .line 409
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    .line 410
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 412
    :try_start_0
    invoke-virtual {v0, p1, p2}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->seekTo(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 417
    :cond_0
    :goto_0
    return-void

    .line 413
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public setBufferForPlaybackMs(I)V
    .locals 0
    .param p1, "bufferForPlaybackMs"    # I

    .prologue
    .line 178
    iput p1, p0, Lcom/vk/core/view/SimpleVideoView;->bufferForPlaybackMs:I

    .line 179
    return-void
.end method

.method public setFitVideo(Z)V
    .locals 0
    .param p1, "fitVideo"    # Z

    .prologue
    .line 258
    iput-boolean p1, p0, Lcom/vk/core/view/SimpleVideoView;->fitVideo:Z

    .line 259
    invoke-direct {p0}, Lcom/vk/core/view/SimpleVideoView;->updateMatrix()V

    .line 260
    return-void
.end method

.method public setLoop(Z)V
    .locals 0
    .param p1, "loop"    # Z

    .prologue
    .line 186
    iput-boolean p1, p0, Lcom/vk/core/view/SimpleVideoView;->loop:Z

    .line 187
    return-void
.end method

.method public setMute(Z)V
    .locals 2
    .param p1, "mute"    # Z

    .prologue
    .line 242
    iput-boolean p1, p0, Lcom/vk/core/view/SimpleVideoView;->mute:Z

    .line 243
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    .line 244
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 245
    if-eqz p1, :cond_1

    .line 246
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVolume(F)V

    .line 251
    :cond_0
    :goto_0
    return-void

    .line 248
    :cond_1
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setVolume(F)V

    goto :goto_0
.end method

.method public setOnBufferingEventsListener(Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;)V
    .locals 0
    .param p1, "onBufferingEventsListener"    # Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;

    .prologue
    .line 210
    iput-object p1, p0, Lcom/vk/core/view/SimpleVideoView;->onBufferingEventsListener:Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;

    .line 211
    return-void
.end method

.method public setOnEndListener(Lcom/vk/core/view/SimpleVideoView$OnEndListener;)V
    .locals 0
    .param p1, "onEndListener"    # Lcom/vk/core/view/SimpleVideoView$OnEndListener;

    .prologue
    .line 202
    iput-object p1, p0, Lcom/vk/core/view/SimpleVideoView;->onEndListener:Lcom/vk/core/view/SimpleVideoView$OnEndListener;

    .line 203
    return-void
.end method

.method public setOnErrorListener(Lcom/vk/core/view/SimpleVideoView$OnErrorListener;)V
    .locals 0
    .param p1, "onErrorListener"    # Lcom/vk/core/view/SimpleVideoView$OnErrorListener;

    .prologue
    .line 226
    iput-object p1, p0, Lcom/vk/core/view/SimpleVideoView;->onErrorListener:Lcom/vk/core/view/SimpleVideoView$OnErrorListener;

    .line 227
    return-void
.end method

.method public setOnFirstFrameRenderedListener(Lcom/vk/core/view/SimpleVideoView$OnFirstFrameRenderedListener;)V
    .locals 0
    .param p1, "onFirstFrameRenderedListener"    # Lcom/vk/core/view/SimpleVideoView$OnFirstFrameRenderedListener;

    .prologue
    .line 218
    iput-object p1, p0, Lcom/vk/core/view/SimpleVideoView;->onFirstFrameRenderedListener:Lcom/vk/core/view/SimpleVideoView$OnFirstFrameRenderedListener;

    .line 219
    return-void
.end method

.method public setOnPreparedListener(Lcom/vk/core/view/SimpleVideoView$OnPreparedListener;)V
    .locals 0
    .param p1, "onPreparedListener"    # Lcom/vk/core/view/SimpleVideoView$OnPreparedListener;

    .prologue
    .line 194
    iput-object p1, p0, Lcom/vk/core/view/SimpleVideoView;->onPreparedListener:Lcom/vk/core/view/SimpleVideoView$OnPreparedListener;

    .line 195
    return-void
.end method

.method public setPlayWhenReady(Z)V
    .locals 1
    .param p1, "playWhenReady"    # Z

    .prologue
    .line 376
    iput-boolean p1, p0, Lcom/vk/core/view/SimpleVideoView;->playWhenReady:Z

    .line 377
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->getPlayer()Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    .line 378
    .local v0, "player":Lcom/google/android/exoplayer2/SimpleExoPlayer;
    if-eqz v0, :cond_0

    .line 379
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->setPlayWhenReady(Z)V

    .line 380
    if-eqz p1, :cond_0

    .line 381
    invoke-direct {p0}, Lcom/vk/core/view/SimpleVideoView;->requestAudioFocus()V

    .line 384
    :cond_0
    return-void
.end method

.method public setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/view/TextureView$SurfaceTextureListener;

    .prologue
    .line 121
    iput-object p1, p0, Lcom/vk/core/view/SimpleVideoView;->surfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 122
    return-void
.end method

.method public setVideoUri(Landroid/net/Uri;)V
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v1, 0x0

    .line 325
    if-nez p1, :cond_0

    .line 353
    :goto_0
    return-void

    .line 329
    :cond_0
    iput-object p1, p0, Lcom/vk/core/view/SimpleVideoView;->sourceUri:Landroid/net/Uri;

    .line 332
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vk/core/view/SimpleVideoView;->setCurrentState(I)V

    .line 333
    invoke-virtual {p0}, Lcom/vk/core/view/SimpleVideoView;->initPlayer()V

    .line 336
    iput-boolean v1, p0, Lcom/vk/core/view/SimpleVideoView;->buffering:Z

    .line 337
    iput v1, p0, Lcom/vk/core/view/SimpleVideoView;->videoWidth:I

    .line 338
    iput v1, p0, Lcom/vk/core/view/SimpleVideoView;->videoHeight:I

    .line 341
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->bgHandler:Landroid/os/Handler;

    invoke-static {p0, p1}, Lcom/vk/core/view/SimpleVideoView$$Lambda$4;->lambdaFactory$(Lcom/vk/core/view/SimpleVideoView;Landroid/net/Uri;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public stop()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 356
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->sourceUri:Landroid/net/Uri;

    .line 359
    invoke-direct {p0, v1}, Lcom/vk/core/view/SimpleVideoView;->setCurrentState(I)V

    .line 362
    iput-boolean v1, p0, Lcom/vk/core/view/SimpleVideoView;->buffering:Z

    .line 363
    iput v1, p0, Lcom/vk/core/view/SimpleVideoView;->videoWidth:I

    .line 364
    iput v1, p0, Lcom/vk/core/view/SimpleVideoView;->videoHeight:I

    .line 367
    iget-object v0, p0, Lcom/vk/core/view/SimpleVideoView;->bgHandler:Landroid/os/Handler;

    invoke-static {p0}, Lcom/vk/core/view/SimpleVideoView$$Lambda$5;->lambdaFactory$(Lcom/vk/core/view/SimpleVideoView;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 373
    return-void
.end method
