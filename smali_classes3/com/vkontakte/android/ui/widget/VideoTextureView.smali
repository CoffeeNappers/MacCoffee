.class public Lcom/vkontakte/android/ui/widget/VideoTextureView;
.super Landroid/view/TextureView;
.source "VideoTextureView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/widget/VideoTextureView$OnVideoTextureCallback;
    }
.end annotation


# instance fields
.field private mCallback:Lcom/vkontakte/android/ui/widget/VideoTextureView$OnVideoTextureCallback;

.field private mVideoHeight:F

.field private mVideoWidth:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/high16 v0, -0x40800000    # -1.0f

    .line 19
    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 14
    iput v0, p0, Lcom/vkontakte/android/ui/widget/VideoTextureView;->mVideoWidth:F

    .line 15
    iput v0, p0, Lcom/vkontakte/android/ui/widget/VideoTextureView;->mVideoHeight:F

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/high16 v0, -0x40800000    # -1.0f

    .line 23
    invoke-direct {p0, p1, p2}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    iput v0, p0, Lcom/vkontakte/android/ui/widget/VideoTextureView;->mVideoWidth:F

    .line 15
    iput v0, p0, Lcom/vkontakte/android/ui/widget/VideoTextureView;->mVideoHeight:F

    .line 24
    return-void
.end method


# virtual methods
.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 69
    :try_start_0
    invoke-super {p0}, Landroid/view/TextureView;->onDetachedFromWindow()V

    .line 70
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VideoTextureView;->mCallback:Lcom/vkontakte/android/ui/widget/VideoTextureView$OnVideoTextureCallback;

    if-eqz v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/VideoTextureView;->mCallback:Lcom/vkontakte/android/ui/widget/VideoTextureView$OnVideoTextureCallback;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/widget/VideoTextureView$OnVideoTextureCallback;->onDetachedFromWindow()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    :cond_0
    :goto_0
    return-void

    .line 73
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 8
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v7, 0x0

    .line 42
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getSuggestedMinimumWidth()I

    move-result v6

    invoke-static {v6, p1}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getDefaultSize(II)I

    move-result v2

    .line 43
    .local v2, "parentWidth":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getSuggestedMinimumHeight()I

    move-result v6

    invoke-static {v6, p2}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getDefaultSize(II)I

    move-result v1

    .line 44
    .local v1, "parentHeight":I
    iget v6, p0, Lcom/vkontakte/android/ui/widget/VideoTextureView;->mVideoWidth:F

    cmpg-float v6, v6, v7

    if-lez v6, :cond_0

    iget v6, p0, Lcom/vkontakte/android/ui/widget/VideoTextureView;->mVideoHeight:F

    cmpg-float v6, v6, v7

    if-lez v6, :cond_0

    if-lez v2, :cond_0

    if-gtz v1, :cond_1

    .line 45
    :cond_0
    invoke-virtual {p0, v2, v1}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->setMeasuredDimension(II)V

    .line 64
    :goto_0
    return-void

    .line 49
    :cond_1
    int-to-float v6, v2

    int-to-float v7, v1

    div-float v3, v6, v7

    .line 50
    .local v3, "sratio":F
    iget v6, p0, Lcom/vkontakte/android/ui/widget/VideoTextureView;->mVideoWidth:F

    iget v7, p0, Lcom/vkontakte/android/ui/widget/VideoTextureView;->mVideoHeight:F

    div-float v4, v6, v7

    .line 55
    .local v4, "vratio":F
    cmpl-float v6, v3, v4

    if-lez v6, :cond_2

    .line 56
    move v0, v1

    .line 57
    .local v0, "height":I
    int-to-float v6, v0

    mul-float/2addr v6, v4

    float-to-int v5, v6

    .line 63
    .local v5, "width":I
    :goto_1
    invoke-virtual {p0, v5, v0}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->setMeasuredDimension(II)V

    goto :goto_0

    .line 59
    .end local v0    # "height":I
    .end local v5    # "width":I
    :cond_2
    move v5, v2

    .line 60
    .restart local v5    # "width":I
    int-to-float v6, v5

    div-float/2addr v6, v4

    float-to-int v0, v6

    .restart local v0    # "height":I
    goto :goto_1
.end method

.method public setCallback(Lcom/vkontakte/android/ui/widget/VideoTextureView$OnVideoTextureCallback;)V
    .locals 0
    .param p1, "callback"    # Lcom/vkontakte/android/ui/widget/VideoTextureView$OnVideoTextureCallback;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/VideoTextureView;->mCallback:Lcom/vkontakte/android/ui/widget/VideoTextureView$OnVideoTextureCallback;

    .line 28
    return-void
.end method

.method public setVideoSize(II)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 31
    int-to-float v1, p1

    iput v1, p0, Lcom/vkontakte/android/ui/widget/VideoTextureView;->mVideoWidth:F

    .line 32
    int-to-float v1, p2

    iput v1, p0, Lcom/vkontakte/android/ui/widget/VideoTextureView;->mVideoHeight:F

    .line 33
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 34
    .local v0, "parent":Landroid/view/ViewParent;
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->requestLayout()V

    .line 35
    if-eqz v0, :cond_0

    .line 36
    invoke-interface {v0}, Landroid/view/ViewParent;->requestLayout()V

    .line 38
    :cond_0
    return-void
.end method
