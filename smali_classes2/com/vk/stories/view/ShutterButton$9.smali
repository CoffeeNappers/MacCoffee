.class Lcom/vk/stories/view/ShutterButton$9;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ShutterButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/ShutterButton;->toMasksShutter(Z)Landroid/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/view/ShutterButton;


# direct methods
.method constructor <init>(Lcom/vk/stories/view/ShutterButton;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/view/ShutterButton;

    .prologue
    .line 449
    iput-object p1, p0, Lcom/vk/stories/view/ShutterButton$9;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v2, 0x0

    .line 452
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton$9;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v0, v2}, Lcom/vk/stories/view/ShutterButton;->setForwardArrowAlpha(F)V

    .line 453
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton$9;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-static {}, Lcom/vk/stories/view/ShutterButton;->access$200()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/ShutterButton;->setCircleRadius(F)V

    .line 454
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton$9;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-static {}, Lcom/vk/stories/view/ShutterButton;->access$300()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/ShutterButton;->setBorderSize(F)V

    .line 455
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton$9;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v0, v2}, Lcom/vk/stories/view/ShutterButton;->setRedProgress(F)V

    .line 456
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton$9;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {v0, v2}, Lcom/vk/stories/view/ShutterButton;->setRedProgressAlpha(F)V

    .line 457
    return-void
.end method
