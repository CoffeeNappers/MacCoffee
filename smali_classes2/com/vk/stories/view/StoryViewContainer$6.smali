.class Lcom/vk/stories/view/StoryViewContainer$6;
.super Ljava/lang/Object;
.source "StoryViewContainer.java"

# interfaces
.implements Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/StoryViewContainer;->initTouchListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/view/StoryViewContainer;


# direct methods
.method constructor <init>(Lcom/vk/stories/view/StoryViewContainer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 297
    iput-object p1, p0, Lcom/vk/stories/view/StoryViewContainer$6;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSwipeBottom()V
    .locals 1

    .prologue
    .line 317
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$6;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$1400(Lcom/vk/stories/view/StoryViewContainer;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 318
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$6;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$700(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/stories/view/StoryViewContainer$ControlCallback;->finish()V

    .line 320
    :cond_0
    return-void
.end method

.method public onSwipeLeft()V
    .locals 0

    .prologue
    .line 301
    return-void
.end method

.method public onSwipeRight()V
    .locals 0

    .prologue
    .line 313
    return-void
.end method

.method public onSwipeTop()V
    .locals 1

    .prologue
    .line 305
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$6;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$1400(Lcom/vk/stories/view/StoryViewContainer;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 306
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$6;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$700(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/stories/view/StoryViewContainer$ControlCallback;->finish()V

    .line 308
    :cond_0
    return-void
.end method
