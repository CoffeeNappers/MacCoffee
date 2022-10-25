.class public final Lcom/vk/music/model/MusicModelImpl;
.super Lcom/vk/music/model/ObservableModel;
.source "MusicModelImpl.java"

# interfaces
.implements Lcom/vk/music/model/MusicModel;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/music/model/ObservableModel",
        "<",
        "Lcom/vk/music/model/MusicModel$Callback;",
        ">;",
        "Lcom/vk/music/model/MusicModel;"
    }
.end annotation


# static fields
.field private static final AUDIO_ITEMS_PORTION:I = 0x64

.field private static final PLAYLISTS_PORTION:I = 0xc


# instance fields
.field private canLoadMore:Z

.field private errorMessage:Ljava/lang/String;

.field private loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field private final musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

.field private musicTracks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field private offset:I

.field private final ownerId:I

.field private ownerImage:Ljava/lang/String;

.field private ownerName:Ljava/lang/String;

.field private final playerModel:Lcom/vk/music/model/PlayerModel;

.field private final playlistChangedSubscriber:Lcom/vk/music/event/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/event/Subscriber",
            "<",
            "Lcom/vk/music/event/PlaylistChanged;",
            ">;"
        }
    .end annotation
.end field

.field private final playlistCreatedSubscriber:Lcom/vk/music/event/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/event/Subscriber",
            "<",
            "Lcom/vk/music/event/PlaylistCreated;",
            ">;"
        }
    .end annotation
.end field

.field private final playlistRemovedSubscriber:Lcom/vk/music/event/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/event/Subscriber",
            "<",
            "Lcom/vk/music/event/PlaylistRemoved;",
            ">;"
        }
    .end annotation
.end field

.field private playlists:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation
.end field

.field private targetTrack:Lcom/vkontakte/android/audio/MusicTrack;


# direct methods
.method constructor <init>(I)V
    .locals 2
    .param p1, "ownerId"    # I

    .prologue
    .line 100
    invoke-direct {p0}, Lcom/vk/music/model/ObservableModel;-><init>()V

    .line 53
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/music/model/MusicModelImpl;->canLoadMore:Z

    .line 63
    invoke-static {p0}, Lcom/vk/music/model/MusicModelImpl$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/MusicModelImpl;)Lcom/vk/music/event/Subscriber;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->playlistChangedSubscriber:Lcom/vk/music/event/Subscriber;

    .line 75
    invoke-static {p0}, Lcom/vk/music/model/MusicModelImpl$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/MusicModelImpl;)Lcom/vk/music/event/Subscriber;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->playlistCreatedSubscriber:Lcom/vk/music/event/Subscriber;

    .line 84
    invoke-static {p0}, Lcom/vk/music/model/MusicModelImpl$$Lambda$3;->lambdaFactory$(Lcom/vk/music/model/MusicModelImpl;)Lcom/vk/music/event/Subscriber;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->playlistRemovedSubscriber:Lcom/vk/music/event/Subscriber;

    .line 101
    iput p1, p0, Lcom/vk/music/model/MusicModelImpl;->ownerId:I

    .line 102
    new-instance v0, Lcom/vk/music/model/PlayerModelImpl;

    invoke-static {p1}, Lcom/vk/music/model/MusicModelImpl;->getRefer(I)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/music/model/PlayerModelImpl;-><init>(Lcom/vkontakte/android/audio/player/PlayerRefer;)V

    iput-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    .line 103
    new-instance v0, Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-direct {v0}, Lcom/vk/music/model/MusicTrackModelImpl;-><init>()V

    iput-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    .line 104
    const-class v0, Lcom/vk/music/event/PlaylistChanged;

    iget-object v1, p0, Lcom/vk/music/model/MusicModelImpl;->playlistChangedSubscriber:Lcom/vk/music/event/Subscriber;

    invoke-static {v0, v1}, Lcom/vk/music/event/MusicEventBus;->subscribe(Ljava/lang/Class;Lcom/vk/music/event/Subscriber;)V

    .line 105
    const-class v0, Lcom/vk/music/event/PlaylistCreated;

    iget-object v1, p0, Lcom/vk/music/model/MusicModelImpl;->playlistCreatedSubscriber:Lcom/vk/music/event/Subscriber;

    invoke-static {v0, v1}, Lcom/vk/music/event/MusicEventBus;->subscribe(Ljava/lang/Class;Lcom/vk/music/event/Subscriber;)V

    .line 106
    const-class v0, Lcom/vk/music/event/PlaylistRemoved;

    iget-object v1, p0, Lcom/vk/music/model/MusicModelImpl;->playlistRemovedSubscriber:Lcom/vk/music/event/Subscriber;

    invoke-static {v0, v1}, Lcom/vk/music/event/MusicEventBus;->subscribe(Ljava/lang/Class;Lcom/vk/music/event/Subscriber;)V

    .line 107
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "ownerId"    # I
    .param p2, "ownerName"    # Ljava/lang/String;
    .param p3, "ownerImage"    # Ljava/lang/String;

    .prologue
    .line 95
    invoke-direct {p0, p1}, Lcom/vk/music/model/MusicModelImpl;-><init>(I)V

    .line 96
    iput-object p2, p0, Lcom/vk/music/model/MusicModelImpl;->ownerName:Ljava/lang/String;

    .line 97
    iput-object p3, p0, Lcom/vk/music/model/MusicModelImpl;->ownerImage:Ljava/lang/String;

    .line 98
    return-void
.end method

.method static synthetic access$002(Lcom/vk/music/model/MusicModelImpl;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/MusicModelImpl;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/vk/music/model/MusicModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method static synthetic access$102(Lcom/vk/music/model/MusicModelImpl;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/MusicModelImpl;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/vk/music/model/MusicModelImpl;->ownerName:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$202(Lcom/vk/music/model/MusicModelImpl;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/MusicModelImpl;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/vk/music/model/MusicModelImpl;->ownerImage:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$302(Lcom/vk/music/model/MusicModelImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/MusicModelImpl;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/vk/music/model/MusicModelImpl;->playlists:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$400(Lcom/vk/music/model/MusicModelImpl;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/MusicModelImpl;

    .prologue
    .line 31
    iget-boolean v0, p0, Lcom/vk/music/model/MusicModelImpl;->canLoadMore:Z

    return v0
.end method

.method static synthetic access$402(Lcom/vk/music/model/MusicModelImpl;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/MusicModelImpl;
    .param p1, "x1"    # Z

    .prologue
    .line 31
    iput-boolean p1, p0, Lcom/vk/music/model/MusicModelImpl;->canLoadMore:Z

    return p1
.end method

.method static synthetic access$502(Lcom/vk/music/model/MusicModelImpl;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/MusicModelImpl;
    .param p1, "x1"    # I

    .prologue
    .line 31
    iput p1, p0, Lcom/vk/music/model/MusicModelImpl;->offset:I

    return p1
.end method

.method static synthetic access$600(Lcom/vk/music/model/MusicModelImpl;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/MusicModelImpl;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->musicTracks:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$602(Lcom/vk/music/model/MusicModelImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/MusicModelImpl;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/vk/music/model/MusicModelImpl;->musicTracks:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$702(Lcom/vk/music/model/MusicModelImpl;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/MusicModelImpl;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/vk/music/model/MusicModelImpl;->errorMessage:Ljava/lang/String;

    return-object p1
.end method

.method private static getRefer(I)Lcom/vkontakte/android/audio/player/PlayerRefer;
    .locals 1
    .param p0, "ownerId"    # I

    .prologue
    .line 37
    invoke-static {p0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 38
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->audios_my:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 42
    :goto_0
    return-object v0

    .line 39
    :cond_0
    if-gez p0, :cond_1

    .line 40
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->audios_group:Lcom/vkontakte/android/audio/player/PlayerRefer;

    goto :goto_0

    .line 42
    :cond_1
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->audios_user:Lcom/vkontakte/android/audio/player/PlayerRefer;

    goto :goto_0
.end method

.method private load(ZZII)V
    .locals 7
    .param p1, "loadOwner"    # Z
    .param p2, "loadPlaylists"    # Z
    .param p3, "audioOffset"    # I
    .param p4, "audioCount"    # I

    .prologue
    .line 215
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 279
    :goto_0
    return-void

    .line 219
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;

    iget v1, p0, Lcom/vk/music/model/MusicModelImpl;->ownerId:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;-><init>(I)V

    .line 220
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->needOwner(Z)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;

    move-result-object v0

    .line 221
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->needPlaylists(Z)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;

    move-result-object v0

    const/16 v1, 0xc

    .line 222
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->playlistsCount(I)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;

    move-result-object v0

    .line 223
    invoke-virtual {v0, p3}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->audioOffset(I)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;

    move-result-object v0

    .line 224
    invoke-virtual {v0, p4}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->audioCount(I)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;

    move-result-object v0

    .line 225
    invoke-virtual {p0}, Lcom/vk/music/model/MusicModelImpl;->isCurrentUser()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->loadSaved(Z)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;

    move-result-object v0

    .line 226
    invoke-virtual {v0}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->build()Lcom/vkontakte/android/api/audio/AudioGetMusicPage;

    move-result-object v6

    new-instance v0, Lcom/vk/music/model/MusicModelImpl$1;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/vk/music/model/MusicModelImpl$1;-><init>(Lcom/vk/music/model/MusicModelImpl;ZZII)V

    .line 227
    invoke-virtual {v6, v0}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 278
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method


# virtual methods
.method public canLoadMoreAudio()Z
    .locals 1

    .prologue
    .line 196
    iget-boolean v0, p0, Lcom/vk/music/model/MusicModelImpl;->canLoadMore:Z

    return v0
.end method

.method public clearCallbacks()V
    .locals 3

    .prologue
    .line 320
    invoke-super {p0}, Lcom/vk/music/model/ObservableModel;->clearCallbacks()V

    .line 321
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vk/music/model/ActiveModel;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vk/music/model/ModelHelper;->clearCallbacksAll([Lcom/vk/music/model/ActiveModel;)V

    .line 322
    return-void
.end method

.method public getError()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 315
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->errorMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getIcon()Ljava/lang/String;
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->ownerImage:Ljava/lang/String;

    return-object v0
.end method

.method public getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 309
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

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
    .line 185
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->musicTracks:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getOriginalPlaylist(Lcom/vk/music/dto/Playlist;)Lcom/vk/music/dto/Playlist;
    .locals 1
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 191
    invoke-virtual {p1}, Lcom/vk/music/dto/Playlist;->getOriginalPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v0

    return-object v0
.end method

.method public getOwnerId()I
    .locals 1

    .prologue
    .line 148
    iget v0, p0, Lcom/vk/music/model/MusicModelImpl;->ownerId:I

    return v0
.end method

.method public getPlayerModel()Lcom/vk/music/model/PlayerModel;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 284
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    return-object v0
.end method

.method public getPlaylists()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation

    .prologue
    .line 175
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->playlists:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 176
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 179
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->playlists:Ljava/util/ArrayList;

    goto :goto_0
.end method

.method public getTitle(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 159
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->ownerName:Ljava/lang/String;

    return-object v0
.end method

.method public hasIcon()Z
    .locals 1

    .prologue
    .line 164
    const/4 v0, 0x1

    return v0
.end method

.method public isCurrentUser()Z
    .locals 1

    .prologue
    .line 201
    iget v0, p0, Lcom/vk/music/model/MusicModelImpl;->ownerId:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    return v0
.end method

.method public isNeedLoadTitle()Z
    .locals 1

    .prologue
    .line 153
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->ownerName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->ownerImage:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$new$1(Lcom/vk/music/event/PlaylistChanged;)V
    .locals 3
    .param p1, "event"    # Lcom/vk/music/event/PlaylistChanged;

    .prologue
    .line 64
    invoke-virtual {p0}, Lcom/vk/music/model/MusicModelImpl;->getOwnerId()I

    move-result v1

    iget-object v2, p1, Lcom/vk/music/event/PlaylistChanged;->playlist:Lcom/vk/music/dto/Playlist;

    iget v2, v2, Lcom/vk/music/dto/Playlist;->ownerId:I

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/vk/music/model/MusicModelImpl;->playlists:Ljava/util/ArrayList;

    if-nez v1, :cond_1

    .line 73
    :cond_0
    :goto_0
    return-void

    .line 68
    :cond_1
    iget-object v1, p0, Lcom/vk/music/model/MusicModelImpl;->playlists:Ljava/util/ArrayList;

    iget-object v2, p1, Lcom/vk/music/event/PlaylistChanged;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 69
    .local v0, "index":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 70
    iget-object v1, p0, Lcom/vk/music/model/MusicModelImpl;->playlists:Ljava/util/ArrayList;

    iget-object v2, p1, Lcom/vk/music/event/PlaylistChanged;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v1, v0, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 71
    invoke-static {p0, p1}, Lcom/vk/music/model/MusicModelImpl$$Lambda$6;->lambdaFactory$(Lcom/vk/music/model/MusicModelImpl;Lcom/vk/music/event/PlaylistChanged;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vk/music/model/MusicModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0
.end method

.method synthetic lambda$new$3(Lcom/vk/music/event/PlaylistCreated;)V
    .locals 3
    .param p1, "event"    # Lcom/vk/music/event/PlaylistCreated;

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/vk/music/model/MusicModelImpl;->getOwnerId()I

    move-result v0

    iget-object v1, p1, Lcom/vk/music/event/PlaylistCreated;->playlist:Lcom/vk/music/dto/Playlist;

    iget v1, v1, Lcom/vk/music/dto/Playlist;->ownerId:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->playlists:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 82
    :cond_0
    :goto_0
    return-void

    .line 80
    :cond_1
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->playlists:Ljava/util/ArrayList;

    const/4 v1, 0x0

    iget-object v2, p1, Lcom/vk/music/event/PlaylistCreated;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 81
    invoke-static {p0, p1}, Lcom/vk/music/model/MusicModelImpl$$Lambda$5;->lambdaFactory$(Lcom/vk/music/model/MusicModelImpl;Lcom/vk/music/event/PlaylistCreated;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/music/model/MusicModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0
.end method

.method synthetic lambda$new$5(Lcom/vk/music/event/PlaylistRemoved;)V
    .locals 2
    .param p1, "event"    # Lcom/vk/music/event/PlaylistRemoved;

    .prologue
    .line 85
    invoke-virtual {p0}, Lcom/vk/music/model/MusicModelImpl;->getOwnerId()I

    move-result v0

    iget-object v1, p1, Lcom/vk/music/event/PlaylistRemoved;->playlist:Lcom/vk/music/dto/Playlist;

    iget v1, v1, Lcom/vk/music/dto/Playlist;->ownerId:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->playlists:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 92
    :cond_0
    :goto_0
    return-void

    .line 89
    :cond_1
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->playlists:Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/vk/music/event/PlaylistRemoved;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    invoke-static {p0, p1}, Lcom/vk/music/model/MusicModelImpl$$Lambda$4;->lambdaFactory$(Lcom/vk/music/model/MusicModelImpl;Lcom/vk/music/event/PlaylistRemoved;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/music/model/MusicModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0
.end method

.method synthetic lambda$null$0(Lcom/vk/music/event/PlaylistChanged;Lcom/vk/music/model/MusicModel$Callback;)V
    .locals 1
    .param p1, "event"    # Lcom/vk/music/event/PlaylistChanged;
    .param p2, "callback"    # Lcom/vk/music/model/MusicModel$Callback;

    .prologue
    .line 71
    iget-object v0, p1, Lcom/vk/music/event/PlaylistChanged;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-interface {p2, p0, v0}, Lcom/vk/music/model/MusicModel$Callback;->onPlaylistChanged(Lcom/vk/music/model/MusicModel;Lcom/vk/music/dto/Playlist;)V

    return-void
.end method

.method synthetic lambda$null$2(Lcom/vk/music/event/PlaylistCreated;Lcom/vk/music/model/MusicModel$Callback;)V
    .locals 1
    .param p1, "event"    # Lcom/vk/music/event/PlaylistCreated;
    .param p2, "callback"    # Lcom/vk/music/model/MusicModel$Callback;

    .prologue
    .line 81
    iget-object v0, p1, Lcom/vk/music/event/PlaylistCreated;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-interface {p2, p0, v0}, Lcom/vk/music/model/MusicModel$Callback;->onPlaylistCreated(Lcom/vk/music/model/MusicModel;Lcom/vk/music/dto/Playlist;)V

    return-void
.end method

.method synthetic lambda$null$4(Lcom/vk/music/event/PlaylistRemoved;Lcom/vk/music/model/MusicModel$Callback;)V
    .locals 1
    .param p1, "event"    # Lcom/vk/music/event/PlaylistRemoved;
    .param p2, "callback"    # Lcom/vk/music/model/MusicModel$Callback;

    .prologue
    .line 90
    iget-object v0, p1, Lcom/vk/music/event/PlaylistRemoved;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-interface {p2, p0, v0}, Lcom/vk/music/model/MusicModel$Callback;->onPlaylistRemoved(Lcom/vk/music/model/MusicModel;Lcom/vk/music/dto/Playlist;)V

    return-void
.end method

.method public loadAndPlayShuffleAll(Landroid/content/Context;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 289
    invoke-virtual {p0}, Lcom/vk/music/model/MusicModelImpl;->canLoadMoreAudio()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vk/music/model/MusicModelImpl;->musicTracks:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/music/model/MusicModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 290
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vk/music/model/MusicModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 291
    .local v0, "shuffleTracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-static {v0}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 292
    invoke-virtual {p0}, Lcom/vk/music/model/MusicModelImpl;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2, v0}, Lcom/vk/music/model/PlayerModel;->togglePlayer(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/List;)V

    .line 304
    .end local v0    # "shuffleTracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :goto_0
    return-void

    .line 294
    :cond_0
    new-instance v1, Lcom/vkontakte/android/api/audio/AudioGet;

    iget v2, p0, Lcom/vk/music/model/MusicModelImpl;->ownerId:I

    invoke-direct {v1, v2}, Lcom/vkontakte/android/api/audio/AudioGet;-><init>(I)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/audio/AudioGet;->offset(I)Lcom/vkontakte/android/api/audio/AudioGet;

    move-result-object v1

    const/16 v2, 0xc8

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/audio/AudioGet;->count(I)Lcom/vkontakte/android/api/audio/AudioGet;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/audio/AudioGet;->extended()Lcom/vkontakte/android/api/audio/AudioGet;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/audio/AudioGet;->shuffle()Lcom/vkontakte/android/api/audio/AudioGet;

    move-result-object v1

    new-instance v2, Lcom/vk/music/model/MusicModelImpl$2;

    invoke-direct {v2, p0}, Lcom/vk/music/model/MusicModelImpl$2;-><init>(Lcom/vk/music/model/MusicModelImpl;)V

    .line 295
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/audio/AudioGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 302
    invoke-virtual {v1, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method public loadMoreAudio()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 211
    iget v0, p0, Lcom/vk/music/model/MusicModelImpl;->offset:I

    const/16 v1, 0x64

    invoke-direct {p0, v2, v2, v0, v1}, Lcom/vk/music/model/MusicModelImpl;->load(ZZII)V

    .line 212
    return-void
.end method

.method public loadPage()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 206
    const/4 v1, 0x0

    iget v0, p0, Lcom/vk/music/model/MusicModelImpl;->offset:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vk/music/model/MusicModelImpl;->offset:I

    :goto_0
    invoke-direct {p0, v2, v2, v1, v0}, Lcom/vk/music/model/MusicModelImpl;->load(ZZII)V

    .line 207
    return-void

    .line 206
    :cond_0
    const/16 v0, 0x64

    goto :goto_0
.end method

.method public release()V
    .locals 3

    .prologue
    .line 136
    const-class v0, Lcom/vk/music/event/PlaylistChanged;

    iget-object v1, p0, Lcom/vk/music/model/MusicModelImpl;->playlistChangedSubscriber:Lcom/vk/music/event/Subscriber;

    invoke-static {v0, v1}, Lcom/vk/music/event/MusicEventBus;->unsubscribe(Ljava/lang/Class;Lcom/vk/music/event/Subscriber;)V

    .line 137
    const-class v0, Lcom/vk/music/event/PlaylistCreated;

    iget-object v1, p0, Lcom/vk/music/model/MusicModelImpl;->playlistCreatedSubscriber:Lcom/vk/music/event/Subscriber;

    invoke-static {v0, v1}, Lcom/vk/music/event/MusicEventBus;->unsubscribe(Ljava/lang/Class;Lcom/vk/music/event/Subscriber;)V

    .line 138
    const-class v0, Lcom/vk/music/event/PlaylistRemoved;

    iget-object v1, p0, Lcom/vk/music/model/MusicModelImpl;->playlistRemovedSubscriber:Lcom/vk/music/event/Subscriber;

    invoke-static {v0, v1}, Lcom/vk/music/event/MusicEventBus;->unsubscribe(Ljava/lang/Class;Lcom/vk/music/event/Subscriber;)V

    .line 139
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 140
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 141
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 143
    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vk/music/model/ActiveModel;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vk/music/model/ModelHelper;->releaseAll([Lcom/vk/music/model/ActiveModel;)V

    .line 144
    return-void
.end method

.method public restore(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "state"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 125
    const-string/jumbo v0, "targetTrack"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    iput-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->targetTrack:Lcom/vkontakte/android/audio/MusicTrack;

    .line 126
    const-string/jumbo v0, "canLoadMore"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/model/MusicModelImpl;->canLoadMore:Z

    .line 127
    const-string/jumbo v0, "ownerName"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->ownerName:Ljava/lang/String;

    .line 128
    const-string/jumbo v0, "ownerImage"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->ownerImage:Ljava/lang/String;

    .line 129
    const-string/jumbo v0, "audio"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->musicTracks:Ljava/util/ArrayList;

    .line 130
    const-string/jumbo v0, "playlists"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/MusicModelImpl;->playlists:Ljava/util/ArrayList;

    .line 131
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vk/music/model/ActiveModel;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    aput-object v2, v0, v1

    invoke-static {p1, v0}, Lcom/vk/music/model/ModelHelper;->restoreAll(Landroid/os/Bundle;[Lcom/vk/music/model/ActiveModel;)V

    .line 132
    return-void
.end method

.method public save()Landroid/os/Bundle;
    .locals 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 112
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 113
    .local v0, "state":Landroid/os/Bundle;
    const-string/jumbo v1, "targetTrack"

    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl;->targetTrack:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 114
    const-string/jumbo v1, "canLoadMore"

    iget-boolean v2, p0, Lcom/vk/music/model/MusicModelImpl;->canLoadMore:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 115
    const-string/jumbo v1, "ownerName"

    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl;->ownerName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    const-string/jumbo v1, "ownerImage"

    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl;->ownerImage:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    const-string/jumbo v1, "audio"

    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 118
    const-string/jumbo v1, "playlists"

    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl;->playlists:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 119
    const/4 v1, 0x2

    new-array v1, v1, [Lcom/vk/music/model/ActiveModel;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vk/music/model/MusicModelImpl;->playerModel:Lcom/vk/music/model/PlayerModel;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/vk/music/model/MusicModelImpl;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/vk/music/model/ModelHelper;->saveAll(Landroid/os/Bundle;[Lcom/vk/music/model/ActiveModel;)V

    .line 120
    return-object v0
.end method

.method public bridge synthetic subscribe(Lcom/vk/music/model/MusicModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/MusicModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 31
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->subscribe(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic unsubscribe(Lcom/vk/music/model/MusicModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/MusicModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 31
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->unsubscribe(Ljava/lang/Object;)V

    return-void
.end method
