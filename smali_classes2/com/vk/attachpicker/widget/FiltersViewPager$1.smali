.class Lcom/vk/attachpicker/widget/FiltersViewPager$1;
.super Ljava/lang/Object;
.source "FiltersViewPager.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/widget/FiltersViewPager;->lambda$showFakeSwipe$0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field prevValue:F

.field final synthetic this$0:Lcom/vk/attachpicker/widget/FiltersViewPager;

.field final synthetic val$targetSwipe:F


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/widget/FiltersViewPager;F)V
    .locals 1
    .param p1, "this$0"    # Lcom/vk/attachpicker/widget/FiltersViewPager;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/vk/attachpicker/widget/FiltersViewPager$1;->this$0:Lcom/vk/attachpicker/widget/FiltersViewPager;

    iput p2, p0, Lcom/vk/attachpicker/widget/FiltersViewPager$1;->val$targetSwipe:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/attachpicker/widget/FiltersViewPager$1;->prevValue:F

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 5
    .param p1, "animation"    # Landroid/animation/ValueAnimator;

    .prologue
    .line 64
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 65
    .local v1, "v":F
    iget v2, p0, Lcom/vk/attachpicker/widget/FiltersViewPager$1;->prevValue:F

    sub-float v0, v1, v2

    .line 66
    .local v0, "delta":F
    iput v1, p0, Lcom/vk/attachpicker/widget/FiltersViewPager$1;->prevValue:F

    .line 68
    iget-object v2, p0, Lcom/vk/attachpicker/widget/FiltersViewPager$1;->this$0:Lcom/vk/attachpicker/widget/FiltersViewPager;

    invoke-virtual {v2}, Lcom/vk/attachpicker/widget/FiltersViewPager;->isFakeDragging()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 69
    iget-object v2, p0, Lcom/vk/attachpicker/widget/FiltersViewPager$1;->this$0:Lcom/vk/attachpicker/widget/FiltersViewPager;

    neg-float v3, v0

    iget v4, p0, Lcom/vk/attachpicker/widget/FiltersViewPager$1;->val$targetSwipe:F

    mul-float/2addr v3, v4

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/widget/FiltersViewPager;->fakeDragBy(F)V

    .line 71
    :cond_0
    return-void
.end method
