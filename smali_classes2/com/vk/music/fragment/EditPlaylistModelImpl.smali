.class final Lcom/vk/music/fragment/EditPlaylistModelImpl;
.super Lcom/vk/music/model/ObservableModel;
.source "EditPlaylistFragment.java"

# interfaces
.implements Lcom/vk/music/model/EditPlaylistModel;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/music/model/ObservableModel",
        "<",
        "Lcom/vk/music/model/EditPlaylistModel$Callback;",
        ">;",
        "Lcom/vk/music/model/EditPlaylistModel;"
    }
.end annotation


# static fields
.field static final AUDIO_ITEMS_PORTION:I = 0x64


# instance fields
.field attached:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field canLoadMore:Z

.field description:Ljava/lang/String;

.field loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

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

.field photoUrl:Lcom/vk/music/dto/Thumb;

.field playlist:Lcom/vk/music/dto/Playlist;

.field removed:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field saveRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/vk/music/dto/Playlist;ILjava/util/ArrayList;)V
    .locals 1
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "offset"    # I
    .param p3    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/dto/Playlist;",
            "I",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 84
    .local p3, "musicTracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-direct {p0}, Lcom/vk/music/model/ObservableModel;-><init>()V

    .line 70
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->canLoadMore:Z

    .line 78
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->removed:Ljava/util/ArrayList;

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->attached:Ljava/util/ArrayList;

    .line 85
    iput-object p1, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    .line 86
    iput p2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->offset:I

    .line 87
    if-eqz p1, :cond_0

    .line 88
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->title:Ljava/lang/String;

    .line 89
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->description:Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->description:Ljava/lang/String;

    .line 90
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    iput-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->photoUrl:Lcom/vk/music/dto/Thumb;

    .line 91
    iput-object p3, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    .line 98
    :goto_0
    return-void

    .line 93
    :cond_0
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->title:Ljava/lang/String;

    .line 94
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->description:Ljava/lang/String;

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    .line 96
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->canLoadMore:Z

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/vk/music/fragment/EditPlaylistModelImpl;Lcom/vk/music/model/ObservableModel$Notification;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/fragment/EditPlaylistModelImpl;
    .param p1, "x1"    # Lcom/vk/music/model/ObservableModel$Notification;

    .prologue
    .line 66
    invoke-virtual {p0, p1}, Lcom/vk/music/fragment/EditPlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vk/music/fragment/EditPlaylistModelImpl;Lcom/vk/music/model/ObservableModel$Notification;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/fragment/EditPlaylistModelImpl;
    .param p1, "x1"    # Lcom/vk/music/model/ObservableModel$Notification;

    .prologue
    .line 66
    invoke-virtual {p0, p1}, Lcom/vk/music/fragment/EditPlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vk/music/fragment/EditPlaylistModelImpl;Lcom/vk/music/model/ObservableModel$Notification;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/fragment/EditPlaylistModelImpl;
    .param p1, "x1"    # Lcom/vk/music/model/ObservableModel$Notification;

    .prologue
    .line 66
    invoke-virtual {p0, p1}, Lcom/vk/music/fragment/EditPlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vk/music/fragment/EditPlaylistModelImpl;Lcom/vk/music/model/ObservableModel$Notification;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/fragment/EditPlaylistModelImpl;
    .param p1, "x1"    # Lcom/vk/music/model/ObservableModel$Notification;

    .prologue
    .line 66
    invoke-virtual {p0, p1}, Lcom/vk/music/fragment/EditPlaylistModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    return-void
.end method

.method private load(II)V
    .locals 3
    .param p1, "audioOffset"    # I
    .param p2, "audioCount"    # I

    .prologue
    .line 225
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 260
    :goto_0
    return-void

    .line 229
    :cond_0
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    if-nez v0, :cond_1

    .line 230
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "EditPlaylistModelImpl: playlist must not be null"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 234
    :cond_1
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    iget-object v1, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    iget v1, v1, Lcom/vk/music/dto/Playlist;->id:I

    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    iget v2, v2, Lcom/vk/music/dto/Playlist;->ownerId:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;-><init>(II)V

    .line 235
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->audioOffset(I)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    move-result-object v0

    .line 236
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->audioCount(I)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    move-result-object v0

    .line 237
    invoke-virtual {v0}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->build()Lcom/vkontakte/android/api/audio/AudioGetPlaylist;

    move-result-object v0

    new-instance v1, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/vk/music/fragment/EditPlaylistModelImpl$2;-><init>(Lcom/vk/music/fragment/EditPlaylistModelImpl;II)V

    .line 238
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 259
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method


# virtual methods
.method public attachTracks(Ljava/util/List;)V
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
    .local p1, "attachedMusicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v3, 0x0

    .line 285
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 306
    :cond_0
    return-void

    .line 289
    :cond_1
    invoke-virtual {p0}, Lcom/vk/music/fragment/EditPlaylistModelImpl;->isNew()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 290
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 291
    .local v0, "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 292
    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v2, v3, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_0

    .line 296
    .end local v0    # "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_3
    iget-object v1, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->attached:Ljava/util/ArrayList;

    if-nez v1, :cond_4

    .line 297
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->attached:Ljava/util/ArrayList;

    .line 299
    :cond_4
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_5
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 300
    .restart local v0    # "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->attached:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 301
    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->attached:Ljava/util/ArrayList;

    invoke-virtual {v2, v3, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 302
    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v2, v3, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_1
.end method

.method public canLoadMore()Z
    .locals 1

    .prologue
    .line 216
    iget-boolean v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->canLoadMore:Z

    return v0
.end method

.method public getAttached()Ljava/util/Collection;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 147
    invoke-virtual {p0}, Lcom/vk/music/fragment/EditPlaylistModelImpl;->isNew()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    .line 150
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->attached:Ljava/util/ArrayList;

    goto :goto_0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 119
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->description:Ljava/lang/String;

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
    .line 136
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getPhotoUrl()Lcom/vk/music/dto/Thumb;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->photoUrl:Lcom/vk/music/dto/Thumb;

    return-object v0
.end method

.method public getRemoved()Ljava/util/Collection;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 141
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->removed:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 108
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->title:Ljava/lang/String;

    return-object v0
.end method

.method public isNew()Z
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isTrackAttached(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .locals 1
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 264
    invoke-virtual {p0}, Lcom/vk/music/fragment/EditPlaylistModelImpl;->isNew()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 265
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    .line 267
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->attached:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->attached:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public loadMore()V
    .locals 2

    .prologue
    .line 221
    iget v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->offset:I

    const/16 v1, 0x64

    invoke-direct {p0, v0, v1}, Lcom/vk/music/fragment/EditPlaylistModelImpl;->load(II)V

    .line 222
    return-void
.end method

.method public release()V
    .locals 1

    .prologue
    .line 339
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 340
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 342
    :cond_0
    return-void
.end method

.method public removeAttachedTrack(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 1
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 273
    invoke-virtual {p0}, Lcom/vk/music/fragment/EditPlaylistModelImpl;->isNew()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 274
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 281
    :cond_0
    :goto_0
    return-void

    .line 276
    :cond_1
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->attached:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 277
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->attached:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 278
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public restore(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 326
    const-string/jumbo v0, "canLoadMore"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->canLoadMore:Z

    .line 327
    const-string/jumbo v0, "offset"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->offset:I

    .line 328
    const-string/jumbo v0, "title"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->title:Ljava/lang/String;

    .line 329
    const-string/jumbo v0, "description"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->description:Ljava/lang/String;

    .line 330
    const-string/jumbo v0, "photoUrl"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Thumb;

    iput-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->photoUrl:Lcom/vk/music/dto/Thumb;

    .line 331
    const-string/jumbo v0, "playlist"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Playlist;

    iput-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    .line 332
    const-string/jumbo v0, "audio"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    .line 333
    const-string/jumbo v0, "removed"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->removed:Ljava/util/ArrayList;

    .line 334
    const-string/jumbo v0, "attached"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->attached:Ljava/util/ArrayList;

    .line 335
    return-void
.end method

.method public save()Landroid/os/Bundle;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 311
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 312
    .local v0, "state":Landroid/os/Bundle;
    const-string/jumbo v1, "canLoadMore"

    iget-boolean v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->canLoadMore:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 313
    const-string/jumbo v1, "offset"

    iget v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->offset:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 314
    const-string/jumbo v1, "title"

    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->title:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    const-string/jumbo v1, "description"

    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->description:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    const-string/jumbo v1, "photoUrl"

    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->photoUrl:Lcom/vk/music/dto/Thumb;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 317
    const-string/jumbo v1, "playlist"

    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 318
    const-string/jumbo v1, "audio"

    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 319
    const-string/jumbo v1, "removed"

    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->removed:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 320
    const-string/jumbo v1, "attached"

    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->attached:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 321
    return-object v0
.end method

.method public savePlaylist()V
    .locals 4

    .prologue
    .line 167
    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->saveRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v2, :cond_0

    .line 212
    :goto_0
    return-void

    .line 171
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;-><init>()V

    .line 172
    .local v0, "builder":Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;
    invoke-virtual {p0}, Lcom/vk/music/fragment/EditPlaylistModelImpl;->isNew()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 173
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->ownerId(I)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;

    .line 174
    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 175
    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/MusicTrack;

    .line 176
    .local v1, "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->addAudio(Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;

    goto :goto_1

    .line 180
    .end local v1    # "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_1
    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    iget v2, v2, Lcom/vk/music/dto/Playlist;->ownerId:I

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->ownerId(I)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->playlist:Lcom/vk/music/dto/Playlist;

    iget v3, v3, Lcom/vk/music/dto/Playlist;->id:I

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->playlistId(I)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;

    .line 181
    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->attached:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 182
    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->attached:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/MusicTrack;

    .line 183
    .restart local v1    # "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->addAudioToAdd(Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;

    goto :goto_2

    .line 186
    .end local v1    # "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_2
    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->removed:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 187
    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->removed:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/MusicTrack;

    .line 188
    .restart local v1    # "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->addAudioToRemove(Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;

    goto :goto_3

    .line 193
    .end local v1    # "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_3
    iget-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->title:Ljava/lang/String;

    .line 194
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->title(Ljava/lang/String;)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->description:Ljava/lang/String;

    .line 195
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->description(Ljava/lang/String;)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;

    move-result-object v2

    .line 196
    invoke-virtual {v2}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->build()Lcom/vkontakte/android/api/audio/AudioSavePlaylist;

    move-result-object v2

    new-instance v3, Lcom/vk/music/fragment/EditPlaylistModelImpl$1;

    invoke-direct {v3, p0}, Lcom/vk/music/fragment/EditPlaylistModelImpl$1;-><init>(Lcom/vk/music/fragment/EditPlaylistModelImpl;)V

    .line 197
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 211
    invoke-virtual {v2, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->saveRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 0
    .param p1, "description"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 124
    iput-object p1, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->description:Ljava/lang/String;

    .line 125
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 113
    iput-object p1, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->title:Ljava/lang/String;

    .line 114
    return-void
.end method

.method public bridge synthetic subscribe(Lcom/vk/music/model/EditPlaylistModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/EditPlaylistModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 66
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->subscribe(Ljava/lang/Object;)V

    return-void
.end method

.method public toggleRemoved(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .locals 1
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 156
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->removed:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 157
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->removed:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 158
    const/4 v0, 0x0

    .line 161
    :goto_0
    return v0

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistModelImpl;->removed:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 161
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public bridge synthetic unsubscribe(Lcom/vk/music/model/EditPlaylistModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/EditPlaylistModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 66
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->unsubscribe(Ljava/lang/Object;)V

    return-void
.end method
