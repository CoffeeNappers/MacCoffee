.class Lcom/vkontakte/android/ui/CircularProgressView$7;
.super Ljava/lang/Object;
.source "CircularProgressView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/CircularProgressView;->createIndeterminateAnimator(F)Landroid/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/CircularProgressView;

.field final synthetic val$maxSweep:F

.field final synthetic val$start:F


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/CircularProgressView;FF)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/CircularProgressView;

    .prologue
    .line 429
    iput-object p1, p0, Lcom/vkontakte/android/ui/CircularProgressView$7;->this$0:Lcom/vkontakte/android/ui/CircularProgressView;

    iput p2, p0, Lcom/vkontakte/android/ui/CircularProgressView$7;->val$maxSweep:F

    iput p3, p0, Lcom/vkontakte/android/ui/CircularProgressView$7;->val$start:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3
    .param p1, "animation"    # Landroid/animation/ValueAnimator;

    .prologue
    .line 432
    iget-object v1, p0, Lcom/vkontakte/android/ui/CircularProgressView$7;->this$0:Lcom/vkontakte/android/ui/CircularProgressView;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-static {v1, v0}, Lcom/vkontakte/android/ui/CircularProgressView;->access$102(Lcom/vkontakte/android/ui/CircularProgressView;F)F

    .line 433
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView$7;->this$0:Lcom/vkontakte/android/ui/CircularProgressView;

    iget v1, p0, Lcom/vkontakte/android/ui/CircularProgressView$7;->val$maxSweep:F

    iget-object v2, p0, Lcom/vkontakte/android/ui/CircularProgressView$7;->this$0:Lcom/vkontakte/android/ui/CircularProgressView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/CircularProgressView;->access$100(Lcom/vkontakte/android/ui/CircularProgressView;)F

    move-result v2

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/vkontakte/android/ui/CircularProgressView$7;->val$start:F

    add-float/2addr v1, v2

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/CircularProgressView;->access$202(Lcom/vkontakte/android/ui/CircularProgressView;F)F

    .line 434
    iget-object v0, p0, Lcom/vkontakte/android/ui/CircularProgressView$7;->this$0:Lcom/vkontakte/android/ui/CircularProgressView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/CircularProgressView;->invalidate()V

    .line 435
    return-void
.end method
