.class public Lcom/vkontakte/android/api/audio/AudioSavePlaylist;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AudioSavePlaylist.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vk/music/dto/Playlist;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;)V
    .locals 3
    .param p1, "builder"    # Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;

    .prologue
    .line 98
    const-string/jumbo v0, "execute.savePlaylist"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 99
    const-string/jumbo v0, "owner_id"

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->ownerId:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 100
    const-string/jumbo v0, "playlist_id"

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->playlistId:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 101
    const-string/jumbo v0, "title"

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->title:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 102
    const-string/jumbo v0, "desc"

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->description:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 103
    iget-object v0, p1, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->audioIds:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 104
    const-string/jumbo v0, "audio_ids"

    const-string/jumbo v1, ","

    iget-object v2, p1, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->audioIds:Ljava/util/List;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 106
    :cond_0
    iget-object v0, p1, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->audioIdsToAdd:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 107
    const-string/jumbo v0, "audio_ids_to_add"

    const-string/jumbo v1, ","

    iget-object v2, p1, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->audioIdsToAdd:Ljava/util/List;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 109
    :cond_1
    iget-object v0, p1, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->audioIdsToRemove:Ljava/util/List;

    if-eqz v0, :cond_2

    .line 110
    const-string/jumbo v0, "audio_ids_to_remove"

    const-string/jumbo v1, ","

    iget-object v2, p1, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->audioIdsToRemove:Ljava/util/List;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 112
    :cond_2
    const-string/jumbo v1, "save_cover"

    iget-boolean v0, p1, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->saveCover:Z

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 113
    const-string/jumbo v0, "photo_hash"

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->hash:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 114
    const-string/jumbo v0, "photo"

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->photo:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 115
    return-void

    .line 112
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;Lcom/vkontakte/android/api/audio/AudioSavePlaylist$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;
    .param p2, "x1"    # Lcom/vkontakte/android/api/audio/AudioSavePlaylist$1;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist;-><init>(Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;)V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vk/music/dto/Playlist;
    .locals 3
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 119
    new-instance v0, Lcom/vk/music/dto/Playlist;

    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "playlist"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/music/dto/Playlist;-><init>(Lorg/json/JSONObject;)V

    return-object v0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist;->parse(Lorg/json/JSONObject;)Lcom/vk/music/dto/Playlist;

    move-result-object v0

    return-object v0
.end method
