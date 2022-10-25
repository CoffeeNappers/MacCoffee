.class Lcom/vkontakte/android/audio/player/ads/AudioAd;
.super Ljava/lang/Object;
.source "AudioAd.java"

# interfaces
.implements Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;,
        Lcom/vkontakte/android/audio/player/ads/AudioAd$OnStateChangedListener;
    }
.end annotation


# static fields
.field private static final AD_LOAD_TIMEOUT:J = 0x7d0L

.field private static final SLOT_ID:I = 0x10ede

.field private static final handler:Landroid/os/Handler;


# instance fields
.field private volatile _innerState:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

.field private ad:Lcom/my/target/ads/instream/InstreamAudioAd;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final adPlayerHelper:Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;

.field private adsCounter:I

.field private final audioAdStatSender:Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;

.field private currentBanner:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;

.field private currentBannerActions:[Lcom/vkontakte/android/audio/PlayerAction;

.field private final listeners:[Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;

.field private final lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field private midPoints:[F

.field private midPointsStarted:[Z

.field private final onStateChangedListener:Lcom/vkontakte/android/audio/player/ads/AudioAd$OnStateChangedListener;

.field private final refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

.field private volatile state:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

.field private final waitLoading:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 50
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->handler:Landroid/os/Handler;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;Lcom/vkontakte/android/audio/player/ads/AudioAd$OnStateChangedListener;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .locals 4
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p3, "adPlayerHelper"    # Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;
    .param p4, "onStateChangedListener"    # Lcom/vkontakte/android/audio/player/ads/AudioAd$OnStateChangedListener;
    .param p5, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-static {}, Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;->values()[Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    move-result-object v1

    array-length v1, v1

    new-array v1, v1, [Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->listeners:[Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;

    .line 45
    iput-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->_innerState:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    .line 46
    iput-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->state:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    .line 48
    new-instance v1, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 49
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->waitLoading:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 55
    iput v3, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->adsCounter:I

    .line 56
    new-instance v1, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;

    invoke-direct {v1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->audioAdStatSender:Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;

    .line 57
    iput-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->midPoints:[F

    .line 58
    iput-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->midPointsStarted:[Z

    .line 59
    iput-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBanner:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;

    .line 60
    iput-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBannerActions:[Lcom/vkontakte/android/audio/PlayerAction;

    .line 66
    if-nez p5, :cond_0

    sget-object p5, Lcom/vkontakte/android/audio/player/PlayerRefer;->none:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .end local p5    # "refer":Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;
    :cond_0
    iput-object p5, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .line 67
    iput-object p4, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->onStateChangedListener:Lcom/vkontakte/android/audio/player/ads/AudioAd$OnStateChangedListener;

    .line 68
    iput-object p3, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->adPlayerHelper:Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;

    .line 69
    const/4 v1, 0x1

    sput-boolean v1, Lcom/my/target/Tracer;->enabled:Z

    .line 71
    new-instance v0, Lcom/my/target/ads/CustomParams;

    invoke-direct {v0}, Lcom/my/target/ads/CustomParams;-><init>()V

    .line 72
    .local v0, "customParams":Lcom/my/target/ads/CustomParams;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/ads/CustomParams;->setVKId(Ljava/lang/String;)V

    .line 73
    const-string/jumbo v1, "vkcat_id"

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    invoke-interface {v2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;->getInt()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/my/target/ads/CustomParams;->setCustomParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    const-string/jumbo v1, "duration"

    iget v2, p2, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/my/target/ads/CustomParams;->setCustomParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    const-string/jumbo v1, "content_id"

    invoke-virtual {p2}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/my/target/ads/CustomParams;->setCustomParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    const-string/jumbo v1, "puid1"

    const-string/jumbo v2, "554"

    invoke-virtual {v0, v1, v2}, Lcom/my/target/ads/CustomParams;->setCustomParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    new-instance v1, Lcom/my/target/ads/instream/InstreamAudioAd;

    const v2, 0x10ede

    invoke-direct {v1, v2, v0, p1}, Lcom/my/target/ads/instream/InstreamAudioAd;-><init>(ILcom/my/target/ads/CustomParams;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    .line 89
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    invoke-virtual {v1, p0}, Lcom/my/target/ads/instream/InstreamAudioAd;->setListener(Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;)V

    .line 90
    return-void
.end method

.method private endWaitLoad()V
    .locals 2

    .prologue
    .line 104
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 106
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->waitLoading:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 107
    sget-object v0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 111
    return-void

    .line 109
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v0
.end method

.method static isWorking(Lcom/vkontakte/android/audio/player/ads/AudioAd;)Z
    .locals 1
    .param p0, "audioAd"    # Lcom/vkontakte/android/audio/player/ads/AudioAd;

    .prologue
    .line 188
    if-eqz p0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->state:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private killAd()V
    .locals 2

    .prologue
    .line 115
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 117
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    if-eqz v0, :cond_0

    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/my/target/ads/instream/InstreamAudioAd;->setListener(Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;)V

    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    invoke-virtual {v0}, Lcom/my/target/ads/instream/InstreamAudioAd;->stop()V

    .line 120
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    invoke-virtual {v0}, Lcom/my/target/ads/instream/InstreamAudioAd;->destroy()V

    .line 121
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    .line 123
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->waitLoading:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 124
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->onComplete()V

    .line 125
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->waitLoading:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 130
    return-void

    .line 128
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v0
.end method

.method private onComplete()V
    .locals 5

    .prologue
    .line 139
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 141
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->_innerState:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    if-eqz v2, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->_innerState:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    .line 142
    .local v1, "state":Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;
    :goto_0
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->_innerState:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    .line 143
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->setState(Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;)V

    .line 144
    if-eqz v1, :cond_0

    .line 145
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->listeners:[Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;->ordinal()I

    move-result v3

    aget-object v0, v2, v3

    .line 146
    .local v0, "onCompleteListener":Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->listeners:[Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;->ordinal()I

    move-result v3

    const/4 v4, 0x0

    aput-object v4, v2, v3

    .line 148
    if-eqz v0, :cond_0

    .line 149
    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;->onComplete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 153
    .end local v0    # "onCompleteListener":Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 155
    return-void

    .line 141
    .end local v1    # "state":Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;
    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->state:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 153
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v2
.end method

.method private setState(Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;)V
    .locals 1
    .param p1, "state"    # Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    .prologue
    .line 133
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->state:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    .line 134
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->onStateChangedListener:Lcom/vkontakte/android/audio/player/ads/AudioAd$OnStateChangedListener;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd$OnStateChangedListener;->onStateChange()V

    .line 135
    return-void
.end method

.method private startWaitLoad()V
    .locals 4

    .prologue
    .line 98
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->waitLoading:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 99
    sget-object v0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->handler:Landroid/os/Handler;

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 100
    return-void
.end method


# virtual methods
.method checkMidroll(I)Z
    .locals 3
    .param p1, "progressSec"    # I

    .prologue
    const/4 v1, 0x1

    .line 158
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->midPoints:[F

    if-eqz v2, :cond_1

    .line 159
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->midPoints:[F

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 160
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->midPoints:[F

    aget v2, v2, v0

    float-to-int v2, v2

    if-ne v2, p1, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->midPointsStarted:[Z

    aget-boolean v2, v2, v0

    if-nez v2, :cond_0

    .line 161
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->midPointsStarted:[Z

    aput-boolean v1, v2, v0

    .line 166
    .end local v0    # "i":I
    :goto_1
    return v1

    .line 159
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 166
    .end local v0    # "i":I
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method getAdText()Ljava/lang/String;
    .locals 2

    .prologue
    .line 273
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBanner:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;

    .line 274
    .local v0, "currentBanner":Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;->getAdText()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method getCurrentDuration()F
    .locals 2

    .prologue
    .line 237
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBanner:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;

    .line 238
    .local v0, "currentBanner":Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_0
    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;->getDuration()F

    move-result v1

    goto :goto_0
.end method

.method getPlayerActions()[Lcom/vkontakte/android/audio/PlayerAction;
    .locals 1

    .prologue
    .line 269
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBannerActions:[Lcom/vkontakte/android/audio/PlayerAction;

    return-object v0
.end method

.method isAllowSeek()Z
    .locals 2

    .prologue
    .line 242
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBanner:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;

    .line 243
    .local v0, "currentBanner":Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;->isAllowSeek()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method isAllowSkip()Z
    .locals 2

    .prologue
    .line 252
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBanner:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;

    .line 253
    .local v0, "currentBanner":Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;->isAllowSkip()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method isAllowTrackChange()Z
    .locals 2

    .prologue
    .line 247
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBanner:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;

    .line 248
    .local v0, "currentBanner":Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;->isAllowTrackChange()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onBannerComplete(Lcom/my/target/ads/instream/InstreamAudioAd;Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;)V
    .locals 2
    .param p1, "instreamAudioAd"    # Lcom/my/target/ads/instream/InstreamAudioAd;
    .param p2, "instreamAudioAdBanner"    # Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;

    .prologue
    .line 383
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 384
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->audioAdStatSender:Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendCompleted(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 385
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBanner:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;

    .line 386
    return-void
.end method

.method public onBannerStart(Lcom/my/target/ads/instream/InstreamAudioAd;Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;)V
    .locals 6
    .param p1, "instreamAudioAd"    # Lcom/my/target/ads/instream/InstreamAudioAd;
    .param p2, "instreamAudioAdBanner"    # Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;

    .prologue
    const/4 v5, 0x0

    .line 348
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 349
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->audioAdStatSender:Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;

    iget-object v4, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendReady(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 350
    iget v3, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->adsCounter:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->adsCounter:I

    .line 352
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->_innerState:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    if-eqz v3, :cond_0

    .line 353
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->_innerState:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    invoke-direct {p0, v3}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->setState(Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;)V

    .line 354
    iput-object v5, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->_innerState:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    .line 357
    :cond_0
    iput-object p2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBanner:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;

    .line 358
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBanner:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;

    if-eqz v3, :cond_4

    .line 359
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 360
    .local v1, "actions":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/PlayerAction;>;"
    sget-object v3, Lcom/vkontakte/android/audio/PlayerAction;->playPause:Lcom/vkontakte/android/audio/PlayerAction;

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 361
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBanner:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;

    invoke-interface {v3}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;->isAllowSeek()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 362
    sget-object v3, Lcom/vkontakte/android/audio/PlayerAction;->seek:Lcom/vkontakte/android/audio/PlayerAction;

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 364
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBanner:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;

    invoke-interface {v3}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;->isAllowTrackChange()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 365
    sget-object v3, Lcom/vkontakte/android/audio/PlayerAction;->changeTrack:Lcom/vkontakte/android/audio/PlayerAction;

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 367
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBanner:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;

    invoke-interface {v3}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;->isAllowSkip()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 368
    sget-object v3, Lcom/vkontakte/android/audio/PlayerAction;->skipAd:Lcom/vkontakte/android/audio/PlayerAction;

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 370
    :cond_3
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v3

    new-array v3, v3, [Lcom/vkontakte/android/audio/PlayerAction;

    iput-object v3, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBannerActions:[Lcom/vkontakte/android/audio/PlayerAction;

    .line 371
    const/4 v2, 0x0

    .line 372
    .local v2, "i":I
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/PlayerAction;

    .line 373
    .local v0, "action":Lcom/vkontakte/android/audio/PlayerAction;
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBannerActions:[Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v0, v4, v2

    .line 374
    add-int/lit8 v2, v2, 0x1

    .line 375
    goto :goto_0

    .line 377
    .end local v0    # "action":Lcom/vkontakte/android/audio/PlayerAction;
    .end local v1    # "actions":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/PlayerAction;>;"
    .end local v2    # "i":I
    :cond_4
    iput-object v5, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->currentBannerActions:[Lcom/vkontakte/android/audio/PlayerAction;

    .line 379
    :cond_5
    return-void
.end method

.method public onBannerTimeLeftChange(FFLcom/my/target/ads/instream/InstreamAudioAd;)V
    .locals 3
    .param p1, "v"    # F
    .param p2, "v1"    # F
    .param p3, "instreamAudioAd"    # Lcom/my/target/ads/instream/InstreamAudioAd;

    .prologue
    .line 390
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    aput-object p3, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 391
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->audioAdStatSender:Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;

    sub-float v1, p2, p1

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    invoke-virtual {v0, v1, p2, v2}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendProgress(FFLcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 392
    return-void
.end method

.method public onComplete(Ljava/lang/String;Lcom/my/target/ads/instream/InstreamAudioAd;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "instreamAudioAd"    # Lcom/my/target/ads/instream/InstreamAudioAd;

    .prologue
    .line 396
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 397
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->onComplete()V

    .line 398
    return-void
.end method

.method public onError(Ljava/lang/String;Lcom/my/target/ads/instream/InstreamAudioAd;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "instreamAudioAd"    # Lcom/my/target/ads/instream/InstreamAudioAd;

    .prologue
    .line 341
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->endWaitLoad()V

    .line 342
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 343
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->onComplete()V

    .line 344
    return-void
.end method

.method public onLoad(Lcom/my/target/ads/instream/InstreamAudioAd;)V
    .locals 4
    .param p1, "instreamAudioAd"    # Lcom/my/target/ads/instream/InstreamAudioAd;

    .prologue
    .line 303
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->endWaitLoad()V

    .line 305
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 307
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 308
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->audioAdStatSender:Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendReceived(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 309
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    if-eqz v0, :cond_0

    .line 310
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    invoke-virtual {v0}, Lcom/my/target/ads/instream/InstreamAudioAd;->getMidPoints()[F

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->midPoints:[F

    .line 312
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->midPoints:[F

    if-eqz v0, :cond_1

    .line 313
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->midPoints:[F

    array-length v0, v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->midPointsStarted:[Z

    .line 315
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    if-eqz v0, :cond_2

    .line 316
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->adPlayerHelper:Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->getOrCreateAdPlayer()Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/ads/instream/InstreamAudioAd;->setPlayer(Lcom/my/target/ads/instream/InstreamAudioAdPlayer;)V

    .line 318
    :cond_2
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getAudioAdConfig()Lcom/vkontakte/android/auth/configs/AudioAdConfig;

    move-result-object v0

    sget-object v1, Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;->preroll:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    iget v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->adsCounter:I

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    invoke-static {v0, v1, v2, v3}, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->isAdAllowed(Lcom/vkontakte/android/auth/configs/AudioAdConfig;Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;ILcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    if-eqz v0, :cond_3

    .line 320
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    invoke-virtual {v0}, Lcom/my/target/ads/instream/InstreamAudioAd;->startPreroll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 326
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 328
    return-void

    .line 322
    :cond_3
    :try_start_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->audioAdStatSender:Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendRejected(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 323
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->onComplete()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 326
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v0
.end method

.method public onNoAd(Ljava/lang/String;Lcom/my/target/ads/instream/InstreamAudioAd;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "instreamAudioAd"    # Lcom/my/target/ads/instream/InstreamAudioAd;

    .prologue
    .line 332
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->endWaitLoad()V

    .line 334
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 335
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->audioAdStatSender:Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendNotReceived(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 336
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->onComplete()V

    .line 337
    return-void
.end method

.method pause()Z
    .locals 2

    .prologue
    .line 279
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 281
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    if-eqz v0, :cond_0

    .line 282
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    invoke-virtual {v0}, Lcom/my/target/ads/instream/InstreamAudioAd;->pause()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 283
    const/4 v0, 0x1

    .line 287
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    :goto_0
    return v0

    .line 285
    :cond_0
    const/4 v0, 0x0

    .line 287
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v0
.end method

.method release()V
    .locals 3

    .prologue
    .line 173
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 175
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->listeners:[Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 176
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->listeners:[Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 175
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 178
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    if-eqz v1, :cond_1

    .line 179
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    invoke-virtual {v1}, Lcom/my/target/ads/instream/InstreamAudioAd;->stop()V

    .line 180
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    invoke-virtual {v1}, Lcom/my/target/ads/instream/InstreamAudioAd;->destroy()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 183
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 185
    return-void

    .line 183
    .end local v0    # "i":I
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v1
.end method

.method resume()Z
    .locals 1

    .prologue
    .line 292
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    if-eqz v0, :cond_0

    .line 293
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    invoke-virtual {v0}, Lcom/my/target/ads/instream/InstreamAudioAd;->resume()V

    .line 294
    const/4 v0, 0x1

    .line 296
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public run()V
    .locals 0

    .prologue
    .line 94
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->killAd()V

    .line 95
    return-void
.end method

.method skip()V
    .locals 2

    .prologue
    .line 258
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 260
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    if-eqz v0, :cond_0

    .line 261
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    invoke-virtual {v0}, Lcom/my/target/ads/instream/InstreamAudioAd;->skip()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 264
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 266
    return-void

    .line 264
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v0
.end method

.method work(Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;)V
    .locals 1
    .param p1, "state"    # Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;
    .param p2, "onCompleteListener"    # Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;

    .prologue
    .line 192
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->work(Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;I)V

    .line 193
    return-void
.end method

.method work(Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;I)V
    .locals 3
    .param p1, "state"    # Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;
    .param p2, "onCompleteListener"    # Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;
    .param p3, "positionSec"    # I

    .prologue
    .line 197
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 199
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->listeners:[Lcom/vkontakte/android/audio/player/ads/AudioAd$OnCompleteListener;

    invoke-virtual {p1}, Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;->ordinal()I

    move-result v1

    aput-object p2, v0, v1

    .line 200
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->_innerState:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    .line 201
    sget-object v0, Lcom/vkontakte/android/audio/player/ads/AudioAd$1;->$SwitchMap$com$vkontakte$android$auth$configs$AudioAdConfig$Type:[I

    invoke-virtual {p1}, Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    packed-switch v0, :pswitch_data_0

    .line 232
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 234
    return-void

    .line 203
    :pswitch_0
    :try_start_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    if-eqz v0, :cond_0

    .line 204
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    invoke-virtual {v0}, Lcom/my/target/ads/instream/InstreamAudioAd;->load()V

    .line 205
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->audioAdStatSender:Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendRequested(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 207
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->startWaitLoad()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 232
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v0

    .line 209
    :cond_0
    :try_start_2
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->onComplete()V

    goto :goto_0

    .line 213
    :pswitch_1
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getAudioAdConfig()Lcom/vkontakte/android/auth/configs/AudioAdConfig;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->adsCounter:I

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    invoke-static {v0, p1, v1, v2}, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->isAdAllowed(Lcom/vkontakte/android/auth/configs/AudioAdConfig;Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;ILcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    if-eqz v0, :cond_1

    .line 215
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    int-to-float v1, p3

    invoke-virtual {v0, v1}, Lcom/my/target/ads/instream/InstreamAudioAd;->startMidroll(F)V

    goto :goto_0

    .line 217
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->audioAdStatSender:Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendRejected(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 218
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->onComplete()V

    goto :goto_0

    .line 222
    :pswitch_2
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getAudioAdConfig()Lcom/vkontakte/android/auth/configs/AudioAdConfig;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->adsCounter:I

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    invoke-static {v0, p1, v1, v2}, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->isAdAllowed(Lcom/vkontakte/android/auth/configs/AudioAdConfig;Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;ILcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    if-eqz v0, :cond_2

    .line 224
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->ad:Lcom/my/target/ads/instream/InstreamAudioAd;

    invoke-virtual {v0}, Lcom/my/target/ads/instream/InstreamAudioAd;->startPostroll()V

    goto :goto_0

    .line 226
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->audioAdStatSender:Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ads/AudioAd;->refer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/ads/AudioAdStatSender;->sendRejected(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V

    .line 227
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/ads/AudioAd;->onComplete()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 201
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
