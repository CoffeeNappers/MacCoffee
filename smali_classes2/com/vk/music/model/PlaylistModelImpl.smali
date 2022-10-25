.class public Lcom/vk/music/model/PlaylistModelImpl;
.super Lcom/vk/music/model/ObservableModel;
.source "PlaylistModelImpl.java"

# interfaces
.implements Lcom/vk/music/model/PlaylistModel;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/music/model/ObservableModel",
        "<",
        "Lcom/vk/music/model/PlaylistModel$Callback;",
        ">;",
        "Lcom/vk/music/model/PlaylistModel;"
    }
.end annotation


# static fields
.field static final AUDIO_ITEMS_PORTION:I = 0x64


# instance fields
.field final accessKey:Ljava/lang/String;

.field attachRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field canLoadMore:Z

.field deleteRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field errorMessage:Ljava/lang/String;

.field loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field final musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

.field private final musicTrackModelCallback:Lcom/vk/music/model/MusicTrackModel$Callback;

.field musicTracks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field offset:I

.field owner:Ljava/lang/String;

.field final ownerId:I

.field final playerModel:Lcom/vk/music/model/PlayerModel;

.field playlist:Lcom/vk/music/dto/Playlist;

.field final playlistChangedSubscriber:Lcom/vk/music/event/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/event/Subscriber",
            "<",
            "Lcom/vk/music/event/PlaylistChanged;",
            ">;"
        }
    .end annotation
.end field

.field final playlistId:I

.field final playlistType:I

.field toggleRequest:Lcom/vkontakte/android/api/VKAPIRequest;


# direct methods
.method public constructor <init>(IIILcom/vk/music/dto/Playlist;Ljava/lang/String;)V
    .locals 2
    .param p1, "ownerId"    # I
    .param p2, "playlistId"    # I
    .param p3, "playlistType"    # I
    .param p4, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "accessKey"    # Ljava/lang/String;

    .prologue
    .line 86
    invoke-direct {p0}, Lcom/vk/music/model/ObservableModel;-><init>()V

    .line 64
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->canLoadMore:Z

    .line 76
    invoke-static {p0}, Lcom/vk/music/model/PlaylistModelImpl$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/PlaylistModelImpl;)Lcom/vk/music/event/Subscriber;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlistChangedSubscriber:Lcom/vk/music/event/Subscriber;

    .line 455
    new-instance v0, Lcom/vk/music/model/PlaylistModelImpl$8;

    invoke-direct {v0, p0}, Lcom/vk/music/model/PlaylistModelImpl$8;-><init>(Lcom/vk/music/model/PlaylistModelImpl;)V

    iput-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTrackModelCallback:Lcom/vk/music/model/MusicTrackModel$Callback;

    .line 87
    iput p1, p0, Lcom/vk/music/model/PlaylistModelImpl;->ownerId:I

    .line 88
    iput p2, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlistId:I

    .line 89
    iput p3, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlistType:I

    .line 90
    iput-object p4, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    .line 91
    iput-object p5, p0, Lcom/vk/music/model/PlaylistModelImpl;->accessKey:Ljava/lang/String;

    .line 93
    new-instance v0, Lcom/vk/music/model/PlayerModelImpl;

    invoke-static {p1}, Lcom/vk/music/model/PlaylistModelImpl;->getRefer(I)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/music/model/PlayerModelImpl;-><init>(Lcom/vkontakte/android/audio/player/PlayerRefer;)V

    iput-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    .line 94
    new-instance v0, Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-direct {v0}, Lcom/vk/music/model/MusicTrackModelImpl;-><init>()V

    iput-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    .line 95
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    iget-object v1, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTrackModelCallback:Lcom/vk/music/model/MusicTrackModel$Callback;

    invoke-interface {v0, v1}, Lcom/vk/music/model/MusicTrackModel;->subscribe(Lcom/vk/music/model/MusicTrackModel$Callback;)V

    .line 96
    const-class v0, Lcom/vk/music/event/PlaylistChanged;

    iget-object v1, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlistChangedSubscriber:Lcom/vk/music/event/Subscriber;

    invoke-static {v0, v1}, Lcom/vk/music/event/MusicEventBus;->subscribe(Ljava/lang/Class;Lcom/vk/music/event/Subscriber;)V

    .line 97
    return-void
.end method

.method private static getRefer(I)Lcom/vkontakte/android/audio/player/PlayerRefer;
    .locals 1
    .param p0, "ownerId"    # I

    .prologue
    .line 47
    invoke-static {p0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->audios_my:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 52
    :goto_0
    return-object v0

    .line 49
    :cond_0
    if-gez p0, :cond_1

    .line 50
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->audios_group:Lcom/vkontakte/android/audio/player/PlayerRefer;

    goto :goto_0

    .line 52
    :cond_1
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->audios_user:Lcom/vkontakte/android/audio/player/PlayerRefer;

    goto :goto_0
.end method

.method private load(ZZII)V
    .locals 7
    .param p1, "loadOwner"    # Z
    .param p2, "loadPlaylist"    # Z
    .param p3, "audioOffset"    # I
    .param p4, "audioCount"    # I

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 274
    :goto_0
    return-void

    .line 193
    :cond_0
    iget v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlistType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 194
    new-instance v0, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v1, ""

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 195
    new-instance v0, Lcom/vk/music/model/PlaylistModelImpl$1;

    invoke-direct {v0, p0, p1, p3}, Lcom/vk/music/model/PlaylistModelImpl$1;-><init>(Lcom/vk/music/model/PlaylistModelImpl;ZI)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    .line 222
    invoke-virtual {v0, v1}, Lcom/vk/music/model/PlaylistModelImpl$1;->execPool([Ljava/lang/Object;)Lcom/vkontakte/android/background/AsyncTask;

    goto :goto_0

    .line 224
    :cond_1
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    iget v1, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlistId:I

    iget v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->ownerId:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;-><init>(II)V

    .line 225
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->needOwner(Z)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    move-result-object v0

    .line 226
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->needPlaylist(Z)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    move-result-object v0

    .line 227
    invoke-virtual {v0, p3}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->audioOffset(I)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    move-result-object v0

    .line 228
    invoke-virtual {v0, p4}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->audioCount(I)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/model/PlaylistModelImpl;->accessKey:Ljava/lang/String;

    .line 229
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->accessKey(Ljava/lang/String;)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    move-result-object v0

    .line 230
    invoke-virtual {v0}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->build()Lcom/vkontakte/android/api/audio/AudioGetPlaylist;

    move-result-object v6

    new-instance v0, Lcom/vk/music/model/PlaylistModelImpl$2;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/vk/music/model/PlaylistModelImpl$2;-><init>(Lcom/vk/music/model/PlaylistModelImpl;ZZII)V

    .line 231
    invoke-virtual {v6, v0}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 272
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method


# virtual methods
.method public attachMusic(Ljava/util/List;)V
    .locals 4
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
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
    .line 379
    .local p1, "tracksToAttach":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->attachRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v2, :cond_0

    .line 429
    :goto_0
    return-void

    .line 383
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;-><init>()V

    .line 384
    .local v0, "builder":Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/MusicTrack;

    .line 385
    .local v1, "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;->addAudio(Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;

    goto :goto_1

    .line 387
    .end local v1    # "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_1
    iget v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->ownerId:I

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;->ownerId(I)Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;

    .line 388
    iget v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlistId:I

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;->playlistId(I)Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;

    .line 389
    invoke-virtual {v0}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;->build()Lcom/vkontakte/android/api/audio/AudioAddToPlaylist;

    move-result-object v2

    new-instance v3, Lcom/vk/music/model/PlaylistModelImpl$7;

    invoke-direct {v3, p0, p1}, Lcom/vk/music/model/PlaylistModelImpl$7;-><init>(Lcom/vk/music/model/PlaylistModelImpl;Ljava/util/List;)V

    .line 390
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 428
    invoke-virtual {v2, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->attachRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method public canLoadMore()Z
    .locals 1

    .prologue
    .line 170
    iget-boolean v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->canLoadMore:Z

    return v0
.end method

.method public canShare()Z
    .locals 2

    .prologue
    .line 328
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    iget v0, v0, Lcom/vk/music/dto/Playlist;->type:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public clearCallbacks()V
    .locals 3

    .prologue
    .line 451
    invoke-super {p0}, Lcom/vk/music/model/ObservableModel;->clearCallbacks()V

    .line 452
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vk/music/model/ActiveModel;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vk/music/model/ModelHelper;->clearCallbacksAll([Lcom/vk/music/model/ActiveModel;)V

    .line 453
    return-void
.end method

.method public delete()V
    .locals 3

    .prologue
    .line 352
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->deleteRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 375
    :goto_0
    return-void

    .line 356
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    iget v0, v0, Lcom/vk/music/dto/Playlist;->type:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 357
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    invoke-static {v0}, Lcom/vkontakte/android/audio/AudioFacade;->removeSavedTrack([Ljava/lang/String;)V

    .line 358
    invoke-static {p0}, Lcom/vk/music/model/PlaylistModelImpl$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/PlaylistModelImpl;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/music/model/PlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0

    .line 360
    :cond_1
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioDeletePlaylist;

    iget v1, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlistId:I

    iget v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->ownerId:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/audio/AudioDeletePlaylist;-><init>(II)V

    new-instance v1, Lcom/vk/music/model/PlaylistModelImpl$6;

    invoke-direct {v1, p0}, Lcom/vk/music/model/PlaylistModelImpl$6;-><init>(Lcom/vk/music/model/PlaylistModelImpl;)V

    .line 361
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioDeletePlaylist;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 373
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->deleteRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method public getError()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 446
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->errorMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 440
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    return-object v0
.end method

.method public getMusicTracks()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 160
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getOffset()I
    .locals 1

    .prologue
    .line 165
    iget v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->offset:I

    return v0
.end method

.method public getOwner()Ljava/lang/String;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->owner:Ljava/lang/String;

    return-object v0
.end method

.method public getOwnerId()I
    .locals 1

    .prologue
    .line 134
    iget v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->ownerId:I

    return v0
.end method

.method public getPlayerModel()Lcom/vk/music/model/PlayerModel;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 434
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    return-object v0
.end method

.method public getPlaylist()Lcom/vk/music/dto/Playlist;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 150
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    return-object v0
.end method

.method public isCurrentUser()Z
    .locals 1

    .prologue
    .line 139
    iget v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->ownerId:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    return v0
.end method

.method public isFollowed()Z
    .locals 1

    .prologue
    .line 323
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    iget-object v0, v0, Lcom/vk/music/dto/Playlist;->followed:Lcom/vk/music/dto/PlaylistLink;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLoaded()Z
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$delete$2(Lcom/vk/music/model/PlaylistModel$Callback;)V
    .locals 0
    .param p1, "callback"    # Lcom/vk/music/model/PlaylistModel$Callback;

    .prologue
    .line 358
    invoke-interface {p1, p0}, Lcom/vk/music/model/PlaylistModel$Callback;->onDeletionDone(Lcom/vk/music/model/PlaylistModel;)V

    return-void
.end method

.method synthetic lambda$new$1(Lcom/vk/music/event/PlaylistChanged;)V
    .locals 4
    .param p1, "event"    # Lcom/vk/music/event/PlaylistChanged;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v0}, Lcom/vk/music/dto/Playlist;->getPid()J

    move-result-wide v0

    iget-object v2, p1, Lcom/vk/music/event/PlaylistChanged;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v2}, Lcom/vk/music/dto/Playlist;->getPid()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 84
    :goto_0
    return-void

    .line 81
    :cond_0
    iget-object v0, p1, Lcom/vk/music/event/PlaylistChanged;->playlist:Lcom/vk/music/dto/Playlist;

    iput-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    .line 83
    invoke-static {p0}, Lcom/vk/music/model/PlaylistModelImpl$$Lambda$3;->lambdaFactory$(Lcom/vk/music/model/PlaylistModelImpl;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/music/model/PlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0
.end method

.method synthetic lambda$null$0(Lcom/vk/music/model/PlaylistModel$Callback;)V
    .locals 0
    .param p1, "callback"    # Lcom/vk/music/model/PlaylistModel$Callback;

    .prologue
    .line 83
    invoke-interface {p1, p0}, Lcom/vk/music/model/PlaylistModel$Callback;->onPlaylistChanged(Lcom/vk/music/model/PlaylistModel;)V

    return-void
.end method

.method public load()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 180
    const/4 v1, 0x0

    iget v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->offset:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->offset:I

    :goto_0
    invoke-direct {p0, v2, v2, v1, v0}, Lcom/vk/music/model/PlaylistModelImpl;->load(ZZII)V

    .line 181
    return-void

    .line 180
    :cond_0
    const/16 v0, 0x64

    goto :goto_0
.end method

.method public loadAndPlayShuffleAll(Landroid/content/Context;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 333
    invoke-virtual {p0}, Lcom/vk/music/model/PlaylistModelImpl;->canLoadMore()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 334
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 335
    .local v0, "shuffleTracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-static {v0}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 336
    invoke-virtual {p0}, Lcom/vk/music/model/PlaylistModelImpl;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2, v0}, Lcom/vk/music/model/PlayerModel;->togglePlayer(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/List;)V

    .line 348
    .end local v0    # "shuffleTracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :goto_0
    return-void

    .line 338
    :cond_0
    new-instance v1, Lcom/vkontakte/android/api/audio/AudioGet;

    iget v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->ownerId:I

    invoke-direct {v1, v2}, Lcom/vkontakte/android/api/audio/AudioGet;-><init>(I)V

    iget v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlistId:I

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/audio/AudioGet;->playlistId(I)Lcom/vkontakte/android/api/audio/AudioGet;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/audio/AudioGet;->offset(I)Lcom/vkontakte/android/api/audio/AudioGet;

    move-result-object v1

    const/16 v2, 0xc8

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/audio/AudioGet;->count(I)Lcom/vkontakte/android/api/audio/AudioGet;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->accessKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/audio/AudioGet;->accessKey(Ljava/lang/String;)Lcom/vkontakte/android/api/audio/AudioGet;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/audio/AudioGet;->shuffle()Lcom/vkontakte/android/api/audio/AudioGet;

    move-result-object v1

    new-instance v2, Lcom/vk/music/model/PlaylistModelImpl$5;

    invoke-direct {v2, p0}, Lcom/vk/music/model/PlaylistModelImpl$5;-><init>(Lcom/vk/music/model/PlaylistModelImpl;)V

    .line 339
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/audio/AudioGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 346
    invoke-virtual {v1, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method public loadMore()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 185
    iget v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->offset:I

    const/16 v1, 0x64

    invoke-direct {p0, v2, v2, v0, v1}, Lcom/vk/music/model/PlaylistModelImpl;->load(ZZII)V

    .line 186
    return-void
.end method

.method public release()V
    .locals 3

    .prologue
    .line 124
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    iget-object v1, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTrackModelCallback:Lcom/vk/music/model/MusicTrackModel$Callback;

    invoke-interface {v0, v1}, Lcom/vk/music/model/MusicTrackModel;->unsubscribe(Lcom/vk/music/model/MusicTrackModel$Callback;)V

    .line 125
    const-class v0, Lcom/vk/music/event/PlaylistChanged;

    iget-object v1, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlistChangedSubscriber:Lcom/vk/music/event/Subscriber;

    invoke-static {v0, v1}, Lcom/vk/music/event/MusicEventBus;->unsubscribe(Ljava/lang/Class;Lcom/vk/music/event/Subscriber;)V

    .line 126
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 127
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 129
    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vk/music/model/ActiveModel;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vk/music/model/ModelHelper;->releaseAll([Lcom/vk/music/model/ActiveModel;)V

    .line 130
    return-void
.end method

.method public restore(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "state"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 114
    const-string/jumbo v0, "offset"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->offset:I

    .line 115
    const-string/jumbo v0, "canLoadMore"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->canLoadMore:Z

    .line 116
    const-string/jumbo v0, "owner"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->owner:Ljava/lang/String;

    .line 117
    const-string/jumbo v0, "playlist"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Playlist;

    iput-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    .line 118
    const-string/jumbo v0, "music"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    .line 119
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vk/music/model/ActiveModel;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    aput-object v2, v0, v1

    invoke-static {p1, v0}, Lcom/vk/music/model/ModelHelper;->restoreAll(Landroid/os/Bundle;[Lcom/vk/music/model/ActiveModel;)V

    .line 120
    return-void
.end method

.method public save()Landroid/os/Bundle;
    .locals 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 102
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 103
    .local v0, "state":Landroid/os/Bundle;
    const-string/jumbo v1, "offset"

    iget v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->offset:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 104
    const-string/jumbo v1, "canLoadMore"

    iget-boolean v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->canLoadMore:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 105
    const-string/jumbo v1, "owner"

    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->owner:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    const-string/jumbo v1, "playlist"

    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 107
    const-string/jumbo v1, "music"

    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 108
    const/4 v1, 0x2

    new-array v1, v1, [Lcom/vk/music/model/ActiveModel;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vk/music/model/PlaylistModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/vk/music/model/PlaylistModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/vk/music/model/ModelHelper;->saveAll(Landroid/os/Bundle;[Lcom/vk/music/model/ActiveModel;)V

    .line 109
    return-object v0
.end method

.method public setPlaylist(Lcom/vk/music/dto/Playlist;)V
    .locals 0
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 154
    iput-object p1, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    .line 155
    return-void
.end method

.method public bridge synthetic subscribe(Lcom/vk/music/model/PlaylistModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/PlaylistModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 42
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->subscribe(Ljava/lang/Object;)V

    return-void
.end method

.method public toggleFollowing()V
    .locals 4

    .prologue
    .line 278
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->toggleRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 319
    :goto_0
    return-void

    .line 282
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    iget-object v0, v0, Lcom/vk/music/dto/Playlist;->followed:Lcom/vk/music/dto/PlaylistLink;

    if-nez v0, :cond_1

    .line 283
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioFollowPlaylist;

    iget v1, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlistId:I

    iget v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->ownerId:I

    iget-object v3, p0, Lcom/vk/music/model/PlaylistModelImpl;->accessKey:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/audio/AudioFollowPlaylist;-><init>(IILjava/lang/String;)V

    new-instance v1, Lcom/vk/music/model/PlaylistModelImpl$3;

    invoke-direct {v1, p0}, Lcom/vk/music/model/PlaylistModelImpl$3;-><init>(Lcom/vk/music/model/PlaylistModelImpl;)V

    .line 284
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioFollowPlaylist;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 299
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->toggleRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 301
    :cond_1
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioDeletePlaylist;

    iget-object v1, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    iget-object v1, v1, Lcom/vk/music/dto/Playlist;->followed:Lcom/vk/music/dto/PlaylistLink;

    iget v1, v1, Lcom/vk/music/dto/PlaylistLink;->id:I

    iget-object v2, p0, Lcom/vk/music/model/PlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    iget-object v2, v2, Lcom/vk/music/dto/Playlist;->followed:Lcom/vk/music/dto/PlaylistLink;

    iget v2, v2, Lcom/vk/music/dto/PlaylistLink;->ownerId:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/audio/AudioDeletePlaylist;-><init>(II)V

    new-instance v1, Lcom/vk/music/model/PlaylistModelImpl$4;

    invoke-direct {v1, p0}, Lcom/vk/music/model/PlaylistModelImpl$4;-><init>(Lcom/vk/music/model/PlaylistModelImpl;)V

    .line 302
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioDeletePlaylist;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 317
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/PlaylistModelImpl;->toggleRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method public bridge synthetic unsubscribe(Lcom/vk/music/model/PlaylistModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/PlaylistModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 42
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->unsubscribe(Ljava/lang/Object;)V

    return-void
.end method
