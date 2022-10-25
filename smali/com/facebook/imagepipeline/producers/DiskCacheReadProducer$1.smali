.class Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;
.super Ljava/lang/Object;
.source "DiskCacheReadProducer.java"

# interfaces
.implements Lbolts/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;->onFinishDiskReads(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)Lbolts/Continuation;
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
        "Lcom/facebook/imagepipeline/image/EncodedImage;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;

.field final synthetic val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

.field final synthetic val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener;

.field final synthetic val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

.field final synthetic val$requestId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;Lcom/facebook/imagepipeline/producers/ProducerListener;Ljava/lang/String;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 0
    .param p1, "this$0"    # Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->this$0:Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;

    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener;

    iput-object p3, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$requestId:Ljava/lang/String;

    iput-object p4, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    iput-object p5, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic then(Lbolts/Task;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 75
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->then(Lbolts/Task;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public then(Lbolts/Task;)Ljava/lang/Void;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lbolts/Task",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)",
            "Ljava/lang/Void;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p1, "task":Lbolts/Task;, "Lbolts/Task<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 79
    invoke-static {p1}, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;->access$000(Lbolts/Task;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 80
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener;

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$requestId:Ljava/lang/String;

    const-string/jumbo v3, "DiskCacheProducer"

    invoke-interface {v1, v2, v3, v7}, Lcom/facebook/imagepipeline/producers/ProducerListener;->onProducerFinishWithCancellation(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 81
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    invoke-interface {v1}, Lcom/facebook/imagepipeline/producers/Consumer;->onCancellation()V

    .line 103
    :goto_0
    return-object v7

    .line 82
    :cond_0
    invoke-virtual {p1}, Lbolts/Task;->isFaulted()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 83
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener;

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$requestId:Ljava/lang/String;

    const-string/jumbo v3, "DiskCacheProducer"

    invoke-virtual {p1}, Lbolts/Task;->getError()Ljava/lang/Exception;

    move-result-object v4

    invoke-interface {v1, v2, v3, v4, v7}, Lcom/facebook/imagepipeline/producers/ProducerListener;->onProducerFinishWithFailure(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 84
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->this$0:Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;

    invoke-static {v1}, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;->access$100(Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-interface {v1, v2, v3}, Lcom/facebook/imagepipeline/producers/Producer;->produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    goto :goto_0

    .line 86
    :cond_1
    invoke-virtual {p1}, Lbolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/image/EncodedImage;

    .line 87
    .local v0, "cachedReference":Lcom/facebook/imagepipeline/image/EncodedImage;
    if-eqz v0, :cond_2

    .line 88
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener;

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$requestId:Ljava/lang/String;

    const-string/jumbo v3, "DiskCacheProducer"

    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener;

    iget-object v5, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$requestId:Ljava/lang/String;

    .line 91
    invoke-static {v4, v5, v6}, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;->getExtraMap(Lcom/facebook/imagepipeline/producers/ProducerListener;Ljava/lang/String;Z)Ljava/util/Map;

    move-result-object v4

    .line 88
    invoke-interface {v1, v2, v3, v4}, Lcom/facebook/imagepipeline/producers/ProducerListener;->onProducerFinishWithSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 92
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-interface {v1, v2}, Lcom/facebook/imagepipeline/producers/Consumer;->onProgressUpdate(F)V

    .line 93
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    invoke-interface {v1, v0, v6}, Lcom/facebook/imagepipeline/producers/Consumer;->onNewResult(Ljava/lang/Object;Z)V

    .line 94
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/image/EncodedImage;->close()V

    goto :goto_0

    .line 96
    :cond_2
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener;

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$requestId:Ljava/lang/String;

    const-string/jumbo v3, "DiskCacheProducer"

    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener;

    iget-object v5, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$requestId:Ljava/lang/String;

    const/4 v6, 0x0

    .line 99
    invoke-static {v4, v5, v6}, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;->getExtraMap(Lcom/facebook/imagepipeline/producers/ProducerListener;Ljava/lang/String;Z)Ljava/util/Map;

    move-result-object v4

    .line 96
    invoke-interface {v1, v2, v3, v4}, Lcom/facebook/imagepipeline/producers/ProducerListener;->onProducerFinishWithSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 100
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->this$0:Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;

    invoke-static {v1}, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;->access$100(Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-interface {v1, v2, v3}, Lcom/facebook/imagepipeline/producers/Producer;->produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    goto :goto_0
.end method
