.class public Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;
.super Lcom/vk/imageloader/view/VKImageView;
.source "VKHorizontalParallaxImageView.java"

# interfaces
.implements Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;


# instance fields
.field private final drawMatrix:Landroid/graphics/Matrix;

.field private offset:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    .line 14
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->drawMatrix:Landroid/graphics/Matrix;

    .line 16
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->offset:F

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->drawMatrix:Landroid/graphics/Matrix;

    .line 16
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->offset:F

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 14
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->drawMatrix:Landroid/graphics/Matrix;

    .line 16
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->offset:F

    .line 28
    return-void
.end method


# virtual methods
.method protected buildHierarchy(Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;)V
    .locals 0
    .param p1, "builder"    # Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .prologue
    .line 32
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .line 33
    return-void
.end method

.method public getOffset()F
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->offset:F

    return v0
.end method

.method public getTransform(Landroid/graphics/Matrix;Landroid/graphics/Rect;IIFF)Landroid/graphics/Matrix;
    .locals 3
    .param p1, "outTransform"    # Landroid/graphics/Matrix;
    .param p2, "parentBounds"    # Landroid/graphics/Rect;
    .param p3, "childWidth"    # I
    .param p4, "childHeight"    # I
    .param p5, "focusX"    # F
    .param p6, "focusY"    # F

    .prologue
    .line 37
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    int-to-float v2, p4

    div-float v0, v1, v2

    .line 38
    .local v0, "scale":F
    invoke-virtual {p1, v0, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 39
    return-object p1
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x0

    .line 55
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->hasImage()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 56
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->getImageHeight()I

    move-result v7

    int-to-float v7, v7

    div-float v3, v6, v7

    .line 57
    .local v3, "scale":F
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->getImageWidth()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v3

    float-to-int v2, v6

    .line 58
    .local v2, "iw":I
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->getImageHeight()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v3

    float-to-int v1, v6

    .line 59
    .local v1, "ih":I
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v6

    sub-int v4, v2, v6

    .line 60
    .local v4, "wd":I
    int-to-float v6, v4

    iget v7, p0, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->offset:F

    mul-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    rem-int v5, v6, v2

    .line 62
    .local v5, "x":I
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v6

    check-cast v6, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    invoke-virtual {v6}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 63
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    .line 64
    invoke-virtual {v0, v9, v9, v2, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 66
    iget-object v6, p0, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->drawMatrix:Landroid/graphics/Matrix;

    sub-int v7, v5, v2

    int-to-float v7, v7

    invoke-virtual {v6, v7, v8}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 67
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 68
    iget-object v6, p0, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->drawMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v6}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 69
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 70
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 72
    iget-object v6, p0, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->drawMatrix:Landroid/graphics/Matrix;

    int-to-float v7, v5

    invoke-virtual {v6, v7, v8}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 73
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 74
    iget-object v6, p0, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->drawMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v6}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 75
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 76
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 78
    iget-object v6, p0, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->drawMatrix:Landroid/graphics/Matrix;

    add-int v7, v5, v2

    int-to-float v7, v7

    invoke-virtual {v6, v7, v8}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 79
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 80
    iget-object v6, p0, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->drawMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v6}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 81
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 82
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 87
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    .end local v1    # "ih":I
    .end local v2    # "iw":I
    .end local v3    # "scale":F
    .end local v4    # "wd":I
    .end local v5    # "x":I
    :cond_0
    :goto_0
    return-void

    .line 85
    :cond_1
    invoke-super {p0, p1}, Lcom/vk/imageloader/view/VKImageView;->onDraw(Landroid/graphics/Canvas;)V

    goto :goto_0
.end method

.method public setOffset(F)V
    .locals 0
    .param p1, "offset"    # F

    .prologue
    .line 47
    iput p1, p0, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->offset:F

    .line 48
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKHorizontalParallaxImageView;->invalidate()V

    .line 49
    return-void
.end method
