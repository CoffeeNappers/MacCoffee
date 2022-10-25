.class public Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "StoriesGetUploadServer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/vk/stories/model/StoryUploadParams;)V
    .locals 4
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # Lcom/vk/stories/model/StoryUploadParams;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 22
    invoke-virtual {p2}, Lcom/vk/stories/model/StoryUploadParams;->getMaskId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 23
    const-string/jumbo v0, "mask_id"

    invoke-virtual {p2}, Lcom/vk/stories/model/StoryUploadParams;->getMaskId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 25
    :cond_0
    invoke-virtual {p2}, Lcom/vk/stories/model/StoryUploadParams;->getSectionId()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 26
    const-string/jumbo v0, "section_id"

    invoke-virtual {p2}, Lcom/vk/stories/model/StoryUploadParams;->getSectionId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 28
    :cond_1
    invoke-virtual {p2}, Lcom/vk/stories/model/StoryUploadParams;->getLocation()Landroid/location/Location;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 29
    const-string/jumbo v0, "latitude"

    invoke-virtual {p2}, Lcom/vk/stories/model/StoryUploadParams;->getLocation()Landroid/location/Location;

    move-result-object v1

    invoke-virtual {v1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 30
    const-string/jumbo v0, "longitude"

    invoke-virtual {p2}, Lcom/vk/stories/model/StoryUploadParams;->getLocation()Landroid/location/Location;

    move-result-object v1

    invoke-virtual {v1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 32
    :cond_2
    invoke-virtual {p2}, Lcom/vk/stories/model/StoryUploadParams;->getUserIds()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {p2}, Lcom/vk/stories/model/StoryUploadParams;->getUserIds()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 33
    const-string/jumbo v0, "user_ids"

    const-string/jumbo v1, ","

    invoke-virtual {p2}, Lcom/vk/stories/model/StoryUploadParams;->getUserIds()Ljava/util/ArrayList;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 35
    :cond_3
    invoke-virtual {p2}, Lcom/vk/stories/model/StoryUploadParams;->getCameraType()Lcom/vk/stories/model/StoryUploadParams$CameraType;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 36
    const-string/jumbo v0, "camera_type"

    invoke-virtual {p2}, Lcom/vk/stories/model/StoryUploadParams;->getCameraType()Lcom/vk/stories/model/StoryUploadParams$CameraType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/stories/model/StoryUploadParams$CameraType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 38
    :cond_4
    const-string/jumbo v1, "add_to_news"

    invoke-virtual {p2}, Lcom/vk/stories/model/StoryUploadParams;->isAddToNews()Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 39
    return-void

    .line 38
    :cond_5
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getPhotoUploadServer(Lcom/vk/stories/model/StoryUploadParams;)Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;
    .locals 2
    .param p0, "params"    # Lcom/vk/stories/model/StoryUploadParams;

    .prologue
    .line 13
    new-instance v0, Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;

    const-string/jumbo v1, "stories.getPhotoUploadServer"

    invoke-direct {v0, v1, p0}, Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;-><init>(Ljava/lang/String;Lcom/vk/stories/model/StoryUploadParams;)V

    return-object v0
.end method

.method public static getVideoUploadServer(Lcom/vk/stories/model/StoryUploadParams;)Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;
    .locals 2
    .param p0, "params"    # Lcom/vk/stories/model/StoryUploadParams;

    .prologue
    .line 17
    new-instance v0, Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;

    const-string/jumbo v1, "stories.getVideoUploadServer"

    invoke-direct {v0, v1, p0}, Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;-><init>(Ljava/lang/String;Lcom/vk/stories/model/StoryUploadParams;)V

    return-object v0
.end method


# virtual methods
.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 10
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;->parse(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 43
    :try_start_0
    const-string/jumbo v0, "response"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string/jumbo v1, "upload_url"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 46
    :goto_0
    return-object v0

    .line 44
    :catch_0
    move-exception v0

    .line 46
    const/4 v0, 0x0

    goto :goto_0
.end method
