.class public Lcom/vk/imageloader/transform/StoriesProfileButtonTransform;
.super Lcom/facebook/imagepipeline/request/BasePostprocessor;
.source "StoriesProfileButtonTransform.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/facebook/imagepipeline/request/BasePostprocessor;-><init>()V

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    const-string/jumbo v0, "StoriesProfileButtonTransform"

    return-object v0
.end method

.method public getPostprocessorCacheKey()Lcom/facebook/cache/common/CacheKey;
    .locals 2

    .prologue
    .line 49
    new-instance v0, Lcom/facebook/cache/common/SimpleCacheKey;

    const-string/jumbo v1, "StoriesProfileButtonTransform"

    invoke-direct {v0, v1}, Lcom/facebook/cache/common/SimpleCacheKey;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public process(Landroid/graphics/Bitmap;Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;)Lcom/facebook/common/references/CloseableReference;
    .locals 8
    .param p1, "sourceBitmap"    # Landroid/graphics/Bitmap;
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
    const/16 v1, 0x32

    .line 28
    invoke-virtual {p2, v1, v1}, Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;->createBitmap(II)Lcom/facebook/common/references/CloseableReference;

    move-result-object v6

    .line 30
    .local v6, "bitmapRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Landroid/graphics/Bitmap;>;"
    :try_start_0
    invoke-virtual {v6}, Lcom/facebook/common/references/CloseableReference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/graphics/Bitmap;

    .line 31
    .local v7, "destBitmap":Landroid/graphics/Bitmap;
    invoke-static {p1, v7}, Lcom/vk/imageloader/ImageLoaderUtils;->fastResizeBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 33
    const/4 v1, 0x5

    invoke-static {v7, v1}, Lcom/vk/attachpicker/jni/Native;->blurBitmap(Landroid/graphics/Bitmap;I)V

    .line 34
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v7}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 36
    .local v0, "canvas":Landroid/graphics/Canvas;
    new-instance v5, Landroid/graphics/Paint;

    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    .line 37
    .local v5, "paint":Landroid/graphics/Paint;
    const/high16 v1, 0x33000000

    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 38
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/Canvas;->getHeight()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 40
    invoke-static {v6}, Lcom/facebook/common/references/CloseableReference;->cloneOrNull(Lcom/facebook/common/references/CloseableReference;)Lcom/facebook/common/references/CloseableReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 42
    invoke-static {v6}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    return-object v1

    .end local v0    # "canvas":Landroid/graphics/Canvas;
    .end local v5    # "paint":Landroid/graphics/Paint;
    .end local v7    # "destBitmap":Landroid/graphics/Bitmap;
    :catchall_0
    move-exception v1

    invoke-static {v6}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    throw v1
.end method
