.class public Lcom/vk/attachpicker/widget/LocalImageView;
.super Lcom/vk/imageloader/view/VKImageView;
.source "LocalImageView.java"


# instance fields
.field private final defaultPlaceholder:Landroid/graphics/drawable/ColorDrawable;

.field private entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

.field private final imageCorruptedStub:Lcom/vk/attachpicker/widget/CorruptedFileDrawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    .line 20
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const v1, -0xf0e0e

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/LocalImageView;->defaultPlaceholder:Landroid/graphics/drawable/ColorDrawable;

    .line 21
    new-instance v0, Lcom/vk/attachpicker/widget/CorruptedFileDrawable;

    invoke-direct {v0}, Lcom/vk/attachpicker/widget/CorruptedFileDrawable;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/LocalImageView;->imageCorruptedStub:Lcom/vk/attachpicker/widget/CorruptedFileDrawable;

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const v1, -0xf0e0e

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/LocalImageView;->defaultPlaceholder:Landroid/graphics/drawable/ColorDrawable;

    .line 21
    new-instance v0, Lcom/vk/attachpicker/widget/CorruptedFileDrawable;

    invoke-direct {v0}, Lcom/vk/attachpicker/widget/CorruptedFileDrawable;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/LocalImageView;->imageCorruptedStub:Lcom/vk/attachpicker/widget/CorruptedFileDrawable;

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 20
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const v1, -0xf0e0e

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/LocalImageView;->defaultPlaceholder:Landroid/graphics/drawable/ColorDrawable;

    .line 21
    new-instance v0, Lcom/vk/attachpicker/widget/CorruptedFileDrawable;

    invoke-direct {v0}, Lcom/vk/attachpicker/widget/CorruptedFileDrawable;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/LocalImageView;->imageCorruptedStub:Lcom/vk/attachpicker/widget/CorruptedFileDrawable;

    .line 35
    return-void
.end method

.method public static computeBounds(IIIIZ)Landroid/graphics/RectF;
    .locals 10
    .param p0, "viewWidth"    # I
    .param p1, "viewHeight"    # I
    .param p2, "bitmapWidth"    # I
    .param p3, "bitmapHeight"    # I
    .param p4, "isAspectFit"    # Z

    .prologue
    const/4 v9, 0x0

    .line 65
    move v1, p2

    .line 66
    .local v1, "bitmapW":I
    move v0, p3

    .line 68
    .local v0, "bitmapH":I
    int-to-float v6, v1

    int-to-float v7, p0

    div-float v5, v6, v7

    .line 69
    .local v5, "scaleW":F
    int-to-float v6, v0

    int-to-float v7, p1

    div-float v4, v6, v7

    .line 71
    .local v4, "scaleH":F
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    .line 73
    .local v2, "drawRegion":Landroid/graphics/RectF;
    if-eqz p4, :cond_0

    .line 74
    invoke-static {v5, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 75
    .local v3, "scale":F
    int-to-float v6, v1

    div-float/2addr v6, v3

    float-to-int v1, v6

    .line 76
    int-to-float v6, v0

    div-float/2addr v6, v3

    float-to-int v0, v6

    .line 77
    sub-int v6, p0, v1

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    sub-int v7, p1, v0

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    add-int v8, p0, v1

    div-int/lit8 v8, v8, 0x2

    int-to-float v8, v8

    add-int v9, p1, v0

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    invoke-virtual {v2, v6, v7, v8, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 92
    .end local v3    # "scale":F
    :goto_0
    return-object v2

    .line 79
    :cond_0
    sub-float v6, v5, v4

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    const v7, 0x3727c5ac    # 1.0E-5f

    cmpl-float v6, v6, v7

    if-lez v6, :cond_2

    .line 80
    int-to-float v6, v1

    div-float/2addr v6, v4

    int-to-float v7, p0

    cmpl-float v6, v6, v7

    if-lez v6, :cond_1

    .line 81
    int-to-float v6, v1

    div-float/2addr v6, v4

    float-to-int v1, v6

    .line 82
    sub-int v6, v1, p0

    neg-int v6, v6

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    add-int v7, v1, p0

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    int-to-float v8, p1

    invoke-virtual {v2, v6, v9, v7, v8}, Landroid/graphics/RectF;->set(FFFF)V

    goto :goto_0

    .line 84
    :cond_1
    int-to-float v6, v0

    div-float/2addr v6, v5

    float-to-int v0, v6

    .line 85
    sub-int v6, v0, p1

    neg-int v6, v6

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    int-to-float v7, p0

    add-int v8, v0, p1

    div-int/lit8 v8, v8, 0x2

    int-to-float v8, v8

    invoke-virtual {v2, v9, v6, v7, v8}, Landroid/graphics/RectF;->set(FFFF)V

    goto :goto_0

    .line 88
    :cond_2
    int-to-float v6, p0

    int-to-float v7, p1

    invoke-virtual {v2, v9, v9, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    goto :goto_0
.end method


# virtual methods
.method protected buildHierarchy(Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;)V
    .locals 1
    .param p1, "builder"    # Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vk/attachpicker/widget/LocalImageView;->defaultPlaceholder:Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p1, v0}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->setPlaceholderImage(Landroid/graphics/drawable/Drawable;)Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .line 40
    sget-object v0, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_CENTER:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {p1, v0}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .line 41
    iget-object v0, p0, Lcom/vk/attachpicker/widget/LocalImageView;->imageCorruptedStub:Lcom/vk/attachpicker/widget/CorruptedFileDrawable;

    invoke-virtual {p1, v0}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->setFailureImage(Landroid/graphics/drawable/Drawable;)Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .line 42
    return-void
.end method

.method public getEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/vk/attachpicker/widget/LocalImageView;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    return-object v0
.end method

.method public setImage(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;Z)V
    .locals 2
    .param p1, "image"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    .param p2, "fullSize"    # Z

    .prologue
    .line 45
    if-nez p1, :cond_0

    .line 55
    :goto_0
    return-void

    .line 48
    :cond_0
    iput-object p1, p0, Lcom/vk/attachpicker/widget/LocalImageView;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 50
    if-nez p2, :cond_1

    .line 51
    iget-object v0, p1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->path:Landroid/net/Uri;

    sget-object v1, Lcom/vk/imageloader/ImageSize;->SMALL:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {p0, v0, v1}, Lcom/vk/attachpicker/widget/LocalImageView;->load(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;)V

    goto :goto_0

    .line 53
    :cond_1
    iget-object v0, p1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->path:Landroid/net/Uri;

    sget-object v1, Lcom/vk/imageloader/ImageSize;->VERY_BIG:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {p0, v0, v1}, Lcom/vk/attachpicker/widget/LocalImageView;->load(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;)V

    goto :goto_0
.end method
