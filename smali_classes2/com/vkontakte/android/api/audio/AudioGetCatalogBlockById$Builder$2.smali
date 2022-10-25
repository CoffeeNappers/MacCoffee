.class Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$2;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AudioGetCatalogBlockById.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->buildPlaylists()Lcom/vkontakte/android/api/VKAPIRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
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


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;
    .param p2, "method"    # Ljava/lang/String;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$2;->this$0:Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;
    .locals 6
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
    .line 56
    :try_start_0
    iget-object v4, p0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$2;->this$0:Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;

    invoke-static {v4, p1}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->access$000(Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;Lorg/json/JSONObject;)Lcom/vk/music/dto/Section;

    move-result-object v2

    .line 57
    .local v2, "section":Lcom/vk/music/dto/Section;
    new-instance v3, Lcom/vkontakte/android/data/VKList;

    invoke-direct {v3}, Lcom/vkontakte/android/data/VKList;-><init>()V

    .line 58
    .local v3, "vkList":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vk/music/dto/Playlist;>;"
    iget v4, v2, Lcom/vk/music/dto/Section;->count:I

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/data/VKList;->setTotal(I)V

    .line 59
    iget-object v4, v2, Lcom/vk/music/dto/Section;->playlists:Ljava/util/ArrayList;

    if-eqz v4, :cond_1

    .line 60
    iget-object v4, v2, Lcom/vk/music/dto/Section;->playlists:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/data/VKList;->addAll(Ljava/util/Collection;)Z

    .line 69
    .end local v2    # "section":Lcom/vk/music/dto/Section;
    .end local v3    # "vkList":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vk/music/dto/Playlist;>;"
    :cond_0
    :goto_0
    return-object v3

    .line 61
    .restart local v2    # "section":Lcom/vk/music/dto/Section;
    .restart local v3    # "vkList":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vk/music/dto/Playlist;>;"
    :cond_1
    iget-object v4, v2, Lcom/vk/music/dto/Section;->extendedPlaylists:Ljava/util/ArrayList;

    if-eqz v4, :cond_0

    .line 62
    iget-object v4, v2, Lcom/vk/music/dto/Section;->extendedPlaylists:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/music/dto/ExtendedPlaylist;

    .line 63
    .local v1, "extendedPlaylist":Lcom/vk/music/dto/ExtendedPlaylist;
    iget-object v5, v1, Lcom/vk/music/dto/ExtendedPlaylist;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/data/VKList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 67
    .end local v1    # "extendedPlaylist":Lcom/vk/music/dto/ExtendedPlaylist;
    .end local v2    # "section":Lcom/vk/music/dto/Section;
    .end local v3    # "vkList":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vk/music/dto/Playlist;>;"
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0, v4}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 69
    const/4 v3, 0x0

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
    .line 52
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$2;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;

    move-result-object v0

    return-object v0
.end method
