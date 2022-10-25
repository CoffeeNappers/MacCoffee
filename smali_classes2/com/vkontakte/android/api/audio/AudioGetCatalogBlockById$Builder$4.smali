.class Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$4;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AudioGetCatalogBlockById.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->buildAudios()Lcom/vkontakte/android/api/VKAPIRequest;
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
        "Lcom/vkontakte/android/audio/MusicTrack;",
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
    .line 100
    iput-object p1, p0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$4;->this$0:Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;
    .locals 4
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 104
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$4;->this$0:Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;

    invoke-static {v3, p1}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->access$000(Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;Lorg/json/JSONObject;)Lcom/vk/music/dto/Section;

    move-result-object v1

    .line 105
    .local v1, "section":Lcom/vk/music/dto/Section;
    new-instance v2, Lcom/vkontakte/android/data/VKList;

    invoke-direct {v2}, Lcom/vkontakte/android/data/VKList;-><init>()V

    .line 106
    .local v2, "vkList":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget v3, v1, Lcom/vk/music/dto/Section;->count:I

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/data/VKList;->setTotal(I)V

    .line 107
    iget-object v3, v1, Lcom/vk/music/dto/Section;->audios:Ljava/util/ArrayList;

    if-eqz v3, :cond_0

    .line 108
    iget-object v3, v1, Lcom/vk/music/dto/Section;->audios:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/data/VKList;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    .end local v1    # "section":Lcom/vk/music/dto/Section;
    .end local v2    # "vkList":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_0
    :goto_0
    return-object v2

    .line 111
    :catch_0
    move-exception v0

    .line 112
    .local v0, "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 113
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
    .line 100
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$4;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;

    move-result-object v0

    return-object v0
.end method
