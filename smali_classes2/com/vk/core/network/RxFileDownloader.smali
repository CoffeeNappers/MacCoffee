.class public Lcom/vk/core/network/RxFileDownloader;
.super Ljava/lang/Object;
.source "RxFileDownloader.java"

# interfaces
.implements Lio/reactivex/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/core/network/RxFileDownloader$DownloadCancelationException;,
        Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;,
        Lcom/vk/core/network/RxFileDownloader$DownloadEvent;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/ObservableOnSubscribe",
        "<",
        "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final backgroundThread:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private final context:Landroid/content/Context;

.field private final outputFile:Ljava/io/File;

.field private final url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/vk/core/network/RxFileDownloader;->backgroundThread:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "outputFile"    # Ljava/io/File;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/vk/core/network/RxFileDownloader;->context:Landroid/content/Context;

    .line 36
    iput-object p2, p0, Lcom/vk/core/network/RxFileDownloader;->url:Ljava/lang/String;

    .line 37
    iput-object p3, p0, Lcom/vk/core/network/RxFileDownloader;->outputFile:Ljava/io/File;

    .line 38
    return-void
.end method

.method static synthetic access$300()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lcom/vk/core/network/RxFileDownloader;->backgroundThread:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method private static createResponseCancellable(Lokhttp3/Response;)Lio/reactivex/functions/Cancellable;
    .locals 1
    .param p0, "response"    # Lokhttp3/Response;

    .prologue
    .line 225
    new-instance v0, Lcom/vk/core/network/RxFileDownloader$2;

    invoke-direct {v0, p0}, Lcom/vk/core/network/RxFileDownloader$2;-><init>(Lokhttp3/Response;)V

    return-object v0
.end method

.method public static download(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Lio/reactivex/Observable;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "outputFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/io/File;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 25
    new-instance v0, Lcom/vk/core/network/RxFileDownloader;

    invoke-direct {v0, p0, p1, p2}, Lcom/vk/core/network/RxFileDownloader;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)V

    invoke-static {v0}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object v0

    const-wide/16 v2, 0x64

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v4, 0x1

    .line 26
    invoke-virtual {v0, v2, v3, v1, v4}, Lio/reactivex/Observable;->sample(JLjava/util/concurrent/TimeUnit;Z)Lio/reactivex/Observable;

    move-result-object v0

    .line 27
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public subscribe(Lio/reactivex/ObservableEmitter;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableEmitter",
            "<",
            "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 43
    .local p1, "e":Lio/reactivex/ObservableEmitter;, "Lio/reactivex/ObservableEmitter<Lcom/vk/core/network/RxFileDownloader$DownloadEvent;>;"
    :try_start_0
    iget-object v7, p0, Lcom/vk/core/network/RxFileDownloader;->outputFile:Ljava/io/File;

    invoke-static {v7}, Lcom/vk/core/util/FileUtils;->doubleTryDeleteFile(Ljava/io/File;)V

    .line 45
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vk/core/network/Network;->makeBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v7

    new-instance v8, Lcom/vk/core/network/RxFileDownloader$1;

    invoke-direct {v8, p0, p1}, Lcom/vk/core/network/RxFileDownloader$1;-><init>(Lcom/vk/core/network/RxFileDownloader;Lio/reactivex/ObservableEmitter;)V

    .line 46
    invoke-virtual {v7, v8}, Lokhttp3/OkHttpClient$Builder;->addNetworkInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 55
    .local v0, "builder":Lokhttp3/OkHttpClient$Builder;
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v1

    .line 56
    .local v1, "client":Lokhttp3/OkHttpClient;
    new-instance v7, Lokhttp3/Request$Builder;

    invoke-direct {v7}, Lokhttp3/Request$Builder;-><init>()V

    iget-object v8, p0, Lcom/vk/core/network/RxFileDownloader;->url:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v7

    invoke-virtual {v7}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v4

    .line 57
    .local v4, "request":Lokhttp3/Request;
    invoke-virtual {v1, v4}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v7

    invoke-interface {v7}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v5

    .line 58
    .local v5, "response":Lokhttp3/Response;
    invoke-static {v5}, Lcom/vk/core/network/RxFileDownloader;->createResponseCancellable(Lokhttp3/Response;)Lio/reactivex/functions/Cancellable;

    move-result-object v7

    invoke-interface {p1, v7}, Lio/reactivex/ObservableEmitter;->setCancellable(Lio/reactivex/functions/Cancellable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 62
    :try_start_1
    iget-object v7, p0, Lcom/vk/core/network/RxFileDownloader;->outputFile:Ljava/io/File;

    invoke-static {v7}, Lokio/Okio;->sink(Ljava/io/File;)Lokio/Sink;

    move-result-object v7

    invoke-static {v7}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v6

    .line 63
    .local v6, "sink":Lokio/BufferedSink;
    invoke-virtual {v5}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v7

    invoke-virtual {v7}, Lokhttp3/ResponseBody;->source()Lokio/BufferedSource;

    move-result-object v7

    invoke-interface {v6, v7}, Lokio/BufferedSink;->writeAll(Lokio/Source;)J

    .line 64
    invoke-interface {v6}, Lokio/BufferedSink;->close()V
    :try_end_1
    .catch Lcom/vk/core/network/RxFileDownloader$DownloadCancelationException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 69
    .end local v6    # "sink":Lokio/BufferedSink;
    :goto_0
    :try_start_2
    invoke-interface {p1}, Lio/reactivex/ObservableEmitter;->isDisposed()Z

    move-result v7

    if-nez v7, :cond_0

    .line 70
    iget-object v7, p0, Lcom/vk/core/network/RxFileDownloader;->outputFile:Ljava/io/File;

    invoke-static {v7}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->createDoneEvent(Ljava/io/File;)Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    move-result-object v7

    invoke-interface {p1, v7}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 71
    invoke-interface {p1}, Lio/reactivex/ObservableEmitter;->onComplete()V

    .line 80
    .end local v0    # "builder":Lokhttp3/OkHttpClient$Builder;
    .end local v1    # "client":Lokhttp3/OkHttpClient;
    .end local v4    # "request":Lokhttp3/Request;
    .end local v5    # "response":Lokhttp3/Response;
    :cond_0
    :goto_1
    return-void

    .line 65
    .restart local v0    # "builder":Lokhttp3/OkHttpClient$Builder;
    .restart local v1    # "client":Lokhttp3/OkHttpClient;
    .restart local v4    # "request":Lokhttp3/Request;
    .restart local v5    # "response":Lokhttp3/Response;
    :catch_0
    move-exception v2

    .line 66
    .local v2, "downloadCanceled":Lcom/vk/core/network/RxFileDownloader$DownloadCancelationException;
    iget-object v7, p0, Lcom/vk/core/network/RxFileDownloader;->outputFile:Ljava/io/File;

    invoke-static {v7}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 73
    .end local v0    # "builder":Lokhttp3/OkHttpClient$Builder;
    .end local v1    # "client":Lokhttp3/OkHttpClient;
    .end local v2    # "downloadCanceled":Lcom/vk/core/network/RxFileDownloader$DownloadCancelationException;
    .end local v4    # "request":Lokhttp3/Request;
    .end local v5    # "response":Lokhttp3/Response;
    :catch_1
    move-exception v3

    .line 74
    .local v3, "exc":Ljava/lang/Exception;
    iget-object v7, p0, Lcom/vk/core/network/RxFileDownloader;->outputFile:Ljava/io/File;

    invoke-static {v7}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    .line 76
    invoke-interface {p1}, Lio/reactivex/ObservableEmitter;->isDisposed()Z

    move-result v7

    if-nez v7, :cond_0

    .line 77
    invoke-interface {p1, v3}, Lio/reactivex/ObservableEmitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_1
.end method
