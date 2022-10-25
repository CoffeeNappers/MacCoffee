.class public Lcom/vk/stories/StoryViewActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "StoryViewActivity.java"

# interfaces
.implements Lcom/vk/stories/view/StoryViewContainer$ControlCallback;


# static fields
.field public static final INTENT_GET_STORIES_RESPONSE:Ljava/lang/String; = "get_stories_response"

.field public static final INTENT_OPEN_STORY:Ljava/lang/String; = "open_story"

.field public static final INTENT_OPEN_STORY_OWNER_ID:Ljava/lang/String; = "open_story_uid"

.field public static final INTENT_SOURCE_TYPE:Ljava/lang/String; = "source_type"


# instance fields
.field private storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vk/stories/StoryViewActivity;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v0, p1}, Lcom/vk/stories/view/StoryViewContainer;->doDispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 38
    const/4 v0, 0x1

    .line 40
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public noDragGestureInProgress()Z
    .locals 1

    .prologue
    .line 79
    const/4 v0, 0x0

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vk/stories/StoryViewActivity;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vk/stories/view/StoryViewContainer;->onActivityResult(IILandroid/content/Intent;)V

    .line 47
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 24
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    invoke-virtual {p0}, Lcom/vk/stories/StoryViewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "get_stories_response"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    .line 27
    .local v5, "storiesContainers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    invoke-virtual {p0}, Lcom/vk/stories/StoryViewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "open_story_uid"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    .line 28
    .local v6, "openStoryUid":I
    invoke-virtual {p0}, Lcom/vk/stories/StoryViewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "open_story"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 29
    .local v7, "openStory":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/vk/stories/StoryViewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "source_type"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v8

    check-cast v8, Lcom/vk/stories/StoriesController$SourceType;

    .line 31
    .local v8, "sourceType":Lcom/vk/stories/StoriesController$SourceType;
    new-instance v0, Lcom/vk/stories/view/StoryViewContainer;

    if-nez v8, :cond_0

    sget-object v2, Lcom/vk/stories/StoriesController$SourceType;->SNIPPET:Lcom/vk/stories/StoriesController$SourceType;

    :goto_0
    const/4 v3, 0x1

    move-object v1, p0

    move-object v4, p0

    invoke-direct/range {v0 .. v7}, Lcom/vk/stories/view/StoryViewContainer;-><init>(Landroid/content/Context;Lcom/vk/stories/StoriesController$SourceType;ZLcom/vk/stories/view/StoryViewContainer$ControlCallback;Ljava/util/ArrayList;ILjava/lang/String;)V

    iput-object v0, p0, Lcom/vk/stories/StoryViewActivity;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    .line 32
    iget-object v0, p0, Lcom/vk/stories/StoryViewActivity;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {p0, v0}, Lcom/vk/stories/StoryViewActivity;->setContentView(Landroid/view/View;)V

    .line 33
    return-void

    :cond_0
    move-object v2, v8

    .line 31
    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/vk/stories/StoryViewActivity;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer;->onDestroy()V

    .line 64
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onDestroy()V

    .line 65
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vk/stories/StoryViewActivity;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer;->onPause()V

    .line 58
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onPause()V

    .line 59
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 51
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onResume()V

    .line 52
    iget-object v0, p0, Lcom/vk/stories/StoryViewActivity;->storyViewContainer:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer;->onResume()V

    .line 53
    return-void
.end method

.method public scrollStoriesListToAuthorId(I)V
    .locals 0
    .param p1, "uid"    # I

    .prologue
    .line 75
    return-void
.end method

.method public startForResult(Landroid/content/Intent;I)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "requestCode"    # I

    .prologue
    .line 69
    invoke-virtual {p0, p1, p2}, Lcom/vk/stories/StoryViewActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 70
    return-void
.end method
