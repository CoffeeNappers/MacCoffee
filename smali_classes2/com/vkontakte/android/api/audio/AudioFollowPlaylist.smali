.class public final Lcom/vkontakte/android/api/audio/AudioFollowPlaylist;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AudioFollowPlaylist.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vk/music/dto/PlaylistLink;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(IILjava/lang/String;)V
    .locals 1
    .param p1, "playlistId"    # I
    .param p2, "ownerId"    # I
    .param p3, "accessKey"    # Ljava/lang/String;

    .prologue
    .line 15
    const-string/jumbo v0, "audio.followPlaylist"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 16
    const-string/jumbo v0, "playlist_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/audio/AudioFollowPlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 17
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/audio/AudioFollowPlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 18
    if-eqz p3, :cond_0

    .line 19
    const-string/jumbo v0, "access_key"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/audio/AudioFollowPlaylist;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 21
    :cond_0
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vk/music/dto/PlaylistLink;
    .locals 2
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 25
    new-instance v0, Lcom/vk/music/dto/PlaylistLink;

    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/music/dto/PlaylistLink;-><init>(Lorg/json/JSONObject;)V

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
    .line 12
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/audio/AudioFollowPlaylist;->parse(Lorg/json/JSONObject;)Lcom/vk/music/dto/PlaylistLink;

    move-result-object v0

    return-object v0
.end method
