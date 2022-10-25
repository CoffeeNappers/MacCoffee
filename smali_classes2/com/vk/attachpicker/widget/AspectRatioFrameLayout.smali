.class public Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;
.super Landroid/widget/FrameLayout;
.source "AspectRatioFrameLayout.java"


# instance fields
.field private aspectRatio:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 12
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->aspectRatio:F

    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 16
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->aspectRatio:F

    .line 17
    return-void
.end method


# virtual methods
.method public getAspectRatio()F
    .locals 1

    .prologue
    .line 20
    iget v0, p0, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->aspectRatio:F

    return v0
.end method

.method protected onMeasure(II)V
    .locals 9
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v8, 0x40000000    # 2.0f

    const/high16 v7, 0x3f800000    # 1.0f

    .line 30
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    .line 31
    .local v4, "width":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 33
    .local v1, "height":I
    int-to-float v5, v4

    int-to-float v6, v1

    div-float v0, v5, v6

    .line 37
    .local v0, "availableAspectRatio":F
    iget v5, p0, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->aspectRatio:F

    cmpl-float v5, v5, v7

    if-nez v5, :cond_0

    .line 38
    invoke-static {v4, v1}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 39
    .local v3, "targetWidth":I
    invoke-static {v4, v1}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 57
    .local v2, "targetHeight":I
    :goto_0
    invoke-static {v3, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-static {v2, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    invoke-super {p0, v5, v6}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 58
    return-void

    .line 40
    .end local v2    # "targetHeight":I
    .end local v3    # "targetWidth":I
    :cond_0
    iget v5, p0, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->aspectRatio:F

    cmpl-float v5, v5, v7

    if-lez v5, :cond_2

    .line 41
    iget v5, p0, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->aspectRatio:F

    cmpg-float v5, v0, v5

    if-gtz v5, :cond_1

    .line 42
    move v3, v4

    .line 43
    .restart local v3    # "targetWidth":I
    int-to-float v5, v4

    iget v6, p0, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->aspectRatio:F

    div-float/2addr v5, v6

    float-to-int v2, v5

    .restart local v2    # "targetHeight":I
    goto :goto_0

    .line 45
    .end local v2    # "targetHeight":I
    .end local v3    # "targetWidth":I
    :cond_1
    int-to-float v5, v1

    iget v6, p0, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->aspectRatio:F

    mul-float/2addr v5, v6

    float-to-int v3, v5

    .line 46
    .restart local v3    # "targetWidth":I
    move v2, v1

    .restart local v2    # "targetHeight":I
    goto :goto_0

    .line 49
    .end local v2    # "targetHeight":I
    .end local v3    # "targetWidth":I
    :cond_2
    iget v5, p0, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->aspectRatio:F

    cmpl-float v5, v0, v5

    if-ltz v5, :cond_3

    .line 50
    int-to-float v5, v1

    iget v6, p0, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->aspectRatio:F

    mul-float/2addr v5, v6

    float-to-int v3, v5

    .line 51
    .restart local v3    # "targetWidth":I
    move v2, v1

    .restart local v2    # "targetHeight":I
    goto :goto_0

    .line 53
    .end local v2    # "targetHeight":I
    .end local v3    # "targetWidth":I
    :cond_3
    move v3, v4

    .line 54
    .restart local v3    # "targetWidth":I
    int-to-float v5, v4

    iget v6, p0, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->aspectRatio:F

    div-float/2addr v5, v6

    float-to-int v2, v5

    .restart local v2    # "targetHeight":I
    goto :goto_0
.end method

.method public setAspectRatio(F)V
    .locals 0
    .param p1, "aspectRatio"    # F

    .prologue
    .line 24
    iput p1, p0, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->aspectRatio:F

    .line 25
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->requestLayout()V

    .line 26
    return-void
.end method
