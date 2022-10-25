.class public Lcom/facebook/imagepipeline/producers/NoOpMediaVariationsIndex;
.super Ljava/lang/Object;
.source "NoOpMediaVariationsIndex.java"

# interfaces
.implements Lcom/facebook/imagepipeline/producers/MediaVariationsIndex;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCachedVariants(Ljava/lang/String;)Lbolts/Task;
    .locals 1
    .param p1, "mediaId"    # Ljava/lang/String;
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

    .prologue
    .line 24
    const/4 v0, 0x0

    invoke-static {v0}, Lbolts/Task;->forResult(Ljava/lang/Object;)Lbolts/Task;

    move-result-object v0

    return-object v0
.end method

.method public saveCachedVariant(Ljava/lang/String;Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V
    .locals 0
    .param p1, "mediaId"    # Ljava/lang/String;
    .param p2, "cacheKey"    # Lcom/facebook/cache/common/CacheKey;
    .param p3, "encodedImage"    # Lcom/facebook/imagepipeline/image/EncodedImage;

    .prologue
    .line 30
    return-void
.end method
