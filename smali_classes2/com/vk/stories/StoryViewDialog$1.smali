.class Lcom/vk/stories/StoryViewDialog$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "StoryViewDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/StoryViewDialog;->startOpenAnimation(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/StoryViewDialog;


# direct methods
.method constructor <init>(Lcom/vk/stories/StoryViewDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/StoryViewDialog;

    .prologue
    .line 159
    iput-object p1, p0, Lcom/vk/stories/StoryViewDialog$1;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 9
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v7, 0x0

    const/4 v3, 0x0

    .line 162
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$1;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0, v3}, Lcom/vk/stories/StoryViewDialog;->access$002(Lcom/vk/stories/StoryViewDialog;Z)Z

    .line 164
    iget-object v8, p0, Lcom/vk/stories/StoryViewDialog$1;->this$0:Lcom/vk/stories/StoryViewDialog;

    new-instance v0, Lcom/vk/stories/view/StoryViewContainer;

    iget-object v1, p0, Lcom/vk/stories/StoryViewDialog$1;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v1}, Lcom/vk/stories/StoryViewDialog;->access$200(Lcom/vk/stories/StoryViewDialog;)Landroid/app/Activity;

    move-result-object v1

    sget-object v2, Lcom/vk/stories/StoriesController$SourceType;->LIST:Lcom/vk/stories/StoriesController$SourceType;

    iget-object v4, p0, Lcom/vk/stories/StoryViewDialog$1;->this$0:Lcom/vk/stories/StoryViewDialog;

    iget-object v5, p0, Lcom/vk/stories/StoryViewDialog$1;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v5}, Lcom/vk/stories/StoryViewDialog;->access$300(Lcom/vk/stories/StoryViewDialog;)Ljava/util/ArrayList;

    move-result-object v5

    iget-object v6, p0, Lcom/vk/stories/StoryViewDialog$1;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v6}, Lcom/vk/stories/StoryViewDialog;->access$400(Lcom/vk/stories/StoryViewDialog;)I

    move-result v6

    invoke-direct/range {v0 .. v7}, Lcom/vk/stories/view/StoryViewContainer;-><init>(Landroid/content/Context;Lcom/vk/stories/StoriesController$SourceType;ZLcom/vk/stories/view/StoryViewContainer$ControlCallback;Ljava/util/ArrayList;ILjava/lang/String;)V

    invoke-static {v8, v0}, Lcom/vk/stories/StoryViewDialog;->access$102(Lcom/vk/stories/StoryViewDialog;Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/stories/view/StoryViewContainer;

    .line 165
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$1;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->access$500(Lcom/vk/stories/StoryViewDialog;)Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;->removeAllViews()V

    .line 166
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$1;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->access$500(Lcom/vk/stories/StoryViewDialog;)Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/StoryViewDialog$1;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v1}, Lcom/vk/stories/StoryViewDialog;->access$100(Lcom/vk/stories/StoryViewDialog;)Lcom/vk/stories/view/StoryViewContainer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;->addView(Landroid/view/View;)V

    .line 167
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$1;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->access$100(Lcom/vk/stories/StoryViewDialog;)Lcom/vk/stories/view/StoryViewContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer;->onResume()V

    .line 169
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$1;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0, v7}, Lcom/vk/stories/StoryViewDialog;->access$602(Lcom/vk/stories/StoryViewDialog;Lcom/vk/stories/view/StoryView;)Lcom/vk/stories/view/StoryView;

    .line 170
    return-void
.end method
