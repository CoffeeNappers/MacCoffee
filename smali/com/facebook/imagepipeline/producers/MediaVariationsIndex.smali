.class public interface abstract Lcom/facebook/imagepipeline/producers/MediaVariationsIndex;
.super Ljava/lang/Object;
.source "MediaVariationsIndex.java"


# virtual methods
.method public abstract getCachedVariants(Ljava/lang/String;)Lbolts/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lbolts/Task",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/imagepipeline/request/MediaVariations$Variant;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract saveCachedVariant(Ljava/lang/String;Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V
.end method
