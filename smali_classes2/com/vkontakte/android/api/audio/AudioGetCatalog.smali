.class public Lcom/vkontakte/android/api/audio/AudioGetCatalog;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "AudioGetCatalog.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/ListAPIRequest",
        "<",
        "Lcom/vk/music/dto/Section;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 15
    const-string/jumbo v0, "audio.getCatalog"

    const-class v1, Lcom/vk/music/dto/Section;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 16
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "first_name_gen,photo_50,photo_100,photo_200"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetCatalog;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 17
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
            "Lcom/vk/music/dto/Section;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 21
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/ListAPIRequest;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;

    move-result-object v1

    .line 22
    .local v1, "list":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vk/music/dto/Section;>;"
    invoke-virtual {v1}, Lcom/vkontakte/android/data/VKList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 23
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vk/music/dto/Section;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/music/dto/Section;

    iget-object v2, v2, Lcom/vk/music/dto/Section;->type:Lcom/vk/music/dto/Section$Type;

    sget-object v3, Lcom/vk/music/dto/Section$Type;->unknown:Lcom/vk/music/dto/Section$Type;

    if-ne v2, v3, :cond_0

    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 28
    :cond_1
    return-object v1
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
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/audio/AudioGetCatalog;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;

    move-result-object v0

    return-object v0
.end method
