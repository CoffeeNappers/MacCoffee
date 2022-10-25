.class public Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;
.super Ljava/lang/Object;
.source "DiskCacheReadProducer.java"

# interfaces
.implements Lcom/facebook/imagepipeline/producers/Producer;


# annotations
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

.field public static final PRODUCER_NAME:Ljava/lang/String; = "DiskCacheProducer"


# instance fields
.field private final mDiskCachePolicy:Lcom/facebook/imagepipeline/cache/DiskCachePolicy;

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


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/producers/Producer;Lcom/facebook/imagepipeline/cache/DiskCachePolicy;)V
    .locals 0
    .param p2, "diskCachePolicy"    # Lcom/facebook/imagepipeline/cache/DiskCachePolicy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;",
            "Lcom/facebook/imagepipeline/cache/DiskCachePolicy;",
            ")V"
        }
    .end annotation

    .prologue
    .line 46
    .local p1, "inputProducer":Lcom/facebook/imagepipeline/producers/Producer;, "Lcom/facebook/imagepipeline/producers/Producer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;->mInputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    .line 48
    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;->mDiskCachePolicy:Lcom/facebook/imagepipeline/cache/DiskCachePolicy;

    .line 49
    return-void
.end method

.method static synthetic access$000(Lbolts/Task;)Z
    .locals 1
    .param p0, "x0"    # Lbolts/Task;

    .prologue
    .line 37
    invoke-static {p0}, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;->isTaskCancelled(Lbolts/Task;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;->mInputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method static getExtraMap(Lcom/facebook/imagepipeline/producers/ProducerListener;Ljava/lang/String;Z)Ljava/util/Map;
    .locals 2
    .param p0, "listener"    # Lcom/facebook/imagepipeline/producers/ProducerListener;
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "valueFound"    # Z
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/ProducerListener;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 130
    invoke-interface {p0, p1}, Lcom/facebook/imagepipeline/producers/ProducerListener;->requiresExtraMap(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 131
    const/4 v0, 0x0

    .line 133
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "cached_value_found"

    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

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
    .line 109
    .local p0, "task":Lbolts/Task;, "Lbolts/Task<*>;"
    invoke-virtual {p0}, Lbolts/Task;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 110
    invoke-virtual {p0}, Lbolts/Task;->isFaulted()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lbolts/Task;->getError()Ljava/lang/Exception;

    move-result-object v0

    instance-of v0, v0, Ljava/util/concurrent/CancellationException;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 109
    :goto_0
    return v0

    .line 110
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private maybeStartInputProducer(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
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
    .line 116
    .local p1, "consumer":Lcom/facebook/imagepipeline/producers/Consumer;, "Lcom/facebook/imagepipeline/producers/Consumer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getLowestPermittedRequestLevel()Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->getValue()I

    move-result v0

    sget-object v1, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->DISK_CACHE:Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    .line 117
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->getValue()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 118
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-interface {p1, v0, v1}, Lcom/facebook/imagepipeline/producers/Consumer;->onNewResult(Ljava/lang/Object;Z)V

    .line 123
    :goto_0
    return-void

    .line 122
    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;->mInputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    invoke-interface {v0, p1, p2}, Lcom/facebook/imagepipeline/producers/Producer;->produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    goto :goto_0
.end method

.method private onFinishDiskReads(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)Lbolts/Continuation;
    .locals 6
    .param p2, "producerContext"    # Lcom/facebook/imagepipeline/producers/ProducerContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Consumer",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            ")",
            "Lbolts/Continuation",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .prologue
    .line 73
    .local p1, "consumer":Lcom/facebook/imagepipeline/producers/Consumer;, "Lcom/facebook/imagepipeline/producers/Consumer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getId()Ljava/lang/String;

    move-result-object v3

    .line 74
    .local v3, "requestId":Ljava/lang/String;
    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getListener()Lcom/facebook/imagepipeline/producers/ProducerListener;

    move-result-object v2

    .line 75
    .local v2, "listener":Lcom/facebook/imagepipeline/producers/ProducerListener;
    new-instance v0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$1;-><init>(Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;Lcom/facebook/imagepipeline/producers/ProducerListener;Ljava/lang/String;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    return-object v0
.end method

.method private subscribeTaskForRequestCancellation(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 1
    .param p1, "isCancelled"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p2, "producerContext"    # Lcom/facebook/imagepipeline/producers/ProducerContext;

    .prologue
    .line 139
    new-instance v0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$2;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer$2;-><init>(Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    invoke-interface {p2, v0}, Lcom/facebook/imagepipeline/producers/ProducerContext;->addCallbacks(Lcom/facebook/imagepipeline/producers/ProducerContextCallbacks;)V

    .line 146
    return-void
.end method


# virtual methods
.method public produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 7
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
    .line 54
    .local p1, "consumer":Lcom/facebook/imagepipeline/producers/Consumer;, "Lcom/facebook/imagepipeline/producers/Consumer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getImageRequest()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v2

    .line 55
    .local v2, "imageRequest":Lcom/facebook/imagepipeline/request/ImageRequest;
    invoke-virtual {v2}, Lcom/facebook/imagepipeline/request/ImageRequest;->isDiskCacheEnabled()Z

    move-result v4

    if-nez v4, :cond_0

    .line 56
    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;->maybeStartInputProducer(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    .line 68
    :goto_0
    return-void

    .line 60
    :cond_0
    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getListener()Lcom/facebook/imagepipeline/producers/ProducerListener;

    move-result-object v4

    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getId()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "DiskCacheProducer"

    invoke-interface {v4, v5, v6}, Lcom/facebook/imagepipeline/producers/ProducerListener;->onProducerStart(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    new-instance v3, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 63
    .local v3, "isCancelled":Ljava/util/concurrent/atomic/AtomicBoolean;
    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;->mDiskCachePolicy:Lcom/facebook/imagepipeline/cache/DiskCachePolicy;

    .line 64
    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getCallerContext()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v2, v5, v3}, Lcom/facebook/imagepipeline/cache/DiskCachePolicy;->createAndStartCacheReadTask(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;)Lbolts/Task;

    move-result-object v1

    .line 65
    .local v1, "diskLookupTask":Lbolts/Task;, "Lbolts/Task<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;->onFinishDiskReads(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)Lbolts/Continuation;

    move-result-object v0

    .line 66
    .local v0, "continuation":Lbolts/Continuation;, "Lbolts/Continuation<Lcom/facebook/imagepipeline/image/EncodedImage;Ljava/lang/Void;>;"
    invoke-virtual {v1, v0}, Lbolts/Task;->continueWith(Lbolts/Continuation;)Lbolts/Task;

    .line 67
    invoke-direct {p0, v3, p2}, Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;->subscribeTaskForRequestCancellation(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    goto :goto_0
.end method
