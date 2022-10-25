.class Lcom/vk/stories/view/StoryViewContainer$4;
.super Landroid/animation/AnimatorListenerAdapter;
.source "StoryViewContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/StoryViewContainer;->showStory(Lcom/vk/stories/model/GetStoriesResponse;)V
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
    .line 251
    iput-object p1, p0, Lcom/vk/stories/view/StoryViewContainer$4;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 254
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$4;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$900(Lcom/vk/stories/view/StoryViewContainer;)Landroid/widget/FrameLayout;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 255
    return-void
.end method
