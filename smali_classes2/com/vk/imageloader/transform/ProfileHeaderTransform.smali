.class public Lcom/vk/imageloader/transform/ProfileHeaderTransform;
.super Lcom/facebook/imagepipeline/request/BasePostprocessor;
.source "ProfileHeaderTransform.java"


# instance fields
.field private final photoRect:Landroid/graphics/RectF;

.field private final ratio:F

.field private width:F


# direct methods
.method public constructor <init>(FLandroid/graphics/RectF;)V
    .locals 1
    .param p1, "width"    # F
    .param p2, "photoRect"    # Landroid/graphics/RectF;

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/facebook/imagepipeline/request/BasePostprocessor;-><init>()V

    .line 17
    const/high16 v0, 0x3fc00000    # 1.5f

    iput v0, p0, Lcom/vk/imageloader/transform/ProfileHeaderTransform;->ratio:F

    .line 22
    iput p1, p0, Lcom/vk/imageloader/transform/ProfileHeaderTransform;->width:F

    .line 23
    iput-object p2, p0, Lcom/vk/imageloader/transform/ProfileHeaderTransform;->photoRect:Landroid/graphics/RectF;

    .line 24
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    const-string/jumbo v0, "ProfileHeaderTransform"

    return-object v0
.end method

.method public getPostprocessorCacheKey()Lcom/facebook/cache/common/CacheKey;
    .locals 2

    .prologue
    .line 104
    new-instance v0, Lcom/facebook/cache/common/SimpleCacheKey;

    const-string/jumbo v1, "ProfileHeaderTransform"

    invoke-direct {v0, v1}, Lcom/facebook/cache/common/SimpleCacheKey;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public process(Landroid/graphics/Bitmap;Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;)Lcom/facebook/common/references/CloseableReference;
    .locals 34
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "bitmapFactory"    # Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;",
            ")",
            "Lcom/facebook/common/references/CloseableReference",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 37
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vk/imageloader/transform/ProfileHeaderTransform;->photoRect:Landroid/graphics/RectF;

    if-nez v4, :cond_0

    .line 38
    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x3fc00000    # 1.5f

    div-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v9

    move-object/from16 v4, p2

    move-object/from16 v5, p1

    invoke-static/range {v4 .. v9}, Lcom/vk/imageloader/ImageLoaderUtils;->createFrescoBitmap(Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;Landroid/graphics/Bitmap;IIII)Lcom/facebook/common/references/CloseableReference;

    move-result-object v4

    .line 98
    :goto_0
    return-object v4

    .line 41
    :cond_0
    const/16 v16, 0x1

    .line 42
    .local v16, "moveTop":Z
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vk/imageloader/transform/ProfileHeaderTransform;->width:F

    const/high16 v5, 0x3fc00000    # 1.5f

    div-float/2addr v4, v5

    float-to-double v14, v4

    .line 43
    .local v14, "height":D
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-double v4, v4

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v17

    move/from16 v0, v17

    int-to-double v0, v0

    move-wide/from16 v30, v0

    div-double v24, v4, v30

    .line 44
    .local v24, "photoRatio":D
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-double v0, v4

    move-wide/from16 v26, v0

    .line 45
    .local v26, "photoWidth":D
    div-double v22, v26, v24

    .line 47
    .local v22, "photoHeight":D
    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    cmpl-double v4, v24, v4

    if-lez v4, :cond_1

    .line 48
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-double v0, v4

    move-wide/from16 v22, v0

    .line 49
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-double v4, v4

    mul-double v26, v4, v24

    .line 50
    const/16 v16, 0x0

    .line 53
    :cond_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vk/imageloader/transform/ProfileHeaderTransform;->photoRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 54
    .local v6, "bmpX":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vk/imageloader/transform/ProfileHeaderTransform;->photoRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 55
    .local v7, "bmpY":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vk/imageloader/transform/ProfileHeaderTransform;->photoRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v8

    .line 56
    .local v8, "bmpW":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vk/imageloader/transform/ProfileHeaderTransform;->photoRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v9

    .line 57
    .local v9, "bmpH":I
    div-int/lit8 v4, v8, 0x2

    add-int/2addr v4, v6

    int-to-double v10, v4

    .line 58
    .local v10, "centerX":D
    add-int v4, v7, v9

    int-to-double v12, v4

    .line 60
    .local v12, "centerY":D
    if-eqz v16, :cond_4

    .line 63
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x3fc00000    # 1.5f

    div-float/2addr v4, v5

    float-to-double v14, v4

    .line 65
    int-to-double v4, v9

    cmpl-double v4, v4, v14

    if-lez v4, :cond_3

    .line 66
    const-wide v28, 0x40047ae147ae147bL    # 2.56

    .line 70
    .local v28, "rectOffsetY":D
    :goto_1
    int-to-double v4, v9

    int-to-double v0, v9

    move-wide/from16 v30, v0

    div-double v30, v30, v28

    sub-double v4, v4, v30

    sub-double/2addr v12, v4

    .line 71
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    div-double v4, v14, v4

    sub-double v20, v4, v12

    .line 72
    .local v20, "offsetY":D
    int-to-double v4, v9

    cmpl-double v4, v4, v14

    if-lez v4, :cond_2

    .line 73
    div-int/lit8 v4, v9, 0x2

    int-to-double v4, v4

    sub-double v4, v12, v4

    const-wide/16 v30, 0x0

    cmpl-double v4, v4, v30

    if-ltz v4, :cond_2

    .line 74
    neg-int v4, v7

    int-to-double v0, v4

    move-wide/from16 v20, v0

    .line 78
    :cond_2
    move-wide/from16 v0, v20

    neg-double v0, v0

    move-wide/from16 v20, v0

    .line 79
    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    div-double v4, v26, v4

    double-to-int v9, v4

    .line 80
    const-wide/16 v4, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v17

    sub-int v17, v17, v9

    move/from16 v0, v17

    int-to-double v0, v0

    move-wide/from16 v30, v0

    move-wide/from16 v0, v20

    move-wide/from16 v2, v30

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v30

    move-wide/from16 v0, v30

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v18

    .line 81
    .local v18, "offset":D
    const/4 v6, 0x0

    .line 82
    move-wide/from16 v0, v18

    double-to-int v7, v0

    .line 83
    move-wide/from16 v0, v26

    double-to-int v8, v0

    .end local v20    # "offsetY":D
    .end local v28    # "rectOffsetY":D
    :goto_2
    move-object/from16 v4, p2

    move-object/from16 v5, p1

    .line 98
    invoke-static/range {v4 .. v9}, Lcom/vk/imageloader/ImageLoaderUtils;->createFrescoBitmap(Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;Landroid/graphics/Bitmap;IIII)Lcom/facebook/common/references/CloseableReference;

    move-result-object v4

    goto/16 :goto_0

    .line 68
    .end local v18    # "offset":D
    :cond_3
    const-wide/high16 v28, 0x4000000000000000L    # 2.0

    .restart local v28    # "rectOffsetY":D
    goto :goto_1

    .line 86
    .end local v28    # "rectOffsetY":D
    :cond_4
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x3fc00000    # 1.5f

    mul-float/2addr v4, v5

    move-object/from16 v0, p0

    iput v4, v0, Lcom/vk/imageloader/transform/ProfileHeaderTransform;->width:F

    .line 91
    move-wide/from16 v0, v22

    double-to-int v9, v0

    .line 92
    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    mul-double v4, v4, v22

    double-to-int v8, v4

    .line 93
    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/imageloader/transform/ProfileHeaderTransform;->width:F

    move/from16 v17, v0

    const/high16 v30, 0x40000000    # 2.0f

    div-float v17, v17, v30

    move/from16 v0, v17

    float-to-double v0, v0

    move-wide/from16 v30, v0

    sub-double v30, v30, v10

    move-wide/from16 v0, v30

    neg-double v0, v0

    move-wide/from16 v30, v0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v17

    sub-int v17, v17, v8

    move/from16 v0, v17

    int-to-double v0, v0

    move-wide/from16 v32, v0

    invoke-static/range {v30 .. v33}, Ljava/lang/Math;->min(DD)D

    move-result-wide v30

    move-wide/from16 v0, v30

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v18

    .line 94
    .restart local v18    # "offset":D
    move-wide/from16 v0, v18

    double-to-int v6, v0

    .line 95
    const/4 v7, 0x0

    goto :goto_2
.end method
