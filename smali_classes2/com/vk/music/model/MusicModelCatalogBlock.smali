.class public Lcom/vk/music/model/MusicModelCatalogBlock;
.super Lcom/vk/music/model/ObservableModel;
.source "MusicModelCatalogBlock.java"

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


# instance fields
.field canLoadMore:Z

.field final catalogBlockId:I

.field errorMessage:Ljava/lang/String;

.field loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field final musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

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

.field final playerModel:Lcom/vk/music/model/PlayerModel;


# direct methods
.method public constructor <init>(Lcom/vk/music/dto/Section;)V
    .locals 2
    .param p1, "section"    # Lcom/vk/music/dto/Section;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/vk/music/model/ObservableModel;-><init>()V

    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->canLoadMore:Z

    .line 40
    iget v0, p1, Lcom/vk/music/dto/Section;->id:I

    iput v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->catalogBlockId:I

    .line 41
    new-instance v0, Lcom/vk/music/model/PlayerModelImpl;

    iget-object v1, p1, Lcom/vk/music/dto/Section;->source:Ljava/lang/String;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/PlayerRefer;->parseRecommended(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/music/model/PlayerModelImpl;-><init>(Lcom/vkontakte/android/audio/player/PlayerRefer;)V

    iput-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->playerModel:Lcom/vk/music/model/PlayerModel;

    .line 42
    new-instance v0, Lcom/vk/music/model/MusicTrackModelImpl;

    invoke-direct {v0}, Lcom/vk/music/model/MusicTrackModelImpl;-><init>()V

    iput-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    .line 43
    return-void
.end method

.method private load(ZII)V
    .locals 2
    .param p1, "loadOwner"    # Z
    .param p2, "audioOffset"    # I
    .param p3, "audioCount"    # I

    .prologue
    .line 176
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 220
    :goto_0
    return-void

    .line 180
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;

    iget v1, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->catalogBlockId:I

    invoke-direct {v0, v1, p2, p3}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;-><init>(III)V

    .line 181
    invoke-virtual {v0}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->buildSection()Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    new-instance v1, Lcom/vk/music/model/MusicModelCatalogBlock$2;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/vk/music/model/MusicModelCatalogBlock$2;-><init>(Lcom/vk/music/model/MusicModelCatalogBlock;ZII)V

    .line 182
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 219
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method


# virtual methods
.method public canLoadMoreAudio()Z
    .locals 1

    .prologue
    .line 120
    iget-boolean v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->canLoadMore:Z

    return v0
.end method

.method public getError()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 152
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->errorMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getIcon()Ljava/lang/String;
    .locals 1

    .prologue
    .line 97
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 146
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

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
    .line 109
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->musicTracks:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getOriginalPlaylist(Lcom/vk/music/dto/Playlist;)Lcom/vk/music/dto/Playlist;
    .locals 0
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 115
    return-object p1
.end method

.method public getOwnerId()I
    .locals 1

    .prologue
    .line 76
    const/4 v0, 0x0

    return v0
.end method

.method public getPlayerModel()Lcom/vk/music/model/PlayerModel;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 140
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->playerModel:Lcom/vk/music/model/PlayerModel;

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
    .line 103
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getTitle(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->owner:Ljava/lang/String;

    return-object v0
.end method

.method public hasIcon()Z
    .locals 1

    .prologue
    .line 92
    const/4 v0, 0x0

    return v0
.end method

.method public isCurrentUser()Z
    .locals 1

    .prologue
    .line 125
    const/4 v0, 0x0

    return v0
.end method

.method public isNeedLoadTitle()Z
    .locals 1

    .prologue
    .line 81
    const/4 v0, 0x1

    return v0
.end method

.method public loadAndPlayShuffleAll(Landroid/content/Context;)V
    .locals 5
    .param p1, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 157
    invoke-virtual {p0}, Lcom/vk/music/model/MusicModelCatalogBlock;->canLoadMoreAudio()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->musicTracks:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 158
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->musicTracks:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 159
    .local v0, "shuffleTracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-static {v0}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 160
    invoke-virtual {p0}, Lcom/vk/music/model/MusicModelCatalogBlock;->getPlayerModel()Lcom/vk/music/model/PlayerModel;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2, v0}, Lcom/vk/music/model/PlayerModel;->togglePlayer(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/List;)V

    .line 173
    .end local v0    # "shuffleTracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :goto_0
    return-void

    .line 162
    :cond_0
    new-instance v1, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;

    iget v2, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->catalogBlockId:I

    const/4 v3, 0x0

    const/16 v4, 0xc8

    invoke-direct {v1, v2, v3, v4}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;-><init>(III)V

    invoke-virtual {v1}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->shuffle()Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;

    move-result-object v1

    .line 163
    invoke-virtual {v1}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->buildAudios()Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    new-instance v2, Lcom/vk/music/model/MusicModelCatalogBlock$1;

    invoke-direct {v2, p0}, Lcom/vk/music/model/MusicModelCatalogBlock$1;-><init>(Lcom/vk/music/model/MusicModelCatalogBlock;)V

    .line 164
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 171
    invoke-virtual {v1, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method public loadMoreAudio()V
    .locals 3

    .prologue
    .line 135
    const/4 v0, 0x0

    iget v1, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->offset:I

    const/16 v2, 0x64

    invoke-direct {p0, v0, v1, v2}, Lcom/vk/music/model/MusicModelCatalogBlock;->load(ZII)V

    .line 136
    return-void
.end method

.method public loadPage()V
    .locals 3

    .prologue
    .line 130
    const/4 v1, 0x1

    const/4 v2, 0x0

    iget v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->offset:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->offset:I

    :goto_0
    invoke-direct {p0, v1, v2, v0}, Lcom/vk/music/model/MusicModelCatalogBlock;->load(ZII)V

    .line 131
    return-void

    .line 130
    :cond_0
    const/16 v0, 0x64

    goto :goto_0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 68
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 70
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->playerModel:Lcom/vk/music/model/PlayerModel;

    invoke-interface {v0}, Lcom/vk/music/model/PlayerModel;->release()V

    .line 71
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->musicTrackModel:Lcom/vk/music/model/MusicTrackModel;

    invoke-interface {v0}, Lcom/vk/music/model/MusicTrackModel;->release()V

    .line 72
    return-void
.end method

.method public restore(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 58
    const-string/jumbo v0, "canLoadMore"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->canLoadMore:Z

    .line 59
    const-string/jumbo v0, "offset"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->offset:I

    .line 60
    const-string/jumbo v0, "owner"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->owner:Ljava/lang/String;

    .line 61
    const-string/jumbo v0, "audio"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->musicTracks:Ljava/util/ArrayList;

    .line 62
    return-void
.end method

.method public save()Landroid/os/Bundle;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 48
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 49
    .local v0, "state":Landroid/os/Bundle;
    const-string/jumbo v1, "canLoadMore"

    iget-boolean v2, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->canLoadMore:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 50
    const-string/jumbo v1, "offset"

    iget v2, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->offset:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 51
    const-string/jumbo v1, "owner"

    iget-object v2, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->owner:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    const-string/jumbo v1, "audio"

    iget-object v2, p0, Lcom/vk/music/model/MusicModelCatalogBlock;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 53
    return-object v0
.end method

.method public bridge synthetic subscribe(Lcom/vk/music/model/MusicModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/MusicModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 22
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
    .line 22
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->unsubscribe(Ljava/lang/Object;)V

    return-void
.end method
