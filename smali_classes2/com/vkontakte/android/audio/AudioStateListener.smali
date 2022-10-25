.class public Lcom/vkontakte/android/audio/AudioStateListener;
.super Ljava/lang/Object;
.source "AudioStateListener.java"

# interfaces
.implements Lcom/vkontakte/android/audio/player/PlayerListener;
.implements Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;


# static fields
.field public static final inst:Lcom/vkontakte/android/audio/AudioStateListener;


# instance fields
.field private volatile lastBufferedMid:Ljava/lang/String;

.field private volatile lastBufferedPercent:I

.field private list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mPlayerListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerListener;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mSavedTracksListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;",
            ">;"
        }
    .end annotation
.end field

.field private notifyOnBufferingProgress:Ljava/lang/Runnable;

.field private notifyOnProgress:Ljava/lang/Runnable;

.field private notifyOnSavedTracksChanged:Ljava/lang/Runnable;

.field private notifyOnStateChanged:Ljava/lang/Runnable;

.field private notifyOnTrackListChanged:Ljava/lang/Runnable;

.field private player:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/vkontakte/android/audio/player/Player;",
            ">;"
        }
    .end annotation
.end field

.field private playerState:Lcom/vkontakte/android/audio/player/PlayerState;

.field private savedTracks:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/vkontakte/android/audio/player/SavedTracks;",
            ">;"
        }
    .end annotation
.end field

.field private trackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    new-instance v0, Lcom/vkontakte/android/audio/AudioStateListener;

    invoke-direct {v0}, Lcom/vkontakte/android/audio/AudioStateListener;-><init>()V

    sput-object v0, Lcom/vkontakte/android/audio/AudioStateListener;->inst:Lcom/vkontakte/android/audio/AudioStateListener;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->player:Ljava/lang/ref/WeakReference;

    .line 34
    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->savedTracks:Ljava/lang/ref/WeakReference;

    .line 36
    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->lastBufferedMid:Ljava/lang/String;

    .line 37
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->lastBufferedPercent:I

    .line 39
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mPlayerListeners:Ljava/util/Set;

    .line 40
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mSavedTracksListeners:Ljava/util/Set;

    .line 175
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioStateListener$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/audio/AudioStateListener;)Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnStateChanged:Ljava/lang/Runnable;

    .line 188
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioStateListener$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/audio/AudioStateListener;)Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnTrackListChanged:Ljava/lang/Runnable;

    .line 199
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioStateListener$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/audio/AudioStateListener;)Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnProgress:Ljava/lang/Runnable;

    .line 211
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioStateListener$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/audio/AudioStateListener;)Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnBufferingProgress:Ljava/lang/Runnable;

    .line 272
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioStateListener$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/audio/AudioStateListener;)Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnSavedTracksChanged:Ljava/lang/Runnable;

    .line 27
    return-void
.end method

.method private notifyOnBufferingProgress()V
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnBufferingProgress:Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 220
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnBufferingProgress:Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 221
    return-void
.end method

.method private notifyOnDownloadFinished(Z)V
    .locals 4
    .param p1, "completed"    # Z

    .prologue
    .line 296
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mSavedTracksListeners:Ljava/util/Set;

    .line 297
    .local v1, "savedTracksListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;

    .line 298
    .local v0, "listener":Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    invoke-interface {v0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;->onDownloadFinished(Z)V

    goto :goto_0

    .line 299
    .end local v0    # "listener":Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    :cond_0
    return-void
.end method

.method private notifyOnDownloadStarted()V
    .locals 4

    .prologue
    .line 290
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mSavedTracksListeners:Ljava/util/Set;

    .line 291
    .local v1, "savedTracksListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;

    .line 292
    .local v0, "listener":Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;->onDownloadStarted()V

    goto :goto_0

    .line 293
    .end local v0    # "listener":Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    :cond_0
    return-void
.end method

.method private notifyOnParametersChanged(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 1
    .param p1, "player"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 224
    invoke-static {p0, p1}, Lcom/vkontakte/android/audio/AudioStateListener$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/audio/AudioStateListener;Lcom/vkontakte/android/audio/player/Player;)Ljava/lang/Runnable;

    move-result-object v0

    .line 229
    .local v0, "runnable":Ljava/lang/Runnable;
    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 230
    return-void
.end method

.method private notifyOnProgress()V
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnProgress:Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 208
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnProgress:Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 209
    return-void
.end method

.method private notifyOnSavedTracksChanged()V
    .locals 1

    .prologue
    .line 279
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnSavedTracksChanged:Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 280
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnSavedTracksChanged:Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 281
    return-void
.end method

.method private notifyOnSavedTracksSaved()V
    .locals 4

    .prologue
    .line 284
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mSavedTracksListeners:Ljava/util/Set;

    .line 285
    .local v1, "savedTracksListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;

    .line 286
    .local v0, "listener":Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;->onSavedTracksSaved()V

    goto :goto_0

    .line 287
    .end local v0    # "listener":Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    :cond_0
    return-void
.end method

.method private notifyOnStateChanged()V
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnStateChanged:Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnStateChanged:Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 186
    return-void
.end method

.method private notifyOnTrackListChanged()V
    .locals 1

    .prologue
    .line 195
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnTrackListChanged:Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 196
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnTrackListChanged:Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 197
    return-void
.end method


# virtual methods
.method addPlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;Z)V
    .locals 3
    .param p1, "listener"    # Lcom/vkontakte/android/audio/player/PlayerListener;
    .param p2, "forceLastState"    # Z

    .prologue
    .line 101
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mPlayerListeners:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 102
    .local v0, "playerListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/player/PlayerListener;>;"
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 103
    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mPlayerListeners:Ljava/util/Set;

    .line 105
    if-eqz p2, :cond_2

    .line 106
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->trackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    if-eqz v1, :cond_0

    .line 107
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->trackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-interface {p1, v1}, Lcom/vkontakte/android/audio/player/PlayerListener;->onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 108
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->trackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-interface {p1, v1}, Lcom/vkontakte/android/audio/player/PlayerListener;->onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 110
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->trackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->playerState:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eqz v1, :cond_1

    .line 111
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->playerState:Lcom/vkontakte/android/audio/player/PlayerState;

    iget-object v2, p0, Lcom/vkontakte/android/audio/AudioStateListener;->trackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-interface {p1, v1, v2}, Lcom/vkontakte/android/audio/player/PlayerListener;->onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 112
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->list:Ljava/util/List;

    if-eqz v1, :cond_2

    .line 113
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->list:Ljava/util/List;

    invoke-interface {p1, v1}, Lcom/vkontakte/android/audio/player/PlayerListener;->onTrackListChanged(Ljava/util/List;)V

    .line 115
    :cond_2
    return-void
.end method

.method addSavedTracksListener(Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;Z)V
    .locals 2
    .param p1, "listener"    # Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    .param p2, "forceLastState"    # Z

    .prologue
    .line 235
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mSavedTracksListeners:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 236
    .local v0, "savedTracksListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;>;"
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 237
    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mSavedTracksListeners:Ljava/util/Set;

    .line 239
    if-eqz p2, :cond_0

    .line 240
    invoke-interface {p1}, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;->onSavedTracksChanged()V

    .line 242
    :cond_0
    return-void
.end method

.method public getList()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

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
    .line 83
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->list:Ljava/util/List;

    return-object v0
.end method

.method public getPlayer()Lcom/vkontakte/android/audio/player/Player;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 88
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->player:Ljava/lang/ref/WeakReference;

    .line 89
    .local v0, "weakReference":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/vkontakte/android/audio/player/Player;>;"
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/player/Player;

    goto :goto_0
.end method

.method public getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->playerState:Lcom/vkontakte/android/audio/player/PlayerState;

    if-nez v0, :cond_0

    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->playerState:Lcom/vkontakte/android/audio/player/PlayerState;

    goto :goto_0
.end method

.method public getSavedTracks()Lcom/vkontakte/android/audio/player/SavedTracks;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->savedTracks:Ljava/lang/ref/WeakReference;

    .line 95
    .local v0, "weakReference":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/vkontakte/android/audio/player/SavedTracks;>;"
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/player/SavedTracks;

    goto :goto_0
.end method

.method public getTrackInfo()Lcom/vkontakte/android/audio/player/TrackInfo;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 78
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->trackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    return-object v0
.end method

.method synthetic lambda$new$0()V
    .locals 6

    .prologue
    .line 176
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mPlayerListeners:Ljava/util/Set;

    .line 177
    .local v1, "playerListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/player/PlayerListener;>;"
    iget-object v2, p0, Lcom/vkontakte/android/audio/AudioStateListener;->playerState:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 178
    .local v2, "playerState":Lcom/vkontakte/android/audio/player/PlayerState;
    iget-object v3, p0, Lcom/vkontakte/android/audio/AudioStateListener;->trackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    .line 179
    .local v3, "trackInfo":Lcom/vkontakte/android/audio/player/TrackInfo;
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/PlayerListener;

    .line 180
    .local v0, "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    invoke-interface {v0, v2, v3}, Lcom/vkontakte/android/audio/player/PlayerListener;->onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V

    goto :goto_0

    .line 181
    .end local v0    # "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    :cond_0
    return-void
.end method

.method synthetic lambda$new$1()V
    .locals 4

    .prologue
    .line 189
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mPlayerListeners:Ljava/util/Set;

    .line 190
    .local v1, "playerListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/player/PlayerListener;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/PlayerListener;

    .line 191
    .local v0, "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    iget-object v3, p0, Lcom/vkontakte/android/audio/AudioStateListener;->list:Ljava/util/List;

    invoke-interface {v0, v3}, Lcom/vkontakte/android/audio/player/PlayerListener;->onTrackListChanged(Ljava/util/List;)V

    goto :goto_0

    .line 192
    .end local v0    # "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    :cond_0
    return-void
.end method

.method synthetic lambda$new$2()V
    .locals 5

    .prologue
    .line 200
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mPlayerListeners:Ljava/util/Set;

    .line 201
    .local v1, "playerListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/player/PlayerListener;>;"
    iget-object v2, p0, Lcom/vkontakte/android/audio/AudioStateListener;->trackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    .line 202
    .local v2, "trackInfo":Lcom/vkontakte/android/audio/player/TrackInfo;
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/PlayerListener;

    .line 203
    .local v0, "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    invoke-interface {v0, v2}, Lcom/vkontakte/android/audio/player/PlayerListener;->onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    goto :goto_0

    .line 204
    .end local v0    # "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    :cond_0
    return-void
.end method

.method synthetic lambda$new$3()V
    .locals 5

    .prologue
    .line 212
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mPlayerListeners:Ljava/util/Set;

    .line 213
    .local v1, "playerListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/player/PlayerListener;>;"
    iget-object v2, p0, Lcom/vkontakte/android/audio/AudioStateListener;->trackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    .line 214
    .local v2, "trackInfo":Lcom/vkontakte/android/audio/player/TrackInfo;
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/PlayerListener;

    .line 215
    .local v0, "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    invoke-interface {v0, v2}, Lcom/vkontakte/android/audio/player/PlayerListener;->onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    goto :goto_0

    .line 216
    .end local v0    # "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    :cond_0
    return-void
.end method

.method synthetic lambda$new$5()V
    .locals 4

    .prologue
    .line 273
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mSavedTracksListeners:Ljava/util/Set;

    .line 274
    .local v1, "savedTracksListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;

    .line 275
    .local v0, "listener":Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;->onSavedTracksChanged()V

    goto :goto_0

    .line 276
    .end local v0    # "listener":Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    :cond_0
    return-void
.end method

.method synthetic lambda$notifyOnParametersChanged$4(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 4
    .param p1, "player"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 225
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mPlayerListeners:Ljava/util/Set;

    .line 226
    .local v1, "playerListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/player/PlayerListener;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/PlayerListener;

    .line 227
    .local v0, "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    invoke-interface {v0, p1}, Lcom/vkontakte/android/audio/player/PlayerListener;->onParametersChanged(Lcom/vkontakte/android/audio/player/Player;)V

    goto :goto_0

    .line 228
    .end local v0    # "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    :cond_0
    return-void
.end method

.method public onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 2
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 150
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v0

    if-nez v0, :cond_1

    .line 166
    :cond_0
    :goto_0
    return-void

    .line 153
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->lastBufferedMid:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getMid()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->lastBufferedPercent:I

    .line 154
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getBufferingPercent()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 157
    :cond_2
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getMid()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->lastBufferedMid:Ljava/lang/String;

    .line 158
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getBufferingPercent()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->lastBufferedPercent:I

    .line 161
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getBufferingPercent()I

    move-result v0

    const/16 v1, 0x64

    if-ne v0, v1, :cond_3

    .line 162
    invoke-static {p1}, Lcom/vkontakte/android/audio/AudioFacade;->saveTrackIfAutoSaveEnable(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 164
    :cond_3
    iput-object p1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->trackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    .line 165
    invoke-direct {p0}, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnBufferingProgress()V

    goto :goto_0
.end method

.method public onCreatePlayer(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 1
    .param p1, "player"    # Lcom/vkontakte/android/audio/player/Player;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 43
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->player:Ljava/lang/ref/WeakReference;

    .line 44
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/Player;->getState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->playerState:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 45
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/Player;->getTrackInfo()Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->trackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    .line 46
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/Player;->getTrackList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->list:Ljava/util/List;

    .line 48
    invoke-direct {p0}, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnStateChanged()V

    .line 49
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnParametersChanged(Lcom/vkontakte/android/audio/player/Player;)V

    .line 50
    invoke-direct {p0}, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnBufferingProgress()V

    .line 51
    invoke-direct {p0}, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnProgress()V

    .line 52
    invoke-direct {p0}, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnTrackListChanged()V

    .line 53
    return-void
.end method

.method public onDestroyPlayer()V
    .locals 1

    .prologue
    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->player:Ljava/lang/ref/WeakReference;

    .line 57
    return-void
.end method

.method public onDownloadFinished(Z)V
    .locals 0
    .param p1, "completed"    # Z

    .prologue
    .line 267
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnDownloadFinished(Z)V

    .line 268
    return-void
.end method

.method public onDownloadStarted()V
    .locals 0

    .prologue
    .line 262
    invoke-direct {p0}, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnDownloadStarted()V

    .line 263
    return-void
.end method

.method public onLoadSavedTracks(Lcom/vkontakte/android/audio/player/SavedTracks;)V
    .locals 1
    .param p1, "savedTracks"    # Lcom/vkontakte/android/audio/player/SavedTracks;

    .prologue
    .line 60
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->savedTracks:Ljava/lang/ref/WeakReference;

    .line 62
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/AudioStateListener;->onSavedTracksChanged()V

    .line 63
    return-void
.end method

.method public onParametersChanged(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 0
    .param p1, "player"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 170
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnParametersChanged(Lcom/vkontakte/android/audio/player/Player;)V

    .line 171
    return-void
.end method

.method public onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 0
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 144
    iput-object p1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->trackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    .line 145
    invoke-direct {p0}, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnProgress()V

    .line 146
    return-void
.end method

.method public onSavedTracksChanged()V
    .locals 0

    .prologue
    .line 252
    invoke-direct {p0}, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnSavedTracksChanged()V

    .line 253
    return-void
.end method

.method public onSavedTracksSaved()V
    .locals 0

    .prologue
    .line 257
    invoke-direct {p0}, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnSavedTracksSaved()V

    .line 258
    return-void
.end method

.method public onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 3
    .param p1, "playerState"    # Lcom/vkontakte/android/audio/player/PlayerState;
    .param p2, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 126
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v0

    .line 127
    .local v0, "prefs":Lcom/vkontakte/android/audio/player/Prefs;
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne p1, v1, :cond_0

    iget-object v1, v0, Lcom/vkontakte/android/audio/player/Prefs;->pausedBySystem:Lcom/vk/core/util/Preference$PreferenceBoolean;

    invoke-virtual {v1}, Lcom/vk/core/util/Preference$PreferenceBoolean;->get()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 128
    iget-object v1, v0, Lcom/vkontakte/android/audio/player/Prefs;->pausedBySystem:Lcom/vk/core/util/Preference$PreferenceBoolean;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/core/util/Preference$PreferenceBoolean;->set(Ljava/lang/Boolean;)V

    .line 131
    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->playerState:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 132
    iput-object p2, p0, Lcom/vkontakte/android/audio/AudioStateListener;->trackInfo:Lcom/vkontakte/android/audio/player/TrackInfo;

    .line 133
    invoke-direct {p0}, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnStateChanged()V

    .line 134
    return-void
.end method

.method public onTrackListChanged(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 138
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    iput-object p1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->list:Ljava/util/List;

    .line 139
    invoke-direct {p0}, Lcom/vkontakte/android/audio/AudioStateListener;->notifyOnTrackListChanged()V

    .line 140
    return-void
.end method

.method public onUnloadSavedTracks()V
    .locals 1

    .prologue
    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->savedTracks:Ljava/lang/ref/WeakReference;

    .line 67
    return-void
.end method

.method removePlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/vkontakte/android/audio/player/PlayerListener;

    .prologue
    .line 118
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mPlayerListeners:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 119
    .local v0, "playerListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/player/PlayerListener;>;"
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 120
    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mPlayerListeners:Ljava/util/Set;

    .line 121
    return-void
.end method

.method removeSavedTracksListener(Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;

    .prologue
    .line 245
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mSavedTracksListeners:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 246
    .local v0, "savedTracksListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;>;"
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 247
    iput-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener;->mSavedTracksListeners:Ljava/util/Set;

    .line 248
    return-void
.end method
