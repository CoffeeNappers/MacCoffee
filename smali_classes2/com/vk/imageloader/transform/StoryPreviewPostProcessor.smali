.class public Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;
.super Lcom/facebook/imagepipeline/request/BasePostprocessor;
.source "StoryPreviewPostProcessor.java"


# static fields
.field public static final INSTANCE_15:Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;

.field public static final INSTANCE_5:Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;


# instance fields
.field private final radius:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 25
    new-instance v0, Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;-><init>(I)V

    sput-object v0, Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;->INSTANCE_5:Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;

    .line 26
    new-instance v0, Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;-><init>(I)V

    sput-object v0, Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;->INSTANCE_15:Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "radius"    # I

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/facebook/imagepipeline/request/BasePostprocessor;-><init>()V

    .line 31
    iput p1, p0, Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;->radius:I

    .line 32
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "StoryPreviewPostProcessor-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;->radius:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPostprocessorCacheKey()Lcom/facebook/cache/common/CacheKey;
    .locals 3

    .prologue
    .line 71
    new-instance v0, Lcom/facebook/cache/common/SimpleCacheKey;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "StoryPreviewPostProcessor-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;->radius:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

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
    const/high16 v7, 0x3f800000    # 1.0f

    .line 44
    const/16 v4, 0x32

    .line 45
    .local v4, "size":I
    invoke-static {p1}, Lcom/vk/attachpicker/util/BitmapUtils;->getAspectRatio(Landroid/graphics/Bitmap;)F

    move-result v0

    .line 47
    .local v0, "ar":F
    cmpl-float v6, v0, v7

    if-lez v6, :cond_0

    .line 48
    const/16 v5, 0x32

    .line 49
    .local v5, "w":I
    int-to-float v6, v5

    div-float/2addr v6, v0

    float-to-int v3, v6

    .line 57
    .local v3, "h":I
    :goto_0
    invoke-virtual {p2, v5, v3}, Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;->createBitmap(II)Lcom/facebook/common/references/CloseableReference;

    move-result-object v1

    .line 59
    .local v1, "bitmapRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Landroid/graphics/Bitmap;>;"
    :try_start_0
    invoke-virtual {v1}, Lcom/facebook/common/references/CloseableReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;

    .line 60
    .local v2, "destBitmap":Landroid/graphics/Bitmap;
    invoke-static {p1, v2}, Lcom/vk/imageloader/ImageLoaderUtils;->fastResizeBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 61
    iget v6, p0, Lcom/vk/imageloader/transform/StoryPreviewPostProcessor;->radius:I

    invoke-static {v2, v6}, Lcom/vk/attachpicker/jni/Native;->blurBitmap(Landroid/graphics/Bitmap;I)V

    .line 63
    invoke-static {v1}, Lcom/facebook/common/references/CloseableReference;->cloneOrNull(Lcom/facebook/common/references/CloseableReference;)Lcom/facebook/common/references/CloseableReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v6

    .line 65
    invoke-static {v1}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    return-object v6

    .line 50
    .end local v1    # "bitmapRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Landroid/graphics/Bitmap;>;"
    .end local v2    # "destBitmap":Landroid/graphics/Bitmap;
    .end local v3    # "h":I
    .end local v5    # "w":I
    :cond_0
    cmpg-float v6, v0, v7

    if-gez v6, :cond_1

    .line 51
    const/16 v3, 0x32

    .line 52
    .restart local v3    # "h":I
    int-to-float v6, v3

    mul-float/2addr v6, v0

    float-to-int v5, v6

    .restart local v5    # "w":I
    goto :goto_0

    .line 54
    .end local v3    # "h":I
    .end local v5    # "w":I
    :cond_1
    const/16 v5, 0x32

    .line 55
    .restart local v5    # "w":I
    const/16 v3, 0x32

    .restart local v3    # "h":I
    goto :goto_0

    .line 65
    .restart local v1    # "bitmapRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Landroid/graphics/Bitmap;>;"
    :catchall_0
    move-exception v6

    invoke-static {v1}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    throw v6
.end method
