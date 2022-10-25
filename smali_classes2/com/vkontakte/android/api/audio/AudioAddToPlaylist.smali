.class public final Lcom/vkontakte/android/api/audio/AudioAddToPlaylist;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AudioAddToPlaylist.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;,
        Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;)V
    .locals 3
    .param p1, "builder"    # Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;

    .prologue
    .line 50
    const-string/jumbo v0, "execute.addAudioToPlaylist"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 51
    const-string/jumbo v0, "owner_id"

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;->ownerId:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 52
    const-string/jumbo v0, "playlist_id"

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;->playlistId:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 53
    const-string/jumbo v0, "audio_ids"

    const-string/jumbo v1, ","

    iget-object v2, p1, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;->audioIds:Ljava/util/List;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 54
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;
    .param p2, "x1"    # Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$1;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist;-><init>(Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;)V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;
    .locals 7
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 58
    new-instance v4, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;

    invoke-direct {v4}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;-><init>()V

    .line 59
    .local v4, "result":Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;
    const-string/jumbo v5, "response"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 60
    .local v2, "jResponse":Lorg/json/JSONObject;
    const-string/jumbo v5, "result"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 61
    .local v1, "jNewIds":Lorg/json/JSONArray;
    if-eqz v1, :cond_1

    .line 62
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v5

    new-array v3, v5, [I

    .line 63
    .local v3, "newIds":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v5, v3

    if-ge v0, v5, :cond_0

    .line 64
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "audio_id"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    aput v5, v3, v0

    .line 63
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 66
    :cond_0
    iput-object v3, v4, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;->ids:[I

    .line 70
    .end local v0    # "i":I
    .end local v3    # "newIds":[I
    :goto_1
    new-instance v5, Lcom/vk/music/dto/Playlist;

    const-string/jumbo v6, "playlist"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/vk/music/dto/Playlist;-><init>(Lorg/json/JSONObject;)V

    iput-object v5, v4, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;->playlist:Lcom/vk/music/dto/Playlist;

    .line 71
    return-object v4

    .line 68
    :cond_1
    const/4 v5, 0x0

    new-array v5, v5, [I

    iput-object v5, v4, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;->ids:[I

    goto :goto_1
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 20
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Result;

    move-result-object v0

    return-object v0
.end method
