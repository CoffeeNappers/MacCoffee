.class public final Lcom/vk/music/model/PlayerModelImpl;
.super Lcom/vk/music/model/ObservableModel;
.source "PlayerModelImpl.java"

# interfaces
.implements Lcom/vk/music/model/PlayerModel;
.implements Lcom/vkontakte/android/audio/player/PlayerListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/music/model/ObservableModel",
        "<",
        "Lcom/vk/music/model/PlayerModel$Callback;",
        ">;",
        "Lcom/vk/music/model/PlayerModel;",
        "Lcom/vkontakte/android/audio/player/PlayerListener;"
    }
.end annotation


# instance fields
.field playerPlaying:Z

.field playingTrack:Lcom/vkontakte/android/audio/MusicTrack;

.field final refer:Lcom/vkontakte/android/audio/player/PlayerRefer;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/audio/player/PlayerRefer;)V
    .locals 1
    .param p1, "refer"    # Lcom/vkontakte/android/audio/player/PlayerRefer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/vk/music/model/ObservableModel;-><init>()V

    .line 36
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/PlayerState;->isPlayState()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/model/PlayerModelImpl;->playerPlaying:Z

    .line 39
    iput-object p1, p0, Lcom/vk/music/model/PlayerModelImpl;->refer:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 40
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/AudioFacade;->addPlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;Z)V

    .line 41
    return-void
.end method


# virtual methods
.method public addToPlayNext(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 99
    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/vkontakte/android/audio/AudioFacade;->addToPlayNext(Landroid/content/Context;Ljava/util/Collection;)V

    .line 100
    const v0, 0x7f080403

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 101
    return-void
.end method

.method public getPlayingTrack()Lcom/vkontakte/android/audio/MusicTrack;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lcom/vk/music/model/PlayerModelImpl;->playingTrack:Lcom/vkontakte/android/audio/MusicTrack;

    return-object v0
.end method

.method public isPlayerPlaying()Z
    .locals 1

    .prologue
    .line 94
    iget-boolean v0, p0, Lcom/vk/music/model/PlayerModelImpl;->playerPlaying:Z

    return v0
.end method

.method synthetic lambda$onStateChanged$0(Lcom/vk/music/model/PlayerModel$Callback;)V
    .locals 0
    .param p1, "callback"    # Lcom/vk/music/model/PlayerModel$Callback;

    .prologue
    .line 126
    invoke-interface {p1, p0}, Lcom/vk/music/model/PlayerModel$Callback;->onPlayingStopped(Lcom/vk/music/model/PlayerModel;)V

    return-void
.end method

.method synthetic lambda$onStateChanged$1(Lcom/vk/music/model/PlayerModel$Callback;)V
    .locals 0
    .param p1, "callback"    # Lcom/vk/music/model/PlayerModel$Callback;

    .prologue
    .line 133
    invoke-interface {p1, p0}, Lcom/vk/music/model/PlayerModel$Callback;->onPlayingResumed(Lcom/vk/music/model/PlayerModel;)V

    return-void
.end method

.method synthetic lambda$onStateChanged$2(Lcom/vk/music/model/PlayerModel$Callback;)V
    .locals 0
    .param p1, "callback"    # Lcom/vk/music/model/PlayerModel$Callback;

    .prologue
    .line 139
    invoke-interface {p1, p0}, Lcom/vk/music/model/PlayerModel$Callback;->onPlayingPaused(Lcom/vk/music/model/PlayerModel;)V

    return-void
.end method

.method public loadAndPlayTheSame(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 105
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetRecommendations;

    const/16 v1, 0x64

    invoke-virtual {p2}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/audio/AudioGetRecommendations;-><init>(ILjava/lang/String;)V

    new-instance v1, Lcom/vk/music/model/PlayerModelImpl$1;

    invoke-direct {v1, p0}, Lcom/vk/music/model/PlayerModelImpl$1;-><init>(Lcom/vk/music/model/PlayerModelImpl;)V

    .line 106
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetRecommendations;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 116
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 117
    return-void
.end method

.method public onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 0
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 162
    return-void
.end method

.method public onParametersChanged(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 0
    .param p1, "player"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 167
    return-void
.end method

.method public onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 0
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 157
    return-void
.end method

.method public onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 5
    .param p1, "state"    # Lcom/vkontakte/android/audio/player/PlayerState;
    .param p2, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    const/4 v4, 0x0

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 121
    sget-object v2, Lcom/vk/music/model/PlayerModelImpl$2;->$SwitchMap$com$vkontakte$android$audio$player$PlayerState:[I

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/PlayerState;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 147
    :cond_0
    :goto_0
    return-void

    .line 123
    :pswitch_0
    iget-object v2, p0, Lcom/vk/music/model/PlayerModelImpl;->playingTrack:Lcom/vkontakte/android/audio/MusicTrack;

    if-eqz v2, :cond_1

    .line 124
    .local v0, "notifyStop":Z
    :goto_1
    iput-object v4, p0, Lcom/vk/music/model/PlayerModelImpl;->playingTrack:Lcom/vkontakte/android/audio/MusicTrack;

    .line 125
    if-eqz v0, :cond_0

    .line 126
    invoke-static {p0}, Lcom/vk/music/model/PlayerModelImpl$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/PlayerModelImpl;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vk/music/model/PlayerModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0

    .end local v0    # "notifyStop":Z
    :cond_1
    move v0, v1

    .line 123
    goto :goto_1

    .line 131
    :pswitch_1
    iput-boolean v0, p0, Lcom/vk/music/model/PlayerModelImpl;->playerPlaying:Z

    .line 132
    invoke-virtual {p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/model/PlayerModelImpl;->playingTrack:Lcom/vkontakte/android/audio/MusicTrack;

    .line 133
    invoke-static {p0}, Lcom/vk/music/model/PlayerModelImpl$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/PlayerModelImpl;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vk/music/model/PlayerModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0

    .line 137
    :pswitch_2
    iput-boolean v1, p0, Lcom/vk/music/model/PlayerModelImpl;->playerPlaying:Z

    .line 138
    invoke-virtual {p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/model/PlayerModelImpl;->playingTrack:Lcom/vkontakte/android/audio/MusicTrack;

    .line 139
    invoke-static {p0}, Lcom/vk/music/model/PlayerModelImpl$$Lambda$3;->lambdaFactory$(Lcom/vk/music/model/PlayerModelImpl;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vk/music/model/PlayerModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0

    .line 143
    :pswitch_3
    iput-object v4, p0, Lcom/vk/music/model/PlayerModelImpl;->playingTrack:Lcom/vkontakte/android/audio/MusicTrack;

    goto :goto_0

    .line 121
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
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
    .line 152
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    return-void
.end method

.method public release()V
    .locals 0

    .prologue
    .line 58
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->removePlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;)V

    .line 59
    return-void
.end method

.method public restore(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 45
    const-string/jumbo v0, "playingTrack"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    iput-object v0, p0, Lcom/vk/music/model/PlayerModelImpl;->playingTrack:Lcom/vkontakte/android/audio/MusicTrack;

    .line 46
    return-void
.end method

.method public save()Landroid/os/Bundle;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 51
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 52
    .local v0, "state":Landroid/os/Bundle;
    const-string/jumbo v1, "playingTrack"

    iget-object v2, p0, Lcom/vk/music/model/PlayerModelImpl;->playingTrack:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 53
    return-object v0
.end method

.method public bridge synthetic subscribe(Lcom/vk/music/model/PlayerModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/PlayerModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 31
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->subscribe(Ljava/lang/Object;)V

    return-void
.end method

.method public togglePlayer(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/List;)V
    .locals 1
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 69
    .local p2, "tracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vk/music/model/PlayerModelImpl;->refer:Lcom/vkontakte/android/audio/player/PlayerRefer;

    invoke-virtual {p0, p1, p2, v0}, Lcom/vk/music/model/PlayerModelImpl;->togglePlayer(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/List;Lcom/vkontakte/android/audio/player/PlayerRefer;)V

    .line 70
    return-void
.end method

.method public togglePlayer(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/List;Lcom/vkontakte/android/audio/player/PlayerRefer;)V
    .locals 3
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "refer"    # Lcom/vkontakte/android/audio/player/PlayerRefer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;",
            "Lcom/vkontakte/android/audio/player/PlayerRefer;",
            ")V"
        }
    .end annotation

    .prologue
    .local p2, "tracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v2, 0x0

    .line 74
    if-eqz p1, :cond_2

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/audio/MusicTrack;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 75
    iget-boolean v1, p0, Lcom/vk/music/model/PlayerModelImpl;->playerPlaying:Z

    if-eqz v1, :cond_1

    .line 76
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->pause()V

    .line 90
    :cond_0
    :goto_0
    return-void

    .line 78
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->resume()V

    goto :goto_0

    .line 81
    :cond_2
    if-nez p2, :cond_3

    const/4 v0, -0x1

    .line 82
    .local v0, "index":I
    :goto_1
    if-ltz v0, :cond_4

    .line 83
    invoke-static {p2, v0, p3, v2}, Lcom/vkontakte/android/audio/AudioFacade;->playTracks(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;Z)V

    goto :goto_0

    .line 81
    .end local v0    # "index":I
    :cond_3
    invoke-interface {p2, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    goto :goto_1

    .line 84
    .restart local v0    # "index":I
    :cond_4
    if-eqz p1, :cond_5

    .line 85
    invoke-static {p1, p3, v2}, Lcom/vkontakte/android/audio/AudioFacade;->playTrack(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vkontakte/android/audio/player/PlayerRefer;Z)V

    goto :goto_0

    .line 86
    :cond_5
    if-eqz p2, :cond_0

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 87
    invoke-static {p2, v2, p3, v2}, Lcom/vkontakte/android/audio/AudioFacade;->playTracks(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;Z)V

    goto :goto_0
.end method

.method public bridge synthetic unsubscribe(Lcom/vk/music/model/PlayerModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/PlayerModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 31
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->unsubscribe(Ljava/lang/Object;)V

    return-void
.end method
