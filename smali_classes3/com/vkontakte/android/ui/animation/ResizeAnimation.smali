.class public Lcom/vkontakte/android/ui/animation/ResizeAnimation;
.super Landroid/view/animation/Animation;
.source "ResizeAnimation.java"


# instance fields
.field private final mFromHeight:F

.field private final mFromWidth:F

.field private final mToHeight:F

.field private final mToWidth:F

.field private final mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;FFFF)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "fromWidth"    # F
    .param p3, "fromHeight"    # F
    .param p4, "toWidth"    # F
    .param p5, "toHeight"    # F

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    .line 16
    iput p5, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mToHeight:F

    .line 17
    iput p4, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mToWidth:F

    .line 18
    iput p3, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mFromHeight:F

    .line 19
    iput p2, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mFromWidth:F

    .line 20
    iput-object p1, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mView:Landroid/view/View;

    .line 21
    const-wide/16 v0, 0x12c

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->setDuration(J)V

    .line 22
    return-void
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 5
    .param p1, "interpolatedTime"    # F
    .param p2, "t"    # Landroid/view/animation/Transformation;

    .prologue
    .line 26
    iget v3, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mToHeight:F

    iget v4, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mFromHeight:F

    sub-float/2addr v3, v4

    mul-float/2addr v3, p1

    iget v4, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mFromHeight:F

    add-float v0, v3, v4

    .line 27
    .local v0, "height":F
    iget v3, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mToWidth:F

    iget v4, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mFromWidth:F

    sub-float/2addr v3, v4

    mul-float/2addr v3, p1

    iget v4, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mFromWidth:F

    add-float v2, v3, v4

    .line 28
    .local v2, "width":F
    iget-object v3, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 29
    .local v1, "p":Landroid/view/ViewGroup$LayoutParams;
    float-to-int v3, v0

    iput v3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 30
    float-to-int v3, v2

    iput v3, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 31
    iget-object v3, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->requestLayout()V

    .line 32
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 36
    if-ne p0, p1, :cond_1

    move v2, v1

    .line 45
    :cond_0
    :goto_0
    return v2

    .line 37
    :cond_1
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-ne v3, v4, :cond_0

    move-object v0, p1

    .line 39
    check-cast v0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;

    .line 41
    .local v0, "that":Lcom/vkontakte/android/ui/animation/ResizeAnimation;
    iget v3, v0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mToHeight:F

    iget v4, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mToHeight:F

    invoke-static {v3, v4}, Ljava/lang/Float;->compare(FF)I

    move-result v3

    if-nez v3, :cond_0

    .line 42
    iget v3, v0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mFromHeight:F

    iget v4, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mFromHeight:F

    invoke-static {v3, v4}, Ljava/lang/Float;->compare(FF)I

    move-result v3

    if-nez v3, :cond_0

    .line 43
    iget v3, v0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mToWidth:F

    iget v4, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mToWidth:F

    invoke-static {v3, v4}, Ljava/lang/Float;->compare(FF)I

    move-result v3

    if-nez v3, :cond_0

    .line 44
    iget v3, v0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mFromWidth:F

    iget v4, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mFromWidth:F

    invoke-static {v3, v4}, Ljava/lang/Float;->compare(FF)I

    move-result v3

    if-nez v3, :cond_0

    .line 45
    iget-object v3, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mView:Landroid/view/View;

    if-eqz v3, :cond_3

    iget-object v1, p0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mView:Landroid/view/View;

    iget-object v2, v0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mView:Landroid/view/View;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    :cond_2
    :goto_1
    move v2, v1

    goto :goto_0

    :cond_3
    iget-object v3, v0, Lcom/vkontakte/android/ui/animation/ResizeAnimation;->mView:Landroid/view/View;

    if-eqz v3, :cond_2

    move v1, v2

    goto :goto_1
.end method
