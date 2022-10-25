.class public Lcom/vk/imageloader/transform/TintPostProcessor;
.super Lcom/facebook/imagepipeline/request/BasePostprocessor;
.source "TintPostProcessor.java"


# instance fields
.field private final cacheKey:Lcom/facebook/cache/common/CacheKey;

.field private final color:I

.field private final name:Ljava/lang/String;

.field private final paint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(I)V
    .locals 3
    .param p1, "color"    # I

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/facebook/imagepipeline/request/BasePostprocessor;-><init>()V

    .line 16
    iput p1, p0, Lcom/vk/imageloader/transform/TintPostProcessor;->color:I

    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "TintPostProcessor#"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/imageloader/transform/TintPostProcessor;->name:Ljava/lang/String;

    .line 18
    new-instance v0, Lcom/facebook/cache/common/SimpleCacheKey;

    iget-object v1, p0, Lcom/vk/imageloader/transform/TintPostProcessor;->name:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/facebook/cache/common/SimpleCacheKey;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vk/imageloader/transform/TintPostProcessor;->cacheKey:Lcom/facebook/cache/common/CacheKey;

    .line 19
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/imageloader/transform/TintPostProcessor;->paint:Landroid/graphics/Paint;

    .line 20
    iget-object v0, p0, Lcom/vk/imageloader/transform/TintPostProcessor;->paint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/PorterDuffColorFilter;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, p1, v2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 21
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vk/imageloader/transform/TintPostProcessor;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPostprocessorCacheKey()Lcom/facebook/cache/common/CacheKey;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vk/imageloader/transform/TintPostProcessor;->cacheKey:Lcom/facebook/cache/common/CacheKey;

    return-object v0
.end method

.method public process(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 3
    .param p1, "destBitmap"    # Landroid/graphics/Bitmap;
    .param p2, "sourceBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v2, 0x0

    .line 25
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 26
    .local v0, "canvas":Landroid/graphics/Canvas;
    iget-object v1, p0, Lcom/vk/imageloader/transform/TintPostProcessor;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p2, v2, v2, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 27
    return-void
.end method
