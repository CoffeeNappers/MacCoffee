.class Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$MediaVariationsConsumer;
.super Lcom/facebook/imagepipeline/producers/DelegatingConsumer;
.source "MediaVariationsFallbackProducer.java"


# annotations
.annotation build Lcom/facebook/common/internal/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MediaVariationsConsumer"
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
.field private final mProducerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

.field final synthetic this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 0
    .param p1, "this$0"    # Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;
    .param p3, "producerContext"    # Lcom/facebook/imagepipeline/producers/ProducerContext;
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
    .line 301
    .local p2, "consumer":Lcom/facebook/imagepipeline/producers/Consumer;, "Lcom/facebook/imagepipeline/producers/Consumer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$MediaVariationsConsumer;->this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;

    .line 302
    invoke-direct {p0, p2}, Lcom/facebook/imagepipeline/producers/DelegatingConsumer;-><init>(Lcom/facebook/imagepipeline/producers/Consumer;)V

    .line 303
    iput-object p3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$MediaVariationsConsumer;->mProducerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 304
    return-void
.end method

.method private storeResultInDatabase(Lcom/facebook/imagepipeline/image/EncodedImage;)V
    .locals 5
    .param p1, "newResult"    # Lcom/facebook/imagepipeline/image/EncodedImage;

    .prologue
    .line 315
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$MediaVariationsConsumer;->mProducerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-interface {v3}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getImageRequest()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v1

    .line 316
    .local v1, "imageRequest":Lcom/facebook/imagepipeline/request/ImageRequest;
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getMediaVariations()Lcom/facebook/imagepipeline/request/MediaVariations;

    move-result-object v2

    .line 318
    .local v2, "mediaVariations":Lcom/facebook/imagepipeline/request/MediaVariations;
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/request/ImageRequest;->isDiskCacheEnabled()Z

    move-result v3

    if-eqz v3, :cond_0

    if-nez v2, :cond_1

    .line 328
    :cond_0
    :goto_0
    return-void

    .line 323
    :cond_1
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$MediaVariationsConsumer;->this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;

    .line 324
    invoke-static {v3}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->access$300(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;)Lcom/facebook/imagepipeline/cache/CacheKeyFactory;

    move-result-object v3

    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$MediaVariationsConsumer;->mProducerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-interface {v4}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getCallerContext()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v1, v4}, Lcom/facebook/imagepipeline/cache/CacheKeyFactory;->getEncodedCacheKey(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Lcom/facebook/cache/common/CacheKey;

    move-result-object v0

    .line 326
    .local v0, "cacheKey":Lcom/facebook/cache/common/CacheKey;
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$MediaVariationsConsumer;->this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;

    invoke-static {v3}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->access$400(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;)Lcom/facebook/imagepipeline/producers/MediaVariationsIndex;

    move-result-object v3

    .line 327
    invoke-virtual {v2}, Lcom/facebook/imagepipeline/request/MediaVariations;->getMediaId()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v0, p1}, Lcom/facebook/imagepipeline/producers/MediaVariationsIndex;->saveCachedVariant(Ljava/lang/String;Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V

    goto :goto_0
.end method


# virtual methods
.method protected onNewResultImpl(Lcom/facebook/imagepipeline/image/EncodedImage;Z)V
    .locals 1
    .param p1, "newResult"    # Lcom/facebook/imagepipeline/image/EncodedImage;
    .param p2, "isLast"    # Z

    .prologue
    .line 308
    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    .line 309
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$MediaVariationsConsumer;->storeResultInDatabase(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    .line 311
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$MediaVariationsConsumer;->getConsumer()Lcom/facebook/imagepipeline/producers/Consumer;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/facebook/imagepipeline/producers/Consumer;->onNewResult(Ljava/lang/Object;Z)V

    .line 312
    return-void
.end method

.method protected bridge synthetic onNewResultImpl(Ljava/lang/Object;Z)V
    .locals 0

    .prologue
    .line 295
    check-cast p1, Lcom/facebook/imagepipeline/image/EncodedImage;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$MediaVariationsConsumer;->onNewResultImpl(Lcom/facebook/imagepipeline/image/EncodedImage;Z)V

    return-void
.end method
