.class Lcom/facebook/imagepipeline/producers/LocalFetchProducer$1;
.super Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;
.source "LocalFetchProducer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/producers/LocalFetchProducer;->produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable",
        "<",
        "Lcom/facebook/imagepipeline/image/EncodedImage;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/imagepipeline/producers/LocalFetchProducer;

.field final synthetic val$imageRequest:Lcom/facebook/imagepipeline/request/ImageRequest;


# direct methods
.method constructor <init>(Lcom/facebook/imagepipeline/producers/LocalFetchProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerListener;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/imagepipeline/request/ImageRequest;)V
    .locals 0
    .param p1, "this$0"    # Lcom/facebook/imagepipeline/producers/LocalFetchProducer;
    .param p3, "producerListener"    # Lcom/facebook/imagepipeline/producers/ProducerListener;
    .param p4, "producerName"    # Ljava/lang/String;
    .param p5, "requestId"    # Ljava/lang/String;

    .prologue
    .line 52
    .local p2, "consumer":Lcom/facebook/imagepipeline/producers/Consumer;, "Lcom/facebook/imagepipeline/producers/Consumer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/LocalFetchProducer$1;->this$0:Lcom/facebook/imagepipeline/producers/LocalFetchProducer;

    iput-object p6, p0, Lcom/facebook/imagepipeline/producers/LocalFetchProducer$1;->val$imageRequest:Lcom/facebook/imagepipeline/request/ImageRequest;

    invoke-direct {p0, p2, p3, p4, p5}, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;-><init>(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerListener;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected disposeResult(Lcom/facebook/imagepipeline/image/EncodedImage;)V
    .locals 0
    .param p1, "result"    # Lcom/facebook/imagepipeline/image/EncodedImage;

    .prologue
    .line 66
    invoke-static {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->closeSafely(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    .line 67
    return-void
.end method

.method protected bridge synthetic disposeResult(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 52
    check-cast p1, Lcom/facebook/imagepipeline/image/EncodedImage;

    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/producers/LocalFetchProducer$1;->disposeResult(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    return-void
.end method

.method protected getResult()Lcom/facebook/imagepipeline/image/EncodedImage;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 56
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/LocalFetchProducer$1;->this$0:Lcom/facebook/imagepipeline/producers/LocalFetchProducer;

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/LocalFetchProducer$1;->val$imageRequest:Lcom/facebook/imagepipeline/request/ImageRequest;

    invoke-virtual {v1, v2}, Lcom/facebook/imagepipeline/producers/LocalFetchProducer;->getEncodedImage(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/image/EncodedImage;

    move-result-object v0

    .line 57
    .local v0, "encodedImage":Lcom/facebook/imagepipeline/image/EncodedImage;
    if-nez v0, :cond_0

    .line 58
    const/4 v0, 0x0

    .line 61
    .end local v0    # "encodedImage":Lcom/facebook/imagepipeline/image/EncodedImage;
    :goto_0
    return-object v0

    .line 60
    .restart local v0    # "encodedImage":Lcom/facebook/imagepipeline/image/EncodedImage;
    :cond_0
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/image/EncodedImage;->parseMetaData()V

    goto :goto_0
.end method

.method protected bridge synthetic getResult()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 52
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/LocalFetchProducer$1;->getResult()Lcom/facebook/imagepipeline/image/EncodedImage;

    move-result-object v0

    return-object v0
.end method
