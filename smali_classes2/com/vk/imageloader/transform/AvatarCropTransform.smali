.class public Lcom/vk/imageloader/transform/AvatarCropTransform;
.super Lcom/facebook/imagepipeline/request/BasePostprocessor;
.source "AvatarCropTransform.java"


# instance fields
.field private final maxWidth:I

.field private final rawCropRect:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/graphics/RectF;I)V
    .locals 0
    .param p1, "rawCropRect"    # Landroid/graphics/RectF;
    .param p2, "maxWidth"    # I

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/facebook/imagepipeline/request/BasePostprocessor;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/vk/imageloader/transform/AvatarCropTransform;->rawCropRect:Landroid/graphics/RectF;

    .line 19
    iput p2, p0, Lcom/vk/imageloader/transform/AvatarCropTransform;->maxWidth:I

    .line 20
    return-void
.end method


# virtual methods
.method public process(Landroid/graphics/Bitmap;Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;)Lcom/facebook/common/references/CloseableReference;
    .locals 12
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
    .line 27
    new-instance v7, Landroid/graphics/Rect;

    iget-object v0, p0, Lcom/vk/imageloader/transform/AvatarCropTransform;->rawCropRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    .line 28
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iget-object v1, p0, Lcom/vk/imageloader/transform/AvatarCropTransform;->rawCropRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    .line 29
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iget-object v2, p0, Lcom/vk/imageloader/transform/AvatarCropTransform;->rawCropRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    .line 30
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iget-object v3, p0, Lcom/vk/imageloader/transform/AvatarCropTransform;->rawCropRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    .line 31
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-direct {v7, v0, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 33
    .local v7, "cropRect":Landroid/graphics/Rect;
    iget v2, v7, Landroid/graphics/Rect;->left:I

    iget v3, v7, Landroid/graphics/Rect;->top:I

    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v4

    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v5

    move-object v0, p2

    move-object v1, p1

    invoke-static/range {v0 .. v5}, Lcom/vk/imageloader/ImageLoaderUtils;->createFrescoBitmap(Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;Landroid/graphics/Bitmap;IIII)Lcom/facebook/common/references/CloseableReference;

    move-result-object v9

    .line 35
    .local v9, "croppedBitmapRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Landroid/graphics/Bitmap;>;"
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget v1, p0, Lcom/vk/imageloader/transform/AvatarCropTransform;->maxWidth:I

    if-le v0, v1, :cond_0

    .line 36
    iget v0, p0, Lcom/vk/imageloader/transform/AvatarCropTransform;->maxWidth:I

    int-to-float v0, v0

    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    div-float v11, v0, v1

    .line 38
    .local v11, "scale":F
    :try_start_0
    invoke-virtual {v9}, Lcom/facebook/common/references/CloseableReference;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/graphics/Bitmap;

    .line 40
    .local v8, "croppedBitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v11

    float-to-int v0, v0

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v11

    float-to-int v1, v1

    invoke-virtual {p2, v0, v1}, Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;->createBitmap(II)Lcom/facebook/common/references/CloseableReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v6

    .line 42
    .local v6, "bitmapRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Landroid/graphics/Bitmap;>;"
    :try_start_1
    invoke-virtual {v6}, Lcom/facebook/common/references/CloseableReference;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/graphics/Bitmap;

    .line 43
    .local v10, "destBitmap":Landroid/graphics/Bitmap;
    invoke-static {v8, v10}, Lcom/vk/imageloader/ImageLoaderUtils;->fastResizeBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 45
    invoke-static {v6}, Lcom/facebook/common/references/CloseableReference;->cloneOrNull(Lcom/facebook/common/references/CloseableReference;)Lcom/facebook/common/references/CloseableReference;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 47
    :try_start_2
    invoke-static {v6}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 50
    invoke-static {v9}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    move-object v9, v0

    .line 55
    .end local v6    # "bitmapRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Landroid/graphics/Bitmap;>;"
    .end local v8    # "croppedBitmap":Landroid/graphics/Bitmap;
    .end local v9    # "croppedBitmapRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Landroid/graphics/Bitmap;>;"
    .end local v10    # "destBitmap":Landroid/graphics/Bitmap;
    .end local v11    # "scale":F
    :cond_0
    return-object v9

    .line 47
    .restart local v6    # "bitmapRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Landroid/graphics/Bitmap;>;"
    .restart local v8    # "croppedBitmap":Landroid/graphics/Bitmap;
    .restart local v9    # "croppedBitmapRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Landroid/graphics/Bitmap;>;"
    .restart local v11    # "scale":F
    :catchall_0
    move-exception v0

    :try_start_3
    invoke-static {v6}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 50
    .end local v6    # "bitmapRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Landroid/graphics/Bitmap;>;"
    .end local v8    # "croppedBitmap":Landroid/graphics/Bitmap;
    :catchall_1
    move-exception v0

    invoke-static {v9}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    throw v0
.end method
