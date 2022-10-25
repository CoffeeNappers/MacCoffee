.class Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;
.super Ljava/lang/Object;
.source "MediaVariationsFallbackProducer.java"

# interfaces
.implements Lbolts/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lbolts/Continuation",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/facebook/imagepipeline/request/MediaVariations$Variant;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;

.field final synthetic val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

.field final synthetic val$imageRequest:Lcom/facebook/imagepipeline/request/ImageRequest;

.field final synthetic val$isCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final synthetic val$mediaVariations:Lcom/facebook/imagepipeline/request/MediaVariations;

.field final synthetic val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

.field final synthetic val$resizeOptions:Lcom/facebook/imagepipeline/common/ResizeOptions;


# direct methods
.method constructor <init>(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/imagepipeline/request/MediaVariations;Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/imagepipeline/common/ResizeOptions;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 0
    .param p1, "this$0"    # Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;

    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    iput-object p3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    iput-object p4, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->val$mediaVariations:Lcom/facebook/imagepipeline/request/MediaVariations;

    iput-object p5, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->val$imageRequest:Lcom/facebook/imagepipeline/request/ImageRequest;

    iput-object p6, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->val$resizeOptions:Lcom/facebook/imagepipeline/common/ResizeOptions;

    iput-object p7, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->val$isCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public then(Lbolts/Task;)Ljava/lang/Object;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lbolts/Task",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/imagepipeline/request/MediaVariations$Variant;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p1, "task":Lbolts/Task;, "Lbolts/Task<Ljava/util/List<Lcom/facebook/imagepipeline/request/MediaVariations$Variant;>;>;"
    const/4 v9, 0x0

    .line 107
    invoke-virtual {p1}, Lbolts/Task;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lbolts/Task;->isFaulted()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 125
    .end local p1    # "task":Lbolts/Task;, "Lbolts/Task<Ljava/util/List<Lcom/facebook/imagepipeline/request/MediaVariations$Variant;>;>;"
    :cond_0
    :goto_0
    return-object p1

    .line 111
    .restart local p1    # "task":Lbolts/Task;, "Lbolts/Task<Ljava/util/List<Lcom/facebook/imagepipeline/request/MediaVariations$Variant;>;>;"
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lbolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lbolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 112
    :cond_2
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-static {v0, v1, v2}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->access$000(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    move-object p1, v9

    .line 113
    goto :goto_0

    .line 115
    :cond_3
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->val$mediaVariations:Lcom/facebook/imagepipeline/request/MediaVariations;

    .line 119
    invoke-virtual {p1}, Lbolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    iget-object v5, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->val$imageRequest:Lcom/facebook/imagepipeline/request/ImageRequest;

    iget-object v6, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->val$resizeOptions:Lcom/facebook/imagepipeline/common/ResizeOptions;

    iget-object v7, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$1;->val$isCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 115
    invoke-static/range {v0 .. v7}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->access$100(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/imagepipeline/request/MediaVariations;Ljava/util/List;Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/imagepipeline/common/ResizeOptions;Ljava/util/concurrent/atomic/AtomicBoolean;)Lbolts/Task;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p1

    goto :goto_0

    .line 124
    :catch_0
    move-exception v8

    .local v8, "e":Ljava/lang/Exception;
    move-object p1, v9

    .line 125
    goto :goto_0
.end method
