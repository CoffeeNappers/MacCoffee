.class final Lcom/vk/stories/StoriesController$5;
.super Ljava/lang/Object;
.source "StoriesController.java"

# interfaces
.implements Lbolts/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/StoriesController;->reloadStoriesFromCache()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lbolts/Continuation",
        "<",
        "Lcom/vk/stories/model/GetStoriesResponse;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 214
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic then(Lbolts/Task;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 214
    invoke-virtual {p0, p1}, Lcom/vk/stories/StoriesController$5;->then(Lbolts/Task;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public then(Lbolts/Task;)Ljava/lang/Void;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lbolts/Task",
            "<",
            "Lcom/vk/stories/model/GetStoriesResponse;",
            ">;)",
            "Ljava/lang/Void;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 217
    .local p1, "task":Lbolts/Task;, "Lbolts/Task<Lcom/vk/stories/model/GetStoriesResponse;>;"
    invoke-virtual {p1}, Lbolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/GetStoriesResponse;

    .line 218
    .local v0, "res":Lcom/vk/stories/model/GetStoriesResponse;
    if-eqz v0, :cond_0

    .line 219
    invoke-static {}, Lcom/vk/stories/StoriesController;->access$000()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v1

    const/16 v2, 0x65

    iget-object v3, v0, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-static {v3}, Lcom/vk/stories/StoriesController;->postProcessDisplayStoryList(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/vk/attachpicker/events/NotificationCenter;->fireEvent(ILjava/lang/Object;)V

    .line 221
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method
