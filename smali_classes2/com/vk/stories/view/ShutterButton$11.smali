.class Lcom/vk/stories/view/ShutterButton$11;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ShutterButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/ShutterButton;->createAnimatorSet()Landroid/animation/AnimatorSet;
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
    .line 496
    iput-object p1, p0, Lcom/vk/stories/view/ShutterButton$11;->this$0:Lcom/vk/stories/view/ShutterButton;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 499
    invoke-virtual {p0, p1}, Lcom/vk/stories/view/ShutterButton$11;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 500
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 504
    iget-object v0, p0, Lcom/vk/stories/view/ShutterButton$11;->this$0:Lcom/vk/stories/view/ShutterButton;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/view/ShutterButton;->access$402(Lcom/vk/stories/view/ShutterButton;Landroid/animation/AnimatorSet;)Landroid/animation/AnimatorSet;

    .line 505
    return-void
.end method
