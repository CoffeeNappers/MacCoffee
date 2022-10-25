.class final Lcom/vkontakte/android/ViewUtils$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ViewUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$view:Landroid/view/View;

.field final synthetic val$visibility:I


# direct methods
.method constructor <init>(Landroid/view/View;I)V
    .locals 0

    .prologue
    .line 633
    iput-object p1, p0, Lcom/vkontakte/android/ViewUtils$3;->val$view:Landroid/view/View;

    iput p2, p0, Lcom/vkontakte/android/ViewUtils$3;->val$visibility:I

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "anim"    # Landroid/animation/Animator;

    .prologue
    .line 646
    iget-object v0, p0, Lcom/vkontakte/android/ViewUtils$3;->val$view:Landroid/view/View;

    iget v1, p0, Lcom/vkontakte/android/ViewUtils$3;->val$visibility:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 648
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "anim"    # Landroid/animation/Animator;

    .prologue
    .line 640
    iget-object v0, p0, Lcom/vkontakte/android/ViewUtils$3;->val$view:Landroid/view/View;

    iget v1, p0, Lcom/vkontakte/android/ViewUtils$3;->val$visibility:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 642
    invoke-static {}, Lcom/vkontakte/android/ViewUtils;->access$000()Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ViewUtils$3;->val$view:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 643
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "anim"    # Landroid/animation/Animator;

    .prologue
    .line 635
    iget-object v0, p0, Lcom/vkontakte/android/ViewUtils$3;->val$view:Landroid/view/View;

    iget v1, p0, Lcom/vkontakte/android/ViewUtils$3;->val$visibility:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 637
    return-void
.end method
