.class public Lcom/vk/imageloader/OkHttpNetworkFetcher;
.super Lcom/facebook/imagepipeline/producers/BaseNetworkFetcher;
.source "OkHttpNetworkFetcher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/imageloader/OkHttpNetworkFetcher$HttpImageBenchmarkReporter;,
        Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/imagepipeline/producers/BaseNetworkFetcher",
        "<",
        "Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;",
        ">;"
    }
.end annotation


# static fields
.field private static final FETCH_TIME:Ljava/lang/String; = "fetch_time"

.field private static final IMAGE_SIZE:Ljava/lang/String; = "image_size"

.field private static final QUEUE_TIME:Ljava/lang/String; = "queue_time"

.field private static final TAG:Ljava/lang/String; = "OkHttpNetworkFetchProducer"

.field private static final TOTAL_TIME:Ljava/lang/String; = "total_time"

.field private static benchmarkReporter:Lcom/vk/imageloader/OkHttpNetworkFetcher$HttpImageBenchmarkReporter;


# instance fields
.field private cancellationExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/BaseNetworkFetcher;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vk/imageloader/OkHttpNetworkFetcher;)Ljava/util/concurrent/Executor;
    .locals 1
    .param p0, "x0"    # Lcom/vk/imageloader/OkHttpNetworkFetcher;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher;->cancellationExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method static synthetic access$002(Lcom/vk/imageloader/OkHttpNetworkFetcher;Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;
    .locals 0
    .param p0, "x0"    # Lcom/vk/imageloader/OkHttpNetworkFetcher;
    .param p1, "x1"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher;->cancellationExecutor:Ljava/util/concurrent/Executor;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vk/imageloader/OkHttpNetworkFetcher;Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;Lokhttp3/Call;ILjava/lang/Exception;ZLcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/imageloader/OkHttpNetworkFetcher;
    .param p1, "x1"    # Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;
    .param p2, "x2"    # Lokhttp3/Call;
    .param p3, "x3"    # I
    .param p4, "x4"    # Ljava/lang/Exception;
    .param p5, "x5"    # Z
    .param p6, "x6"    # Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;

    .prologue
    .line 40
    invoke-direct/range {p0 .. p6}, Lcom/vk/imageloader/OkHttpNetworkFetcher;->handleException(Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;Lokhttp3/Call;ILjava/lang/Exception;ZLcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V

    return-void
.end method

.method private handleException(Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;Lokhttp3/Call;ILjava/lang/Exception;ZLcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V
    .locals 6
    .param p1, "fetchState"    # Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;
    .param p2, "call"    # Lokhttp3/Call;
    .param p3, "responseCode"    # I
    .param p4, "e"    # Ljava/lang/Exception;
    .param p5, "apiError"    # Z
    .param p6, "callback"    # Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;

    .prologue
    .line 186
    invoke-interface {p2}, Lokhttp3/Call;->isCanceled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 187
    invoke-interface {p6}, Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;->onCancellation()V

    .line 196
    :cond_0
    :goto_0
    return-void

    .line 189
    :cond_1
    invoke-interface {p6, p4}, Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;->onFailure(Ljava/lang/Throwable;)V

    .line 191
    sget-object v0, Lcom/vk/imageloader/OkHttpNetworkFetcher;->benchmarkReporter:Lcom/vk/imageloader/OkHttpNetworkFetcher$HttpImageBenchmarkReporter;

    if-eqz v0, :cond_0

    .line 192
    sget-object v0, Lcom/vk/imageloader/OkHttpNetworkFetcher;->benchmarkReporter:Lcom/vk/imageloader/OkHttpNetworkFetcher$HttpImageBenchmarkReporter;

    invoke-interface {p2}, Lokhttp3/Call;->request()Lokhttp3/Request;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v1

    .line 193
    invoke-static {p1}, Lcom/vk/imageloader/OkHttpNetworkFetcher;->isOriginal(Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;)Z

    move-result v5

    move v2, p3

    move-object v3, p4

    move v4, p5

    .line 192
    invoke-interface/range {v0 .. v5}, Lcom/vk/imageloader/OkHttpNetworkFetcher$HttpImageBenchmarkReporter;->reportImageLoadFailure(Ljava/lang/String;ILjava/lang/Exception;ZZ)V

    goto :goto_0
.end method

.method private static isOriginal(Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;)Z
    .locals 3
    .param p0, "fetchState"    # Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;

    .prologue
    .line 199
    invoke-virtual {p0}, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->getContext()Lcom/facebook/imagepipeline/producers/ProducerContext;

    move-result-object v1

    invoke-interface {v1}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getImageRequest()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getResizeOptions()Lcom/facebook/imagepipeline/common/ResizeOptions;

    move-result-object v0

    .line 200
    .local v0, "options":Lcom/facebook/imagepipeline/common/ResizeOptions;
    if-eqz v0, :cond_0

    iget v1, v0, Lcom/facebook/imagepipeline/common/ResizeOptions;->height:I

    sget-object v2, Lcom/vk/imageloader/ImageSize;->BIG:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v2}, Lcom/vk/imageloader/ImageSize;->getPixelsSize()I

    move-result v2

    if-le v1, v2, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static setBenchmarkReporter(Lcom/vk/imageloader/OkHttpNetworkFetcher$HttpImageBenchmarkReporter;)V
    .locals 0
    .param p0, "reporter"    # Lcom/vk/imageloader/OkHttpNetworkFetcher$HttpImageBenchmarkReporter;

    .prologue
    .line 64
    sput-object p0, Lcom/vk/imageloader/OkHttpNetworkFetcher;->benchmarkReporter:Lcom/vk/imageloader/OkHttpNetworkFetcher$HttpImageBenchmarkReporter;

    .line 65
    return-void
.end method


# virtual methods
.method public bridge synthetic createFetchState(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)Lcom/facebook/imagepipeline/producers/FetchState;
    .locals 1

    .prologue
    .line 40
    invoke-virtual {p0, p1, p2}, Lcom/vk/imageloader/OkHttpNetworkFetcher;->createFetchState(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;

    move-result-object v0

    return-object v0
.end method

.method public createFetchState(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;
    .locals 1
    .param p2, "context"    # Lcom/facebook/imagepipeline/producers/ProducerContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Consumer",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            ")",
            "Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;"
        }
    .end annotation

    .prologue
    .line 79
    .local p1, "consumer":Lcom/facebook/imagepipeline/producers/Consumer;, "Lcom/facebook/imagepipeline/producers/Consumer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    new-instance v0, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;

    invoke-direct {v0, p1, p2}, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;-><init>(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    return-object v0
.end method

.method public bridge synthetic fetch(Lcom/facebook/imagepipeline/producers/FetchState;Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V
    .locals 0

    .prologue
    .line 40
    check-cast p1, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;

    invoke-virtual {p0, p1, p2}, Lcom/vk/imageloader/OkHttpNetworkFetcher;->fetch(Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V

    return-void
.end method

.method public fetch(Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V
    .locals 6
    .param p1, "fetchState"    # Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;
    .param p2, "callback"    # Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;

    .prologue
    .line 84
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iput-wide v4, p1, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->submitTime:J

    .line 85
    invoke-virtual {p1}, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->getUri()Landroid/net/Uri;

    move-result-object v3

    .line 86
    .local v3, "uri":Landroid/net/Uri;
    new-instance v4, Lokhttp3/Request$Builder;

    invoke-direct {v4}, Lokhttp3/Request$Builder;-><init>()V

    new-instance v5, Lokhttp3/CacheControl$Builder;

    invoke-direct {v5}, Lokhttp3/CacheControl$Builder;-><init>()V

    .line 87
    invoke-virtual {v5}, Lokhttp3/CacheControl$Builder;->noStore()Lokhttp3/CacheControl$Builder;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/CacheControl$Builder;->build()Lokhttp3/CacheControl;

    move-result-object v5

    invoke-virtual {v4, v5}, Lokhttp3/Request$Builder;->cacheControl(Lokhttp3/CacheControl;)Lokhttp3/Request$Builder;

    move-result-object v4

    .line 88
    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v4

    .line 89
    invoke-virtual {v4}, Lokhttp3/Request$Builder;->get()Lokhttp3/Request$Builder;

    move-result-object v4

    .line 90
    invoke-virtual {v4}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v2

    .line 92
    .local v2, "request":Lokhttp3/Request;
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v4

    sget-object v5, Lcom/vk/core/network/Network$ClientType;->CLIENT_IMAGE_LOADER:Lcom/vk/core/network/Network$ClientType;

    invoke-virtual {v4, v5}, Lcom/vk/core/network/Network;->getClient(Lcom/vk/core/network/Network$ClientType;)Lokhttp3/OkHttpClient;

    move-result-object v1

    .line 93
    .local v1, "client":Lokhttp3/OkHttpClient;
    invoke-virtual {v1, v2}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    .line 95
    .local v0, "call":Lokhttp3/Call;
    invoke-virtual {p1}, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->getContext()Lcom/facebook/imagepipeline/producers/ProducerContext;

    move-result-object v4

    new-instance v5, Lcom/vk/imageloader/OkHttpNetworkFetcher$1;

    invoke-direct {v5, p0, v0, v1}, Lcom/vk/imageloader/OkHttpNetworkFetcher$1;-><init>(Lcom/vk/imageloader/OkHttpNetworkFetcher;Lokhttp3/Call;Lokhttp3/OkHttpClient;)V

    invoke-interface {v4, v5}, Lcom/facebook/imagepipeline/producers/ProducerContext;->addCallbacks(Lcom/facebook/imagepipeline/producers/ProducerContextCallbacks;)V

    .line 114
    new-instance v4, Lcom/vk/imageloader/OkHttpNetworkFetcher$2;

    invoke-direct {v4, p0, p1, p2}, Lcom/vk/imageloader/OkHttpNetworkFetcher$2;-><init>(Lcom/vk/imageloader/OkHttpNetworkFetcher;Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V

    invoke-interface {v0, v4}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    .line 153
    return-void
.end method

.method public bridge synthetic getExtraMap(Lcom/facebook/imagepipeline/producers/FetchState;I)Ljava/util/Map;
    .locals 1

    .prologue
    .line 40
    check-cast p1, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;

    invoke-virtual {p0, p1, p2}, Lcom/vk/imageloader/OkHttpNetworkFetcher;->getExtraMap(Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;I)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getExtraMap(Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;I)Ljava/util/Map;
    .locals 6
    .param p1, "fetchState"    # Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;
    .param p2, "byteSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;",
            "I)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 169
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 170
    .local v0, "extraMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "queue_time"

    iget-wide v2, p1, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->responseTime:J

    iget-wide v4, p1, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->submitTime:J

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    const-string/jumbo v1, "fetch_time"

    iget-wide v2, p1, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->fetchCompleteTime:J

    iget-wide v4, p1, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->responseTime:J

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    const-string/jumbo v1, "total_time"

    iget-wide v2, p1, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->fetchCompleteTime:J

    iget-wide v4, p1, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->submitTime:J

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    const-string/jumbo v1, "image_size"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    return-object v0
.end method

.method public bridge synthetic onFetchCompletion(Lcom/facebook/imagepipeline/producers/FetchState;I)V
    .locals 0

    .prologue
    .line 40
    check-cast p1, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;

    invoke-virtual {p0, p1, p2}, Lcom/vk/imageloader/OkHttpNetworkFetcher;->onFetchCompletion(Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;I)V

    return-void
.end method

.method public onFetchCompletion(Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;I)V
    .locals 8
    .param p1, "fetchState"    # Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;
    .param p2, "byteSize"    # I

    .prologue
    .line 157
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iput-wide v4, p1, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->fetchCompleteTime:J

    .line 159
    sget-object v0, Lcom/vk/imageloader/OkHttpNetworkFetcher;->benchmarkReporter:Lcom/vk/imageloader/OkHttpNetworkFetcher$HttpImageBenchmarkReporter;

    if-eqz v0, :cond_0

    .line 160
    iget-wide v4, p1, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->fetchCompleteTime:J

    iget-wide v6, p1, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->submitTime:J

    sub-long/2addr v4, v6

    long-to-int v2, v4

    .line 161
    .local v2, "totalTime":I
    iget-wide v4, p1, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->fetchCompleteTime:J

    iget-wide v6, p1, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->responseTime:J

    sub-long/2addr v4, v6

    long-to-int v3, v4

    .line 162
    .local v3, "fetchTime":I
    invoke-virtual {p1}, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->getContext()Lcom/facebook/imagepipeline/producers/ProducerContext;

    move-result-object v0

    invoke-interface {v0}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getImageRequest()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    .line 163
    .local v1, "uri":Ljava/lang/String;
    sget-object v0, Lcom/vk/imageloader/OkHttpNetworkFetcher;->benchmarkReporter:Lcom/vk/imageloader/OkHttpNetworkFetcher$HttpImageBenchmarkReporter;

    invoke-static {p1}, Lcom/vk/imageloader/OkHttpNetworkFetcher;->isOriginal(Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;)Z

    move-result v5

    move v4, p2

    invoke-interface/range {v0 .. v5}, Lcom/vk/imageloader/OkHttpNetworkFetcher$HttpImageBenchmarkReporter;->reportImageLoadSucceeded(Ljava/lang/String;IIIZ)V

    .line 165
    .end local v1    # "uri":Ljava/lang/String;
    .end local v2    # "totalTime":I
    .end local v3    # "fetchTime":I
    :cond_0
    return-void
.end method
