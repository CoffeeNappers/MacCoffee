.class Lcom/vkontakte/android/ui/CircularProgressView$4;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CircularProgressView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/CircularProgressView;->resetAnimation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/CircularProgressView;

.field wasCancelled:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/CircularProgressView;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/CircularProgressView;

    .prologue
    .line 356
    iput-object p1, p0, Lcom/vkontakte/android/ui/CircularProgressView$4;->this$0:Lcom/vkontakte/android/ui/CircularProgressView;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 357
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/CircularProgressView$4;->wasCancelled:Z

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 361
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/CircularProgressView$4;->wasCancelled:Z

    .line 362
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 366
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/CircularProgressView$4;->wasCancelled:Z

    if-nez v0, :cond_0

    .line 367
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView$4;->this$0:Lcom/vkontakte/android/ui/CircularProgressView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/CircularProgressView;->resetAnimation()V

    .line 368
    :cond_0
    return-void
.end method
