.class public Lcom/vk/imageloader/view/GenericVKImageView;
.super Lcom/vk/imageloader/view/VKDraweeView;
.source "GenericVKImageView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/imageloader/view/VKDraweeView",
        "<",
        "Lcom/facebook/drawee/generic/GenericDraweeHierarchy;",
        ">;"
    }
.end annotation


# static fields
.field public static final MAX_ASPECT_RATIO:F = 3.33f

.field public static final MIN_ASPECT_RATIO:F = 0.3f


# instance fields
.field private aspectRatio:F

.field private fixedHeight:I

.field private fixedWidth:I

.field private hasOverlappingRendering:Z

.field private maxAspectRatio:F

.field private maxHeight:I

.field private maxWidth:I

.field private minAspectRatio:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vk/imageloader/view/GenericVKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 59
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/vk/imageloader/view/GenericVKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v1, -0x1

    .line 63
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/imageloader/view/VKDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 45
    const v0, 0x3e99999a    # 0.3f

    iput v0, p0, Lcom/vk/imageloader/view/GenericVKImageView;->minAspectRatio:F

    .line 46
    const v0, 0x40551eb8    # 3.33f

    iput v0, p0, Lcom/vk/imageloader/view/GenericVKImageView;->maxAspectRatio:F

    .line 47
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/imageloader/view/GenericVKImageView;->aspectRatio:F

    .line 48
    iput v1, p0, Lcom/vk/imageloader/view/GenericVKImageView;->fixedWidth:I

    .line 49
    iput v1, p0, Lcom/vk/imageloader/view/GenericVKImageView;->fixedHeight:I

    .line 52
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/imageloader/view/GenericVKImageView;->hasOverlappingRendering:Z

    .line 64
    invoke-direct {p0, p1, p2}, Lcom/vk/imageloader/view/GenericVKImageView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 65
    return-void
.end method

.method private clampAspectRatio(F)F
    .locals 1
    .param p1, "ar"    # F

    .prologue
    .line 144
    iget v0, p0, Lcom/vk/imageloader/view/GenericVKImageView;->minAspectRatio:F

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/vk/imageloader/view/GenericVKImageView;->maxAspectRatio:F

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    .line 149
    .end local p1    # "ar":F
    :goto_0
    return p1

    .line 146
    .restart local p1    # "ar":F
    :cond_0
    iget v0, p0, Lcom/vk/imageloader/view/GenericVKImageView;->minAspectRatio:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_1

    .line 147
    iget p1, p0, Lcom/vk/imageloader/view/GenericVKImageView;->minAspectRatio:F

    goto :goto_0

    .line 149
    :cond_1
    iget p1, p0, Lcom/vk/imageloader/view/GenericVKImageView;->maxAspectRatio:F

    goto :goto_0
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 68
    invoke-static {p1, p2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyInflater;->inflateBuilder(Landroid/content/Context;Landroid/util/AttributeSet;)Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    move-result-object v0

    .line 69
    .local v0, "builder":Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;
    const/16 v1, 0x12c

    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->setFadeDuration(I)Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .line 70
    invoke-virtual {p0, v0}, Lcom/vk/imageloader/view/GenericVKImageView;->buildHierarchy(Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;)V

    .line 72
    invoke-virtual {v0}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->getDesiredAspectRatio()F

    move-result v1

    invoke-virtual {p0, v1}, Lcom/vk/imageloader/view/GenericVKImageView;->setAspectRatio(F)V

    .line 73
    invoke-virtual {v0}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->build()Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vk/imageloader/view/GenericVKImageView;->setHierarchy(Lcom/facebook/drawee/interfaces/DraweeHierarchy;)V

    .line 74
    return-void
.end method


# virtual methods
.method protected buildHierarchy(Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;)V
    .locals 0
    .param p1, "builder"    # Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .prologue
    .line 77
    return-void
.end method

.method public getAspectRatio()F
    .locals 1

    .prologue
    .line 140
    iget v0, p0, Lcom/vk/imageloader/view/GenericVKImageView;->aspectRatio:F

    return v0
.end method

.method public getFixedHeight()I
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lcom/vk/imageloader/view/GenericVKImageView;->fixedHeight:I

    return v0
.end method

.method public getFixedWidth()I
    .locals 1

    .prologue
    .line 87
    iget v0, p0, Lcom/vk/imageloader/view/GenericVKImageView;->fixedWidth:I

    return v0
.end method

.method public getMaxAspectRatio()F
    .locals 1

    .prologue
    .line 162
    iget v0, p0, Lcom/vk/imageloader/view/GenericVKImageView;->maxAspectRatio:F

    return v0
.end method

.method public getMinAspectRatio()F
    .locals 1

    .prologue
    .line 154
    iget v0, p0, Lcom/vk/imageloader/view/GenericVKImageView;->minAspectRatio:F

    return v0
.end method

.method public hasOverlappingRendering()Z
    .locals 1

    .prologue
    .line 118
    iget-boolean v0, p0, Lcom/vk/imageloader/view/GenericVKImageView;->hasOverlappingRendering:Z

    return v0
.end method

.method protected onMeasure(II)V
    .locals 7
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v6, 0x40000000    # 2.0f

    .line 171
    iget v4, p0, Lcom/vk/imageloader/view/GenericVKImageView;->fixedWidth:I

    if-ltz v4, :cond_0

    iget v4, p0, Lcom/vk/imageloader/view/GenericVKImageView;->fixedHeight:I

    if-ltz v4, :cond_0

    .line 172
    iget v4, p0, Lcom/vk/imageloader/view/GenericVKImageView;->fixedWidth:I

    invoke-static {v4, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    iget v5, p0, Lcom/vk/imageloader/view/GenericVKImageView;->fixedHeight:I

    .line 173
    invoke-static {v5, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 172
    invoke-super {p0, v4, v5}, Lcom/vk/imageloader/view/VKDraweeView;->onMeasure(II)V

    .line 197
    :goto_0
    return-void

    .line 175
    :cond_0
    iget v4, p0, Lcom/vk/imageloader/view/GenericVKImageView;->aspectRatio:F

    const/4 v5, 0x0

    cmpl-float v4, v4, v5

    if-lez v4, :cond_3

    .line 176
    iget v4, p0, Lcom/vk/imageloader/view/GenericVKImageView;->aspectRatio:F

    invoke-direct {p0, v4}, Lcom/vk/imageloader/view/GenericVKImageView;->clampAspectRatio(F)F

    move-result v1

    .line 178
    .local v1, "targetAspectRatio":F
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 179
    .local v3, "targetWidth":I
    int-to-float v4, v3

    div-float/2addr v4, v1

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v2, v4

    .line 181
    .local v2, "targetHeight":I
    iget v4, p0, Lcom/vk/imageloader/view/GenericVKImageView;->maxHeight:I

    if-le v2, v4, :cond_1

    iget v4, p0, Lcom/vk/imageloader/view/GenericVKImageView;->maxHeight:I

    if-lez v4, :cond_1

    if-lez v2, :cond_1

    .line 182
    iget v4, p0, Lcom/vk/imageloader/view/GenericVKImageView;->maxHeight:I

    int-to-float v4, v4

    int-to-float v5, v2

    div-float v0, v4, v5

    .line 183
    .local v0, "downScale":F
    int-to-float v4, v2

    mul-float/2addr v4, v0

    float-to-int v2, v4

    .line 184
    int-to-float v4, v3

    mul-float/2addr v4, v0

    float-to-int v3, v4

    .line 187
    .end local v0    # "downScale":F
    :cond_1
    iget v4, p0, Lcom/vk/imageloader/view/GenericVKImageView;->maxWidth:I

    if-le v3, v4, :cond_2

    iget v4, p0, Lcom/vk/imageloader/view/GenericVKImageView;->maxWidth:I

    if-lez v4, :cond_2

    if-lez v3, :cond_2

    .line 188
    iget v4, p0, Lcom/vk/imageloader/view/GenericVKImageView;->maxWidth:I

    int-to-float v4, v4

    int-to-float v5, v3

    div-float v0, v4, v5

    .line 189
    .restart local v0    # "downScale":F
    int-to-float v4, v2

    mul-float/2addr v4, v0

    float-to-int v2, v4

    .line 190
    int-to-float v4, v3

    mul-float/2addr v4, v0

    float-to-int v3, v4

    .line 192
    .end local v0    # "downScale":F
    :cond_2
    invoke-static {v3, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    invoke-static {v2, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-super {p0, v4, v5}, Lcom/vk/imageloader/view/VKDraweeView;->onMeasure(II)V

    goto :goto_0

    .line 194
    .end local v1    # "targetAspectRatio":F
    .end local v2    # "targetHeight":I
    .end local v3    # "targetWidth":I
    :cond_3
    invoke-super {p0, p1, p2}, Lcom/vk/imageloader/view/VKDraweeView;->onMeasure(II)V

    goto :goto_0
.end method

.method public setActualScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V
    .locals 1
    .param p1, "scaleType"    # Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    .prologue
    .line 224
    invoke-virtual {p0}, Lcom/vk/imageloader/view/GenericVKImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 225
    return-void
.end method

.method public setAspectRatio(F)V
    .locals 1
    .param p1, "aspectRatio"    # F

    .prologue
    .line 129
    iget v0, p0, Lcom/vk/imageloader/view/GenericVKImageView;->aspectRatio:F

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    .line 134
    :goto_0
    return-void

    .line 132
    :cond_0
    iput p1, p0, Lcom/vk/imageloader/view/GenericVKImageView;->aspectRatio:F

    .line 133
    invoke-virtual {p0}, Lcom/vk/imageloader/view/GenericVKImageView;->requestLayout()V

    goto :goto_0
.end method

.method public setAspectRatio(FF)V
    .locals 2
    .param p1, "w"    # F
    .param p2, "h"    # F

    .prologue
    const/4 v1, 0x0

    .line 80
    cmpl-float v0, p1, v1

    if-eqz v0, :cond_0

    cmpl-float v0, p2, v1

    if-nez v0, :cond_1

    .line 84
    :cond_0
    :goto_0
    return-void

    .line 83
    :cond_1
    div-float v0, p1, p2

    invoke-virtual {p0, v0}, Lcom/vk/imageloader/view/GenericVKImageView;->setAspectRatio(F)V

    goto :goto_0
.end method

.method public setErrorImage(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 216
    invoke-virtual {p0}, Lcom/vk/imageloader/view/GenericVKImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setFailureImage(I)V

    .line 217
    return-void
.end method

.method public setErrorImage(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 212
    invoke-virtual {p0}, Lcom/vk/imageloader/view/GenericVKImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setFailureImage(Landroid/graphics/drawable/Drawable;)V

    .line 213
    return-void
.end method

.method public setFixedSize(I)V
    .locals 0
    .param p1, "fixedSize"    # I

    .prologue
    .line 101
    invoke-virtual {p0, p1, p1}, Lcom/vk/imageloader/view/GenericVKImageView;->setFixedSize(II)V

    .line 102
    return-void
.end method

.method public setFixedSize(II)V
    .locals 0
    .param p1, "fixedWidth"    # I
    .param p2, "fixedHeight"    # I

    .prologue
    .line 95
    iput p1, p0, Lcom/vk/imageloader/view/GenericVKImageView;->fixedWidth:I

    .line 96
    iput p2, p0, Lcom/vk/imageloader/view/GenericVKImageView;->fixedHeight:I

    .line 97
    invoke-virtual {p0}, Lcom/vk/imageloader/view/GenericVKImageView;->requestLayout()V

    .line 98
    return-void
.end method

.method public setHasOverlappingRendering(Z)V
    .locals 0
    .param p1, "hasOverlappingRendering"    # Z

    .prologue
    .line 122
    iput-boolean p1, p0, Lcom/vk/imageloader/view/GenericVKImageView;->hasOverlappingRendering:Z

    .line 123
    return-void
.end method

.method public setMaxAspectRatio(F)V
    .locals 0
    .param p1, "maxAspectRatio"    # F

    .prologue
    .line 166
    iput p1, p0, Lcom/vk/imageloader/view/GenericVKImageView;->maxAspectRatio:F

    .line 167
    return-void
.end method

.method public setMaxHeight(I)V
    .locals 0
    .param p1, "maxHeight"    # I

    .prologue
    .line 106
    invoke-super {p0, p1}, Lcom/vk/imageloader/view/VKDraweeView;->setMaxHeight(I)V

    .line 107
    iput p1, p0, Lcom/vk/imageloader/view/GenericVKImageView;->maxHeight:I

    .line 108
    return-void
.end method

.method public setMaxWidth(I)V
    .locals 0
    .param p1, "maxWidth"    # I

    .prologue
    .line 112
    invoke-super {p0, p1}, Lcom/vk/imageloader/view/VKDraweeView;->setMaxWidth(I)V

    .line 113
    iput p1, p0, Lcom/vk/imageloader/view/GenericVKImageView;->maxWidth:I

    .line 114
    return-void
.end method

.method public setMinAspectRatio(F)V
    .locals 0
    .param p1, "minAspectRatio"    # F

    .prologue
    .line 158
    iput p1, p0, Lcom/vk/imageloader/view/GenericVKImageView;->minAspectRatio:F

    .line 159
    return-void
.end method

.method public setOverlayImage(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 220
    invoke-virtual {p0}, Lcom/vk/imageloader/view/GenericVKImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setOverlayImage(Landroid/graphics/drawable/Drawable;)V

    .line 221
    return-void
.end method

.method public setPlaceholderColor(I)V
    .locals 2
    .param p1, "color"    # I

    .prologue
    .line 200
    invoke-virtual {p0}, Lcom/vk/imageloader/view/GenericVKImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setPlaceholderImage(Landroid/graphics/drawable/Drawable;)V

    .line 201
    return-void
.end method

.method public setPlaceholderImage(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 208
    invoke-virtual {p0}, Lcom/vk/imageloader/view/GenericVKImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setPlaceholderImage(I)V

    .line 209
    return-void
.end method

.method public setPlaceholderImage(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 204
    invoke-virtual {p0}, Lcom/vk/imageloader/view/GenericVKImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setPlaceholderImage(Landroid/graphics/drawable/Drawable;)V

    .line 205
    return-void
.end method
