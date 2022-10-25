.class Lcom/vk/stories/view/StoryView$9;
.super Ljava/lang/Object;
.source "StoryView.java"

# interfaces
.implements Lcom/vk/core/view/SimpleVideoView$OnBufferingEventsListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/StoryView;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/view/StoryView;


# direct methods
.method constructor <init>(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 472
    iput-object p1, p0, Lcom/vk/stories/view/StoryView$9;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBufferingEnd(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 2
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 483
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$9;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0}, Lcom/vk/stories/view/StoryView;->access$600(Lcom/vk/stories/view/StoryView;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 484
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$9;->this$0:Lcom/vk/stories/view/StoryView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/view/StoryView;->access$1800(Lcom/vk/stories/view/StoryView;Z)V

    .line 486
    :cond_0
    return-void
.end method

.method public onBufferingStart(Lcom/google/android/exoplayer2/SimpleExoPlayer;)V
    .locals 1
    .param p1, "player"    # Lcom/google/android/exoplayer2/SimpleExoPlayer;

    .prologue
    .line 475
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$9;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0}, Lcom/vk/stories/view/StoryView;->access$600(Lcom/vk/stories/view/StoryView;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 476
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$9;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0}, Lcom/vk/stories/view/StoryView;->access$1600(Lcom/vk/stories/view/StoryView;)V

    .line 477
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$9;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0}, Lcom/vk/stories/view/StoryView;->access$1700(Lcom/vk/stories/view/StoryView;)V

    .line 479
    :cond_0
    return-void
.end method
