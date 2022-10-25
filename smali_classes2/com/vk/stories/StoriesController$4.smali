.class final Lcom/vk/stories/StoriesController$4;
.super Ljava/lang/Object;
.source "StoriesController.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/StoriesController;->loadNewStories()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vk/stories/model/GetStoriesResponse;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 205
    return-void
.end method

.method public success(Lcom/vk/stories/model/GetStoriesResponse;)V
    .locals 3
    .param p1, "result"    # Lcom/vk/stories/model/GetStoriesResponse;

    .prologue
    .line 198
    iget-object v0, p1, Lcom/vk/stories/model/GetStoriesResponse;->originalJsonObject:Lorg/json/JSONObject;

    invoke-static {v0}, Lcom/vk/stories/StoriesController;->setCachedStories(Lorg/json/JSONObject;)V

    .line 199
    invoke-static {}, Lcom/vk/stories/StoriesController;->access$000()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    const/16 v1, 0x65

    iget-object v2, p1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/vk/stories/StoriesController;->postProcessDisplayStoryList(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/events/NotificationCenter;->fireEvent(ILjava/lang/Object;)V

    .line 200
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 195
    check-cast p1, Lcom/vk/stories/model/GetStoriesResponse;

    invoke-virtual {p0, p1}, Lcom/vk/stories/StoriesController$4;->success(Lcom/vk/stories/model/GetStoriesResponse;)V

    return-void
.end method
