.class public Lcom/vkontakte/android/audio/player/PlayerService;
.super Lcom/vkontakte/android/audio/utils/BoundService;
.source "PlayerService.java"

# interfaces
.implements Lcom/vkontakte/android/AppStateTracker$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;,
        Lcom/vkontakte/android/audio/player/PlayerService$StopRunnable;,
        Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;,
        Lcom/vkontakte/android/audio/player/PlayerService$MySavedTracksListener;,
        Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;,
        Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;
    }
.end annotation


# static fields
.field static final LOG_PREFIX:Ljava/lang/String; = "PlayerService"

.field static final LOG_TAG:Ljava/lang/String; = "PlayerService"

.field public static final NOTIFY_DOWNLOAD_TRACKS:I = 0x2

.field public static final NOTIFY_DOWNLOAD_TRACKS_FINISHED:I = 0x3

.field public static final NOTIFY_PLAYER_SERVICE:I = 0x1

.field private static final SHOW_PAUSED_INFO_MAX_COUNT:I = 0xa

.field private static final SHOW_PAUSED_INFO_MAX_PERIOD:I = 0x5a

.field private static final SHOW_PAUSED_INFO_MAX_PER_DAY:I = 0x2

.field private static final TIME_MILLIS_RESUME_MUSIC:I = 0x2710

.field private static final TIME_MILLIS_SHOW_POPUP:I = 0xea60

.field private static final mNetworkStateEvent:Lcom/vkontakte/android/audio/events/StaticObservableEvent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/audio/events/StaticObservableEvent",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;",
            "Lcom/vkontakte/android/audio/player/PlayerService;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final checkStop:Ljava/lang/Runnable;

.field private lastMid:Ljava/lang/String;

.field private mHandler:Landroid/os/Handler;

.field private final mNetworkStateReceiver:Landroid/content/BroadcastReceiver;

.field private mPlayer:Lcom/vkontakte/android/audio/player/Player;

.field private mQueuedIntents:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

.field private final mScreenStateReceiver:Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;

.field private mStartId:I

.field private final mStopRunnable:Lcom/vkontakte/android/audio/player/PlayerService$StopRunnable;

.field private mUiStarted:Z

.field private needShowBuyMusicSubscriptionFragment:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 66
    new-instance v0, Lcom/vkontakte/android/audio/player/PlayerService$1;

    invoke-direct {v0}, Lcom/vkontakte/android/audio/player/PlayerService$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerService;->mNetworkStateEvent:Lcom/vkontakte/android/audio/events/StaticObservableEvent;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 51
    invoke-direct {p0}, Lcom/vkontakte/android/audio/utils/BoundService;-><init>()V

    .line 58
    new-instance v0, Lcom/vkontakte/android/audio/player/PlayerService$StopRunnable;

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/audio/player/PlayerService$StopRunnable;-><init>(Lcom/vkontakte/android/audio/player/PlayerService;Lcom/vkontakte/android/audio/player/PlayerService$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mStopRunnable:Lcom/vkontakte/android/audio/player/PlayerService$StopRunnable;

    .line 60
    iput-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService;->lastMid:Ljava/lang/String;

    .line 73
    new-instance v0, Lcom/vkontakte/android/audio/player/PlayerService$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/audio/player/PlayerService$2;-><init>(Lcom/vkontakte/android/audio/player/PlayerService;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mNetworkStateReceiver:Landroid/content/BroadcastReceiver;

    .line 81
    new-instance v0, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;-><init>(Lcom/vkontakte/android/audio/player/PlayerService;Lcom/vkontakte/android/audio/player/PlayerService$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mScreenStateReceiver:Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;

    .line 82
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->needShowBuyMusicSubscriptionFragment:Z

    .line 178
    new-instance v0, Lcom/vkontakte/android/audio/player/PlayerService$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/audio/player/PlayerService$3;-><init>(Lcom/vkontakte/android/audio/player/PlayerService;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->checkStop:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$100()Lcom/vkontakte/android/audio/events/StaticObservableEvent;
    .locals 1

    .prologue
    .line 51
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerService;->mNetworkStateEvent:Lcom/vkontakte/android/audio/events/StaticObservableEvent;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/audio/player/PlayerService;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;
    .param p1, "x1"    # Z

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/PlayerService;->tryStopMe(Z)V

    return-void
.end method

.method static synthetic access$1202(Lcom/vkontakte/android/audio/player/PlayerService;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/PlayerService;->lastMid:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/audio/player/PlayerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->updateWidgets()V

    return-void
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/audio/player/PlayerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->tryStopMe()V

    return-void
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/audio/player/PlayerService;)Lcom/vkontakte/android/audio/player/SavedTracks;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/audio/player/PlayerService;)Ljava/util/LinkedList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mQueuedIntents:Ljava/util/LinkedList;

    return-object v0
.end method

.method static synthetic access$1602(Lcom/vkontakte/android/audio/player/PlayerService;Ljava/util/LinkedList;)Ljava/util/LinkedList;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;
    .param p1, "x1"    # Ljava/util/LinkedList;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mQueuedIntents:Ljava/util/LinkedList;

    return-object p1
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/audio/player/PlayerService;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/PlayerService;->handleIntent(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/audio/player/PlayerService;)Lcom/vkontakte/android/audio/player/Player;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/audio/player/PlayerService;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->checkStop:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$502(Lcom/vkontakte/android/audio/player/PlayerService;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;
    .param p1, "x1"    # Z

    .prologue
    .line 51
    iput-boolean p1, p0, Lcom/vkontakte/android/audio/player/PlayerService;->needShowBuyMusicSubscriptionFragment:Z

    return p1
.end method

.method static synthetic access$600(Lcom/vkontakte/android/audio/player/PlayerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->showBuyMusicSubscriptionFragmentIfNeed()V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/audio/player/PlayerService;)Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mScreenStateReceiver:Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;

    return-object v0
.end method

.method public static addNetworkStateEventHandler(Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;)V
    .locals 1
    .param p0, "handler"    # Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;

    .prologue
    .line 199
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerService;->mNetworkStateEvent:Lcom/vkontakte/android/audio/events/StaticObservableEvent;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/audio/events/StaticObservableEvent;->add(Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    return-void
.end method

.method public static getDefaultValueForExoPlayer()Ljava/lang/String;
    .locals 3

    .prologue
    .line 233
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getDefaultAudioPlayer()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v0, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 240
    const-string/jumbo v0, "exo"

    :goto_1
    return-object v0

    .line 233
    :sswitch_0
    const-string/jumbo v2, "standard"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v2, "exoCached"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :sswitch_2
    const-string/jumbo v2, "exo"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x3

    goto :goto_0

    .line 235
    :pswitch_0
    const-string/jumbo v0, "standard"

    goto :goto_1

    .line 237
    :pswitch_1
    const-string/jumbo v0, "exoCached"

    goto :goto_1

    .line 233
    :sswitch_data_0
    .sparse-switch
        -0x67c54da2 -> :sswitch_1
        0x18a1c -> :sswitch_2
        0x4e3d1ebd -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static getPlayerType(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 245
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 246
    .local v1, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "__dbg_exo_player"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 247
    const-string/jumbo v2, "__dbg_exo_player"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 248
    .local v0, "b":Z
    if-eqz v0, :cond_0

    const-string/jumbo v2, "exo"

    .line 250
    .end local v0    # "b":Z
    :goto_0
    return-object v2

    .line 248
    .restart local v0    # "b":Z
    :cond_0
    const-string/jumbo v2, "standard"

    goto :goto_0

    .line 250
    .end local v0    # "b":Z
    :cond_1
    const-string/jumbo v2, "__dbg_player_type"

    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerService;->getDefaultValueForExoPlayer()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private handleIntent(Landroid/content/Intent;)V
    .locals 14
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 406
    if-nez p1, :cond_1

    const/4 v0, 0x0

    .line 408
    .local v0, "action":Ljava/lang/String;
    :goto_0
    if-nez v0, :cond_2

    .line 504
    :cond_0
    :goto_1
    return-void

    .line 406
    .end local v0    # "action":Ljava/lang/String;
    :cond_1
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 411
    .restart local v0    # "action":Ljava/lang/String;
    :cond_2
    const/4 v9, 0x5

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string/jumbo v11, "PlayerService"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    const-string/jumbo v11, "PlayerService"

    aput-object v11, v9, v10

    const/4 v10, 0x2

    const-string/jumbo v11, "onStartCommand"

    aput-object v11, v9, v10

    const/4 v10, 0x3

    const-string/jumbo v11, "action"

    aput-object v11, v9, v10

    const/4 v10, 0x4

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v9}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 412
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_STOP:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 413
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/Player;->saveTracksState()V

    .line 414
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/Player;->stop()V

    goto :goto_1

    .line 415
    :cond_3
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_LOGOUT:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 416
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/audio/player/Player;->stop(Z)V

    .line 417
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/Player;->clearTracks()V

    .line 418
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/SavedTracks;->cancelDownloads()V

    .line 419
    invoke-static {p0}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/Prefs;->clear()V

    goto :goto_1

    .line 420
    :cond_4
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_PAUSE:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 421
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/Player;->pause()Z

    goto :goto_1

    .line 422
    :cond_5
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_TOGGLE_RESUME_PAUSE:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 423
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/Player;->toggleResumePause()Z

    goto :goto_1

    .line 424
    :cond_6
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_REWIND:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 425
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/Player;->rewind()Z

    goto/16 :goto_1

    .line 426
    :cond_7
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_RESUME:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 427
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/Player;->resume()Z

    goto/16 :goto_1

    .line 428
    :cond_8
    sget-object v9, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_SHOW_PLAYER:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 429
    new-instance v9, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getAudioPlayerActivityClass()Ljava/lang/Class;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v10, 0x18800000

    .line 430
    invoke-virtual {v9, v10}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v1

    .line 432
    .local v1, "intentShowPlayer":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/audio/player/PlayerService;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_1

    .line 433
    .end local v1    # "intentShowPlayer":Landroid/content/Intent;
    :cond_9
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_NEXT:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 434
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/Player;->playNext()Z

    goto/16 :goto_1

    .line 435
    :cond_a
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_PREV:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_b

    .line 436
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/Player;->playPrev()Z

    move-result v9

    if-nez v9, :cond_0

    .line 437
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->updateWidgets()V

    goto/16 :goto_1

    .line 439
    :cond_b
    sget-object v9, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_PLAY_NEXT:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_d

    .line 440
    sget-object v9, Lcom/vkontakte/android/audio/AudioFacade;->EXTRA_MUSIC_FILES:Ljava/lang/String;

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    .line 441
    .local v6, "tracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    if-eqz v6, :cond_0

    .line 442
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/Player;->hasTracks()Z

    move-result v9

    if-eqz v9, :cond_c

    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/Player;->getState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v9

    sget-object v10, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v9, v10, :cond_c

    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/Player;->getState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v9

    sget-object v10, Lcom/vkontakte/android/audio/player/PlayerState;->STOPPED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v9, v10, :cond_c

    .line 443
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9, v6}, Lcom/vkontakte/android/audio/player/Player;->addTrackToNext(Ljava/util/List;)V

    goto/16 :goto_1

    .line 445
    :cond_c
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    const/4 v10, 0x0

    sget-object v11, Lcom/vkontakte/android/audio/player/PlayerRefer;->none:Lcom/vkontakte/android/audio/player/PlayerRefer;

    invoke-virtual {v9, v6, v10, v11}, Lcom/vkontakte/android/audio/player/Player;->setTracksAndPlay(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;)V

    goto/16 :goto_1

    .line 448
    .end local v6    # "tracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_d
    sget-object v9, Lcom/vkontakte/android/audio/AudioFacade;->ACTION_ADD_TO_PLAYLIST:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e

    .line 449
    sget-object v9, Lcom/vkontakte/android/audio/AudioFacade;->EXTRA_MUSIC_FILES:Ljava/lang/String;

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    .line 450
    .restart local v6    # "tracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    if-eqz v6, :cond_0

    .line 451
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9, v6}, Lcom/vkontakte/android/audio/player/Player;->addTracks(Ljava/util/Collection;)V

    goto/16 :goto_1

    .line 453
    .end local v6    # "tracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_e
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_PLAY_UUID:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_f

    .line 454
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_UUID:Ljava/lang/String;

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 455
    .local v8, "uuid":Ljava/lang/String;
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 456
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9, v8}, Lcom/vkontakte/android/audio/player/Player;->play(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 458
    .end local v8    # "uuid":Ljava/lang/String;
    :cond_f
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_TOGGLE_SHUFFLE:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_10

    .line 459
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/Player;->toggleShuffle()V

    goto/16 :goto_1

    .line 460
    :cond_10
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_SET_SHUFFLE:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_11

    .line 461
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    sget-object v10, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_SHUFFLE:Ljava/lang/String;

    const/4 v11, 0x0

    invoke-virtual {p1, v10, v11}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v10

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/audio/player/Player;->setShuffle(Z)V

    goto/16 :goto_1

    .line 462
    :cond_11
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_TOGGLE_REPEAT:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_12

    .line 463
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    sget-object v10, Lcom/vkontakte/android/audio/player/LoopMode;->VALUES:[Lcom/vkontakte/android/audio/player/LoopMode;

    iget-object v11, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v11}, Lcom/vkontakte/android/audio/player/Player;->getLoopMode()Lcom/vkontakte/android/audio/player/LoopMode;

    move-result-object v11

    invoke-virtual {v11}, Lcom/vkontakte/android/audio/player/LoopMode;->ordinal()I

    move-result v11

    add-int/lit8 v11, v11, 0x1

    sget-object v12, Lcom/vkontakte/android/audio/player/LoopMode;->VALUES:[Lcom/vkontakte/android/audio/player/LoopMode;

    array-length v12, v12

    rem-int/2addr v11, v12

    aget-object v10, v10, v11

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/audio/player/Player;->setLoopMode(Lcom/vkontakte/android/audio/player/LoopMode;)V

    goto/16 :goto_1

    .line 464
    :cond_12
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_TOGGLE_REPEAT_NONE_OR_TRACK:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_13

    .line 465
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/Player;->getLoopMode()Lcom/vkontakte/android/audio/player/LoopMode;

    move-result-object v2

    .line 466
    .local v2, "loopMode":Lcom/vkontakte/android/audio/player/LoopMode;
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerService$4;->$SwitchMap$com$vkontakte$android$audio$player$LoopMode:[I

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/LoopMode;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    goto/16 :goto_1

    .line 469
    :pswitch_0
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    sget-object v10, Lcom/vkontakte/android/audio/player/LoopMode;->NONE:Lcom/vkontakte/android/audio/player/LoopMode;

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/audio/player/Player;->setLoopMode(Lcom/vkontakte/android/audio/player/LoopMode;)V

    goto/16 :goto_1

    .line 472
    :pswitch_1
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    sget-object v10, Lcom/vkontakte/android/audio/player/LoopMode;->TRACK:Lcom/vkontakte/android/audio/player/LoopMode;

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/audio/player/Player;->setLoopMode(Lcom/vkontakte/android/audio/player/LoopMode;)V

    goto/16 :goto_1

    .line 475
    .end local v2    # "loopMode":Lcom/vkontakte/android/audio/player/LoopMode;
    :cond_13
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_SET_REPEAT_MODE:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_14

    .line 476
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    sget-object v10, Lcom/vkontakte/android/audio/player/LoopMode;->VALUES:[Lcom/vkontakte/android/audio/player/LoopMode;

    sget-object v11, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_REPEAT_MODE:Ljava/lang/String;

    sget-object v12, Lcom/vkontakte/android/audio/player/LoopMode;->NONE:Lcom/vkontakte/android/audio/player/LoopMode;

    .line 477
    invoke-virtual {v12}, Lcom/vkontakte/android/audio/player/LoopMode;->ordinal()I

    move-result v12

    .line 476
    invoke-virtual {p1, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v11

    aget-object v10, v10, v11

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/audio/player/Player;->setLoopMode(Lcom/vkontakte/android/audio/player/LoopMode;)V

    goto/16 :goto_1

    .line 478
    :cond_14
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_START_DOWNLOAD_TRACKS:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_15

    .line 479
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_TRACKS:Ljava/lang/String;

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    .line 480
    .local v7, "tracks":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/audio/MusicTrack;>;"
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_SHOW_NOTIFICATION:Ljava/lang/String;

    const/4 v10, 0x0

    invoke-virtual {p1, v9, v10}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    .line 481
    .local v5, "showNotifications":Z
    if-eqz v7, :cond_0

    .line 482
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-virtual {v9, v7, v5}, Lcom/vkontakte/android/audio/player/SavedTracks;->downloadTracks(Ljava/util/Collection;Z)V

    goto/16 :goto_1

    .line 484
    .end local v5    # "showNotifications":Z
    .end local v7    # "tracks":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_15
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_PAUSE_DOWNLOAD:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_16

    .line 485
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/SavedTracks;->pauseDownload()V

    goto/16 :goto_1

    .line 486
    :cond_16
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_RESUME_DOWNLOAD:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_17

    .line 487
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/SavedTracks;->resumeDownload()V

    goto/16 :goto_1

    .line 488
    :cond_17
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_CANCEL_DOWNLOAD:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_18

    .line 489
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/audio/player/SavedTracks;->cancelDownload(Ljava/lang/String;)Z

    goto/16 :goto_1

    .line 490
    :cond_18
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_CANCEL_DOWNLOADS:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_19

    .line 491
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/SavedTracks;->cancelDownloads()V

    goto/16 :goto_1

    .line 492
    :cond_19
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_REMOVE_SAVED_TRACK:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1b

    .line 493
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_MID:Ljava/lang/String;

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 494
    .local v4, "mids":[Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 495
    array-length v10, v4

    const/4 v9, 0x0

    :goto_2
    if-ge v9, v10, :cond_0

    aget-object v3, v4, v9

    .line 496
    .local v3, "mid":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_1a

    .line 497
    iget-object v11, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/String;

    const/4 v13, 0x0

    aput-object v3, v12, v13

    invoke-virtual {v11, v12}, Lcom/vkontakte/android/audio/player/SavedTracks;->removeTracks([Ljava/lang/String;)V

    .line 495
    :cond_1a
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 501
    .end local v3    # "mid":Ljava/lang/String;
    .end local v4    # "mids":[Ljava/lang/String;
    :cond_1b
    sget-object v9, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_REMOVE_ALL_SAVED_TRACK:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 502
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/SavedTracks;->clearTracks()V

    goto/16 :goto_1

    .line 466
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method static synthetic lambda$waitForOnline$0(Ljava/util/concurrent/CountDownLatch;Lcom/vkontakte/android/audio/player/PlayerService;Z)V
    .locals 0
    .param p0, "latch"    # Ljava/util/concurrent/CountDownLatch;
    .param p1, "playerService"    # Lcom/vkontakte/android/audio/player/PlayerService;
    .param p2, "online"    # Z

    .prologue
    .line 213
    if-eqz p2, :cond_0

    .line 214
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 215
    :cond_0
    return-void
.end method

.method public static removeNetworkStateEventHandler(Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;)V
    .locals 1
    .param p0, "handler"    # Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;

    .prologue
    .line 203
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerService;->mNetworkStateEvent:Lcom/vkontakte/android/audio/events/StaticObservableEvent;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/audio/events/StaticObservableEvent;->remove(Ljava/lang/Object;)V

    .line 204
    return-void
.end method

.method private sendErrorBroadcast(Ljava/lang/String;)V
    .locals 2
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 658
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 659
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 660
    return-void
.end method

.method private showBuyMusicSubscriptionFragmentIfNeed()V
    .locals 14

    .prologue
    .line 91
    iget-boolean v8, p0, Lcom/vkontakte/android/audio/player/PlayerService;->needShowBuyMusicSubscriptionFragment:Z

    if-nez v8, :cond_1

    .line 117
    :cond_0
    :goto_0
    return-void

    .line 95
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 96
    .local v2, "currentTime":J
    const/4 v7, 0x0

    .line 97
    .local v7, "todayCount":I
    const/4 v5, 0x0

    .line 98
    .local v5, "maxTimesCount":I
    invoke-static {p0}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v8

    iget-object v8, v8, Lcom/vkontakte/android/audio/player/Prefs;->showedPausedInfo:Lcom/vk/core/util/Preference$PreferenceLongArray;

    invoke-virtual {v8}, Lcom/vk/core/util/Preference$PreferenceLongArray;->get()[Ljava/lang/Long;

    move-result-object v6

    .line 99
    .local v6, "times":[Ljava/lang/Long;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 100
    .local v4, "longs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    array-length v9, v6

    const/4 v8, 0x0

    :goto_1
    if-ge v8, v9, :cond_4

    aget-object v1, v6, v8

    .line 101
    .local v1, "l":Ljava/lang/Long;
    const-wide/32 v10, 0x5265c00

    sub-long v10, v2, v10

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    cmp-long v10, v10, v12

    if-gez v10, :cond_2

    add-int/lit8 v7, v7, 0x1

    .line 102
    :cond_2
    const-wide/32 v10, 0x134fd900

    sub-long v10, v2, v10

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    cmp-long v10, v10, v12

    if-gez v10, :cond_3

    .line 103
    add-int/lit8 v5, v5, 0x1

    .line 104
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    :cond_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 107
    .end local v1    # "l":Ljava/lang/Long;
    :cond_4
    const/4 v8, 0x2

    if-ge v7, v8, :cond_0

    const/16 v8, 0xa

    if-ge v5, v8, :cond_0

    .line 109
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    .line 110
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    invoke-static {}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->isShowed()Z

    move-result v8

    if-nez v8, :cond_0

    .line 111
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    invoke-static {p0}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v8

    iget-object v9, v8, Lcom/vkontakte/android/audio/player/Prefs;->showedPausedInfo:Lcom/vk/core/util/Preference$PreferenceLongArray;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/Long;

    invoke-interface {v4, v8}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/Long;

    invoke-virtual {v9, v8}, Lcom/vk/core/util/Preference$PreferenceLongArray;->set([Ljava/lang/Long;)V

    .line 114
    invoke-static {p0, v0}, Lcom/vkontakte/android/fragments/money/MusicWasPausedFragment;->show(Landroid/content/Context;Landroid/app/Activity;)V

    .line 115
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/vkontakte/android/audio/player/PlayerService;->needShowBuyMusicSubscriptionFragment:Z

    goto :goto_0
.end method

.method private tryStopMe()V
    .locals 1

    .prologue
    .line 402
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerService;->tryStopMe(Z)V

    .line 403
    return-void
.end method

.method private tryStopMe(Z)V
    .locals 4
    .param p1, "schedule"    # Z

    .prologue
    .line 391
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mStopRunnable:Lcom/vkontakte/android/audio/player/PlayerService$StopRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 392
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->isBound()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->getState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v0

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->STOPPED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

    .line 393
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/SavedTracks;->hasTasks()Z

    move-result v0

    if-nez v0, :cond_0

    .line 394
    if-eqz p1, :cond_1

    .line 395
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mStopRunnable:Lcom/vkontakte/android/audio/player/PlayerService$StopRunnable;

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 399
    :cond_0
    :goto_0
    return-void

    .line 397
    :cond_1
    iget v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mStartId:I

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerService;->stopSelf(I)V

    goto :goto_0
.end method

.method private updateWidgets()V
    .locals 4

    .prologue
    .line 667
    invoke-static {p0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v0

    .line 668
    .local v0, "awm":Landroid/appwidget/AppWidgetManager;
    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lcom/vkontakte/android/PlayerWidget;

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v2}, Landroid/appwidget/AppWidgetManager;->getAppWidgetIds(Landroid/content/ComponentName;)[I

    move-result-object v1

    .line 669
    .local v1, "ids":[I
    if-eqz v1, :cond_0

    array-length v2, v1

    if-lez v2, :cond_0

    .line 670
    invoke-static {p0, v0, v1}, Lcom/vkontakte/android/PlayerWidget;->update(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V

    .line 672
    :cond_0
    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lcom/vkontakte/android/PlayerBigWidget;

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v2}, Landroid/appwidget/AppWidgetManager;->getAppWidgetIds(Landroid/content/ComponentName;)[I

    move-result-object v1

    .line 673
    if-eqz v1, :cond_1

    array-length v2, v1

    if-lez v2, :cond_1

    .line 674
    invoke-static {p0, v0, v1}, Lcom/vkontakte/android/PlayerBigWidget;->update(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V

    .line 676
    :cond_1
    return-void
.end method

.method public static waitForOnline(Landroid/content/Context;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 229
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerService;->waitForOnline(Landroid/content/Context;I)Z

    move-result v0

    return v0
.end method

.method public static waitForOnline(Landroid/content/Context;I)Z
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 208
    invoke-static {p0}, Lcom/vkontakte/android/audio/utils/Utils;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 224
    :goto_0
    return v2

    .line 211
    :cond_0
    new-instance v1, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v1, v2}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 212
    .local v1, "latch":Ljava/util/concurrent/CountDownLatch;
    invoke-static {v1}, Lcom/vkontakte/android/audio/player/PlayerService$$Lambda$1;->lambdaFactory$(Ljava/util/concurrent/CountDownLatch;)Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;

    move-result-object v0

    .line 216
    .local v0, "handler":Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerService;->addNetworkStateEventHandler(Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;)V

    .line 218
    if-lez p1, :cond_1

    .line 219
    int-to-long v2, p1

    :try_start_0
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 224
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerService;->removeNetworkStateEventHandler(Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;)V

    goto :goto_0

    .line 221
    :cond_1
    :try_start_1
    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 224
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerService;->removeNetworkStateEventHandler(Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;)V

    goto :goto_0

    :catchall_0
    move-exception v2

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerService;->removeNetworkStateEventHandler(Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;)V

    throw v2
.end method


# virtual methods
.method public cancelNotification()V
    .locals 2

    .prologue
    .line 612
    const-string/jumbo v1, "notification"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/audio/player/PlayerService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 613
    .local v0, "manager":Landroid/app/NotificationManager;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 614
    return-void
.end method

.method public getPlayer()Lcom/vkontakte/android/audio/player/Player;
    .locals 1

    .prologue
    .line 383
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    return-object v0
.end method

.method public getSavedTracks()Lcom/vkontakte/android/audio/player/SavedTracks;
    .locals 1

    .prologue
    .line 387
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

    return-object v0
.end method

.method public onAppPaused()V
    .locals 0

    .prologue
    .line 171
    return-void
.end method

.method public onAppResumed()V
    .locals 0

    .prologue
    .line 175
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->showBuyMusicSubscriptionFragmentIfNeed()V

    .line 176
    return-void
.end method

.method public onBound(Landroid/content/Intent;)V
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 364
    invoke-super {p0, p1}, Lcom/vkontakte/android/audio/utils/BoundService;->onBound(Landroid/content/Intent;)V

    .line 366
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mUiStarted:Z

    if-nez v0, :cond_0

    .line 367
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mUiStarted:Z

    .line 370
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mNetworkStateReceiver:Landroid/content/BroadcastReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string/jumbo v2, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/audio/player/PlayerService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 371
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mStopRunnable:Lcom/vkontakte/android/audio/player/PlayerService$StopRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 372
    return-void
.end method

.method public onCreate()V
    .locals 14

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v13, 0x0

    const/4 v7, 0x1

    const/4 v12, 0x0

    .line 256
    invoke-super {p0}, Lcom/vkontakte/android/audio/utils/BoundService;->onCreate()V

    .line 258
    invoke-static {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->getPlayerType(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    .line 260
    .local v4, "playerType":Ljava/lang/String;
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    const/4 v6, -0x1

    invoke-virtual {v10}, Ljava/lang/String;->hashCode()I

    move-result v11

    sparse-switch v11, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v6, :pswitch_data_0

    .line 263
    sget-object v5, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->mediaPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    .line 273
    .local v5, "type":Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;
    :goto_1
    new-array v6, v9, [Ljava/lang/Object;

    const-string/jumbo v9, "PlayerService"

    aput-object v9, v6, v12

    const-string/jumbo v9, "PlayerService"

    aput-object v9, v6, v7

    const-string/jumbo v9, "onCreate"

    aput-object v9, v6, v8

    invoke-static {v6}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 276
    :try_start_0
    iget-boolean v6, v5, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->useLocalhostForCache:Z

    if-eqz v6, :cond_1

    .line 277
    invoke-static {p0}, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->startThread(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 284
    :cond_1
    :goto_2
    new-instance v3, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;

    invoke-direct {v3, p0, v13}, Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;-><init>(Lcom/vkontakte/android/audio/player/PlayerService;Lcom/vkontakte/android/audio/player/PlayerService$1;)V

    .line 286
    .local v3, "loadedListener":Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;
    new-instance v6, Lcom/vkontakte/android/audio/player/Player;

    invoke-direct {v6, p0, v3, v5}, Lcom/vkontakte/android/audio/player/Player;-><init>(Lcom/vkontakte/android/audio/player/PlayerService;Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;)V

    iput-object v6, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    .line 288
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v6, "android.media.action.OPEN_AUDIO_EFFECT_CONTROL_SESSION"

    invoke-direct {v2, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 289
    .local v2, "intent":Landroid/content/Intent;
    const-string/jumbo v6, "android.media.extra.PACKAGE_NAME"

    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 290
    const-string/jumbo v6, "android.media.extra.AUDIO_SESSION"

    iget-object v7, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v7}, Lcom/vkontakte/android/audio/player/Player;->getAudioSessionId()I

    move-result v7

    invoke-virtual {v2, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 291
    const-string/jumbo v6, "android.media.extra.CONTENT_TYPE"

    invoke-virtual {v2, v6, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 292
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/audio/player/PlayerService;->sendBroadcast(Landroid/content/Intent;)V

    .line 295
    iget-object v6, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    new-instance v7, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;

    invoke-direct {v7, p0, v13}, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;-><init>(Lcom/vkontakte/android/audio/player/PlayerService;Lcom/vkontakte/android/audio/player/PlayerService$1;)V

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/audio/player/Player;->registerListener(Lcom/vkontakte/android/audio/player/PlayerListener;)V

    .line 296
    sget-object v6, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    iget-object v7, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/audio/AudioStateListener;->onCreatePlayer(Lcom/vkontakte/android/audio/player/Player;)V

    .line 298
    new-instance v6, Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-direct {v6, p0, v3}, Lcom/vkontakte/android/audio/player/SavedTracks;-><init>(Landroid/content/Context;Lcom/vkontakte/android/audio/player/SavedTracks$OnLoadedListener;)V

    iput-object v6, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

    .line 299
    iget-object v6, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

    new-instance v7, Lcom/vkontakte/android/audio/player/PlayerService$MySavedTracksListener;

    invoke-direct {v7, p0, v13}, Lcom/vkontakte/android/audio/player/PlayerService$MySavedTracksListener;-><init>(Lcom/vkontakte/android/audio/player/PlayerService;Lcom/vkontakte/android/audio/player/PlayerService$1;)V

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/audio/player/SavedTracks;->registerListener(Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;)V

    .line 301
    new-instance v6, Landroid/os/Handler;

    invoke-direct {v6}, Landroid/os/Handler;-><init>()V

    iput-object v6, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mHandler:Landroid/os/Handler;

    .line 303
    iput-boolean v12, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mUiStarted:Z

    .line 305
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 306
    .local v1, "iF":Landroid/content/IntentFilter;
    const-string/jumbo v6, "android.intent.action.SCREEN_ON"

    invoke-virtual {v1, v6}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 307
    const-string/jumbo v6, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v1, v6}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 308
    iget-object v6, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mScreenStateReceiver:Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;

    invoke-virtual {p0, v6, v1}, Lcom/vkontakte/android/audio/player/PlayerService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 310
    invoke-static {p0}, Lcom/vkontakte/android/AppStateTracker;->addCallback(Lcom/vkontakte/android/AppStateTracker$Callback;)V

    .line 311
    return-void

    .line 260
    .end local v1    # "iF":Landroid/content/IntentFilter;
    .end local v2    # "intent":Landroid/content/Intent;
    .end local v3    # "loadedListener":Lcom/vkontakte/android/audio/player/PlayerService$LoadedListener;
    .end local v5    # "type":Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;
    :sswitch_0
    const-string/jumbo v11, "standard"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    move v6, v7

    goto/16 :goto_0

    :sswitch_1
    const-string/jumbo v11, "exoCached"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    move v6, v8

    goto/16 :goto_0

    :sswitch_2
    const-string/jumbo v11, "exo"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    move v6, v9

    goto/16 :goto_0

    .line 266
    :pswitch_0
    sget-object v5, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->exoPlayerCached:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    .line 267
    .restart local v5    # "type":Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;
    goto/16 :goto_1

    .line 269
    .end local v5    # "type":Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;
    :pswitch_1
    sget-object v5, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->exoPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    .restart local v5    # "type":Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;
    goto/16 :goto_1

    .line 279
    :catch_0
    move-exception v0

    .line 280
    .local v0, "e":Ljava/io/IOException;
    new-array v6, v12, [Ljava/lang/Object;

    invoke-static {v0, v6}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 281
    const-string/jumbo v6, "Error starting proxy"

    invoke-static {p0, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    goto/16 :goto_2

    .line 260
    :sswitch_data_0
    .sparse-switch
        -0x67c54da2 -> :sswitch_1
        0x18a1c -> :sswitch_2
        0x4e3d1ebd -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onDestroy()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 315
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const-string/jumbo v2, "PlayerService"

    aput-object v2, v1, v5

    const/4 v2, 0x1

    const-string/jumbo v3, "PlayerService"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string/jumbo v3, "onDestroy"

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 317
    invoke-static {p0}, Lcom/vkontakte/android/AppStateTracker;->removeCallback(Lcom/vkontakte/android/AppStateTracker$Callback;)V

    .line 319
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->cancelNotification()V

    .line 321
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v4}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 322
    iput-object v4, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mHandler:Landroid/os/Handler;

    .line 324
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/SavedTracks;->release()V

    .line 325
    iput-object v4, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

    .line 326
    sget-object v1, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/AudioStateListener;->onUnloadSavedTracks()V

    .line 328
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.media.action.CLOSE_AUDIO_EFFECT_CONTROL_SESSION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 329
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "android.media.extra.PACKAGE_NAME"

    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 330
    const-string/jumbo v1, "android.media.extra.AUDIO_SESSION"

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/Player;->getAudioSessionId()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 331
    const-string/jumbo v1, "android.media.extra.CONTENT_TYPE"

    invoke-virtual {v0, v1, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 332
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerService;->sendBroadcast(Landroid/content/Intent;)V

    .line 334
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/Player;->release()V

    .line 335
    iput-object v4, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    .line 336
    sget-object v1, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/AudioStateListener;->onDestroyPlayer()V

    .line 338
    invoke-static {}, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->stopThread()V

    .line 340
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->updateWidgets()V

    .line 342
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mScreenStateReceiver:Lcom/vkontakte/android/audio/player/PlayerService$ScreenStateReceiver;

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/audio/player/PlayerService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 344
    invoke-super {p0}, Lcom/vkontakte/android/audio/utils/BoundService;->onDestroy()V

    .line 345
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 349
    iput p3, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mStartId:I

    .line 351
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 352
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/PlayerService;->handleIntent(Landroid/content/Intent;)V

    .line 359
    :goto_0
    const/4 v0, 0x2

    return v0

    .line 354
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mQueuedIntents:Ljava/util/LinkedList;

    if-nez v0, :cond_1

    .line 355
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mQueuedIntents:Ljava/util/LinkedList;

    .line 356
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mQueuedIntents:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public onTaskRemoved(Landroid/content/Intent;)V
    .locals 3
    .param p1, "rootIntent"    # Landroid/content/Intent;

    .prologue
    .line 508
    invoke-super {p0, p1}, Lcom/vkontakte/android/audio/utils/BoundService;->onTaskRemoved(Landroid/content/Intent;)V

    .line 510
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "PlayerService"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "PlayerService"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "onTaskRemoved"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 512
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->pause()Z

    .line 513
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mSavedTracks:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/SavedTracks;->cancelDownloads()V

    .line 514
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mPlayer:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->saveTracksState()V

    .line 515
    return-void
.end method

.method public onUnbound(Landroid/content/Intent;)V
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 376
    invoke-super {p0, p1}, Lcom/vkontakte/android/audio/utils/BoundService;->onUnbound(Landroid/content/Intent;)V

    .line 378
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService;->mNetworkStateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 379
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->tryStopMe()V

    .line 380
    return-void
.end method

.method public showNotification(Landroid/graphics/Bitmap;Ljava/lang/String;)V
    .locals 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "mid"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 596
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/PlayerService;->lastMid:Ljava/lang/String;

    invoke-static {p2, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 597
    const-string/jumbo v2, "notification"

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/audio/player/PlayerService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 598
    .local v0, "manager":Landroid/app/NotificationManager;
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v1

    .line 599
    .local v1, "player":Lcom/vkontakte/android/audio/player/Player;
    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 600
    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/Player;->getState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/PlayerState;->isPlayState()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 601
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v2

    invoke-static {p0, v2, p1}, Lcom/vkontakte/android/audio/MusicApp;->createNotification(Landroid/content/Context;Lcom/vkontakte/android/audio/player/Player;Landroid/graphics/Bitmap;)Landroid/app/Notification;

    move-result-object v2

    invoke-virtual {p0, v3, v2}, Lcom/vkontakte/android/audio/player/PlayerService;->startForeground(ILandroid/app/Notification;)V

    .line 606
    :goto_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->updateWidgets()V

    .line 609
    .end local v0    # "manager":Landroid/app/NotificationManager;
    .end local v1    # "player":Lcom/vkontakte/android/audio/player/Player;
    :cond_0
    return-void

    .line 603
    .restart local v0    # "manager":Landroid/app/NotificationManager;
    .restart local v1    # "player":Lcom/vkontakte/android/audio/player/Player;
    :cond_1
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/audio/player/PlayerService;->stopForeground(Z)V

    .line 604
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/PlayerService;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v2

    invoke-static {p0, v2, p1}, Lcom/vkontakte/android/audio/MusicApp;->createNotification(Landroid/content/Context;Lcom/vkontakte/android/audio/player/Player;Landroid/graphics/Bitmap;)Landroid/app/Notification;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_0
.end method
