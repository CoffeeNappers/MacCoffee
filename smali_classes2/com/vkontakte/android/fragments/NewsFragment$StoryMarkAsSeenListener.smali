.class Lcom/vkontakte/android/fragments/NewsFragment$StoryMarkAsSeenListener;
.super Ljava/lang/Object;
.source "NewsFragment.java"

# interfaces
.implements Lcom/vk/attachpicker/events/NotificationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/NewsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StoryMarkAsSeenListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vk/attachpicker/events/NotificationListener",
        "<",
        "Lcom/vk/stories/model/StoryEntry;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/NewsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/NewsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 1234
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoryMarkAsSeenListener;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onNotification(IILcom/vk/stories/model/StoryEntry;)V
    .locals 6
    .param p1, "eventType"    # I
    .param p2, "eventId"    # I
    .param p3, "eventArgs"    # Lcom/vk/stories/model/StoryEntry;

    .prologue
    .line 1237
    if-nez p3, :cond_1

    .line 1265
    :cond_0
    :goto_0
    return-void

    .line 1240
    :cond_1
    iget-object v5, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoryMarkAsSeenListener;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/NewsFragment;->access$4000(Lcom/vkontakte/android/fragments/NewsFragment;)Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 1243
    iget-object v5, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoryMarkAsSeenListener;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/NewsFragment;->access$4000(Lcom/vkontakte/android/fragments/NewsFragment;)Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->access$4100(Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;)Lcom/vk/stories/model/GetStoriesResponse;

    move-result-object v2

    .line 1244
    .local v2, "r":Lcom/vk/stories/model/GetStoriesResponse;
    if-eqz v2, :cond_0

    iget-object v5, v2, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    if-eqz v5, :cond_0

    .line 1246
    iget-object v5, v2, Lcom/vk/stories/model/GetStoriesResponse;->originalJsonObject:Lorg/json/JSONObject;

    if-eqz v5, :cond_2

    .line 1247
    iget-object v5, v2, Lcom/vk/stories/model/GetStoriesResponse;->originalJsonObject:Lorg/json/JSONObject;

    invoke-static {v5, p3}, Lcom/vk/stories/StoriesController;->markStoryInJsonAsSeen(Lorg/json/JSONObject;Lcom/vk/stories/model/StoryEntry;)V

    .line 1251
    :cond_2
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1
    iget-object v5, v2, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v1, v5, :cond_0

    .line 1252
    iget-object v5, v2, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vk/stories/model/StoriesContainer;

    .line 1253
    .local v3, "sc":Lcom/vk/stories/model/StoriesContainer;
    invoke-virtual {v3}, Lcom/vk/stories/model/StoriesContainer;->hasValidStories()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1254
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v5, v3, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v0, v5, :cond_4

    .line 1255
    iget-object v5, v3, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vk/stories/model/StoryEntry;

    .line 1256
    .local v4, "se":Lcom/vk/stories/model/StoryEntry;
    invoke-virtual {p3, v4}, Lcom/vk/stories/model/StoryEntry;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1257
    const/4 v5, 0x1

    iput-boolean v5, v4, Lcom/vk/stories/model/StoryEntry;->seen:Z

    .line 1258
    iget-object v5, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoryMarkAsSeenListener;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/NewsFragment;->access$4000(Lcom/vkontakte/android/fragments/NewsFragment;)Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->notifyDataSetChanged()V

    goto :goto_0

    .line 1254
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1251
    .end local v0    # "i":I
    .end local v4    # "se":Lcom/vk/stories/model/StoryEntry;
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public bridge synthetic onNotification(IILjava/lang/Object;)V
    .locals 0

    .prologue
    .line 1234
    check-cast p3, Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/NewsFragment$StoryMarkAsSeenListener;->onNotification(IILcom/vk/stories/model/StoryEntry;)V

    return-void
.end method
