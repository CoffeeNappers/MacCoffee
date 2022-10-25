.class public final Lcom/vkontakte/android/api/audio/AudioGetPlaylists;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AudioGetPlaylists.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;,
        Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vk/music/dto/Playlist;",
        ">;>;"
    }
.end annotation


# static fields
.field private static parserRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/vkontakte/android/data/Parser",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;)V
    .locals 2
    .param p1, "builder"    # Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;

    .prologue
    .line 26
    const-string/jumbo v0, "audio.getPlaylists"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 27
    const-string/jumbo v0, "owner_id"

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->ownerId:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 28
    const-string/jumbo v0, "filter"

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->filter:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    invoke-virtual {v1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 29
    const-string/jumbo v0, "offset"

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->offset:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 30
    const-string/jumbo v0, "count"

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->count:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 31
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;Lcom/vkontakte/android/api/audio/AudioGetPlaylists$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;
    .param p2, "x1"    # Lcom/vkontakte/android/api/audio/AudioGetPlaylists$1;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists;-><init>(Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;)V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;
    .locals 3
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 35
    sget-object v1, Lcom/vkontakte/android/api/audio/AudioGetPlaylists;->parserRef:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_1

    sget-object v1, Lcom/vkontakte/android/api/audio/AudioGetPlaylists;->parserRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/Parser;

    move-object v0, v1

    .line 36
    .local v0, "parser":Lcom/vkontakte/android/data/Parser;, "Lcom/vkontakte/android/data/Parser<Lcom/vk/music/dto/Playlist;>;"
    :goto_0
    if-nez v0, :cond_0

    .line 37
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$1;

    .end local v0    # "parser":Lcom/vkontakte/android/data/Parser;, "Lcom/vkontakte/android/data/Parser<Lcom/vk/music/dto/Playlist;>;"
    invoke-direct {v0, p0}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$1;-><init>(Lcom/vkontakte/android/api/audio/AudioGetPlaylists;)V

    .line 43
    .restart local v0    # "parser":Lcom/vkontakte/android/data/Parser;, "Lcom/vkontakte/android/data/Parser<Lcom/vk/music/dto/Playlist;>;"
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lcom/vkontakte/android/api/audio/AudioGetPlaylists;->parserRef:Ljava/lang/ref/WeakReference;

    .line 45
    :cond_0
    new-instance v1, Lcom/vkontakte/android/data/VKList;

    const-string/jumbo v2, "response"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Lcom/vkontakte/android/data/Parser;)V

    return-object v1

    .line 35
    .end local v0    # "parser":Lcom/vkontakte/android/data/Parser;, "Lcom/vkontakte/android/data/Parser<Lcom/vk/music/dto/Playlist;>;"
    :cond_1
    const/4 v0, 0x0

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
    .line 17
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;

    move-result-object v0

    return-object v0
.end method
