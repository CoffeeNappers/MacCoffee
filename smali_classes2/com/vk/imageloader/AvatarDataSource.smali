.class public Lcom/vk/imageloader/AvatarDataSource;
.super Lcom/facebook/datasource/AbstractDataSource;
.source "AvatarDataSource.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/datasource/AbstractDataSource",
        "<",
        "Lcom/facebook/common/references/CloseableReference",
        "<",
        "Lcom/facebook/imagepipeline/image/CloseableImage;",
        ">;>;"
    }
.end annotation


# static fields
.field public static final CHAT_AVATAR_SCHEME:Ljava/lang/String; = "vkchatphoto"


# instance fields
.field private final mDataSource:Lcom/facebook/imagepipeline/datasource/ListDataSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/datasource/ListDataSource",
            "<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/facebook/datasource/DataSource",
            "<",
            "Lcom/facebook/common/references/CloseableReference",
            "<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;>;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p1, "mDataSources":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/facebook/datasource/DataSource<Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;>;>;"
    invoke-direct {p0}, Lcom/facebook/datasource/AbstractDataSource;-><init>()V

    .line 53
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/facebook/datasource/DataSource;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/datasource/DataSource;

    invoke-static {v0}, Lcom/facebook/imagepipeline/datasource/ListDataSource;->create([Lcom/facebook/datasource/DataSource;)Lcom/facebook/imagepipeline/datasource/ListDataSource;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/imageloader/AvatarDataSource;->mDataSource:Lcom/facebook/imagepipeline/datasource/ListDataSource;

    .line 54
    iget-object v0, p0, Lcom/vk/imageloader/AvatarDataSource;->mDataSource:Lcom/facebook/imagepipeline/datasource/ListDataSource;

    new-instance v1, Lcom/vk/imageloader/AvatarDataSource$1;

    invoke-direct {v1, p0}, Lcom/vk/imageloader/AvatarDataSource$1;-><init>(Lcom/vk/imageloader/AvatarDataSource;)V

    .line 64
    invoke-static {}, Lcom/facebook/common/executors/CallerThreadExecutor;->getInstance()Lcom/facebook/common/executors/CallerThreadExecutor;

    move-result-object v2

    .line 54
    invoke-virtual {v0, v1, v2}, Lcom/facebook/imagepipeline/datasource/ListDataSource;->subscribe(Lcom/facebook/datasource/DataSubscriber;Ljava/util/concurrent/Executor;)V

    .line 65
    return-void
.end method

.method static synthetic access$000(Ljava/util/List;)Lcom/facebook/common/references/CloseableReference;
    .locals 1
    .param p0, "x0"    # Ljava/util/List;

    .prologue
    .line 25
    invoke-static {p0}, Lcom/vk/imageloader/AvatarDataSource;->processResult(Ljava/util/List;)Lcom/facebook/common/references/CloseableReference;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/imageloader/AvatarDataSource;Ljava/lang/Object;Z)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/imageloader/AvatarDataSource;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # Z

    .prologue
    .line 25
    invoke-virtual {p0, p1, p2}, Lcom/vk/imageloader/AvatarDataSource;->setResult(Ljava/lang/Object;Z)Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/vk/imageloader/AvatarDataSource;Ljava/lang/Object;Z)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/imageloader/AvatarDataSource;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # Z

    .prologue
    .line 25
    invoke-virtual {p0, p1, p2}, Lcom/vk/imageloader/AvatarDataSource;->setResult(Ljava/lang/Object;Z)Z

    move-result v0

    return v0
.end method

.method public static get(Landroid/net/Uri;)Lcom/vk/imageloader/AvatarDataSource;
    .locals 7
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v3, 0x0

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .local v0, "dataSources":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/facebook/datasource/DataSource<Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;>;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v4, 0x4

    if-ge v1, v4, :cond_0

    .line 32
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "photo"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 33
    .local v2, "p":Ljava/lang/String;
    if-nez v2, :cond_1

    .line 43
    .end local v2    # "p":Ljava/lang/String;
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_2

    .line 46
    :goto_1
    return-object v3

    .line 37
    .restart local v2    # "p":Ljava/lang/String;
    :cond_1
    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->getImagePipeline()Lcom/facebook/imagepipeline/core/ImagePipeline;

    move-result-object v4

    .line 38
    invoke-static {v2}, Lcom/facebook/imagepipeline/request/ImageRequest;->fromUri(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v5

    sget-object v6, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder$CacheLevel;->FULL_FETCH:Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder$CacheLevel;

    .line 40
    invoke-static {v6}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;->convertCacheLevelToRequestLevel(Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder$CacheLevel;)Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    move-result-object v6

    .line 37
    invoke-virtual {v4, v5, v3, v6}, Lcom/facebook/imagepipeline/core/ImagePipeline;->fetchDecodedImage(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;)Lcom/facebook/datasource/DataSource;

    move-result-object v4

    .line 36
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 46
    .end local v2    # "p":Ljava/lang/String;
    :cond_2
    new-instance v3, Lcom/vk/imageloader/AvatarDataSource;

    invoke-direct {v3, v0}, Lcom/vk/imageloader/AvatarDataSource;-><init>(Ljava/util/ArrayList;)V

    goto :goto_1
.end method

.method private static initRects(IILandroid/graphics/Rect;Landroid/graphics/Rect;III)V
    .locals 4
    .param p0, "i"    # I
    .param p1, "size"    # I
    .param p2, "src"    # Landroid/graphics/Rect;
    .param p3, "dst"    # Landroid/graphics/Rect;
    .param p4, "bs"    # I
    .param p5, "iw"    # I
    .param p6, "ih"    # I

    .prologue
    const/4 v3, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 140
    if-ne p1, v3, :cond_2

    .line 141
    if-nez p0, :cond_1

    .line 142
    div-int/lit8 v0, p4, 0x2

    invoke-virtual {p3, v2, v2, v0, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 143
    div-int/lit8 v0, p5, 0x4

    div-int/lit8 v1, p5, 0x4

    mul-int/lit8 v1, v1, 0x3

    invoke-virtual {p2, v0, v2, v1, p6}, Landroid/graphics/Rect;->set(IIII)V

    .line 180
    :cond_0
    :goto_0
    return-void

    .line 145
    :cond_1
    div-int/lit8 v0, p4, 0x2

    invoke-virtual {p3, v0, v2, p4, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 146
    div-int/lit8 v0, p5, 0x4

    div-int/lit8 v1, p5, 0x4

    mul-int/lit8 v1, v1, 0x3

    invoke-virtual {p2, v0, v2, v1, p6}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 148
    :cond_2
    const/4 v0, 0x3

    if-ne p1, v0, :cond_5

    .line 149
    if-nez p0, :cond_3

    .line 150
    div-int/lit8 v0, p4, 0x2

    invoke-virtual {p3, v2, v2, v0, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 151
    div-int/lit8 v0, p5, 0x4

    div-int/lit8 v1, p5, 0x4

    mul-int/lit8 v1, v1, 0x3

    invoke-virtual {p2, v0, v2, v1, p6}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 153
    :cond_3
    if-ne p0, v1, :cond_4

    .line 154
    div-int/lit8 v0, p4, 0x2

    div-int/lit8 v1, p4, 0x2

    invoke-virtual {p3, v0, v2, p4, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 155
    invoke-virtual {p2, v2, v2, p5, p6}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 158
    :cond_4
    div-int/lit8 v0, p4, 0x2

    div-int/lit8 v1, p4, 0x2

    invoke-virtual {p3, v0, v1, p4, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 159
    invoke-virtual {p2, v2, v2, p5, p6}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 162
    :cond_5
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 163
    if-nez p0, :cond_6

    .line 164
    div-int/lit8 v0, p4, 0x2

    div-int/lit8 v1, p4, 0x2

    invoke-virtual {p3, v2, v2, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 165
    invoke-virtual {p2, v2, v2, p5, p6}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 167
    :cond_6
    if-ne p0, v1, :cond_7

    .line 168
    div-int/lit8 v0, p4, 0x2

    div-int/lit8 v1, p4, 0x2

    invoke-virtual {p3, v2, v0, v1, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 169
    invoke-virtual {p2, v2, v2, p5, p6}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 171
    :cond_7
    if-ne p0, v3, :cond_8

    .line 172
    div-int/lit8 v0, p4, 0x2

    div-int/lit8 v1, p4, 0x2

    invoke-virtual {p3, v0, v2, p4, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 173
    invoke-virtual {p2, v2, v2, p5, p6}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 176
    :cond_8
    div-int/lit8 v0, p4, 0x2

    div-int/lit8 v1, p4, 0x2

    invoke-virtual {p3, v0, v1, p4, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 177
    invoke-virtual {p2, v2, v2, p5, p6}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0
.end method

.method private static processResult(Ljava/util/List;)Lcom/facebook/common/references/CloseableReference;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/common/references/CloseableReference",
            "<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;)",
            "Lcom/facebook/common/references/CloseableReference",
            "<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;"
        }
    .end annotation

    .prologue
    .local p0, "res":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;>;"
    const/4 v14, 0x0

    .line 90
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_1

    .line 91
    :cond_0
    const/4 v5, 0x0

    .line 133
    :goto_0
    return-object v5

    .line 92
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_2

    .line 93
    invoke-interface {p0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/facebook/common/references/CloseableReference;

    goto :goto_0

    .line 95
    :cond_2
    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->getImagePipelineFactory()Lcom/facebook/imagepipeline/core/ImagePipelineFactory;

    move-result-object v5

    invoke-virtual {v5}, Lcom/facebook/imagepipeline/core/ImagePipelineFactory;->getPlatformBitmapFactory()Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;

    move-result-object v11

    .line 98
    .local v11, "platformBitmapFactory":Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;
    const/high16 v5, 0x42800000    # 64.0f

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v5, v6

    float-to-int v4, v5

    .line 99
    .local v4, "bs":I
    invoke-virtual {v11, v4, v4}, Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;->createBitmap(II)Lcom/facebook/common/references/CloseableReference;

    move-result-object v13

    .line 102
    .local v13, "resultBitmapRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Landroid/graphics/Bitmap;>;"
    :try_start_0
    invoke-virtual {v13}, Lcom/facebook/common/references/CloseableReference;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/graphics/Bitmap;

    .line 103
    .local v12, "resultBitmap":Landroid/graphics/Bitmap;
    new-instance v7, Landroid/graphics/Canvas;

    invoke-direct {v7, v12}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 104
    .local v7, "canvas":Landroid/graphics/Canvas;
    sget-object v5, Lcom/vk/imageloader/ImageLoaderUtils;->Rect1ThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v5}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Rect;

    .line 105
    .local v2, "src":Landroid/graphics/Rect;
    sget-object v5, Lcom/vk/imageloader/ImageLoaderUtils;->Rect2ThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v5}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/Rect;

    .line 108
    .local v3, "dst":Landroid/graphics/Rect;
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x4

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 109
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_4

    .line 110
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/facebook/common/references/CloseableReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    .local v10, "imgRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;"
    :try_start_1
    invoke-virtual {v10}, Lcom/facebook/common/references/CloseableReference;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/facebook/imagepipeline/image/CloseableImage;

    .line 113
    .local v8, "ci":Lcom/facebook/imagepipeline/image/CloseableImage;
    instance-of v5, v8, Lcom/facebook/imagepipeline/image/CloseableBitmap;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-nez v5, :cond_3

    .line 122
    :try_start_2
    invoke-static {v10}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 109
    .end local v8    # "ci":Lcom/facebook/imagepipeline/image/CloseableImage;
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 116
    .restart local v8    # "ci":Lcom/facebook/imagepipeline/image/CloseableImage;
    :cond_3
    :try_start_3
    check-cast v8, Lcom/facebook/imagepipeline/image/CloseableBitmap;

    .end local v8    # "ci":Lcom/facebook/imagepipeline/image/CloseableImage;
    invoke-virtual {v8}, Lcom/facebook/imagepipeline/image/CloseableBitmap;->getUnderlyingBitmap()Landroid/graphics/Bitmap;

    move-result-object v9

    .line 118
    .local v9, "img":Landroid/graphics/Bitmap;
    invoke-virtual {v9}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v9}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-static/range {v0 .. v6}, Lcom/vk/imageloader/AvatarDataSource;->initRects(IILandroid/graphics/Rect;Landroid/graphics/Rect;III)V

    .line 120
    sget-object v5, Lcom/vk/imageloader/ImageLoaderUtils;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v7, v9, v2, v3, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 122
    :try_start_4
    invoke-static {v10}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2

    .line 133
    .end local v0    # "i":I
    .end local v1    # "size":I
    .end local v2    # "src":Landroid/graphics/Rect;
    .end local v3    # "dst":Landroid/graphics/Rect;
    .end local v7    # "canvas":Landroid/graphics/Canvas;
    .end local v9    # "img":Landroid/graphics/Bitmap;
    .end local v10    # "imgRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;"
    .end local v12    # "resultBitmap":Landroid/graphics/Bitmap;
    :catchall_0
    move-exception v5

    invoke-static {v13}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    throw v5

    .line 122
    .restart local v0    # "i":I
    .restart local v1    # "size":I
    .restart local v2    # "src":Landroid/graphics/Rect;
    .restart local v3    # "dst":Landroid/graphics/Rect;
    .restart local v7    # "canvas":Landroid/graphics/Canvas;
    .restart local v10    # "imgRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;"
    .restart local v12    # "resultBitmap":Landroid/graphics/Bitmap;
    :catchall_1
    move-exception v5

    :try_start_5
    invoke-static {v10}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    throw v5

    .line 126
    .end local v10    # "imgRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;"
    :cond_4
    new-instance v5, Lcom/facebook/imagepipeline/image/CloseableStaticBitmap;

    sget-object v6, Lcom/facebook/imagepipeline/image/ImmutableQualityInfo;->FULL_QUALITY:Lcom/facebook/imagepipeline/image/QualityInfo;

    const/4 v14, 0x0

    invoke-direct {v5, v13, v6, v14}, Lcom/facebook/imagepipeline/image/CloseableStaticBitmap;-><init>(Lcom/facebook/common/references/CloseableReference;Lcom/facebook/imagepipeline/image/QualityInfo;I)V

    invoke-static {v5}, Lcom/facebook/common/references/CloseableReference;->of(Ljava/io/Closeable;)Lcom/facebook/common/references/CloseableReference;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result-object v5

    .line 133
    invoke-static {v13}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    goto/16 :goto_0
.end method


# virtual methods
.method public close()Z
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/vk/imageloader/AvatarDataSource;->mDataSource:Lcom/facebook/imagepipeline/datasource/ListDataSource;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/datasource/ListDataSource;->close()Z

    move-result v0

    return v0
.end method

.method public declared-synchronized getResult()Lcom/facebook/common/references/CloseableReference;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/common/references/CloseableReference",
            "<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 69
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lcom/facebook/datasource/AbstractDataSource;->hasResult()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/imageloader/AvatarDataSource;->mDataSource:Lcom/facebook/imagepipeline/datasource/ListDataSource;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/datasource/ListDataSource;->hasResult()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/vk/imageloader/AvatarDataSource;->mDataSource:Lcom/facebook/imagepipeline/datasource/ListDataSource;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/datasource/ListDataSource;->getResult()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/imageloader/AvatarDataSource;->processResult(Ljava/util/List;)Lcom/facebook/common/references/CloseableReference;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/vk/imageloader/AvatarDataSource;->setResult(Ljava/lang/Object;Z)Z

    .line 72
    :cond_0
    invoke-super {p0}, Lcom/facebook/datasource/AbstractDataSource;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/common/references/CloseableReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 69
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public bridge synthetic getResult()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 25
    invoke-virtual {p0}, Lcom/vk/imageloader/AvatarDataSource;->getResult()Lcom/facebook/common/references/CloseableReference;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized hasResult()Z
    .locals 1

    .prologue
    .line 82
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lcom/facebook/datasource/AbstractDataSource;->hasResult()Z

    move-result v0

    if-nez v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/vk/imageloader/AvatarDataSource;->mDataSource:Lcom/facebook/imagepipeline/datasource/ListDataSource;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/datasource/ListDataSource;->hasResult()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 85
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 82
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
