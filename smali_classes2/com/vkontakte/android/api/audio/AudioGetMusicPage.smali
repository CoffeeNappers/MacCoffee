.class public final Lcom/vkontakte/android/api/audio/AudioGetMusicPage;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AudioGetMusicPage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;,
        Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final loadSaved:Z


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;)V
    .locals 2
    .param p1, "builder"    # Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 28
    const-string/jumbo v0, "execute.getMusicPage"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 29
    const-string/jumbo v0, "owner_id"

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->ownerId:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 30
    const-string/jumbo v1, "need_owner"

    iget-boolean v0, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->needOwner:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "1"

    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 31
    iget-boolean v0, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->needPlaylists:Z

    if-eqz v0, :cond_1

    .line 32
    const-string/jumbo v0, "need_playlists"

    const-string/jumbo v1, "1"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 33
    const-string/jumbo v0, "playlists_count"

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->playlistsCount:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 37
    :goto_1
    const-string/jumbo v0, "audio_offset"

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->audioOffset:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 38
    const-string/jumbo v0, "audio_count"

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->audioCount:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 39
    iget-boolean v0, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->loadSaved:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/api/audio/AudioGetMusicPage;->loadSaved:Z

    .line 40
    return-void

    .line 30
    :cond_0
    const-string/jumbo v0, "0"

    goto :goto_0

    .line 35
    :cond_1
    const-string/jumbo v0, "need_playlists"

    const-string/jumbo v1, "0"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_1
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;Lcom/vkontakte/android/api/audio/AudioGetMusicPage$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;
    .param p2, "x1"    # Lcom/vkontakte/android/api/audio/AudioGetMusicPage$1;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage;-><init>(Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;)V

    return-void
.end method

.method private static parseImage(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 6
    .param p0, "jOwner"    # Lorg/json/JSONObject;

    .prologue
    const/4 v2, 0x0

    .line 85
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    const-string/jumbo v4, "photo_200"

    aput-object v4, v3, v2

    const/4 v4, 0x1

    const-string/jumbo v5, "photo_100"

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-string/jumbo v5, "photo_50"

    aput-object v5, v3, v4

    array-length v4, v3

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v0, v3, v2

    .line 86
    .local v0, "s":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 87
    .local v1, "url":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 91
    .end local v0    # "s":Ljava/lang/String;
    .end local v1    # "url":Ljava/lang/String;
    :goto_1
    return-object v1

    .line 85
    .restart local v0    # "s":Ljava/lang/String;
    .restart local v1    # "url":Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 91
    .end local v0    # "s":Ljava/lang/String;
    .end local v1    # "url":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;
    .locals 10
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 44
    const-string/jumbo v7, "response"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 45
    .local v3, "jResponse":Lorg/json/JSONObject;
    new-instance v4, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;

    invoke-direct {v4}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;-><init>()V

    .line 46
    .local v4, "result":Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;
    const-string/jumbo v7, "owner"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 47
    .local v1, "jOwner":Lorg/json/JSONObject;
    if-eqz v1, :cond_1

    .line 48
    const-string/jumbo v7, "first_name"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    const-string/jumbo v7, "last_name"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 49
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "first_name"

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "last_name"

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v4, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->ownerName:Ljava/lang/String;

    .line 55
    :cond_0
    :goto_0
    invoke-static {v1}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage;->parseImage(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v4, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->ownerImage:Ljava/lang/String;

    .line 60
    :cond_1
    const-string/jumbo v7, "playlists"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 61
    .local v2, "jPlaylists":Lorg/json/JSONObject;
    if-eqz v2, :cond_2

    .line 62
    new-instance v7, Lcom/vkontakte/android/data/VKList;

    const-class v8, Lcom/vk/music/dto/Playlist;

    invoke-direct {v7, v2, v8}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Ljava/lang/Class;)V

    iput-object v7, v4, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->playlists:Lcom/vkontakte/android/data/VKList;

    .line 65
    :cond_2
    const-string/jumbo v7, "audios"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 66
    .local v0, "jAudios":Lorg/json/JSONObject;
    if-eqz v0, :cond_5

    .line 67
    new-instance v7, Lcom/vkontakte/android/data/VKList;

    const-class v8, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-direct {v7, v0, v8}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Ljava/lang/Class;)V

    iput-object v7, v4, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->musicTracks:Lcom/vkontakte/android/data/VKList;

    .line 73
    :goto_1
    iget-boolean v7, p0, Lcom/vkontakte/android/api/audio/AudioGetMusicPage;->loadSaved:Z

    if-eqz v7, :cond_3

    .line 74
    sget-object v7, Lcom/vkontakte/android/audio/player/SavedTrack;->PROVIDER:Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;

    invoke-virtual {v7}, Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;->getCount()I

    move-result v5

    .line 75
    .local v5, "savedCount":I
    if-lez v5, :cond_3

    .line 76
    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v8, 0x7f0803e0

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 77
    .local v6, "title":Ljava/lang/String;
    new-instance v7, Lcom/vk/music/dto/Playlist;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v8

    const/4 v9, 0x2

    invoke-direct {v7, v6, v8, v9}, Lcom/vk/music/dto/Playlist;-><init>(Ljava/lang/String;II)V

    iput-object v7, v4, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->savedAudios:Lcom/vk/music/dto/Playlist;

    .line 81
    .end local v5    # "savedCount":I
    .end local v6    # "title":Ljava/lang/String;
    :cond_3
    return-object v4

    .line 51
    .end local v0    # "jAudios":Lorg/json/JSONObject;
    .end local v2    # "jPlaylists":Lorg/json/JSONObject;
    :cond_4
    const-string/jumbo v7, "name"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 52
    const-string/jumbo v7, "name"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v4, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->ownerImage:Ljava/lang/String;

    goto :goto_0

    .line 69
    .restart local v0    # "jAudios":Lorg/json/JSONObject;
    .restart local v2    # "jPlaylists":Lorg/json/JSONObject;
    :cond_5
    new-instance v7, Lcom/vkontakte/android/data/VKList;

    invoke-direct {v7}, Lcom/vkontakte/android/data/VKList;-><init>()V

    iput-object v7, v4, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->musicTracks:Lcom/vkontakte/android/data/VKList;

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
    .line 23
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;

    move-result-object v0

    return-object v0
.end method
