.class Lcom/vk/core/widget/ViewShower$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ViewShower.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/core/widget/ViewShower;->hide(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/core/widget/ViewShower;

.field final synthetic val$setGoneAfter:Z

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vk/core/widget/ViewShower;Landroid/view/View;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/core/widget/ViewShower;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/vk/core/widget/ViewShower$2;->this$0:Lcom/vk/core/widget/ViewShower;

    iput-object p2, p0, Lcom/vk/core/widget/ViewShower$2;->val$v:Landroid/view/View;

    iput-boolean p3, p0, Lcom/vk/core/widget/ViewShower$2;->val$setGoneAfter:Z

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/vk/core/widget/ViewShower$2;->this$0:Lcom/vk/core/widget/ViewShower;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/core/widget/ViewShower;->access$102(Lcom/vk/core/widget/ViewShower;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 77
    iget-object v0, p0, Lcom/vk/core/widget/ViewShower$2;->this$0:Lcom/vk/core/widget/ViewShower;

    iget-object v1, p0, Lcom/vk/core/widget/ViewShower$2;->val$v:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/vk/core/widget/ViewShower;->dropViewState(Landroid/view/View;)V

    .line 78
    iget-boolean v0, p0, Lcom/vk/core/widget/ViewShower$2;->val$setGoneAfter:Z

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/vk/core/widget/ViewShower$2;->val$v:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 81
    :cond_0
    return-void
.end method
