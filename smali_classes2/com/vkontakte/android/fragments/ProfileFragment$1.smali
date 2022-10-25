.class Lcom/vkontakte/android/fragments/ProfileFragment$1;
.super Ljava/lang/Object;
.source "ProfileFragment.java"

# interfaces
.implements Lcom/vk/attachpicker/events/NotificationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 247
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$1;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

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
    .line 250
    if-nez p3, :cond_1

    .line 269
    :cond_0
    :goto_0
    return-void

    .line 253
    :cond_1
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$1;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v5

    iget-object v2, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->storiesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    .line 254
    .local v2, "r":Lcom/vk/stories/model/GetStoriesResponse;
    if-eqz v2, :cond_0

    iget-object v5, v2, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    if-eqz v5, :cond_0

    .line 256
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1
    iget-object v5, v2, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v1, v5, :cond_0

    .line 257
    iget-object v5, v2, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vk/stories/model/StoriesContainer;

    .line 258
    .local v3, "sc":Lcom/vk/stories/model/StoriesContainer;
    invoke-virtual {v3}, Lcom/vk/stories/model/StoriesContainer;->hasValidStories()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 259
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v5, v3, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v0, v5, :cond_3

    .line 260
    iget-object v5, v3, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vk/stories/model/StoryEntry;

    .line 261
    .local v4, "se":Lcom/vk/stories/model/StoryEntry;
    invoke-virtual {p3, v4}, Lcom/vk/stories/model/StoryEntry;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 262
    const/4 v5, 0x1

    iput-boolean v5, v4, Lcom/vk/stories/model/StoryEntry;->seen:Z

    goto :goto_0

    .line 259
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 256
    .end local v0    # "i":I
    .end local v4    # "se":Lcom/vk/stories/model/StoryEntry;
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public bridge synthetic onNotification(IILjava/lang/Object;)V
    .locals 0

    .prologue
    .line 247
    check-cast p3, Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/ProfileFragment$1;->onNotification(IILcom/vk/stories/model/StoryEntry;)V

    return-void
.end method
