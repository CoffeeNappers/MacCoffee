.class public Lcom/vkontakte/android/api/stories/StoriesDeleteBan;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "StoriesDeleteBan.java"


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
.method public constructor <init>(I)V
    .locals 1
    .param p1, "ownerId"    # I

    .prologue
    .line 11
    const-string/jumbo v0, "execute.storiesDeleteBan"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 12
    const-string/jumbo v0, "owners_ids"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/stories/StoriesDeleteBan;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 13
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vk/stories/model/GetStoriesResponse;
    .locals 3
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 18
    :try_start_0
    const-string/jumbo v2, "response"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 19
    .local v0, "a":Lorg/json/JSONObject;
    new-instance v2, Lcom/vk/stories/model/GetStoriesResponse;

    invoke-direct {v2, v0}, Lcom/vk/stories/model/GetStoriesResponse;-><init>(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .end local v0    # "a":Lorg/json/JSONObject;
    :goto_0
    return-object v2

    .line 20
    :catch_0
    move-exception v1

    .line 21
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
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/stories/StoriesDeleteBan;->parse(Lorg/json/JSONObject;)Lcom/vk/stories/model/GetStoriesResponse;

    move-result-object v0

    return-object v0
.end method
