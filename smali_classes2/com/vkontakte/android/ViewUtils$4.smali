.class final Lcom/vkontakte/android/ViewUtils$4;
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
.field canceled:Z

.field final synthetic val$view:Landroid/view/View;

.field final synthetic val$visibility:I


# direct methods
.method constructor <init>(Landroid/view/View;I)V
    .locals 1

    .prologue
    .line 655
    iput-object p1, p0, Lcom/vkontakte/android/ViewUtils$4;->val$view:Landroid/view/View;

    iput p2, p0, Lcom/vkontakte/android/ViewUtils$4;->val$visibility:I

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 656
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ViewUtils$4;->canceled:Z

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1
    .param p1, "anim"    # Landroid/animation/Animator;

    .prologue
    .line 675
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ViewUtils$4;->canceled:Z

    .line 676
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3
    .param p1, "anim"    # Landroid/animation/Animator;

    .prologue
    .line 664
    iget-object v0, p0, Lcom/vkontakte/android/ViewUtils$4;->val$view:Landroid/view/View;

    const v1, 0x7f100085

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 665
    invoke-static {}, Lcom/vkontakte/android/ViewUtils;->access$000()Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ViewUtils$4;->val$view:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 666
    iget-boolean v0, p0, Lcom/vkontakte/android/ViewUtils$4;->canceled:Z

    if-eqz v0, :cond_0

    .line 671
    :goto_0
    return-void

    .line 669
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ViewUtils$4;->val$view:Landroid/view/View;

    iget v1, p0, Lcom/vkontakte/android/ViewUtils$4;->val$visibility:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 670
    iget-object v0, p0, Lcom/vkontakte/android/ViewUtils$4;->val$view:Landroid/view/View;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    goto :goto_0
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0
    .param p1, "anim"    # Landroid/animation/Animator;

    .prologue
    .line 660
    return-void
.end method
