.class public Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AudioRemoveFromPlaylist.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;,
        Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;)V
    .locals 3
    .param p1, "builder"    # Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;

    .prologue
    .line 45
    const-string/jumbo v0, "execute.removeAudioFromPlaylist"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 46
    const-string/jumbo v0, "owner_id"

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;->ownerId:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 47
    const-string/jumbo v0, "playlist_id"

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;->playlistId:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 48
    const-string/jumbo v0, "audio_ids"

    const-string/jumbo v1, ","

    iget-object v2, p1, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;->audioIds:Ljava/util/List;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 49
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;
    .param p2, "x1"    # Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$1;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist;-><init>(Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;)V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;
    .locals 4
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 53
    new-instance v1, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;

    invoke-direct {v1}, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;-><init>()V

    .line 54
    .local v1, "result":Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;
    const-string/jumbo v3, "response"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 55
    .local v0, "jResponse":Lorg/json/JSONObject;
    const-string/jumbo v3, "result"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v2, :cond_0

    :goto_0
    iput-boolean v2, v1, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;->result:Z

    .line 56
    new-instance v2, Lcom/vk/music/dto/Playlist;

    const-string/jumbo v3, "playlist"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vk/music/dto/Playlist;-><init>(Lorg/json/JSONObject;)V

    iput-object v2, v1, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;->playlist:Lcom/vk/music/dto/Playlist;

    .line 57
    return-object v1

    .line 55
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 14
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;

    move-result-object v0

    return-object v0
.end method
