.class public Lcom/vkontakte/android/api/stories/StoriesGetById;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "StoriesGetById.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vk/stories/model/GetStoriesResponse;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 12
    const-string/jumbo v0, "stories.getById"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 13
    const-string/jumbo v0, "stories"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/stories/StoriesGetById;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 14
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "name,screen_name,photo_50,photo_100,photo_200,sex,verified,can_write_private_message"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/stories/StoriesGetById;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 15
    const-string/jumbo v0, "photo_sizes"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/api/stories/StoriesGetById;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 16
    const-string/jumbo v0, "extended"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/api/stories/StoriesGetById;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 17
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vk/stories/model/GetStoriesResponse;
    .locals 3
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 22
    :try_start_0
    const-string/jumbo v2, "response"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 23
    .local v0, "a":Lorg/json/JSONObject;
    new-instance v2, Lcom/vk/stories/model/GetStoriesResponse;

    invoke-direct {v2, v0}, Lcom/vk/stories/model/GetStoriesResponse;-><init>(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .end local v0    # "a":Lorg/json/JSONObject;
    :goto_0
    return-object v2

    .line 24
    :catch_0
    move-exception v1

    .line 25
    .local v1, "x":Ljava/lang/Exception;
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
    .line 9
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/stories/StoriesGetById;->parse(Lorg/json/JSONObject;)Lcom/vk/stories/model/GetStoriesResponse;

    move-result-object v0

    return-object v0
.end method
