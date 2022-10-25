.class public Lcom/vk/imageloader/VKImageLoader;
.super Ljava/lang/Object;
.source "VKImageLoader.java"


# static fields
.field public static final AUTO_ROTATION_FLAG:I = 0x17280

.field private static final CACHE_SIZE:F = 0.3f

.field private static final IMAGE_PIPELINE_CACHE_DIR:Ljava/lang/String; = "fresco_cache"

.field private static final IMAGE_PIPELINE_STICKER_CACHE_DIR:Ljava/lang/String; = "fresco_sticker_cache"

.field private static final MAX_DISK_CACHE_SIZE:I = 0x6400000

.field private static final MAX_STICKER_DISK_CACHE_SIZE:I = 0xfa00000

.field private static final PERSISTENT_CACHE_URLS:[Ljava/lang/String;

.field private static diskCacheField:Ljava/lang/reflect/Field;

.field private static heapBitmapCache:Landroid/support/v4/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/LruCache",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 48
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "https://vk.com/images/stickers"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "http://vk.com/images/stickers"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "https://vk.com/images/store/stickers"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "http://vk.com/images/store/stickers"

    aput-object v2, v0, v1

    sput-object v0, Lcom/vk/imageloader/VKImageLoader;->PERSISTENT_CACHE_URLS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/net/Uri;IIILcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;Lcom/facebook/imagepipeline/request/Postprocessor;)Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "x0"    # Landroid/net/Uri;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .param p4, "x4"    # Lcom/vk/imageloader/VKImageRequestWrapper;
    .param p5, "x5"    # Lcom/vk/imageloader/VKImageRequestProgress;
    .param p6, "x6"    # Lcom/facebook/imagepipeline/request/Postprocessor;

    .prologue
    .line 44
    invoke-static/range {p0 .. p6}, Lcom/vk/imageloader/VKImageLoader;->getBitmapInternal(Landroid/net/Uri;IIILcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;Lcom/facebook/imagepipeline/request/Postprocessor;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static clearAllCaches()V
    .locals 1

    .prologue
    .line 119
    invoke-static {}, Lcom/vk/imageloader/VKImageLoader;->clearMemoryCache()V

    .line 120
    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->getImagePipeline()Lcom/facebook/imagepipeline/core/ImagePipeline;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/core/ImagePipeline;->clearCaches()V

    .line 121
    return-void
.end method

.method public static clearMemoryCache()V
    .locals 1

    .prologue
    .line 114
    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->getImagePipeline()Lcom/facebook/imagepipeline/core/ImagePipeline;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/core/ImagePipeline;->clearMemoryCaches()V

    .line 115
    sget-object v0, Lcom/vk/imageloader/VKImageLoader;->heapBitmapCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v0}, Landroid/support/v4/util/LruCache;->evictAll()V

    .line 116
    return-void
.end method

.method private static configureCaches(Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;Landroid/content/Context;)V
    .locals 6
    .param p0, "configBuilder"    # Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const v4, 0x7fffffff

    .line 344
    invoke-static {p1}, Lcom/vk/imageloader/VKImageLoader;->getHeapSizeInBytes(Landroid/content/Context;)I

    move-result v2

    int-to-float v2, v2

    const v3, 0x3e99999a    # 0.3f

    mul-float/2addr v2, v3

    float-to-int v1, v2

    .line 346
    .local v1, "memoryCacheSize":I
    new-instance v0, Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    const/16 v2, 0xc8

    move v3, v1

    move v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/facebook/imagepipeline/cache/MemoryCacheParams;-><init>(IIIII)V

    .line 353
    .local v0, "bitmapCacheParams":Lcom/facebook/imagepipeline/cache/MemoryCacheParams;
    new-instance v2, Lcom/vk/imageloader/VKImageLoader$6;

    invoke-direct {v2, v0}, Lcom/vk/imageloader/VKImageLoader$6;-><init>(Lcom/facebook/imagepipeline/cache/MemoryCacheParams;)V

    .line 354
    invoke-virtual {p0, v2}, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->setBitmapMemoryCacheParamsSupplier(Lcom/facebook/common/internal/Supplier;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    move-result-object v2

    .line 362
    invoke-static {p1}, Lcom/facebook/cache/disk/DiskCacheConfig;->newBuilder(Landroid/content/Context;)Lcom/facebook/cache/disk/DiskCacheConfig$Builder;

    move-result-object v3

    .line 363
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/facebook/cache/disk/DiskCacheConfig$Builder;->setBaseDirectoryPath(Ljava/io/File;)Lcom/facebook/cache/disk/DiskCacheConfig$Builder;

    move-result-object v3

    const-string/jumbo v4, "fresco_cache"

    .line 364
    invoke-virtual {v3, v4}, Lcom/facebook/cache/disk/DiskCacheConfig$Builder;->setBaseDirectoryName(Ljava/lang/String;)Lcom/facebook/cache/disk/DiskCacheConfig$Builder;

    move-result-object v3

    const-wide/32 v4, 0x6400000

    .line 365
    invoke-virtual {v3, v4, v5}, Lcom/facebook/cache/disk/DiskCacheConfig$Builder;->setMaxCacheSize(J)Lcom/facebook/cache/disk/DiskCacheConfig$Builder;

    move-result-object v3

    .line 366
    invoke-virtual {v3}, Lcom/facebook/cache/disk/DiskCacheConfig$Builder;->build()Lcom/facebook/cache/disk/DiskCacheConfig;

    move-result-object v3

    .line 361
    invoke-virtual {v2, v3}, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->setMainDiskCacheConfig(Lcom/facebook/cache/disk/DiskCacheConfig;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    move-result-object v2

    .line 369
    invoke-static {p1}, Lcom/facebook/cache/disk/DiskCacheConfig;->newBuilder(Landroid/content/Context;)Lcom/facebook/cache/disk/DiskCacheConfig$Builder;

    move-result-object v3

    .line 370
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/facebook/cache/disk/DiskCacheConfig$Builder;->setBaseDirectoryPath(Ljava/io/File;)Lcom/facebook/cache/disk/DiskCacheConfig$Builder;

    move-result-object v3

    const-string/jumbo v4, "fresco_sticker_cache"

    .line 371
    invoke-virtual {v3, v4}, Lcom/facebook/cache/disk/DiskCacheConfig$Builder;->setBaseDirectoryName(Ljava/lang/String;)Lcom/facebook/cache/disk/DiskCacheConfig$Builder;

    move-result-object v3

    const-wide/32 v4, 0xfa00000

    .line 372
    invoke-virtual {v3, v4, v5}, Lcom/facebook/cache/disk/DiskCacheConfig$Builder;->setMaxCacheSize(J)Lcom/facebook/cache/disk/DiskCacheConfig$Builder;

    move-result-object v3

    .line 373
    invoke-virtual {v3}, Lcom/facebook/cache/disk/DiskCacheConfig$Builder;->build()Lcom/facebook/cache/disk/DiskCacheConfig;

    move-result-object v3

    .line 368
    invoke-virtual {v2, v3}, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->setSmallImageDiskCacheConfig(Lcom/facebook/cache/disk/DiskCacheConfig;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    .line 376
    return-void
.end method

.method private static declared-synchronized diskCache()Lcom/facebook/imagepipeline/cache/BufferedDiskCache;
    .locals 4

    .prologue
    .line 387
    const-class v2, Lcom/vk/imageloader/VKImageLoader;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lcom/vk/imageloader/VKImageLoader;->diskCacheField:Ljava/lang/reflect/Field;

    if-nez v1, :cond_0

    .line 388
    const-class v1, Lcom/facebook/imagepipeline/core/ImagePipeline;

    const-string/jumbo v3, "mMainBufferedDiskCache"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Lcom/vk/imageloader/VKImageLoader;->diskCacheField:Ljava/lang/reflect/Field;

    .line 389
    sget-object v1, Lcom/vk/imageloader/VKImageLoader;->diskCacheField:Ljava/lang/reflect/Field;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 391
    :cond_0
    sget-object v1, Lcom/vk/imageloader/VKImageLoader;->diskCacheField:Ljava/lang/reflect/Field;

    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->getImagePipeline()Lcom/facebook/imagepipeline/core/ImagePipeline;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    return-object v1

    .line 392
    :catch_0
    move-exception v0

    .line 393
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "Can not find mMainBufferedDiskCache field"

    invoke-direct {v1, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 387
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static getBitmap(Landroid/net/Uri;)Lio/reactivex/Observable;
    .locals 7
    .param p0, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v1, 0x0

    .line 204
    move-object v0, p0

    move v2, v1

    move v3, v1

    move-object v5, v4

    move-object v6, v4

    invoke-static/range {v0 .. v6}, Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;IIILcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;Lcom/facebook/imagepipeline/request/Postprocessor;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static getBitmap(Landroid/net/Uri;IIILcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;Lcom/facebook/imagepipeline/request/Postprocessor;)Lio/reactivex/Observable;
    .locals 8
    .param p0, "uri"    # Landroid/net/Uri;
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "rotation"    # I
    .param p4, "wrapper"    # Lcom/vk/imageloader/VKImageRequestWrapper;
    .param p5, "requestProgress"    # Lcom/vk/imageloader/VKImageRequestProgress;
    .param p6, "postprocessor"    # Lcom/facebook/imagepipeline/request/Postprocessor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "III",
            "Lcom/vk/imageloader/VKImageRequestWrapper;",
            "Lcom/vk/imageloader/VKImageRequestProgress;",
            "Lcom/facebook/imagepipeline/request/Postprocessor;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 226
    new-instance v0, Lcom/vk/imageloader/VKImageLoader$4;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/vk/imageloader/VKImageLoader$4;-><init>(Landroid/net/Uri;IIILcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;Lcom/facebook/imagepipeline/request/Postprocessor;)V

    invoke-static {v0}, Lio/reactivex/Observable;->fromCallable(Ljava/util/concurrent/Callable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static getBitmap(Landroid/net/Uri;Lcom/facebook/imagepipeline/request/Postprocessor;)Lio/reactivex/Observable;
    .locals 7
    .param p0, "uri"    # Landroid/net/Uri;
    .param p1, "postprocessor"    # Lcom/facebook/imagepipeline/request/Postprocessor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Lcom/facebook/imagepipeline/request/Postprocessor;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v1, 0x0

    .line 208
    move-object v0, p0

    move v2, v1

    move v3, v1

    move-object v5, v4

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;IIILcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;Lcom/facebook/imagepipeline/request/Postprocessor;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static getBitmapFromMemoryCache(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 4
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 140
    if-nez p0, :cond_1

    move-object v0, v2

    .line 153
    :cond_0
    :goto_0
    return-object v0

    .line 144
    :cond_1
    sget-object v3, Lcom/vk/imageloader/VKImageLoader;->heapBitmapCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v3, p0}, Landroid/support/v4/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 145
    .local v0, "heapBitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_0

    .line 149
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 150
    .local v1, "uri":Landroid/net/Uri;
    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->getImagePipeline()Lcom/facebook/imagepipeline/core/ImagePipeline;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/facebook/imagepipeline/core/ImagePipeline;->isInBitmapMemoryCache(Landroid/net/Uri;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 151
    invoke-static {v1}, Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;)Lio/reactivex/Observable;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;

    move-object v0, v2

    goto :goto_0

    :cond_2
    move-object v0, v2

    .line 153
    goto :goto_0
.end method

.method private static getBitmapInternal(Landroid/net/Uri;IIILcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;Lcom/facebook/imagepipeline/request/Postprocessor;)Landroid/graphics/Bitmap;
    .locals 9
    .param p0, "uri"    # Landroid/net/Uri;
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "rotation"    # I
    .param p4, "wrapper"    # Lcom/vk/imageloader/VKImageRequestWrapper;
    .param p5, "requestProgress"    # Lcom/vk/imageloader/VKImageRequestProgress;
    .param p6, "postprocessor"    # Lcom/facebook/imagepipeline/request/Postprocessor;

    .prologue
    const/4 v6, 0x0

    .line 251
    if-nez p0, :cond_1

    move-object v1, v6

    .line 337
    :cond_0
    :goto_0
    return-object v1

    .line 255
    :cond_1
    sget-object v7, Lcom/vk/imageloader/VKImageLoader;->heapBitmapCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/support/v4/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    .line 256
    .local v1, "heapCachedBitmap":Landroid/graphics/Bitmap;
    if-nez v1, :cond_0

    .line 261
    if-eqz p0, :cond_5

    const-string/jumbo v7, "vkchatphoto"

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 262
    invoke-static {p0}, Lcom/vk/imageloader/AvatarDataSource;->get(Landroid/net/Uri;)Lcom/vk/imageloader/AvatarDataSource;

    move-result-object v0

    .line 279
    .local v0, "dataSource":Lcom/facebook/datasource/DataSource;, "Lcom/facebook/datasource/DataSource<Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;>;"
    :goto_1
    new-instance v5, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v5}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 280
    .local v5, "res":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Landroid/graphics/Bitmap;>;"
    new-instance v3, Ljava/lang/Object;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 281
    .local v3, "lock":Ljava/lang/Object;
    new-instance v4, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v6, 0x1

    invoke-direct {v4, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 283
    .local v4, "needLock":Ljava/util/concurrent/atomic/AtomicBoolean;
    if-eqz p4, :cond_2

    .line 284
    invoke-virtual {p4, v0}, Lcom/vk/imageloader/VKImageRequestWrapper;->wrap(Lcom/facebook/datasource/DataSource;)V

    .line 286
    :cond_2
    new-instance v6, Lcom/vk/imageloader/VKImageLoader$5;

    invoke-direct {v6, v5, v3, v4, p5}, Lcom/vk/imageloader/VKImageLoader$5;-><init>(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/vk/imageloader/VKImageRequestProgress;)V

    .line 319
    invoke-static {}, Lcom/facebook/common/executors/CallerThreadExecutor;->getInstance()Lcom/facebook/common/executors/CallerThreadExecutor;

    move-result-object v7

    .line 286
    invoke-interface {v0, v6, v7}, Lcom/facebook/datasource/DataSource;->subscribe(Lcom/facebook/datasource/DataSubscriber;Ljava/util/concurrent/Executor;)V

    .line 323
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 325
    :try_start_0
    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 326
    :try_start_1
    invoke-virtual {v3}, Ljava/lang/Object;->wait()V

    .line 327
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 333
    :cond_3
    :goto_2
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 334
    sget-object v6, Lcom/vk/imageloader/VKImageLoader;->heapBitmapCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/support/v4/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    :cond_4
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/graphics/Bitmap;

    move-object v1, v6

    goto :goto_0

    .line 264
    .end local v0    # "dataSource":Lcom/facebook/datasource/DataSource;, "Lcom/facebook/datasource/DataSource<Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;>;"
    .end local v3    # "lock":Ljava/lang/Object;
    .end local v4    # "needLock":Ljava/util/concurrent/atomic/AtomicBoolean;
    .end local v5    # "res":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Landroid/graphics/Bitmap;>;"
    :cond_5
    invoke-static {p0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->newBuilderWithSource(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    move-result-object v2

    .line 265
    .local v2, "imageRequest":Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    const v7, 0x17280

    if-ne p3, v7, :cond_8

    .line 266
    invoke-static {}, Lcom/facebook/imagepipeline/common/RotationOptions;->autoRotate()Lcom/facebook/imagepipeline/common/RotationOptions;

    move-result-object v7

    invoke-virtual {v2, v7}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setRotationOptions(Lcom/facebook/imagepipeline/common/RotationOptions;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 270
    :goto_3
    if-lez p1, :cond_6

    if-lez p2, :cond_6

    .line 271
    new-instance v7, Lcom/facebook/imagepipeline/common/ResizeOptions;

    invoke-direct {v7, p1, p2}, Lcom/facebook/imagepipeline/common/ResizeOptions;-><init>(II)V

    invoke-virtual {v2, v7}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setResizeOptions(Lcom/facebook/imagepipeline/common/ResizeOptions;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 273
    :cond_6
    if-eqz p6, :cond_7

    .line 274
    invoke-virtual {v2, p6}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setPostprocessor(Lcom/facebook/imagepipeline/request/Postprocessor;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 276
    :cond_7
    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->getImagePipeline()Lcom/facebook/imagepipeline/core/ImagePipeline;

    move-result-object v7

    invoke-virtual {v2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->build()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v8

    invoke-virtual {v7, v8, v6}, Lcom/facebook/imagepipeline/core/ImagePipeline;->fetchDecodedImage(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Lcom/facebook/datasource/DataSource;

    move-result-object v0

    .restart local v0    # "dataSource":Lcom/facebook/datasource/DataSource;, "Lcom/facebook/datasource/DataSource<Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;>;"
    goto :goto_1

    .line 268
    .end local v0    # "dataSource":Lcom/facebook/datasource/DataSource;, "Lcom/facebook/datasource/DataSource<Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;>;"
    :cond_8
    invoke-static {p3}, Lcom/facebook/imagepipeline/common/RotationOptions;->forceRotation(I)Lcom/facebook/imagepipeline/common/RotationOptions;

    move-result-object v7

    invoke-virtual {v2, v7}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setRotationOptions(Lcom/facebook/imagepipeline/common/RotationOptions;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    goto :goto_3

    .line 327
    .end local v2    # "imageRequest":Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    .restart local v0    # "dataSource":Lcom/facebook/datasource/DataSource;, "Lcom/facebook/datasource/DataSource<Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;>;"
    .restart local v3    # "lock":Ljava/lang/Object;
    .restart local v4    # "needLock":Ljava/util/concurrent/atomic/AtomicBoolean;
    .restart local v5    # "res":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Landroid/graphics/Bitmap;>;"
    :catchall_0
    move-exception v6

    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v6
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0

    .line 328
    :catch_0
    move-exception v6

    goto :goto_2
.end method

.method public static getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;
    .locals 2
    .param p0, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 190
    if-nez p0, :cond_0

    .line 191
    new-instance v0, Ljava/lang/IllegalAccessException;

    const-string/jumbo v1, "url can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalAccessException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lio/reactivex/Observable;->error(Ljava/lang/Throwable;)Lio/reactivex/Observable;

    move-result-object v0

    .line 194
    :goto_0
    return-object v0

    .line 193
    :cond_0
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/imageloader/VKImageLoader$3;

    invoke-direct {v1}, Lcom/vk/imageloader/VKImageLoader$3;-><init>()V

    .line 194
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public static getDiskCacheEntry(Landroid/net/Uri;)Lcom/facebook/imagepipeline/image/EncodedImage;
    .locals 1
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 95
    sget-object v0, Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;->DEFAULT:Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;

    invoke-static {p0, v0}, Lcom/vk/imageloader/VKImageLoader;->getDiskCacheEntry(Landroid/net/Uri;Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;)Lcom/facebook/imagepipeline/image/EncodedImage;

    move-result-object v0

    return-object v0
.end method

.method public static getDiskCacheEntry(Landroid/net/Uri;Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;)Lcom/facebook/imagepipeline/image/EncodedImage;
    .locals 8
    .param p0, "uri"    # Landroid/net/Uri;
    .param p1, "cacheChoice"    # Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;

    .prologue
    const/4 v5, 0x0

    .line 99
    .line 100
    invoke-static {p0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->newBuilderWithSource(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    move-result-object v4

    .line 101
    invoke-virtual {v4, p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setCacheChoice(Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    move-result-object v4

    .line 102
    invoke-virtual {v4}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->build()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v3

    .line 103
    .local v3, "imageRequest":Lcom/facebook/imagepipeline/request/ImageRequest;
    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->getImagePipeline()Lcom/facebook/imagepipeline/core/ImagePipeline;

    move-result-object v4

    invoke-virtual {v4}, Lcom/facebook/imagepipeline/core/ImagePipeline;->getCacheKeyFactory()Lcom/facebook/imagepipeline/cache/CacheKeyFactory;

    move-result-object v4

    invoke-interface {v4, v3, v5}, Lcom/facebook/imagepipeline/cache/CacheKeyFactory;->getEncodedCacheKey(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Lcom/facebook/cache/common/CacheKey;

    move-result-object v1

    .line 105
    .local v1, "cacheKey":Lcom/facebook/cache/common/CacheKey;
    :try_start_0
    invoke-static {}, Lcom/vk/imageloader/VKImageLoader;->diskCache()Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    move-result-object v4

    new-instance v6, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v7, 0x0

    invoke-direct {v6, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    invoke-virtual {v4, v1, v6}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->get(Lcom/facebook/cache/common/CacheKey;Ljava/util/concurrent/atomic/AtomicBoolean;)Lbolts/Task;

    move-result-object v0

    .line 106
    .local v0, "cacheEntry":Lbolts/Task;, "Lbolts/Task<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    invoke-virtual {v0}, Lbolts/Task;->waitForCompletion()V

    .line 107
    invoke-virtual {v0}, Lbolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/facebook/imagepipeline/image/EncodedImage;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .end local v0    # "cacheEntry":Lbolts/Task;, "Lbolts/Task<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    :goto_0
    return-object v4

    .line 108
    :catch_0
    move-exception v2

    .local v2, "e":Ljava/lang/Exception;
    move-object v4, v5

    .line 109
    goto :goto_0
.end method

.method private static getHeapSizeInBytes(Landroid/content/Context;)I
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 379
    const-string/jumbo v2, "activity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 380
    .local v0, "am":Landroid/app/ActivityManager;
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v1

    .line 381
    .local v1, "memoryClass":I
    mul-int/lit16 v2, v1, 0x400

    mul-int/lit16 v1, v2, 0x400

    .line 382
    return v1
.end method

.method public static getVeryBigBitmap(Landroid/net/Uri;)Lio/reactivex/Observable;
    .locals 7
    .param p0, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 212
    sget-object v0, Lcom/vk/imageloader/ImageSize;->VERY_BIG:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v0}, Lcom/vk/imageloader/ImageSize;->getPixelsSize()I

    move-result v1

    sget-object v0, Lcom/vk/imageloader/ImageSize;->VERY_BIG:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v0}, Lcom/vk/imageloader/ImageSize;->getPixelsSize()I

    move-result v2

    const v3, 0x17280

    move-object v0, p0

    move-object v5, v4

    move-object v6, v4

    invoke-static/range {v0 .. v6}, Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;IIILcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;Lcom/facebook/imagepipeline/request/Postprocessor;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static getVeryBigBitmap(Landroid/net/Uri;Lcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;)Lio/reactivex/Observable;
    .locals 7
    .param p0, "uri"    # Landroid/net/Uri;
    .param p1, "wrapper"    # Lcom/vk/imageloader/VKImageRequestWrapper;
    .param p2, "requestProgress"    # Lcom/vk/imageloader/VKImageRequestProgress;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Lcom/vk/imageloader/VKImageRequestWrapper;",
            "Lcom/vk/imageloader/VKImageRequestProgress;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 216
    sget-object v0, Lcom/vk/imageloader/ImageSize;->VERY_BIG:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v0}, Lcom/vk/imageloader/ImageSize;->getPixelsSize()I

    move-result v1

    sget-object v0, Lcom/vk/imageloader/ImageSize;->VERY_BIG:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v0}, Lcom/vk/imageloader/ImageSize;->getPixelsSize()I

    move-result v2

    const v3, 0x17280

    const/4 v6, 0x0

    move-object v0, p0

    move-object v4, p1

    move-object v5, p2

    invoke-static/range {v0 .. v6}, Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;IIILcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;Lcom/facebook/imagepipeline/request/Postprocessor;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x1

    .line 67
    const/4 v1, 0x0

    const/4 v2, 0x1

    :try_start_0
    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string/jumbo v4, "imagepipeline"

    aput-object v4, v2, v3

    invoke-static {p0, v1, v2}, Lcom/vk/core/util/LibraryLoader;->loadLibraries(Landroid/content/Context;Z[Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    :goto_0
    new-instance v1, Lcom/vk/imageloader/VKImageLoader$1;

    invoke-direct {v1, p0}, Lcom/vk/imageloader/VKImageLoader$1;-><init>(Landroid/content/Context;)V

    invoke-static {v1}, Lcom/facebook/common/soloader/SoLoaderShim;->setHandler(Lcom/facebook/common/soloader/SoLoaderShim$Handler;)V

    .line 79
    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ImagePipelineConfig;->newBuilder(Landroid/content/Context;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    move-result-object v0

    .line 80
    .local v0, "configBuilder":Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    invoke-virtual {v0, v5}, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->setDownsampleEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    .line 81
    new-instance v1, Lcom/vk/imageloader/OkHttpNetworkFetcher;

    invoke-direct {v1}, Lcom/vk/imageloader/OkHttpNetworkFetcher;-><init>()V

    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->setNetworkFetcher(Lcom/facebook/imagepipeline/producers/NetworkFetcher;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    .line 82
    invoke-static {}, Lcom/vk/imageloader/VKCacheKeyFactory;->getInstance()Lcom/vk/imageloader/VKCacheKeyFactory;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->setCacheKeyFactory(Lcom/facebook/imagepipeline/cache/CacheKeyFactory;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    .line 83
    invoke-static {v0, p0}, Lcom/vk/imageloader/VKImageLoader;->configureCaches(Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;Landroid/content/Context;)V

    .line 84
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->build()Lcom/facebook/imagepipeline/core/ImagePipelineConfig;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/facebook/drawee/backends/pipeline/Fresco;->initialize(Landroid/content/Context;Lcom/facebook/imagepipeline/core/ImagePipelineConfig;)V

    .line 86
    new-instance v1, Lcom/vk/imageloader/VKImageLoader$2;

    const v2, 0x19bfcc0

    invoke-direct {v1, v2}, Lcom/vk/imageloader/VKImageLoader$2;-><init>(I)V

    sput-object v1, Lcom/vk/imageloader/VKImageLoader;->heapBitmapCache:Landroid/support/v4/util/LruCache;

    .line 92
    return-void

    .line 68
    .end local v0    # "configBuilder":Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static isInCache(Ljava/lang/String;)Z
    .locals 3
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 124
    if-nez p0, :cond_1

    .line 128
    :cond_0
    :goto_0
    return v1

    .line 127
    :cond_1
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 128
    .local v0, "uri":Landroid/net/Uri;
    sget-object v2, Lcom/vk/imageloader/VKImageLoader;->heapBitmapCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v2, p0}, Landroid/support/v4/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->getImagePipeline()Lcom/facebook/imagepipeline/core/ImagePipeline;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/facebook/imagepipeline/core/ImagePipeline;->isInBitmapMemoryCache(Landroid/net/Uri;)Z

    move-result v2

    if-nez v2, :cond_3

    :cond_2
    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->getImagePipeline()Lcom/facebook/imagepipeline/core/ImagePipeline;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/facebook/imagepipeline/core/ImagePipeline;->isInDiskCacheSync(Landroid/net/Uri;)Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_3
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static isInMemoryCache(Ljava/lang/String;)Z
    .locals 3
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 132
    if-nez p0, :cond_1

    .line 136
    :cond_0
    :goto_0
    return v1

    .line 135
    :cond_1
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 136
    .local v0, "uri":Landroid/net/Uri;
    sget-object v2, Lcom/vk/imageloader/VKImageLoader;->heapBitmapCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v2, p0}, Landroid/support/v4/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->getImagePipeline()Lcom/facebook/imagepipeline/core/ImagePipeline;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/facebook/imagepipeline/core/ImagePipeline;->isInBitmapMemoryCache(Landroid/net/Uri;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static prefetchToDisk(Landroid/net/Uri;)V
    .locals 3
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 183
    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->getImagePipeline()Lcom/facebook/imagepipeline/core/ImagePipeline;

    move-result-object v0

    invoke-static {p0}, Lcom/facebook/imagepipeline/request/ImageRequest;->fromUri(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/facebook/imagepipeline/core/ImagePipeline;->prefetchToDiskCache(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Lcom/facebook/datasource/DataSource;

    .line 184
    return-void
.end method

.method public static prefetchToMemory(Landroid/net/Uri;)V
    .locals 1
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 170
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/vk/imageloader/VKImageLoader;->prefetchToMemory(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;)V

    .line 171
    return-void
.end method

.method public static prefetchToMemory(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;)V
    .locals 4
    .param p0, "uri"    # Landroid/net/Uri;
    .param p1, "size"    # Lcom/vk/imageloader/ImageSize;

    .prologue
    .line 174
    invoke-static {p0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->newBuilderWithSource(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    move-result-object v0

    .line 175
    .local v0, "builder":Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    sget-object v1, Lcom/vk/imageloader/view/VKImageView;->ROTATE_OPTIONS:Lcom/facebook/imagepipeline/common/RotationOptions;

    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setRotationOptions(Lcom/facebook/imagepipeline/common/RotationOptions;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 176
    if-eqz p1, :cond_0

    .line 177
    new-instance v1, Lcom/facebook/imagepipeline/common/ResizeOptions;

    invoke-virtual {p1}, Lcom/vk/imageloader/ImageSize;->getPixelsSize()I

    move-result v2

    invoke-virtual {p1}, Lcom/vk/imageloader/ImageSize;->getPixelsSize()I

    move-result v3

    invoke-direct {v1, v2, v3}, Lcom/facebook/imagepipeline/common/ResizeOptions;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setResizeOptions(Lcom/facebook/imagepipeline/common/ResizeOptions;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 179
    :cond_0
    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->getImagePipeline()Lcom/facebook/imagepipeline/core/ImagePipeline;

    move-result-object v1

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->build()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/facebook/imagepipeline/core/ImagePipeline;->prefetchToBitmapCache(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Lcom/facebook/datasource/DataSource;

    .line 180
    return-void
.end method

.method public static shouldUsePersistentCache(Ljava/lang/String;)Z
    .locals 3
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 158
    if-nez p0, :cond_1

    .line 166
    :cond_0
    :goto_0
    return v1

    .line 161
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    sget-object v2, Lcom/vk/imageloader/VKImageLoader;->PERSISTENT_CACHE_URLS:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 162
    sget-object v2, Lcom/vk/imageloader/VKImageLoader;->PERSISTENT_CACHE_URLS:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 163
    const/4 v1, 0x1

    goto :goto_0

    .line 161
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
