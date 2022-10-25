.class public final Lcom/vkontakte/android/audio/player/Player;
.super Ljava/lang/Object;
.source "Player.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/Player$SaveTracksTask;,
        Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;,
        Lcom/vkontakte/android/audio/player/Player$HandlerCallback;,
        Lcom/vkontakte/android/audio/player/Player$FocusListener;,
        Lcom/vkontakte/android/audio/player/Player$ErrorHandler;,
        Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;,
        Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;
    }
.end annotation


# static fields
.field private static final ERROR_TIMEOUT:J = 0x1388L

.field private static final INDEX_AD:I = 0x1

.field private static final INDEX_CONTENT:I = 0x0

.field static final LOG_PREFIX:Ljava/lang/String; = "Player"

.field private static final MAX_ERRORS_TO_STOP:I = 0x3

.field private static final MSG_BUFFERING:I = 0x4

.field private static final MSG_PARAMETERS_CHANGED:I = 0x5

.field private static final MSG_PROGRESS:I = 0x3

.field private static final MSG_STATE_CHANGED:I = 0x1

.field private static final MSG_TRACKS_CHANGED:I = 0x2

.field private static final NEXT_PREV_TIMEOUT:J = 0x12cL

.field public static final PLAY_RESUME_ON_FOCUS_GAIN_DELAY_MILLIS:I = 0x5dc

.field private static final REWIND_PREV_POSITION_THRESHOLD:J = 0x1388L

.field private static final TOAST_DELAY:J = 0x3e8L


# instance fields
.field private mAudioStatSender:Lcom/vkontakte/android/audio/player/AudioStatSender;

.field private final mErrorHandler:Lcom/vkontakte/android/audio/player/Player$ErrorHandler;

.field private mFocusListener:Lcom/vkontakte/android/audio/player/Player$FocusListener;

.field private final mHandler:Landroid/os/Handler;

.field private mLastNextPrevTime:J

.field private final mListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerListener;",
            ">;"
        }
    .end annotation
.end field

.field private mLoadTracksTask:Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;

.field private final mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private mReleased:Z

.field private final mService:Lcom/vkontakte/android/audio/player/PlayerService;

.field private final mSession:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

.field private mShuffleTracks:Lcom/vkontakte/android/audio/player/Tracks;

.field private final mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

.field private final mTracks:Lcom/vkontakte/android/audio/player/Tracks;

.field private mTracksLocked:Z

.field private mType:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

.field private refer:Lcom/vkontakte/android/audio/player/PlayerRefer;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/audio/player/PlayerService;Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;)V
    .locals 7
    .param p1, "service"    # Lcom/vkontakte/android/audio/player/PlayerService;
    .param p2, "onLoadedListener"    # Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;
    .param p3, "type"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    .prologue
    const/4 v3, 0x0

    const/4 v6, 0x0

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    new-instance v0, Lcom/vkontakte/android/audio/player/AudioStatSender;

    invoke-direct {v0}, Lcom/vkontakte/android/audio/player/AudioStatSender;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mAudioStatSender:Lcom/vkontakte/android/audio/player/AudioStatSender;

    .line 71
    iput-object v6, p0, Lcom/vkontakte/android/audio/player/Player;->refer:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 78
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/Player;->mService:Lcom/vkontakte/android/audio/player/PlayerService;

    .line 79
    iput-object p3, p0, Lcom/vkontakte/android/audio/player/Player;->mType:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    .line 81
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isAudioAdAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 82
    new-instance v0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;

    const/4 v4, 0x1

    new-instance v5, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;

    invoke-direct {v5, p0, v6}, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;-><init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$1;)V

    move-object v1, p3

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;-><init>(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;Landroid/content/Context;IILcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    .line 86
    :goto_0
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mListeners:Ljava/util/Set;

    .line 87
    new-instance v0, Lcom/vkontakte/android/audio/player/Tracks;

    invoke-direct {v0}, Lcom/vkontakte/android/audio/player/Tracks;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    .line 88
    new-instance v0, Lcom/vkontakte/android/audio/player/TrackInfo;

    const/4 v1, 0x2

    new-instance v2, Lcom/vkontakte/android/audio/player/Player$1;

    invoke-direct {v2, p0, p1}, Lcom/vkontakte/android/audio/player/Player$1;-><init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/PlayerService;)V

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/audio/player/TrackInfo;-><init>(ILcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    .line 129
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->setCurrentIndex(I)V

    .line 130
    new-instance v0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;

    invoke-direct {v0, p0, v6}, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;-><init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mErrorHandler:Lcom/vkontakte/android/audio/player/Player$ErrorHandler;

    .line 131
    new-instance v0, Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    invoke-direct {v0, p1, p0}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;-><init>(Landroid/content/Context;Lcom/vkontakte/android/audio/player/Player;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mSession:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    .line 132
    new-instance v0, Landroid/os/Handler;

    new-instance v1, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;

    invoke-direct {v1, p0, v6}, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;-><init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$1;)V

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mHandler:Landroid/os/Handler;

    .line 134
    new-instance v0, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;

    invoke-direct {v0, p0, p2, v6}, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;-><init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;Lcom/vkontakte/android/audio/player/Player$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mLoadTracksTask:Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;

    .line 135
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mLoadTracksTask:Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;

    new-array v1, v3, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->executeQuick([Ljava/lang/Object;)V

    .line 136
    return-void

    .line 84
    :cond_0
    new-instance v0, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;

    invoke-direct {v0, p0, v6}, Lcom/vkontakte/android/audio/player/Player$MyPlayerHelperListener;-><init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$1;)V

    invoke-static {p3, p1, v3, v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Factory;->get(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;Landroid/content/Context;ILcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    goto :goto_0
.end method

.method private abandonAudioFocus()V
    .locals 3

    .prologue
    .line 697
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "PlayerService"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "Player"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "abandonAudioFocus"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 698
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mFocusListener:Lcom/vkontakte/android/audio/player/Player$FocusListener;

    if-eqz v0, :cond_0

    .line 699
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mService:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player;->mFocusListener:Lcom/vkontakte/android/audio/player/Player$FocusListener;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 700
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mFocusListener:Lcom/vkontakte/android/audio/player/Player$FocusListener;

    .line 702
    :cond_0
    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyProgress()V

    return-void
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyBuffering()V

    return-void
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/audio/player/Player;Ljava/lang/String;ZZ)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z

    .prologue
    .line 37
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/audio/player/Player;->play(Ljava/lang/String;ZZ)V

    return-void
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->getFirstTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/Player$ErrorHandler;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mErrorHandler:Lcom/vkontakte/android/audio/player/Player$ErrorHandler;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/PlayerService;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mService:Lcom/vkontakte/android/audio/player/PlayerService;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/audio/player/Player;Z)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;
    .param p1, "x1"    # Z

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/Player;->playNext(Z)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1800(Lcom/vkontakte/android/audio/player/Player;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 37
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/Player;->mReleased:Z

    return v0
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/audio/player/Player;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/audio/player/Player;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mListeners:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$2102(Lcom/vkontakte/android/audio/player/Player;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;
    .param p1, "x1"    # Z

    .prologue
    .line 37
    iput-boolean p1, p0, Lcom/vkontakte/android/audio/player/Player;->mTracksLocked:Z

    return p1
.end method

.method static synthetic access$2202(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;)Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;
    .param p1, "x1"    # Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/Player;->mLoadTracksTask:Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;

    return-object p1
.end method

.method static synthetic access$2300(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/Tracks;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/AudioStatSender;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mAudioStatSender:Lcom/vkontakte/android/audio/player/AudioStatSender;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyStateChanged()V

    return-void
.end method

.method private cacheNextTracks()V
    .locals 4

    .prologue
    .line 422
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 423
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/vkontakte/android/audio/player/Player;->getNextTrack(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 424
    .local v0, "track1":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-eqz v0, :cond_1

    .line 425
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 426
    .local v1, "tracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mService:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/PlayerService;->getSavedTracks()Lcom/vkontakte/android/audio/player/SavedTracks;

    move-result-object v2

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getMid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/audio/player/SavedTracks;->isDownloaded(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 427
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 429
    :cond_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 430
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player;->mService:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/vkontakte/android/audio/MusicTrack;

    invoke-static {v3, v2}, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->cache(Landroid/content/Context;[Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 434
    .end local v0    # "track1":Lcom/vkontakte/android/audio/player/PlayerTrack;
    .end local v1    # "tracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_1
    return-void
.end method

.method private checkTracksLock()V
    .locals 2

    .prologue
    .line 660
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTracksLocked:Z

    if-eqz v0, :cond_0

    .line 661
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Cannot change track list"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 662
    :cond_0
    return-void
.end method

.method private getActualTrackIndex(Ljava/lang/String;)I
    .locals 1
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 592
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->getPlayTracks()Lcom/vkontakte/android/audio/player/Tracks;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/player/Tracks;->indexOf(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private getFirstTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 1

    .prologue
    .line 546
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->getPlayTracks()Lcom/vkontakte/android/audio/player/Tracks;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Tracks;->getFirst()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    return-object v0
.end method

.method private getLastTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 1

    .prologue
    .line 550
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->getPlayTracks()Lcom/vkontakte/android/audio/player/Tracks;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Tracks;->getLast()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    return-object v0
.end method

.method private getNextTrack(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 3
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 554
    if-nez p1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 555
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    iget-object p1, v1, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    .line 557
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->getPlayTracks()Lcom/vkontakte/android/audio/player/Tracks;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/audio/player/Tracks;->getNext(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 558
    .local v0, "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player;->getLoopMode()Lcom/vkontakte/android/audio/player/LoopMode;

    move-result-object v1

    sget-object v2, Lcom/vkontakte/android/audio/player/LoopMode;->LIST:Lcom/vkontakte/android/audio/player/LoopMode;

    if-ne v1, v2, :cond_1

    .line 559
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->getFirstTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 561
    :cond_1
    return-object v0
.end method

.method private getPlayTracks()Lcom/vkontakte/android/audio/player/Tracks;
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 612
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player;->isShuffle()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 613
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mShuffleTracks:Lcom/vkontakte/android/audio/player/Tracks;

    if-nez v0, :cond_0

    .line 614
    invoke-direct {p0, v1, v1}, Lcom/vkontakte/android/audio/player/Player;->shuffleIfNeeded(ZZ)V

    .line 616
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mShuffleTracks:Lcom/vkontakte/android/audio/player/Tracks;

    .line 618
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    goto :goto_0
.end method

.method private getPrevTrack(Ljava/lang/String;Z)Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 3
    .param p1, "uuid"    # Ljava/lang/String;
    .param p2, "canLoop"    # Z

    .prologue
    .line 565
    if-nez p1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 566
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    iget-object p1, v1, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    .line 568
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->getPlayTracks()Lcom/vkontakte/android/audio/player/Tracks;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/audio/player/Tracks;->getPrev(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 569
    .local v0, "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-nez v0, :cond_2

    if-nez p2, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player;->getLoopMode()Lcom/vkontakte/android/audio/player/LoopMode;

    move-result-object v1

    sget-object v2, Lcom/vkontakte/android/audio/player/LoopMode;->LIST:Lcom/vkontakte/android/audio/player/LoopMode;

    if-ne v1, v2, :cond_2

    .line 570
    :cond_1
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->getLastTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 572
    :cond_2
    return-object v0
.end method

.method private notifyBuffering()V
    .locals 1

    .prologue
    .line 732
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/Player;->notifyMessage(I)V

    .line 733
    return-void
.end method

.method private notifyMessage(I)V
    .locals 1
    .param p1, "what"    # I

    .prologue
    .line 705
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->removeMessages(I)V

    .line 706
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mHandler:Landroid/os/Handler;

    invoke-static {v0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 707
    return-void
.end method

.method private notifyParametersChanged()V
    .locals 1

    .prologue
    .line 736
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/Player;->notifyMessage(I)V

    .line 737
    return-void
.end method

.method private notifyProgress()V
    .locals 1

    .prologue
    .line 728
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/Player;->notifyMessage(I)V

    .line 729
    return-void
.end method

.method private notifyStateChanged()V
    .locals 1

    .prologue
    .line 710
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mSession:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->update()V

    .line 711
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/Player;->notifyMessage(I)V

    .line 721
    return-void
.end method

.method private notifyTracksChanged()V
    .locals 1

    .prologue
    .line 724
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/Player;->notifyMessage(I)V

    .line 725
    return-void
.end method

.method private play(Ljava/lang/String;ZZ)V
    .locals 12
    .param p1, "uuid"    # Ljava/lang/String;
    .param p2, "preserveState"    # Z
    .param p3, "clearPreserveProgress"    # Z

    .prologue
    const v11, 0x7f0800f1

    const v10, 0x7f0800f0

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 205
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/Player;->getTrack(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v5

    .line 207
    .local v5, "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    iget-object v8, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v8}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v4

    .line 209
    .local v4, "state":Lcom/vkontakte/android/audio/player/PlayerState;
    const v0, 0x7f0803c4

    .line 210
    .local v0, "errorResId":I
    const/4 v2, 0x0

    .line 211
    .local v2, "objects":[Ljava/lang/Object;
    if-eqz v5, :cond_2

    .line 212
    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getMid()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/vkontakte/android/audio/player/CacheUtils;->getLoadedTmpFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 213
    .local v1, "file":Ljava/io/File;
    if-nez v1, :cond_0

    iget-object v8, p0, Lcom/vkontakte/android/audio/player/Player;->mService:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-virtual {v8}, Lcom/vkontakte/android/audio/player/PlayerService;->getSavedTracks()Lcom/vkontakte/android/audio/player/SavedTracks;

    move-result-object v8

    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getMid()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/audio/player/SavedTracks;->getTrackFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 214
    :cond_0
    if-eqz v1, :cond_1

    iget-object v8, p0, Lcom/vkontakte/android/audio/player/Player;->mService:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-virtual {v8}, Lcom/vkontakte/android/audio/player/PlayerService;->getSavedTracks()Lcom/vkontakte/android/audio/player/SavedTracks;

    move-result-object v8

    invoke-virtual {v8, v1}, Lcom/vkontakte/android/audio/player/SavedTracks;->checkFileLost(Ljava/io/File;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 215
    :cond_1
    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getRestrictionType()I

    move-result v8

    if-nez v8, :cond_7

    .line 216
    iget-object v8, v5, Lcom/vkontakte/android/audio/player/PlayerTrack;->url:Ljava/lang/String;

    iget-object v9, p0, Lcom/vkontakte/android/audio/player/Player;->refer:Lcom/vkontakte/android/audio/player/PlayerRefer;

    invoke-direct {p0, v5, v8, v9}, Lcom/vkontakte/android/audio/player/Player;->playUrl(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)I

    move-result v0

    .line 234
    .end local v1    # "file":Ljava/io/File;
    :cond_2
    :goto_0
    if-eqz v0, :cond_3

    if-eq v0, v10, :cond_3

    if-ne v0, v11, :cond_b

    .line 237
    :cond_3
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->requestAudioFocus()V

    .line 238
    iget-object v8, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v8}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v8

    if-eqz v8, :cond_9

    iget-object v8, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v8}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getUniqueId()Ljava/lang/String;

    move-result-object v8

    .line 239
    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getUniqueId()Ljava/lang/String;

    move-result-object v9

    .line 238
    invoke-static {v8, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_9

    move v3, v6

    .line 240
    .local v3, "preserveProgress":Z
    :goto_1
    iget-object v8, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    if-eqz v3, :cond_a

    if-nez p3, :cond_a

    :goto_2
    invoke-virtual {v8, v6}, Lcom/vkontakte/android/audio/player/TrackInfo;->clear(Z)V

    .line 241
    iget-object v6, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v6, v5}, Lcom/vkontakte/android/audio/player/TrackInfo;->setTrack(Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    .line 243
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->cacheNextTracks()V

    .line 245
    if-eqz p2, :cond_4

    .line 246
    sget-object v6, Lcom/vkontakte/android/audio/player/Player$2;->$SwitchMap$com$vkontakte$android$audio$player$PlayerState:[I

    invoke-virtual {v4}, Lcom/vkontakte/android/audio/player/PlayerState;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 258
    :cond_4
    :goto_3
    :pswitch_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyStateChanged()V

    .line 260
    if-eq v0, v10, :cond_5

    if-ne v0, v11, :cond_6

    .line 262
    :cond_5
    iget-object v6, p0, Lcom/vkontakte/android/audio/player/Player;->mErrorHandler:Lcom/vkontakte/android/audio/player/Player$ErrorHandler;

    invoke-virtual {v6, v0, v2}, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->error(I[Ljava/lang/Object;)V

    .line 267
    .end local v3    # "preserveProgress":Z
    :cond_6
    :goto_4
    return-void

    .line 218
    .restart local v1    # "file":Ljava/io/File;
    :cond_7
    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getRestrictionType()I

    move-result v8

    packed-switch v8, :pswitch_data_1

    goto :goto_0

    .line 220
    :pswitch_1
    const v0, 0x7f0800f1

    .line 221
    new-array v2, v6, [Ljava/lang/Object;

    .end local v2    # "objects":[Ljava/lang/Object;
    iget-object v8, v5, Lcom/vkontakte/android/audio/player/PlayerTrack;->title:Ljava/lang/String;

    aput-object v8, v2, v7

    .line 222
    .restart local v2    # "objects":[Ljava/lang/Object;
    goto :goto_0

    .line 224
    :pswitch_2
    const v0, 0x7f0800f0

    .line 225
    new-array v2, v6, [Ljava/lang/Object;

    .end local v2    # "objects":[Ljava/lang/Object;
    iget-object v8, v5, Lcom/vkontakte/android/audio/player/PlayerTrack;->title:Ljava/lang/String;

    aput-object v8, v2, v7

    .restart local v2    # "objects":[Ljava/lang/Object;
    goto :goto_0

    .line 231
    :cond_8
    iget-object v8, p0, Lcom/vkontakte/android/audio/player/Player;->refer:Lcom/vkontakte/android/audio/player/PlayerRefer;

    invoke-direct {p0, v5, v1, v8}, Lcom/vkontakte/android/audio/player/Player;->playFile(Lcom/vkontakte/android/audio/MusicTrack;Ljava/io/File;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)I

    move-result v0

    goto :goto_0

    .end local v1    # "file":Ljava/io/File;
    :cond_9
    move v3, v7

    .line 238
    goto :goto_1

    .restart local v3    # "preserveProgress":Z
    :cond_a
    move v6, v7

    .line 240
    goto :goto_2

    .line 248
    :pswitch_3
    iget-object v6, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v6}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->stop()V

    goto :goto_3

    .line 253
    :pswitch_4
    iget-object v6, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v6}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->pause()Z

    goto :goto_3

    .line 265
    .end local v3    # "preserveProgress":Z
    :cond_b
    iget-object v6, p0, Lcom/vkontakte/android/audio/player/Player;->mErrorHandler:Lcom/vkontakte/android/audio/player/Player$ErrorHandler;

    invoke-virtual {v6, v0, v2}, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->error(I[Ljava/lang/Object;)V

    goto :goto_4

    .line 246
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_0
        :pswitch_4
    .end packed-switch

    .line 218
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private playFile(Lcom/vkontakte/android/audio/MusicTrack;Ljava/io/File;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)I
    .locals 5
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    const/4 v1, 0x0

    .line 409
    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    const-string/jumbo v3, "PlayerService"

    aput-object v3, v2, v1

    const/4 v3, 0x1

    const-string/jumbo v4, "Player"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string/jumbo v4, "playFile"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string/jumbo v4, "file"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    aput-object p2, v2, v3

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 411
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player;->mType:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    invoke-virtual {p2}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, p1, v4}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->createFileUrl(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, p1, v3, p3}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->play(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 418
    :goto_0
    return v1

    .line 414
    :catch_0
    move-exception v0

    .line 415
    .local v0, "e":Ljava/io/IOException;
    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 418
    const v1, 0x7f0803c4

    goto :goto_0
.end method

.method private playNext(Z)Z
    .locals 10
    .param p1, "checkTimeout"    # Z

    .prologue
    const/4 v2, 0x0

    .line 270
    if-eqz p1, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/vkontakte/android/audio/player/Player;->mLastNextPrevTime:J

    const-wide/16 v8, 0x12c

    add-long/2addr v6, v8

    cmp-long v3, v4, v6

    if-ltz v3, :cond_1

    .line 271
    :cond_0
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/vkontakte/android/audio/player/Player;->getNextTrack(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    .line 272
    .local v1, "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/audio/player/TrackInfo;->clear(Z)V

    .line 274
    if-nez v1, :cond_2

    .line 275
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->getPlayTracks()Lcom/vkontakte/android/audio/player/Tracks;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/audio/player/Tracks;->get(I)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    .line 276
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player;->stop()V

    .line 277
    const/4 v0, 0x1

    .line 281
    .local v0, "preserveState":Z
    :goto_0
    if-eqz v1, :cond_1

    .line 282
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vkontakte/android/audio/player/Player;->mLastNextPrevTime:J

    .line 283
    iget-object v2, v1, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-virtual {p0, v2, v0}, Lcom/vkontakte/android/audio/player/Player;->play(Ljava/lang/String;Z)V

    .line 284
    const/4 v2, 0x1

    .line 287
    .end local v0    # "preserveState":Z
    .end local v1    # "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_1
    return v2

    .line 279
    .restart local v1    # "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_2
    const/4 v0, 0x0

    .restart local v0    # "preserveState":Z
    goto :goto_0
.end method

.method private playUrl(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)I
    .locals 5
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    const/4 v1, 0x0

    .line 393
    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const-string/jumbo v3, "PlayerService"

    aput-object v3, v2, v1

    const/4 v3, 0x1

    const-string/jumbo v4, "Player"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string/jumbo v4, "playUrl"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    aput-object p2, v2, v3

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 395
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 397
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player;->mType:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    invoke-virtual {v3, p1, p2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->createHttpUrl(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, p1, v3, p3}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->play(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 405
    :goto_0
    return v1

    .line 400
    :catch_0
    move-exception v0

    .line 401
    .local v0, "e":Ljava/io/IOException;
    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 405
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player;->mService:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v1}, Lcom/vkontakte/android/audio/utils/Utils;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    const v1, 0x7f0803c4

    goto :goto_0

    :cond_1
    const v1, 0x7f0803c2

    goto :goto_0
.end method

.method private requestAudioFocus()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x1

    .line 686
    new-array v1, v5, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "PlayerService"

    aput-object v3, v1, v2

    const-string/jumbo v2, "Player"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string/jumbo v3, "requestAudioFocus"

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 687
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player;->mFocusListener:Lcom/vkontakte/android/audio/player/Player$FocusListener;

    if-nez v1, :cond_0

    .line 688
    new-instance v1, Lcom/vkontakte/android/audio/player/Player$FocusListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/audio/player/Player$FocusListener;-><init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$1;)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/Player;->mFocusListener:Lcom/vkontakte/android/audio/player/Player$FocusListener;

    .line 689
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player;->mService:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v1}, Lcom/vkontakte/android/audio/utils/Utils;->getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mFocusListener:Lcom/vkontakte/android/audio/player/Player$FocusListener;

    invoke-virtual {v1, v2, v5, v4}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    move-result v0

    .line 690
    .local v0, "result":I
    if-ne v0, v4, :cond_1

    .line 691
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player;->mFocusListener:Lcom/vkontakte/android/audio/player/Player$FocusListener;

    invoke-virtual {v1, v4}, Lcom/vkontakte/android/audio/player/Player$FocusListener;->onAudioFocusChange(I)V

    .line 694
    :goto_0
    return-void

    .line 693
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player;->mFocusListener:Lcom/vkontakte/android/audio/player/Player$FocusListener;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/audio/player/Player$FocusListener;->onAudioFocusChange(I)V

    goto :goto_0
.end method

.method private shuffleIfNeeded(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 627
    .local p1, "preserveUuids":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player;->isShuffle()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 628
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Tracks;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mShuffleTracks:Lcom/vkontakte/android/audio/player/Tracks;

    if-eqz v0, :cond_0

    .line 629
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mShuffleTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Tracks;->clear()V

    .line 636
    :goto_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyTracksChanged()V

    .line 637
    return-void

    .line 631
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/player/Tracks;->shuffle(Ljava/util/Collection;)Lcom/vkontakte/android/audio/player/Tracks;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mShuffleTracks:Lcom/vkontakte/android/audio/player/Tracks;

    goto :goto_0

    .line 634
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mShuffleTracks:Lcom/vkontakte/android/audio/player/Tracks;

    goto :goto_0
.end method

.method private shuffleIfNeeded(ZZ)V
    .locals 5
    .param p1, "preserveCurrentTrack"    # Z
    .param p2, "preserveHistory"    # Z

    .prologue
    const/4 v4, 0x0

    .line 640
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player;->isShuffle()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 641
    if-eqz p1, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v3

    if-nez v3, :cond_1

    .line 642
    :cond_0
    invoke-direct {p0, v4}, Lcom/vkontakte/android/audio/player/Player;->shuffleIfNeeded(Ljava/util/Collection;)V

    .line 657
    :goto_0
    return-void

    .line 644
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 645
    .local v2, "uuids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 646
    .local v0, "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    iget-object v3, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 647
    if-eqz p2, :cond_4

    .line 648
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player;->isShuffle()Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player;->mShuffleTracks:Lcom/vkontakte/android/audio/player/Tracks;

    if-eqz v3, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player;->mShuffleTracks:Lcom/vkontakte/android/audio/player/Tracks;

    .line 649
    .local v1, "tracks":Lcom/vkontakte/android/audio/player/Tracks;
    :goto_1
    iget-object v3, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/audio/player/Tracks;->getPrev(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 650
    iget-object v3, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 648
    .end local v1    # "tracks":Lcom/vkontakte/android/audio/player/Tracks;
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    goto :goto_1

    .line 651
    .restart local v1    # "tracks":Lcom/vkontakte/android/audio/player/Tracks;
    :cond_3
    invoke-static {v2}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 653
    .end local v1    # "tracks":Lcom/vkontakte/android/audio/player/Tracks;
    :cond_4
    invoke-direct {p0, v2}, Lcom/vkontakte/android/audio/player/Player;->shuffleIfNeeded(Ljava/util/Collection;)V

    goto :goto_0

    .line 656
    .end local v0    # "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    .end local v2    # "uuids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_5
    invoke-direct {p0, v4}, Lcom/vkontakte/android/audio/player/Player;->shuffleIfNeeded(Ljava/util/Collection;)V

    goto :goto_0
.end method


# virtual methods
.method public addTrack(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 3
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    const/4 v2, 0x1

    .line 439
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->checkTracksLock()V

    .line 440
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    new-instance v1, Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-direct {v1, p1}, Lcom/vkontakte/android/audio/player/PlayerTrack;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/Tracks;->add(Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    .line 441
    invoke-direct {p0, v2, v2}, Lcom/vkontakte/android/audio/player/Player;->shuffleIfNeeded(ZZ)V

    .line 442
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyTracksChanged()V

    .line 443
    return-void
.end method

.method addTrackToNext(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "tracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v5, 0x1

    .line 455
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->checkTracksLock()V

    .line 457
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v2

    iget-object v1, v2, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    .line 458
    .local v1, "uuid":Ljava/lang/String;
    :goto_0
    if-eqz p1, :cond_1

    .line 459
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 460
    .local v0, "track":Lcom/vkontakte/android/audio/MusicTrack;
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    new-instance v4, Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-direct {v4, v0}, Lcom/vkontakte/android/audio/player/PlayerTrack;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    invoke-virtual {v3, v4, v1}, Lcom/vkontakte/android/audio/player/Tracks;->add(Lcom/vkontakte/android/audio/player/PlayerTrack;Ljava/lang/String;)V

    goto :goto_1

    .line 457
    .end local v0    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    .end local v1    # "uuid":Ljava/lang/String;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 464
    .restart local v1    # "uuid":Ljava/lang/String;
    :cond_1
    invoke-direct {p0, v5, v5}, Lcom/vkontakte/android/audio/player/Player;->shuffleIfNeeded(ZZ)V

    .line 465
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyTracksChanged()V

    .line 466
    return-void
.end method

.method public addTracks(Ljava/util/Collection;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "tracks":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v4, 0x1

    .line 446
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->checkTracksLock()V

    .line 447
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 448
    .local v0, "track":Lcom/vkontakte/android/audio/MusicTrack;
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    new-instance v3, Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-direct {v3, v0}, Lcom/vkontakte/android/audio/player/PlayerTrack;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/audio/player/Tracks;->add(Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    goto :goto_0

    .line 450
    .end local v0    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_0
    invoke-direct {p0, v4, v4}, Lcom/vkontakte/android/audio/player/Player;->shuffleIfNeeded(ZZ)V

    .line 451
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyTracksChanged()V

    .line 452
    return-void
.end method

.method clearTracks()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 531
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->checkTracksLock()V

    .line 532
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Tracks;->clear()V

    .line 533
    invoke-direct {p0, v1, v1}, Lcom/vkontakte/android/audio/player/Player;->shuffleIfNeeded(ZZ)V

    .line 534
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyTracksChanged()V

    .line 535
    return-void
.end method

.method public getActualTrackIndex()I
    .locals 1

    .prologue
    .line 596
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/Player;->getActualTrackIndex(Ljava/lang/String;)I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public getActualTrackList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 580
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->getPlayTracks()Lcom/vkontakte/android/audio/player/Tracks;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Tracks;->asList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getActualTrackListSize()I
    .locals 1

    .prologue
    .line 584
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->getPlayTracks()Lcom/vkontakte/android/audio/player/Tracks;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Tracks;->size()I

    move-result v0

    return v0
.end method

.method getAudioSessionId()I
    .locals 1

    .prologue
    .line 608
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getAudioSessionId()I

    move-result v0

    return v0
.end method

.method getLoopMode()Lcom/vkontakte/android/audio/player/LoopMode;
    .locals 1

    .prologue
    .line 364
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mService:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/audio/player/Prefs;->loopMode:Lcom/vk/core/util/Preference$PreferenceEnum;

    invoke-virtual {v0}, Lcom/vk/core/util/Preference$PreferenceEnum;->get()Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/LoopMode;

    return-object v0
.end method

.method public getState()Lcom/vkontakte/android/audio/player/PlayerState;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 668
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v0

    return-object v0
.end method

.method public getTodayListeningTimeSec()J
    .locals 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mAudioStatSender:Lcom/vkontakte/android/audio/player/AudioStatSender;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/AudioStatSender;->getTodayListeningTimeSec()J

    move-result-wide v0

    return-wide v0
.end method

.method public getTrack(I)Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 542
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/player/Tracks;->get(I)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    return-object v0
.end method

.method public getTrack(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 1
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 538
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/player/Tracks;->get(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    return-object v0
.end method

.method public getTrackCount()I
    .locals 1

    .prologue
    .line 600
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Tracks;->size()I

    move-result v0

    return v0
.end method

.method public getTrackIndex(Ljava/lang/String;)I
    .locals 1
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 588
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/player/Tracks;->indexOf(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getTrackInfo()Lcom/vkontakte/android/audio/player/TrackInfo;
    .locals 1

    .prologue
    .line 672
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    return-object v0
.end method

.method public getTrackList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 576
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Tracks;->asList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public hasTracks()Z
    .locals 1

    .prologue
    .line 604
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Tracks;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isShuffle()Z
    .locals 1

    .prologue
    .line 378
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mService:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/audio/player/Prefs;->shuffle:Lcom/vk/core/util/Preference$PreferenceBoolean;

    invoke-virtual {v0}, Lcom/vk/core/util/Preference$PreferenceBoolean;->get()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public pause()Z
    .locals 1

    .prologue
    .line 335
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mFocusListener:Lcom/vkontakte/android/audio/player/Player$FocusListener;

    if-eqz v0, :cond_0

    .line 336
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mFocusListener:Lcom/vkontakte/android/audio/player/Player$FocusListener;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player$FocusListener;->resetPaused()V

    .line 337
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->pause()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 338
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyStateChanged()V

    .line 339
    const/4 v0, 0x1

    .line 341
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public play(Ljava/lang/String;)V
    .locals 1
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 197
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/audio/player/Player;->play(Ljava/lang/String;Z)V

    .line 198
    return-void
.end method

.method public play(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "uuid"    # Ljava/lang/String;
    .param p2, "preserveState"    # Z

    .prologue
    .line 201
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/audio/player/Player;->play(Ljava/lang/String;ZZ)V

    .line 202
    return-void
.end method

.method public playNext()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 291
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->tryNext()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/Player;->playNext(Z)Z

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method playPrev()Z
    .locals 8

    .prologue
    const/4 v1, 0x1

    .line 295
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/Player;->mLastNextPrevTime:J

    const-wide/16 v6, 0x12c

    add-long/2addr v4, v6

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    .line 296
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/TrackInfo;->getPosition()I

    move-result v2

    int-to-long v2, v2

    const-wide/16 v4, 0x1388

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player;->rewind()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 309
    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 299
    :cond_1
    const/4 v2, 0x0

    invoke-direct {p0, v2, v1}, Lcom/vkontakte/android/audio/player/Player;->getPrevTrack(Ljava/lang/String;Z)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 300
    .local v0, "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-eqz v0, :cond_0

    .line 301
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vkontakte/android/audio/player/Player;->mLastNextPrevTime:J

    .line 302
    iget-object v2, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/vkontakte/android/audio/player/Player;->play(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method registerListener(Lcom/vkontakte/android/audio/player/PlayerListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/vkontakte/android/audio/player/PlayerListener;

    .prologue
    .line 676
    if-eqz p1, :cond_0

    .line 677
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 678
    :cond_0
    return-void
.end method

.method release()V
    .locals 2

    .prologue
    .line 139
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/Player;->mReleased:Z

    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 142
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mSession:Lcom/vkontakte/android/audio/player/MediaSessionHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/MediaSessionHelper;->release()V

    .line 143
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->release()V

    .line 144
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 146
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player;->saveTracksState()V

    .line 148
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/TrackInfo;->clear(Z)V

    .line 150
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mAudioStatSender:Lcom/vkontakte/android/audio/player/AudioStatSender;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/AudioStatSender;->release()V

    .line 153
    return-void
.end method

.method public removeTrack(II)V
    .locals 1
    .param p1, "oid"    # I
    .param p2, "aid"    # I

    .prologue
    .line 523
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->checkTracksLock()V

    .line 524
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/audio/player/Tracks;->remove(II)V

    .line 525
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mShuffleTracks:Lcom/vkontakte/android/audio/player/Tracks;

    if-eqz v0, :cond_0

    .line 526
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mShuffleTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/audio/player/Tracks;->remove(II)V

    .line 527
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyTracksChanged()V

    .line 528
    return-void
.end method

.method public removeTrack(Ljava/lang/String;)V
    .locals 1
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 515
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->checkTracksLock()V

    .line 516
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/player/Tracks;->remove(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 517
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mShuffleTracks:Lcom/vkontakte/android/audio/player/Tracks;

    if-eqz v0, :cond_0

    .line 518
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mShuffleTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/player/Tracks;->remove(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 519
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyTracksChanged()V

    .line 520
    return-void
.end method

.method public resume()Z
    .locals 1

    .prologue
    .line 324
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->resume()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 325
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->requestAudioFocus()V

    .line 326
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyStateChanged()V

    .line 328
    const/4 v0, 0x1

    .line 331
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public rewind()Z
    .locals 1

    .prologue
    .line 313
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->rewind()Z

    move-result v0

    return v0
.end method

.method saveTracksState()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 156
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 157
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 159
    .local v1, "json":Lorg/json/JSONObject;
    :try_start_0
    const-string/jumbo v2, "uuid"

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 160
    const-string/jumbo v2, "duration"

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/audio/player/TrackInfo;->getDuration(I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 161
    const-string/jumbo v2, "position"

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/audio/player/TrackInfo;->getPosition(I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const-string/jumbo v3, "Player"

    aput-object v3, v2, v5

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Saving track state: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v4}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v4

    iget-object v4, v4, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 166
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mService:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v2}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/audio/player/Prefs;->stoppedTrackInfo:Lcom/vk/core/util/Preference$PreferenceString;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/core/util/Preference$PreferenceString;->set(Ljava/lang/String;)V

    .line 171
    .end local v1    # "json":Lorg/json/JSONObject;
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mLoadTracksTask:Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;

    if-eqz v2, :cond_1

    .line 172
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mLoadTracksTask:Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;

    invoke-virtual {v2, v6}, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->cancel(Z)Z

    .line 173
    iput-object v7, p0, Lcom/vkontakte/android/audio/player/Player;->mLoadTracksTask:Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;

    .line 177
    :goto_1
    return-void

    .line 162
    .restart local v1    # "json":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 163
    .local v0, "e":Lorg/json/JSONException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 168
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "json":Lorg/json/JSONObject;
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mService:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v2}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/audio/player/Prefs;->stoppedTrackInfo:Lcom/vk/core/util/Preference$PreferenceString;

    invoke-virtual {v2}, Lcom/vk/core/util/Preference$PreferenceString;->remove()V

    goto :goto_0

    .line 175
    :cond_1
    new-instance v2, Lcom/vkontakte/android/audio/player/Player$SaveTracksTask;

    invoke-direct {v2, p0, v7}, Lcom/vkontakte/android/audio/player/Player$SaveTracksTask;-><init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$1;)V

    new-array v3, v5, [Ljava/lang/Void;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/audio/player/Player$SaveTracksTask;->executeQuick([Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public seekTo(I)V
    .locals 2
    .param p1, "millis"    # I

    .prologue
    .line 317
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->seekTo(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 318
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getId()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->setPosition(II)V

    .line 319
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyProgress()V

    .line 321
    :cond_0
    return-void
.end method

.method setLoopMode(Lcom/vkontakte/android/audio/player/LoopMode;)V
    .locals 1
    .param p1, "mode"    # Lcom/vkontakte/android/audio/player/LoopMode;

    .prologue
    .line 368
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mService:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/audio/player/Prefs;->loopMode:Lcom/vk/core/util/Preference$PreferenceEnum;

    invoke-virtual {v0, p1}, Lcom/vk/core/util/Preference$PreferenceEnum;->set(Ljava/lang/Enum;)V

    .line 369
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyParametersChanged()V

    .line 370
    return-void
.end method

.method public setShuffle(Z)V
    .locals 2
    .param p1, "shuffle"    # Z

    .prologue
    .line 382
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mService:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/audio/player/Prefs;->shuffle:Lcom/vk/core/util/Preference$PreferenceBoolean;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/core/util/Preference$PreferenceBoolean;->set(Ljava/lang/Boolean;)V

    .line 383
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mService:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/audio/player/Prefs;->shuffleGlobal:Lcom/vk/core/util/Preference$PreferenceBoolean;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/core/util/Preference$PreferenceBoolean;->set(Ljava/lang/Boolean;)V

    .line 384
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/audio/player/Player;->shuffleIfNeeded(ZZ)V

    .line 385
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyParametersChanged()V

    .line 386
    return-void
.end method

.method public setTracksAndPlay(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;)V
    .locals 6
    .param p2, "index"    # I
    .param p3, "refer"    # Lcom/vkontakte/android/audio/player/PlayerRefer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;I",
            "Lcom/vkontakte/android/audio/player/PlayerRefer;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "tracks":Ljava/util/Collection;, "Ljava/util/Collection<+Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v2, 0x0

    .line 493
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v3}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->canPlay()Z

    move-result v3

    if-nez v3, :cond_0

    .line 512
    :goto_0
    return-void

    .line 497
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->checkTracksLock()V

    .line 498
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/Tracks;->clear()V

    .line 499
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 500
    .local v0, "track":Lcom/vkontakte/android/audio/MusicTrack;
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    new-instance v5, Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-direct {v5, v0}, Lcom/vkontakte/android/audio/player/PlayerTrack;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/audio/player/Tracks;->add(Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    goto :goto_1

    .line 502
    .end local v0    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_1
    if-ltz p2, :cond_2

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v3, p2}, Lcom/vkontakte/android/audio/player/Tracks;->get(I)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v3

    iget-object v1, v3, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    .line 503
    .local v1, "uuid":Ljava/lang/String;
    :goto_2
    if-nez v1, :cond_3

    :goto_3
    invoke-direct {p0, v2}, Lcom/vkontakte/android/audio/player/Player;->shuffleIfNeeded(Ljava/util/Collection;)V

    .line 504
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyTracksChanged()V

    .line 506
    if-ltz p2, :cond_4

    .line 507
    iput-object p3, p0, Lcom/vkontakte/android/audio/player/Player;->refer:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 508
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/audio/player/Player;->play(Ljava/lang/String;)V

    goto :goto_0

    .end local v1    # "uuid":Ljava/lang/String;
    :cond_2
    move-object v1, v2

    .line 502
    goto :goto_2

    .line 503
    .restart local v1    # "uuid":Ljava/lang/String;
    :cond_3
    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    goto :goto_3

    .line 510
    :cond_4
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player;->stop()V

    goto :goto_0
.end method

.method public setTracksAndPlayShuffle(Ljava/util/Collection;Lcom/vkontakte/android/audio/player/PlayerRefer;)V
    .locals 5
    .param p2, "refer"    # Lcom/vkontakte/android/audio/player/PlayerRefer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;",
            "Lcom/vkontakte/android/audio/player/PlayerRefer;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "tracks":Ljava/util/Collection;, "Ljava/util/Collection<+Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v1, 0x0

    .line 469
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->canPlay()Z

    move-result v2

    if-nez v2, :cond_0

    .line 490
    :goto_0
    return-void

    .line 473
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/audio/player/Player;->setShuffle(Z)V

    .line 475
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->checkTracksLock()V

    .line 476
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/Tracks;->clear()V

    .line 477
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 478
    .local v0, "track":Lcom/vkontakte/android/audio/MusicTrack;
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player;->mTracks:Lcom/vkontakte/android/audio/player/Tracks;

    new-instance v4, Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-direct {v4, v0}, Lcom/vkontakte/android/audio/player/PlayerTrack;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/audio/player/Tracks;->add(Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    goto :goto_1

    .line 480
    .end local v0    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_1
    invoke-direct {p0, v1}, Lcom/vkontakte/android/audio/player/Player;->shuffleIfNeeded(Ljava/util/Collection;)V

    .line 481
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyTracksChanged()V

    .line 482
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->getPlayTracks()Lcom/vkontakte/android/audio/player/Tracks;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/audio/player/Tracks;->get(I)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v2

    iget-object v1, v2, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    .line 484
    .local v1, "uuid":Ljava/lang/String;
    :cond_2
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    .line 485
    iput-object p2, p0, Lcom/vkontakte/android/audio/player/Player;->refer:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 486
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/audio/player/Player;->play(Ljava/lang/String;)V

    goto :goto_0

    .line 488
    :cond_3
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player;->stop()V

    goto :goto_0
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 193
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/player/Player;->stop(Z)V

    .line 194
    return-void
.end method

.method public stop(Z)V
    .locals 2
    .param p1, "reset"    # Z

    .prologue
    .line 182
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->abandonAudioFocus()V

    .line 183
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->stop()V

    .line 184
    if-eqz p1, :cond_0

    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/TrackInfo;->clear(Z)V

    .line 189
    :goto_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyStateChanged()V

    .line 190
    return-void

    .line 187
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/TrackInfo;->clearBuffering()V

    goto :goto_0
.end method

.method public swap(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "uuid1"    # Ljava/lang/String;
    .param p2, "uuid2"    # Ljava/lang/String;

    .prologue
    .line 622
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->getPlayTracks()Lcom/vkontakte/android/audio/player/Tracks;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/audio/player/Tracks;->swap(Ljava/lang/String;Ljava/lang/String;)V

    .line 623
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player;->notifyTracksChanged()V

    .line 624
    return-void
.end method

.method public toggleLoopMode()V
    .locals 4

    .prologue
    .line 373
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player;->getLoopMode()Lcom/vkontakte/android/audio/player/LoopMode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/LoopMode;->ordinal()I

    move-result v0

    .line 374
    .local v0, "ordinal":I
    sget-object v1, Lcom/vkontakte/android/audio/player/LoopMode;->VALUES:[Lcom/vkontakte/android/audio/player/LoopMode;

    add-int/lit8 v2, v0, 0x1

    sget-object v3, Lcom/vkontakte/android/audio/player/LoopMode;->VALUES:[Lcom/vkontakte/android/audio/player/LoopMode;

    array-length v3, v3

    rem-int/2addr v2, v3

    aget-object v1, v1, v2

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/audio/player/Player;->setLoopMode(Lcom/vkontakte/android/audio/player/LoopMode;)V

    .line 375
    return-void
.end method

.method public toggleResumePause()Z
    .locals 2

    .prologue
    .line 345
    sget-object v0, Lcom/vkontakte/android/audio/player/Player$2;->$SwitchMap$com$vkontakte$android$audio$player$PlayerState:[I

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player;->mPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    invoke-interface {v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/PlayerState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 359
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 348
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 349
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mTrackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/player/Player;->play(Ljava/lang/String;)V

    .line 353
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    .line 351
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player;->playNext()Z

    goto :goto_1

    .line 355
    :pswitch_1
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player;->pause()Z

    move-result v0

    goto :goto_0

    .line 357
    :pswitch_2
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player;->resume()Z

    move-result v0

    goto :goto_0

    .line 345
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method toggleShuffle()V
    .locals 1

    .prologue
    .line 389
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/Player;->isShuffle()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/player/Player;->setShuffle(Z)V

    .line 390
    return-void

    .line 389
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method unregisterListener(Lcom/vkontakte/android/audio/player/PlayerListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/vkontakte/android/audio/player/PlayerListener;

    .prologue
    .line 681
    if-eqz p1, :cond_0

    .line 682
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player;->mListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 683
    :cond_0
    return-void
.end method
