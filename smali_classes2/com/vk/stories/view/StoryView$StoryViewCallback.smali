.class public interface abstract Lcom/vk/stories/view/StoryView$StoryViewCallback;
.super Ljava/lang/Object;
.source "StoryView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/view/StoryView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "StoryViewCallback"
.end annotation


# virtual methods
.method public abstract deleteStory(Lcom/vk/stories/model/StoriesContainer;)V
.end method

.method public abstract finish()V
.end method

.method public abstract getCurrentIdlePagerPosition()I
.end method

.method public abstract nextStory()V
.end method

.method public abstract prevStory()V
.end method

.method public abstract shareStory(Ljava/lang/String;Ljava/lang/String;Lcom/vk/stories/model/StoryEntry;)V
.end method
