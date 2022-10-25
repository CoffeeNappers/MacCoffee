.class public Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher;
.super Lcom/facebook/imagepipeline/producers/BaseNetworkFetcher;
.source "HttpUrlConnectionNetworkFetcher.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/imagepipeline/producers/BaseNetworkFetcher",
        "<",
        "Lcom/facebook/imagepipeline/producers/FetchState;",
        ">;"
    }
.end annotation


# static fields
.field public static final HTTP_PERMANENT_REDIRECT:I = 0x134

.field public static final HTTP_TEMPORARY_REDIRECT:I = 0x133

.field private static final MAX_REDIRECTS:I = 0x5

.field private static final NUM_NETWORK_THREADS:I = 0x3


# instance fields
.field private final mExecutorService:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    const/4 v0, 0x3

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 43
    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .locals 0
    .param p1, "executorService"    # Ljava/util/concurrent/ExecutorService;
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/BaseNetworkFetcher;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 48
    return-void
.end method

.method private downloadFrom(Landroid/net/Uri;I)Ljava/net/HttpURLConnection;
    .locals 12
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "maxRedirects"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 96
    invoke-static {p1}, Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher;->openConnectionTo(Landroid/net/Uri;)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 97
    .local v0, "connection":Ljava/net/HttpURLConnection;
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v5

    .line 99
    .local v5, "responseCode":I
    invoke-static {v5}, Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher;->isHttpSuccess(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 110
    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    :goto_0
    return-object v0

    .line 102
    .restart local v0    # "connection":Ljava/net/HttpURLConnection;
    :cond_0
    invoke-static {v5}, Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher;->isHttpRedirect(I)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 103
    const-string/jumbo v6, "Location"

    invoke-virtual {v0, v6}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 104
    .local v3, "nextUriString":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 106
    if-nez v3, :cond_1

    const/4 v2, 0x0

    .line 107
    .local v2, "nextUri":Landroid/net/Uri;
    :goto_1
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    .line 109
    .local v4, "originalScheme":Ljava/lang/String;
    if-lez p2, :cond_2

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 110
    add-int/lit8 v6, p2, -0x1

    invoke-direct {p0, v2, v6}, Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher;->downloadFrom(Landroid/net/Uri;I)Ljava/net/HttpURLConnection;

    move-result-object v0

    goto :goto_0

    .line 106
    .end local v2    # "nextUri":Landroid/net/Uri;
    .end local v4    # "originalScheme":Ljava/lang/String;
    :cond_1
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    goto :goto_1

    .line 112
    .restart local v2    # "nextUri":Landroid/net/Uri;
    .restart local v4    # "originalScheme":Ljava/lang/String;
    :cond_2
    if-nez p2, :cond_3

    const-string/jumbo v6, "URL %s follows too many redirects"

    new-array v7, v11, [Ljava/lang/Object;

    .line 113
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v6, v7}, Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher;->error(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 115
    .local v1, "message":Ljava/lang/String;
    :goto_2
    new-instance v6, Ljava/io/IOException;

    invoke-direct {v6, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 113
    .end local v1    # "message":Ljava/lang/String;
    :cond_3
    const-string/jumbo v6, "URL %s returned %d without a valid redirect"

    new-array v7, v8, [Ljava/lang/Object;

    .line 114
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v11

    invoke-static {v6, v7}, Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher;->error(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 119
    .end local v2    # "nextUri":Landroid/net/Uri;
    .end local v3    # "nextUriString":Ljava/lang/String;
    .end local v4    # "originalScheme":Ljava/lang/String;
    :cond_4
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 120
    new-instance v6, Ljava/io/IOException;

    const-string/jumbo v7, "Image URL %s returned HTTP code %d"

    new-array v8, v8, [Ljava/lang/Object;

    .line 121
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v11

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method private static varargs error(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "format"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 151
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static isHttpRedirect(I)Z
    .locals 1
    .param p0, "responseCode"    # I

    .prologue
    .line 137
    packed-switch p0, :pswitch_data_0

    .line 146
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 144
    :pswitch_1
    const/4 v0, 0x1

    goto :goto_0

    .line 137
    nop

    :pswitch_data_0
    .packed-switch 0x12c
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private static isHttpSuccess(I)Z
    .locals 1
    .param p0, "responseCode"    # I

    .prologue
    .line 132
    const/16 v0, 0xc8

    if-lt p0, v0, :cond_0

    const/16 v0, 0x12c

    if-ge p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static openConnectionTo(Landroid/net/Uri;)Ljava/net/HttpURLConnection;
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    new-instance v0, Ljava/net/URL;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 128
    .local v0, "url":Ljava/net/URL;
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    return-object v1
.end method


# virtual methods
.method public createFetchState(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)Lcom/facebook/imagepipeline/producers/FetchState;
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
            "Lcom/facebook/imagepipeline/producers/FetchState;"
        }
    .end annotation

    .prologue
    .line 52
    .local p1, "consumer":Lcom/facebook/imagepipeline/producers/Consumer;, "Lcom/facebook/imagepipeline/producers/Consumer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    new-instance v0, Lcom/facebook/imagepipeline/producers/FetchState;

    invoke-direct {v0, p1, p2}, Lcom/facebook/imagepipeline/producers/FetchState;-><init>(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    return-object v0
.end method

.method public fetch(Lcom/facebook/imagepipeline/producers/FetchState;Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V
    .locals 3
    .param p1, "fetchState"    # Lcom/facebook/imagepipeline/producers/FetchState;
    .param p2, "callback"    # Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;

    .prologue
    .line 57
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher$1;

    invoke-direct {v2, p0, p1, p2}, Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher$1;-><init>(Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher;Lcom/facebook/imagepipeline/producers/FetchState;Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    .line 64
    .local v0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/FetchState;->getContext()Lcom/facebook/imagepipeline/producers/ProducerContext;

    move-result-object v1

    new-instance v2, Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher$2;

    invoke-direct {v2, p0, v0, p2}, Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher$2;-><init>(Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher;Ljava/util/concurrent/Future;Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V

    invoke-interface {v1, v2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->addCallbacks(Lcom/facebook/imagepipeline/producers/ProducerContextCallbacks;)V

    .line 73
    return-void
.end method

.method fetchSync(Lcom/facebook/imagepipeline/producers/FetchState;Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V
    .locals 4
    .param p1, "fetchState"    # Lcom/facebook/imagepipeline/producers/FetchState;
    .param p2, "callback"    # Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;
    .annotation build Lcom/facebook/common/internal/VisibleForTesting;
    .end annotation

    .prologue
    .line 77
    const/4 v0, 0x0

    .line 80
    .local v0, "connection":Ljava/net/HttpURLConnection;
    :try_start_0
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/producers/FetchState;->getUri()Landroid/net/Uri;

    move-result-object v2

    const/4 v3, 0x5

    invoke-direct {p0, v2, v3}, Lcom/facebook/imagepipeline/producers/HttpUrlConnectionNetworkFetcher;->downloadFrom(Landroid/net/Uri;I)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 82
    if-eqz v0, :cond_0

    .line 83
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    const/4 v3, -0x1

    invoke-interface {p2, v2, v3}, Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;->onResponse(Ljava/io/InputStream;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    :cond_0
    if-eqz v0, :cond_1

    .line 89
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 93
    :cond_1
    :goto_0
    return-void

    .line 85
    :catch_0
    move-exception v1

    .line 86
    .local v1, "e":Ljava/io/IOException;
    :try_start_1
    invoke-interface {p2, v1}, Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;->onFailure(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 88
    if-eqz v0, :cond_1

    .line 89
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_0

    .line 88
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    if-eqz v0, :cond_2

    .line 89
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_2
    throw v2
.end method
