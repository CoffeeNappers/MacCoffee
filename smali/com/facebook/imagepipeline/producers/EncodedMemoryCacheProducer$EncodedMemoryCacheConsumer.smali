.class Lcom/facebook/imagepipeline/producers/EncodedMemoryCacheProducer$EncodedMemoryCacheConsumer;
.super Lcom/facebook/imagepipeline/producers/DelegatingConsumer;
.source "EncodedMemoryCacheProducer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/producers/EncodedMemoryCacheProducer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EncodedMemoryCacheConsumer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/imagepipeline/producers/DelegatingConsumer",
        "<",
        "Lcom/facebook/imagepipeline/image/EncodedImage;",
        "Lcom/facebook/imagepipeline/image/EncodedImage;",
        ">;"
    }
.end annotation


# instance fields
.field private final mMemoryCache:Lcom/facebook/imagepipeline/cache/MemoryCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/cache/MemoryCache",
            "<",
            "Lcom/facebook/cache/common/CacheKey;",
            "Lcom/facebook/imagepipeline/memory/PooledByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private final mRequestedCacheKey:Lcom/facebook/cache/common/CacheKey;


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/cache/MemoryCache;Lcom/facebook/cache/common/CacheKey;)V
    .locals 0
    .param p3, "requestedCacheKey"    # Lcom/facebook/cache/common/CacheKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Consumer",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;",
            "Lcom/facebook/imagepipeline/cache/MemoryCache",
            "<",
            "Lcom/facebook/cache/common/CacheKey;",
            "Lcom/facebook/imagepipeline/memory/PooledByteBuffer;",
            ">;",
            "Lcom/facebook/cache/common/CacheKey;",
            ")V"
        }
    .end annotation

    .prologue
    .line 110
    .local p1, "consumer":Lcom/facebook/imagepipeline/producers/Consumer;, "Lcom/facebook/imagepipeline/producers/Consumer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    .local p2, "memoryCache":Lcom/facebook/imagepipeline/cache/MemoryCache;, "Lcom/facebook/imagepipeline/cache/MemoryCache<Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/memory/PooledByteBuffer;>;"
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/producers/DelegatingConsumer;-><init>(Lcom/facebook/imagepipeline/producers/Consumer;)V

    .line 111
    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/EncodedMemoryCacheProducer$EncodedMemoryCacheConsumer;->mMemoryCache:Lcom/facebook/imagepipeline/cache/MemoryCache;

    .line 112
    iput-object p3, p0, Lcom/facebook/imagepipeline/producers/EncodedMemoryCacheProducer$EncodedMemoryCacheConsumer;->mRequestedCacheKey:Lcom/facebook/cache/common/CacheKey;

    .line 113
    return-void
.end method


# virtual methods
.method public onNewResultImpl(Lcom/facebook/imagepipeline/image/EncodedImage;Z)V
    .locals 6
    .param p1, "newResult"    # Lcom/facebook/imagepipeline/image/EncodedImage;
    .param p2, "isLast"    # Z

    .prologue
    const/4 v5, 0x1

    .line 118
    if-eqz p2, :cond_0

    if-nez p1, :cond_1

    .line 119
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/EncodedMemoryCacheProducer$EncodedMemoryCacheConsumer;->getConsumer()Lcom/facebook/imagepipeline/producers/Consumer;

    move-result-object v4

    invoke-interface {v4, p1, p2}, Lcom/facebook/imagepipeline/producers/Consumer;->onNewResult(Ljava/lang/Object;Z)V

    .line 151
    :goto_0
    return-void

    .line 123
    :cond_1
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getByteBufferRef()Lcom/facebook/common/references/CloseableReference;

    move-result-object v3

    .line 124
    .local v3, "ref":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/memory/PooledByteBuffer;>;"
    if-eqz v3, :cond_3

    .line 127
    :try_start_0
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getEncodedCacheKey()Lcom/facebook/cache/common/CacheKey;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 128
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getEncodedCacheKey()Lcom/facebook/cache/common/CacheKey;

    move-result-object v0

    .line 129
    .local v0, "cacheKey":Lcom/facebook/cache/common/CacheKey;
    :goto_1
    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/EncodedMemoryCacheProducer$EncodedMemoryCacheConsumer;->mMemoryCache:Lcom/facebook/imagepipeline/cache/MemoryCache;

    invoke-interface {v4, v0, v3}, Lcom/facebook/imagepipeline/cache/MemoryCache;->cache(Ljava/lang/Object;Lcom/facebook/common/references/CloseableReference;)Lcom/facebook/common/references/CloseableReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 131
    .local v2, "cachedResult":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/memory/PooledByteBuffer;>;"
    invoke-static {v3}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    .line 133
    if-eqz v2, :cond_3

    .line 136
    :try_start_1
    new-instance v1, Lcom/facebook/imagepipeline/image/EncodedImage;

    invoke-direct {v1, v2}, Lcom/facebook/imagepipeline/image/EncodedImage;-><init>(Lcom/facebook/common/references/CloseableReference;)V

    .line 137
    .local v1, "cachedEncodedImage":Lcom/facebook/imagepipeline/image/EncodedImage;
    invoke-virtual {v1, p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->copyMetaDataFrom(Lcom/facebook/imagepipeline/image/EncodedImage;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 139
    invoke-static {v2}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    .line 142
    :try_start_2
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/EncodedMemoryCacheProducer$EncodedMemoryCacheConsumer;->getConsumer()Lcom/facebook/imagepipeline/producers/Consumer;

    move-result-object v4

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-interface {v4, v5}, Lcom/facebook/imagepipeline/producers/Consumer;->onProgressUpdate(F)V

    .line 143
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/EncodedMemoryCacheProducer$EncodedMemoryCacheConsumer;->getConsumer()Lcom/facebook/imagepipeline/producers/Consumer;

    move-result-object v4

    const/4 v5, 0x1

    invoke-interface {v4, v1, v5}, Lcom/facebook/imagepipeline/producers/Consumer;->onNewResult(Ljava/lang/Object;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 146
    invoke-static {v1}, Lcom/facebook/imagepipeline/image/EncodedImage;->closeSafely(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    goto :goto_0

    .line 128
    .end local v0    # "cacheKey":Lcom/facebook/cache/common/CacheKey;
    .end local v1    # "cachedEncodedImage":Lcom/facebook/imagepipeline/image/EncodedImage;
    .end local v2    # "cachedResult":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/memory/PooledByteBuffer;>;"
    :cond_2
    :try_start_3
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/EncodedMemoryCacheProducer$EncodedMemoryCacheConsumer;->mRequestedCacheKey:Lcom/facebook/cache/common/CacheKey;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 131
    :catchall_0
    move-exception v4

    invoke-static {v3}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    throw v4

    .line 139
    .restart local v0    # "cacheKey":Lcom/facebook/cache/common/CacheKey;
    .restart local v2    # "cachedResult":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/memory/PooledByteBuffer;>;"
    :catchall_1
    move-exception v4

    invoke-static {v2}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    throw v4

    .line 146
    .restart local v1    # "cachedEncodedImage":Lcom/facebook/imagepipeline/image/EncodedImage;
    :catchall_2
    move-exception v4

    invoke-static {v1}, Lcom/facebook/imagepipeline/image/EncodedImage;->closeSafely(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    throw v4

    .line 150
    .end local v0    # "cacheKey":Lcom/facebook/cache/common/CacheKey;
    .end local v1    # "cachedEncodedImage":Lcom/facebook/imagepipeline/image/EncodedImage;
    .end local v2    # "cachedResult":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/memory/PooledByteBuffer;>;"
    :cond_3
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/EncodedMemoryCacheProducer$EncodedMemoryCacheConsumer;->getConsumer()Lcom/facebook/imagepipeline/producers/Consumer;

    move-result-object v4

    invoke-interface {v4, p1, v5}, Lcom/facebook/imagepipeline/producers/Consumer;->onNewResult(Ljava/lang/Object;Z)V

    goto :goto_0
.end method

.method public bridge synthetic onNewResultImpl(Ljava/lang/Object;Z)V
    .locals 0

    .prologue
    .line 101
    check-cast p1, Lcom/facebook/imagepipeline/image/EncodedImage;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/EncodedMemoryCacheProducer$EncodedMemoryCacheConsumer;->onNewResultImpl(Lcom/facebook/imagepipeline/image/EncodedImage;Z)V

    return-void
.end method
