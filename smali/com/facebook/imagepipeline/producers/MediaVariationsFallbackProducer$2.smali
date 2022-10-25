.class Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;
.super Ljava/lang/Object;
.source "MediaVariationsFallbackProducer.java"

# interfaces
.implements Lbolts/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->onFinishDiskReads(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Z)Lbolts/Continuation;
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
.field final synthetic this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;

.field final synthetic val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

.field final synthetic val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener;

.field final synthetic val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

.field final synthetic val$requestId:Ljava/lang/String;

.field final synthetic val$useAsLastResult:Z


# direct methods
.method constructor <init>(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;Lcom/facebook/imagepipeline/producers/ProducerListener;Ljava/lang/String;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;

    .prologue
    .line 206
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;

    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener;

    iput-object p3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$requestId:Ljava/lang/String;

    iput-object p4, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    iput-object p5, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    iput-boolean p6, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$useAsLastResult:Z

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
    .line 206
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->then(Lbolts/Task;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public then(Lbolts/Task;)Ljava/lang/Void;
    .locals 10
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
    const/4 v1, 0x1

    const/4 v9, 0x0

    const/4 v2, 0x0

    .line 211
    invoke-static {p1}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->access$200(Lbolts/Task;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 212
    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener;

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$requestId:Ljava/lang/String;

    const-string/jumbo v4, "MediaVariationsFallbackProducer"

    invoke-interface {v2, v3, v4, v9}, Lcom/facebook/imagepipeline/producers/ProducerListener;->onProducerFinishWithCancellation(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 213
    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    invoke-interface {v2}, Lcom/facebook/imagepipeline/producers/Consumer;->onCancellation()V

    .line 214
    const/4 v1, 0x0

    .line 243
    .local v1, "triggerNextProducer":Z
    :goto_0
    if-eqz v1, :cond_0

    .line 244
    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-static {v2, v3, v4}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->access$000(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    .line 246
    :cond_0
    return-object v9

    .line 215
    .end local v1    # "triggerNextProducer":Z
    :cond_1
    invoke-virtual {p1}, Lbolts/Task;->isFaulted()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 216
    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener;

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$requestId:Ljava/lang/String;

    const-string/jumbo v4, "MediaVariationsFallbackProducer"

    invoke-virtual {p1}, Lbolts/Task;->getError()Ljava/lang/Exception;

    move-result-object v5

    invoke-interface {v2, v3, v4, v5, v9}, Lcom/facebook/imagepipeline/producers/ProducerListener;->onProducerFinishWithFailure(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 217
    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-static {v2, v3, v4}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->access$000(Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    .line 218
    const/4 v1, 0x1

    .restart local v1    # "triggerNextProducer":Z
    goto :goto_0

    .line 220
    .end local v1    # "triggerNextProducer":Z
    :cond_2
    invoke-virtual {p1}, Lbolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/image/EncodedImage;

    .line 221
    .local v0, "cachedReference":Lcom/facebook/imagepipeline/image/EncodedImage;
    if-eqz v0, :cond_5

    .line 222
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener;

    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$requestId:Ljava/lang/String;

    const-string/jumbo v5, "MediaVariationsFallbackProducer"

    iget-object v6, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener;

    iget-object v7, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$requestId:Ljava/lang/String;

    iget-boolean v8, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$useAsLastResult:Z

    .line 225
    invoke-static {v6, v7, v1, v8}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->getExtraMap(Lcom/facebook/imagepipeline/producers/ProducerListener;Ljava/lang/String;ZZ)Ljava/util/Map;

    move-result-object v6

    .line 222
    invoke-interface {v3, v4, v5, v6}, Lcom/facebook/imagepipeline/producers/ProducerListener;->onProducerFinishWithSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 227
    iget-boolean v3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$useAsLastResult:Z

    if-eqz v3, :cond_3

    .line 228
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-interface {v3, v4}, Lcom/facebook/imagepipeline/producers/Consumer;->onProgressUpdate(F)V

    .line 230
    :cond_3
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    iget-boolean v4, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$useAsLastResult:Z

    invoke-interface {v3, v0, v4}, Lcom/facebook/imagepipeline/producers/Consumer;->onNewResult(Ljava/lang/Object;Z)V

    .line 231
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/image/EncodedImage;->close()V

    .line 233
    iget-boolean v3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$useAsLastResult:Z

    if-nez v3, :cond_4

    .restart local v1    # "triggerNextProducer":Z
    :goto_1
    goto :goto_0

    .end local v1    # "triggerNextProducer":Z
    :cond_4
    move v1, v2

    goto :goto_1

    .line 235
    :cond_5
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener;

    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$requestId:Ljava/lang/String;

    const-string/jumbo v5, "MediaVariationsFallbackProducer"

    iget-object v6, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener;

    iget-object v7, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer$2;->val$requestId:Ljava/lang/String;

    .line 238
    invoke-static {v6, v7, v2, v2}, Lcom/facebook/imagepipeline/producers/MediaVariationsFallbackProducer;->getExtraMap(Lcom/facebook/imagepipeline/producers/ProducerListener;Ljava/lang/String;ZZ)Ljava/util/Map;

    move-result-object v2

    .line 235
    invoke-interface {v3, v4, v5, v2}, Lcom/facebook/imagepipeline/producers/ProducerListener;->onProducerFinishWithSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 239
    const/4 v1, 0x1

    .restart local v1    # "triggerNextProducer":Z
    goto :goto_0
.end method
