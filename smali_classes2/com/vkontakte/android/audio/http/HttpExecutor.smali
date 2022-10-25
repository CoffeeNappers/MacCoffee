.class public final Lcom/vkontakte/android/audio/http/HttpExecutor;
.super Ljava/lang/Object;
.source "HttpExecutor.java"


# static fields
.field private static final COUNTER:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lcom/vkontakte/android/audio/http/HttpExecutor;->COUNTER:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method

.method public static execute(Landroid/content/Context;Lokhttp3/Request;Lcom/vkontakte/android/audio/http/HttpResponseHandler;)Ljava/lang/Object;
    .locals 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "request"    # Lokhttp3/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/Context;",
            "Lokhttp3/Request;",
            "Lcom/vkontakte/android/audio/http/HttpResponseHandler",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p2, "responseHandler":Lcom/vkontakte/android/audio/http/HttpResponseHandler;, "Lcom/vkontakte/android/audio/http/HttpResponseHandler<TT;>;"
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 27
    sget-object v6, Lcom/vkontakte/android/audio/http/HttpExecutor;->COUNTER:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v1

    .line 30
    .local v1, "number":I
    if-eqz p0, :cond_0

    :try_start_0
    invoke-static {p0}, Lcom/vkontakte/android/audio/utils/Utils;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 31
    new-instance v6, Ljava/io/IOException;

    const-string/jumbo v7, "No connection"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    :catch_0
    move-exception v0

    .line 58
    .local v0, "e":Ljava/lang/Exception;
    new-array v6, v10, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v0, v6}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 59
    throw v0

    .line 34
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v4, 0x2

    .local v4, "retryCount":I
    move v5, v4

    .line 38
    .end local v4    # "retryCount":I
    .local v5, "retryCount":I
    :goto_0
    const/4 v6, 0x1

    :try_start_1
    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {p1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v6}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 39
    invoke-static {}, Lcom/vk/core/network/Network;->getDefaultClient()Lokhttp3/OkHttpClient;

    move-result-object v6

    invoke-virtual {v6, p1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v6

    invoke-interface {v6}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v2

    .line 40
    .local v2, "response":Lokhttp3/Response;
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v2}, Lokhttp3/Response;->code()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v6}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 41
    invoke-interface {p2, p0, v2}, Lcom/vkontakte/android/audio/http/HttpResponseHandler;->handleResponse(Landroid/content/Context;Lokhttp3/Response;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    .line 43
    .local v3, "result":Ljava/lang/Object;, "TT;"
    if-nez v3, :cond_1

    .line 44
    const/4 v3, 0x0

    .line 46
    .end local v3    # "result":Ljava/lang/Object;, "TT;"
    :cond_1
    return-object v3

    .line 47
    .end local v2    # "response":Lokhttp3/Response;
    :catch_1
    move-exception v0

    .line 48
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_2
    invoke-static {v0}, Lcom/vkontakte/android/audio/http/HttpExecutor;->isTimeoutException(Ljava/lang/Exception;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 49
    add-int/lit8 v4, v5, -0x1

    .end local v5    # "retryCount":I
    .restart local v4    # "retryCount":I
    if-gtz v5, :cond_2

    .line 50
    throw v0

    .line 52
    :cond_2
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v0, v6}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    move v5, v4

    .line 55
    .end local v4    # "retryCount":I
    .restart local v5    # "retryCount":I
    goto :goto_0

    .line 54
    :cond_3
    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
.end method

.method private static isTimeoutException(Ljava/lang/Exception;)Z
    .locals 3
    .param p0, "e"    # Ljava/lang/Exception;

    .prologue
    const/4 v1, 0x1

    .line 64
    instance-of v2, p0, Ljava/net/SocketTimeoutException;

    if-eqz v2, :cond_1

    .line 73
    :cond_0
    :goto_0
    return v1

    .line 67
    :cond_1
    instance-of v2, p0, Ljava/net/SocketException;

    if-eqz v2, :cond_2

    .line 68
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 69
    .local v0, "message":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string/jumbo v2, "ETIMEDOUT"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 73
    .end local v0    # "message":Ljava/lang/String;
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method
