.class public final Lcom/vkontakte/android/api/audio/AudioGetPlaylist;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AudioGetPlaylist.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;,
        Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;",
        ">;"
    }
.end annotation


# instance fields
.field private final ownerId:I

.field private final playlistId:I


# direct methods
.method private constructor <init>(II)V
    .locals 1
    .param p1, "ownerId"    # I
    .param p2, "playlistId"    # I

    .prologue
    .line 23
    const-string/jumbo v0, "execute.getPlaylist"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 24
    const-string/jumbo v0, "owner_id"

    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;->ownerId:I

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 25
    const-string/jumbo v0, "id"

    iput p2, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;->playlistId:I

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 26
    return-void
.end method

.method synthetic constructor <init>(IILcom/vkontakte/android/api/audio/AudioGetPlaylist$1;)V
    .locals 0
    .param p1, "x0"    # I
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/vkontakte/android/api/audio/AudioGetPlaylist$1;

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;-><init>(II)V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;
    .locals 14
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 30
    const-string/jumbo v10, "response"

    invoke-virtual {p1, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 31
    .local v6, "jResponse":Lorg/json/JSONObject;
    new-instance v9, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;

    invoke-direct {v9}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;-><init>()V

    .line 33
    .local v9, "result":Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;
    const-string/jumbo v10, "execute_errors"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 34
    const-string/jumbo v10, "execute_errors"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 35
    .local v1, "errs":Lorg/json/JSONArray;
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-lez v10, :cond_0

    .line 36
    invoke-virtual {v1, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 37
    .local v0, "err":Lorg/json/JSONObject;
    new-instance v10, Lcom/vkontakte/android/api/APIException;

    const-string/jumbo v11, "error_code"

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    const-string/jumbo v12, "error_msg"

    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lcom/vkontakte/android/api/APIException;-><init>(ILjava/lang/String;)V

    throw v10

    .line 40
    .end local v0    # "err":Lorg/json/JSONObject;
    .end local v1    # "errs":Lorg/json/JSONArray;
    :cond_0
    const-string/jumbo v10, "execute_errors"

    invoke-virtual {p1, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 41
    const-string/jumbo v10, "execute_errors"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 42
    .restart local v1    # "errs":Lorg/json/JSONArray;
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-lez v10, :cond_1

    .line 43
    invoke-virtual {v1, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 44
    .restart local v0    # "err":Lorg/json/JSONObject;
    new-instance v10, Lcom/vkontakte/android/api/APIException;

    const-string/jumbo v11, "error_code"

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    const-string/jumbo v12, "error_msg"

    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lcom/vkontakte/android/api/APIException;-><init>(ILjava/lang/String;)V

    throw v10

    .line 48
    .end local v0    # "err":Lorg/json/JSONObject;
    .end local v1    # "errs":Lorg/json/JSONArray;
    :cond_1
    const-string/jumbo v10, "owner"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 49
    const-string/jumbo v10, "owner"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 50
    .local v4, "jOwner":Lorg/json/JSONObject;
    const-string/jumbo v10, "first_name"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_4

    const-string/jumbo v10, "last_name"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 51
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "first_name"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "last_name"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->owner:Ljava/lang/String;

    .line 57
    .end local v4    # "jOwner":Lorg/json/JSONObject;
    :cond_2
    :goto_0
    const-string/jumbo v10, "playlist"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 58
    .local v5, "jPlaylist":Lorg/json/JSONObject;
    if-eqz v5, :cond_3

    .line 59
    new-instance v10, Lcom/vk/music/dto/Playlist;

    invoke-direct {v10, v5}, Lcom/vk/music/dto/Playlist;-><init>(Lorg/json/JSONObject;)V

    iput-object v10, v9, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->playlist:Lcom/vk/music/dto/Playlist;

    .line 62
    :cond_3
    const-string/jumbo v10, "audios"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 63
    .local v3, "jAudios":Lorg/json/JSONArray;
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .local v8, "musicTracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    if-eqz v3, :cond_5

    .line 65
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v7

    .line 66
    .local v7, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v7, :cond_5

    .line 67
    new-instance v10, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    iget v12, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;->ownerId:I

    iget v13, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;->playlistId:I

    invoke-direct {v10, v11, v12, v13}, Lcom/vkontakte/android/audio/MusicTrack;-><init>(Lorg/json/JSONObject;II)V

    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 53
    .end local v2    # "i":I
    .end local v3    # "jAudios":Lorg/json/JSONArray;
    .end local v5    # "jPlaylist":Lorg/json/JSONObject;
    .end local v7    # "length":I
    .end local v8    # "musicTracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    .restart local v4    # "jOwner":Lorg/json/JSONObject;
    :cond_4
    const-string/jumbo v10, "name"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->owner:Ljava/lang/String;

    goto :goto_0

    .line 70
    .end local v4    # "jOwner":Lorg/json/JSONObject;
    .restart local v3    # "jAudios":Lorg/json/JSONArray;
    .restart local v5    # "jPlaylist":Lorg/json/JSONObject;
    .restart local v8    # "musicTracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_5
    iput-object v8, v9, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    .line 71
    return-object v9
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 17
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;

    move-result-object v0

    return-object v0
.end method
