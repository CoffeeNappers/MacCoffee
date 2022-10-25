.class final Lcom/vk/stories/StoriesController$2;
.super Ljava/lang/Object;
.source "StoriesController.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/StoriesController;->unbanUser(ILandroid/content/Context;Lcom/vkontakte/android/api/Callback;)V
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


# instance fields
.field final synthetic val$callback:Lcom/vkontakte/android/api/Callback;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/Callback;)V
    .locals 0

    .prologue
    .line 128
    iput-object p1, p0, Lcom/vk/stories/StoriesController$2;->val$callback:Lcom/vkontakte/android/api/Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 140
    iget-object v0, p0, Lcom/vk/stories/StoriesController$2;->val$callback:Lcom/vkontakte/android/api/Callback;

    if-eqz v0, :cond_0

    .line 141
    iget-object v0, p0, Lcom/vk/stories/StoriesController$2;->val$callback:Lcom/vkontakte/android/api/Callback;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/api/Callback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 143
    :cond_0
    return-void
.end method

.method public success(Lcom/vk/stories/model/GetStoriesResponse;)V
    .locals 3
    .param p1, "result"    # Lcom/vk/stories/model/GetStoriesResponse;

    .prologue
    .line 131
    iget-object v0, p1, Lcom/vk/stories/model/GetStoriesResponse;->originalJsonObject:Lorg/json/JSONObject;

    invoke-static {v0}, Lcom/vk/stories/StoriesController;->setCachedStories(Lorg/json/JSONObject;)V

    .line 132
    invoke-static {}, Lcom/vk/stories/StoriesController;->access$000()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    const/16 v1, 0x65

    iget-object v2, p1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/vk/stories/StoriesController;->postProcessDisplayStoryList(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/events/NotificationCenter;->fireEvent(ILjava/lang/Object;)V

    .line 133
    iget-object v0, p0, Lcom/vk/stories/StoriesController$2;->val$callback:Lcom/vkontakte/android/api/Callback;

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lcom/vk/stories/StoriesController$2;->val$callback:Lcom/vkontakte/android/api/Callback;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/api/Callback;->success(Ljava/lang/Object;)V

    .line 136
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 128
    check-cast p1, Lcom/vk/stories/model/GetStoriesResponse;

    invoke-virtual {p0, p1}, Lcom/vk/stories/StoriesController$2;->success(Lcom/vk/stories/model/GetStoriesResponse;)V

    return-void
.end method
