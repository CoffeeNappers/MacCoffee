.class Lcom/vk/stories/StoryViewDialog$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "StoryViewDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/StoryViewDialog;->animateToDefaultPosition()V
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
    .line 231
    iput-object p1, p0, Lcom/vk/stories/StoryViewDialog$3;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/high16 v2, 0x3f800000    # 1.0f

    .line 234
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$3;->this$0:Lcom/vk/stories/StoryViewDialog;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/StoryViewDialog;->access$802(Lcom/vk/stories/StoryViewDialog;F)F

    .line 235
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$3;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->access$900(Lcom/vk/stories/StoryViewDialog;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 236
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$3;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->access$900(Lcom/vk/stories/StoryViewDialog;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V

    .line 237
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$3;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->access$900(Lcom/vk/stories/StoryViewDialog;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleY(F)V

    .line 239
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$3;->this$0:Lcom/vk/stories/StoryViewDialog;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/StoryViewDialog;->access$902(Lcom/vk/stories/StoryViewDialog;Landroid/view/View;)Landroid/view/View;

    .line 240
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$3;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->access$100(Lcom/vk/stories/StoryViewDialog;)Lcom/vk/stories/view/StoryViewContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer;->playStory()V

    .line 241
    return-void
.end method
