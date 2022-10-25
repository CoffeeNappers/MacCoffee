.class public Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;
.super Ljava/lang/Object;
.source "MediaVariationsFallbackProducer.java"

# interfaces
.implements Lcom/facebook/imagepipeline/producers/Producer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$MediaVariationsConsumer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/imagepipeline/producers/Producer",
        "<",
        "Lcom/facebook/imagepipeline/image/EncodedImage;",
        ">;"
    }
.end annotation


# static fields
.field public static final EXTRA_CACHED_VALUE_FOUND:Ljava/lang/String; = "cached_value_found"

.field public static final EXTRA_CACHED_VALUE_USED_AS_LAST:Ljava/lang/String; = "cached_value_used_as_last"

.field static final PRODUCER_NAME:Ljava/lang/String; = "MediaVariationsFallbackProducer"
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation
.end field


# instance fields
.field private final mCacheKeyFactory:Lcom/facebook/imagepipeline/cache/CacheKeyFactory;

.field private final mDefaultBufferedDiskCache:Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

.field private final mInputProducer:Lcom/facebook/imagepipeline/producers/Producer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/producers/Producer",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation
.end field

.field private final mMediaVariationsIndex:Lcom/facebook/imagepipeline/producers/MediaVariationsIndex;

.field private final mSmallImageBufferedDiskCache:Lcom/facebook/imagepipeline/cache/BufferedDiskCache;


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/imagepipeline/cache/CacheKeyFactory;Lcom/facebook/imagepipeline/producers/MediaVariationsIndex;Lcom/facebook/imagepipeline/producers/Producer;)V
    .locals 0
    .param p1, "defaultBufferedDiskCache"    # Lcom/facebook/imagepipeline/cache/BufferedDiskCache;
    .param p2, "smallImageBufferedDiskCache"    # Lcom/facebook/imagepipeline/cache/BufferedDiskCache;
    .param p3, "cacheKeyFactory"    # Lcom/facebook/imagepipeline/cache/CacheKeyFactory;
    .param p4, "mediaVariationsIndex"    # Lcom/facebook/imagepipeline/producers/MediaVariationsIndex;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/BufferedDiskCache;",
            "Lcom/facebook/imagepipeline/cache/BufferedDiskCache;",
            "Lcom/facebook/imagepipeline/cache/CacheKeyFactory;",
            "Lcom/facebook/imagepipeline/producers/MediaVariationsIndex;",
            "Lcom/facebook/imagepipeline/producers/Producer",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p5, "inputProducer":Lcom/facebook/imagepipeline/producers/Producer;, "Lcom/facebook/imagepipeline/producers/Producer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->mDefaultBufferedDiskCache:Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    .line 65
    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->mSmallImageBufferedDiskCache:Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    .line 66
    iput-object p3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->mCacheKeyFactory:Lcom/facebook/imagepipeline/cache/CacheKeyFactory;

    .line 67
    iput-object p4, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->mMediaVariationsIndex:Lcom/facebook/imagepipeline/producers/MediaVariationsIndex;

    .line 68
    iput-object p5, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->mInputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    .line 69
    return-void
.end method

.method static synthetic access$000(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 0
    .param p0, "x0"    # Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;
    .param p1, "x1"    # Lcom/facebook/imagepipeline/producers/Consumer;
    .param p2, "x2"    # Lcom/facebook/imagepipeline/producers/ProducerContext;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->startInputProducer(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    return-void
.end method

.method static synthetic access$100(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/imagepipeline/request/MediaVariations;Ljava/util/List;Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/imagepipeline/common/ResizeOptions;Ljava/util/concurrent/atomic/AtomicBoolean;)Lbolts/Task;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;
    .param p1, "x1"    # Lcom/facebook/imagepipeline/producers/Consumer;
    .param p2, "x2"    # Lcom/facebook/imagepipeline/producers/ProducerContext;
    .param p3, "x3"    # Lcom/facebook/imagepipeline/request/MediaVariations;
    .param p4, "x4"    # Ljava/util/List;
    .param p5, "x5"    # Lcom/facebook/imagepipeline/request/ImageRequest;
    .param p6, "x6"    # Lcom/facebook/imagepipeline/common/ResizeOptions;
    .param p7, "x7"    # Ljava/util/concurrent/atomic/AtomicBoolean;

    .prologue
    .line 46
    invoke-direct/range {p0 .. p7}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->chooseFromVariants(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/imagepipeline/request/MediaVariations;Ljava/util/List;Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/imagepipeline/common/ResizeOptions;Ljava/util/concurrent/atomic/AtomicBoolean;)Lbolts/Task;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lbolts/Task;)Z
    .locals 1
    .param p0, "x0"    # Lbolts/Task;

    .prologue
    .line 46
    invoke-static {p0}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->isTaskCancelled(Lbolts/Task;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;)Lcom/facebook/imagepipeline/cache/CacheKeyFactory;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->mCacheKeyFactory:Lcom/facebook/imagepipeline/cache/CacheKeyFactory;

    return-object v0
.end method

.method static synthetic access$400(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;)Lcom/facebook/imagepipeline/producers/MediaVariationsIndex;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->mMediaVariationsIndex:Lcom/facebook/imagepipeline/producers/MediaVariationsIndex;

    return-object v0
.end method

.method private chooseFromVariants(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/imagepipeline/request/MediaVariations;Ljava/util/List;Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/imagepipeline/common/ResizeOptions;Ljava/util/concurrent/atomic/AtomicBoolean;)Lbolts/Task;
    .locals 13
    .param p2, "producerContext"    # Lcom/facebook/imagepipeline/producers/ProducerContext;
    .param p3, "mediaVariations"    # Lcom/facebook/imagepipeline/request/MediaVariations;
    .param p5, "imageRequest"    # Lcom/facebook/imagepipeline/request/ImageRequest;
    .param p6, "resizeOptions"    # Lcom/facebook/imagepipeline/common/ResizeOptions;
    .param p7, "isCancelled"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Consumer",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            "Lcom/facebook/imagepipeline/request/MediaVariations;",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/imagepipeline/request/MediaVariations$Variant;",
            ">;",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            "Lcom/facebook/imagepipeline/common/ResizeOptions;",
            "Ljava/util/concurrent/atomic/AtomicBoolean;",
            ")",
            "Lbolts/Task;"
        }
    .end annotation

    .prologue
    .line 143
    .line 144
    .local p1, "consumer":Lcom/facebook/imagepipeline/producers/Consumer;, "Lcom/facebook/imagepipeline/producers/Consumer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    .local p4, "variants":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/imagepipeline/request/MediaVariations$Variant;>;"
    invoke-virtual/range {p5 .. p5}, Lcom/facebook/imagepipeline/request/ImageRequest;->getCacheChoice()Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;

    move-result-object v11

    sget-object v12, Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;->SMALL:Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;

    if-ne v11, v12, :cond_1

    iget-object v6, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->mSmallImageBufferedDiskCache:Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    .line 146
    .local v6, "preferredCache":Lcom/facebook/imagepipeline/cache/BufferedDiskCache;
    :goto_0
    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getCallerContext()Ljava/lang/Object;

    move-result-object v2

    .line 148
    .local v2, "callerContext":Ljava/lang/Object;
    const/4 v8, 0x0

    .line 149
    .local v8, "preferredVariant":Lcom/facebook/imagepipeline/request/MediaVariations$Variant;
    const/4 v7, 0x0

    .line 152
    .local v7, "preferredCacheKey":Lcom/facebook/cache/common/CacheKey;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    invoke-interface/range {p4 .. p4}, Ljava/util/List;->size()I

    move-result v11

    if-ge v5, v11, :cond_2

    .line 153
    move-object/from16 v0, p4

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;

    .line 154
    .local v10, "variant":Lcom/facebook/imagepipeline/request/MediaVariations$Variant;
    iget-object v11, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->mCacheKeyFactory:Lcom/facebook/imagepipeline/cache/CacheKeyFactory;

    .line 155
    invoke-virtual {v10}, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->getUri()Landroid/net/Uri;

    move-result-object v12

    move-object/from16 v0, p5

    invoke-interface {v11, v0, v12, v2}, Lcom/facebook/imagepipeline/cache/CacheKeyFactory;->getEncodedCacheKey(Lcom/facebook/imagepipeline/request/ImageRequest;Landroid/net/Uri;Ljava/lang/Object;)Lcom/facebook/cache/common/CacheKey;

    move-result-object v1

    .line 156
    .local v1, "cacheKey":Lcom/facebook/cache/common/CacheKey;
    invoke-virtual {v6, v1}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->containsSync(Lcom/facebook/cache/common/CacheKey;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 157
    move-object/from16 v0, p6

    invoke-static {v10, v8, v0}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->isCloserToRequest(Lcom/facebook/imagepipeline/request/MediaVariations$Variant;Lcom/facebook/imagepipeline/request/MediaVariations$Variant;Lcom/facebook/imagepipeline/common/ResizeOptions;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 158
    move-object v8, v10

    .line 159
    move-object v7, v1

    .line 152
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 144
    .end local v1    # "cacheKey":Lcom/facebook/cache/common/CacheKey;
    .end local v2    # "callerContext":Ljava/lang/Object;
    .end local v5    # "i":I
    .end local v6    # "preferredCache":Lcom/facebook/imagepipeline/cache/BufferedDiskCache;
    .end local v7    # "preferredCacheKey":Lcom/facebook/cache/common/CacheKey;
    .end local v8    # "preferredVariant":Lcom/facebook/imagepipeline/request/MediaVariations$Variant;
    .end local v10    # "variant":Lcom/facebook/imagepipeline/request/MediaVariations$Variant;
    :cond_1
    iget-object v6, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->mDefaultBufferedDiskCache:Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    goto :goto_0

    .line 165
    .restart local v2    # "callerContext":Ljava/lang/Object;
    .restart local v5    # "i":I
    .restart local v6    # "preferredCache":Lcom/facebook/imagepipeline/cache/BufferedDiskCache;
    .restart local v7    # "preferredCacheKey":Lcom/facebook/cache/common/CacheKey;
    .restart local v8    # "preferredVariant":Lcom/facebook/imagepipeline/request/MediaVariations$Variant;
    :cond_2
    if-nez v7, :cond_3

    .line 166
    const/4 v11, 0x0

    invoke-static {v11}, Lbolts/Task;->forResult(Ljava/lang/Object;)Lbolts/Task;

    move-result-object v4

    .line 167
    .local v4, "diskLookupTask":Lbolts/Task;, "Lbolts/Task<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    const/4 v9, 0x0

    .line 175
    .local v9, "useAsLastResult":Z
    :goto_2
    invoke-direct {p0, p1, p2, v9}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->onFinishDiskReads(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Z)Lbolts/Continuation;

    move-result-object v3

    .line 176
    .local v3, "continuation":Lbolts/Continuation;, "Lbolts/Continuation<Lcom/facebook/imagepipeline/image/EncodedImage;Ljava/lang/Void;>;"
    invoke-virtual {v4, v3}, Lbolts/Task;->continueWith(Lbolts/Continuation;)Lbolts/Task;

    move-result-object v11

    return-object v11

    .line 169
    .end local v3    # "continuation":Lbolts/Continuation;, "Lbolts/Continuation<Lcom/facebook/imagepipeline/image/EncodedImage;Ljava/lang/Void;>;"
    .end local v4    # "diskLookupTask":Lbolts/Task;, "Lbolts/Task<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    .end local v9    # "useAsLastResult":Z
    :cond_3
    move-object/from16 v0, p7

    invoke-virtual {v6, v7, v0}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->get(Lcom/facebook/cache/common/CacheKey;Ljava/util/concurrent/atomic/AtomicBoolean;)Lbolts/Task;

    move-result-object v4

    .line 170
    .restart local v4    # "diskLookupTask":Lbolts/Task;, "Lbolts/Task<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    invoke-virtual/range {p3 .. p3}, Lcom/facebook/imagepipeline/request/MediaVariations;->shouldForceRequestForSpecifiedUri()Z

    move-result v11

    if-nez v11, :cond_4

    .line 171
    move-object/from16 v0, p6

    invoke-static {v8, v0}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->isBigEnoughForRequestedSize(Lcom/facebook/imagepipeline/request/MediaVariations$Variant;Lcom/facebook/imagepipeline/common/ResizeOptions;)Z

    move-result v11

    if-eqz v11, :cond_4

    const/4 v9, 0x1

    .restart local v9    # "useAsLastResult":Z
    :goto_3
    goto :goto_2

    .end local v9    # "useAsLastResult":Z
    :cond_4
    const/4 v9, 0x0

    goto :goto_3
.end method

.method static getExtraMap(Lcom/facebook/imagepipeline/producers/ProducerListener;Ljava/lang/String;ZZ)Ljava/util/Map;
    .locals 4
    .param p0, "listener"    # Lcom/facebook/imagepipeline/producers/ProducerListener;
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "valueFound"    # Z
    .param p3, "useAsLastResult"    # Z
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/ProducerListener;",
            "Ljava/lang/String;",
            "ZZ)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 269
    invoke-interface {p0, p1}, Lcom/facebook/imagepipeline/producers/ProducerListener;->requiresExtraMap(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 270
    const/4 v0, 0x0

    .line 279
    :goto_0
    return-object v0

    .line 272
    :cond_0
    if-eqz p2, :cond_1

    .line 273
    const-string/jumbo v0, "cached_value_found"

    const/4 v1, 0x1

    .line 275
    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "cached_value_used_as_last"

    .line 277
    invoke-static {p3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    .line 273
    invoke-static {v0, v1, v2, v3}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    goto :goto_0

    .line 279
    :cond_1
    const-string/jumbo v0, "cached_value_found"

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    goto :goto_0
.end method

.method private static isBigEnoughForRequestedSize(Lcom/facebook/imagepipeline/request/MediaVariations$Variant;Lcom/facebook/imagepipeline/common/ResizeOptions;)Z
    .locals 2
    .param p0, "variant"    # Lcom/facebook/imagepipeline/request/MediaVariations$Variant;
    .param p1, "resizeOptions"    # Lcom/facebook/imagepipeline/common/ResizeOptions;

    .prologue
    .line 182
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->getWidth()I

    move-result v0

    iget v1, p1, Lcom/facebook/imagepipeline/common/ResizeOptions;->width:I

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->getHeight()I

    move-result v0

    iget v1, p1, Lcom/facebook/imagepipeline/common/ResizeOptions;->height:I

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isCloserToRequest(Lcom/facebook/imagepipeline/request/MediaVariations$Variant;Lcom/facebook/imagepipeline/request/MediaVariations$Variant;Lcom/facebook/imagepipeline/common/ResizeOptions;)Z
    .locals 4
    .param p0, "variant"    # Lcom/facebook/imagepipeline/request/MediaVariations$Variant;
    .param p1, "comparison"    # Lcom/facebook/imagepipeline/request/MediaVariations$Variant;
    .param p2, "resizeOptions"    # Lcom/facebook/imagepipeline/common/ResizeOptions;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 189
    if-nez p1, :cond_1

    .line 196
    :cond_0
    :goto_0
    return v0

    .line 192
    :cond_1
    invoke-static {p1, p2}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->isBigEnoughForRequestedSize(Lcom/facebook/imagepipeline/request/MediaVariations$Variant;Lcom/facebook/imagepipeline/common/ResizeOptions;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 193
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->getWidth()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 194
    invoke-static {p0, p2}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->isBigEnoughForRequestedSize(Lcom/facebook/imagepipeline/request/MediaVariations$Variant;Lcom/facebook/imagepipeline/common/ResizeOptions;)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_2
    move v0, v1

    goto :goto_0

    .line 196
    :cond_3
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->getWidth()I

    move-result v3

    if-gt v2, v3, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method private static isTaskCancelled(Lbolts/Task;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lbolts/Task",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 259
    .local p0, "task":Lbolts/Task;, "Lbolts/Task<*>;"
    invoke-virtual {p0}, Lbolts/Task;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 260
    invoke-virtual {p0}, Lbolts/Task;->isFaulted()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lbolts/Task;->getError()Ljava/lang/Exception;

    move-result-object v0

    instance-of v0, v0, Ljava/util/concurrent/CancellationException;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 259
    :goto_0
    return v0

    .line 260
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private onFinishDiskReads(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Z)Lbolts/Continuation;
    .locals 7
    .param p2, "producerContext"    # Lcom/facebook/imagepipeline/producers/ProducerContext;
    .param p3, "useAsLastResult"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Consumer",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            "Z)",
            "Lbolts/Continuation",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .prologue
    .line 204
    .local p1, "consumer":Lcom/facebook/imagepipeline/producers/Consumer;, "Lcom/facebook/imagepipeline/producers/Consumer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getId()Ljava/lang/String;

    move-result-object v3

    .line 205
    .local v3, "requestId":Ljava/lang/String;
    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getListener()Lcom/facebook/imagepipeline/producers/ProducerListener;

    move-result-object v2

    .line 206
    .local v2, "listener":Lcom/facebook/imagepipeline/producers/ProducerListener;
    new-instance v0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;-><init>(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;Lcom/facebook/imagepipeline/producers/ProducerListener;Ljava/lang/String;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Z)V

    return-object v0
.end method

.method private startInputProducer(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 2
    .param p2, "producerContext"    # Lcom/facebook/imagepipeline/producers/ProducerContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Consumer",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 254
    .local p1, "consumer":Lcom/facebook/imagepipeline/producers/Consumer;, "Lcom/facebook/imagepipeline/producers/Consumer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->mInputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    new-instance v1, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$MediaVariationsConsumer;

    invoke-direct {v1, p0, p1, p2}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$MediaVariationsConsumer;-><init>(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    .line 255
    invoke-interface {v0, v1, p2}, Lcom/facebook/imagepipeline/producers/Producer;->produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    .line 256
    return-void
.end method

.method private subscribeTaskForRequestCancellation(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 1
    .param p1, "isCancelled"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p2, "producerContext"    # Lcom/facebook/imagepipeline/producers/ProducerContext;

    .prologue
    .line 286
    new-instance v0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$3;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$3;-><init>(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    invoke-interface {p2, v0}, Lcom/facebook/imagepipeline/producers/ProducerContext;->addCallbacks(Lcom/facebook/imagepipeline/producers/ProducerContextCallbacks;)V

    .line 293
    return-void
.end method


# virtual methods
.method public produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 19
    .param p2, "producerContext"    # Lcom/facebook/imagepipeline/producers/ProducerContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Consumer",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 74
    .local p1, "consumer":Lcom/facebook/imagepipeline/producers/Consumer;, "Lcom/facebook/imagepipeline/producers/Consumer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    invoke-interface/range {p2 .. p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getImageRequest()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v7

    .line 75
    .local v7, "imageRequest":Lcom/facebook/imagepipeline/request/ImageRequest;
    invoke-virtual {v7}, Lcom/facebook/imagepipeline/request/ImageRequest;->getResizeOptions()Lcom/facebook/imagepipeline/common/ResizeOptions;

    move-result-object v8

    .line 76
    .local v8, "resizeOptions":Lcom/facebook/imagepipeline/common/ResizeOptions;
    invoke-virtual {v7}, Lcom/facebook/imagepipeline/request/ImageRequest;->getMediaVariations()Lcom/facebook/imagepipeline/request/MediaVariations;

    move-result-object v5

    .line 78
    .local v5, "mediaVariations":Lcom/facebook/imagepipeline/request/MediaVariations;
    invoke-virtual {v7}, Lcom/facebook/imagepipeline/request/ImageRequest;->isDiskCacheEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    if-eqz v8, :cond_0

    iget v2, v8, Lcom/facebook/imagepipeline/common/ResizeOptions;->height:I

    if-lez v2, :cond_0

    iget v2, v8, Lcom/facebook/imagepipeline/common/ResizeOptions;->width:I

    if-lez v2, :cond_0

    if-nez v5, :cond_1

    .line 83
    :cond_0
    invoke-direct/range {p0 .. p2}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->startInputProducer(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    .line 133
    :goto_0
    return-void

    .line 87
    :cond_1
    invoke-interface/range {p2 .. p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getListener()Lcom/facebook/imagepipeline/producers/ProducerListener;

    move-result-object v2

    invoke-interface/range {p2 .. p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getId()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "MediaVariationsFallbackProducer"

    invoke-interface {v2, v3, v4}, Lcom/facebook/imagepipeline/producers/ProducerListener;->onProducerStart(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    new-instance v9, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-direct {v9, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 91
    .local v9, "isCancelled":Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-virtual {v5}, Lcom/facebook/imagepipeline/request/MediaVariations;->getVariants()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 96
    invoke-virtual {v5}, Lcom/facebook/imagepipeline/request/MediaVariations;->getVariants()Ljava/util/List;

    move-result-object v6

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    .line 92
    invoke-direct/range {v2 .. v9}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->chooseFromVariants(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/imagepipeline/request/MediaVariations;Ljava/util/List;Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/imagepipeline/common/ResizeOptions;Ljava/util/concurrent/atomic/AtomicBoolean;)Lbolts/Task;

    .line 132
    :goto_1
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v9, v1}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->subscribeTaskForRequestCancellation(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    goto :goto_0

    .line 101
    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->mMediaVariationsIndex:Lcom/facebook/imagepipeline/producers/MediaVariationsIndex;

    .line 102
    invoke-virtual {v5}, Lcom/facebook/imagepipeline/request/MediaVariations;->getMediaId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/facebook/imagepipeline/producers/MediaVariationsIndex;->getCachedVariants(Ljava/lang/String;)Lbolts/Task;

    move-result-object v18

    .line 103
    .local v18, "cachedVariantsTask":Lbolts/Task;, "Lbolts/Task<Ljava/util/List<Lcom/facebook/imagepipeline/request/MediaVariations$Variant;>;>;"
    new-instance v10, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;

    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move-object/from16 v13, p2

    move-object v14, v5

    move-object v15, v7

    move-object/from16 v16, v8

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v17}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;-><init>(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/imagepipeline/request/MediaVariations;Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/imagepipeline/common/ResizeOptions;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Lbolts/Task;->continueWith(Lbolts/Continuation;)Lbolts/Task;

    goto :goto_1
.end method
