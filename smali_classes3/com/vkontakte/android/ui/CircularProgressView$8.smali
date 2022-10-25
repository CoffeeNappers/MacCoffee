.class Lcom/vkontakte/android/ui/CircularProgressView$8;
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


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/CircularProgressView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/CircularProgressView;

    .prologue
    .line 442
    iput-object p1, p0, Lcom/vkontakte/android/ui/CircularProgressView$8;->this$0:Lcom/vkontakte/android/ui/CircularProgressView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/ValueAnimator;

    .prologue
    .line 445
    iget-object v1, p0, Lcom/vkontakte/android/ui/CircularProgressView$8;->this$0:Lcom/vkontakte/android/ui/CircularProgressView;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-static {v1, v0}, Lcom/vkontakte/android/ui/CircularProgressView;->access$302(Lcom/vkontakte/android/ui/CircularProgressView;F)F

    .line 446
    return-void
.end method
