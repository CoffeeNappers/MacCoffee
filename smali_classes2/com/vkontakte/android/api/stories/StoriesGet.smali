.class public Lcom/vkontakte/android/api/stories/StoriesGet;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "StoriesGet.java"


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
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 10
    const-string/jumbo v0, "stories.get"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 11
    const-string/jumbo v0, "extended"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/stories/StoriesGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    const-string/jumbo v0, "photo_sizes"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/stories/StoriesGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 13
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "name,screen_name,photo_50,photo_100,photo_200,sex,verified,can_write_private_message"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/stories/StoriesGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 14
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vk/stories/model/GetStoriesResponse;
    .locals 3
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 19
    :try_start_0
    const-string/jumbo v2, "response"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 20
    .local v0, "a":Lorg/json/JSONObject;
    new-instance v2, Lcom/vk/stories/model/GetStoriesResponse;

    invoke-direct {v2, v0}, Lcom/vk/stories/model/GetStoriesResponse;-><init>(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .end local v0    # "a":Lorg/json/JSONObject;
    :goto_0
    return-object v2

    .line 21
    :catch_0
    move-exception v1

    .line 22
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
    .line 8
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/stories/StoriesGet;->parse(Lorg/json/JSONObject;)Lcom/vk/stories/model/GetStoriesResponse;

    move-result-object v0

    return-object v0
.end method
