.class public Lcom/vk/core/network/NetworkProxyHost;
.super Lcom/vk/core/network/NetworkTrustManager;
.source "NetworkProxyHost.java"


# static fields
.field protected static final CHECK_URL_PING:Ljava/lang/String; = "https://vk.com/ping.txt"

.field protected static final CHECK_URL_PING_MOBILE:Ljava/lang/String; = "https://m.vk.com"

.field protected static final MAX_FOLLOW_UP:I = 0x14

.field private static final TRUSTED_DOMAINS:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected databaseListener:Lcom/vk/analytics/Analytics$OnValueEventListener;

.field private hostInterceptor:Lokhttp3/Interceptor;

.field private hostNameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field protected logging:Z

.field private networkInterceptor:Lokhttp3/Interceptor;

.field protected proxies:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected proxyIndex:I

.field private rsaKey:Ljava/security/PublicKey;

.field protected useHosts:Z

.field private useHostsTemporary:Z

.field protected userAgent:Ljava/lang/String;

.field protected userAgentCheck:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 39
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x9

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, "vk.com"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string/jumbo v3, "userapi.com"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string/jumbo v3, "vk-cdn.net"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string/jumbo v3, "vkuservideo.net"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string/jumbo v3, "vkuservideo.com"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string/jumbo v3, "vkuserlive.com"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string/jumbo v3, "vkuserlive.net"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string/jumbo v3, "vkuseraudio.com"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string/jumbo v3, "vkuseraudio.net"

    aput-object v3, v1, v2

    .line 40
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/vk/core/network/NetworkProxyHost;->TRUSTED_DOMAINS:Ljava/util/ArrayList;

    .line 39
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 36
    invoke-direct {p0}, Lcom/vk/core/network/NetworkTrustManager;-><init>()V

    .line 48
    iput v1, p0, Lcom/vk/core/network/NetworkProxyHost;->proxyIndex:I

    .line 49
    new-instance v0, Lcom/vk/core/network/NetworkProxyHost$1;

    invoke-direct {v0, p0}, Lcom/vk/core/network/NetworkProxyHost$1;-><init>(Lcom/vk/core/network/NetworkProxyHost;)V

    iput-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->databaseListener:Lcom/vk/analytics/Analytics$OnValueEventListener;

    .line 57
    iput-boolean v1, p0, Lcom/vk/core/network/NetworkProxyHost;->logging:Z

    .line 59
    iput-boolean v1, p0, Lcom/vk/core/network/NetworkProxyHost;->useHosts:Z

    .line 60
    iput-boolean v1, p0, Lcom/vk/core/network/NetworkProxyHost;->useHostsTemporary:Z

    .line 61
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->rsaKey:Ljava/security/PublicKey;

    .line 91
    new-instance v0, Lcom/vk/core/network/NetworkProxyHost$2;

    invoke-direct {v0, p0}, Lcom/vk/core/network/NetworkProxyHost$2;-><init>(Lcom/vk/core/network/NetworkProxyHost;)V

    iput-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->hostNameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 125
    new-instance v0, Lcom/vk/core/network/NetworkProxyHost$3;

    invoke-direct {v0, p0}, Lcom/vk/core/network/NetworkProxyHost$3;-><init>(Lcom/vk/core/network/NetworkProxyHost;)V

    iput-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->hostInterceptor:Lokhttp3/Interceptor;

    .line 153
    new-instance v0, Lcom/vk/core/network/NetworkProxyHost$4;

    invoke-direct {v0, p0}, Lcom/vk/core/network/NetworkProxyHost$4;-><init>(Lcom/vk/core/network/NetworkProxyHost;)V

    iput-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->networkInterceptor:Lokhttp3/Interceptor;

    return-void
.end method

.method static synthetic access$000(Lcom/vk/core/network/NetworkProxyHost;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/NetworkProxyHost;

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/vk/core/network/NetworkProxyHost;->useHostsTemporary:Z

    return v0
.end method

.method static synthetic access$100(Lcom/vk/core/network/NetworkProxyHost;Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/NetworkProxyHost;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/vk/core/network/NetworkProxyHost;->isTrustedDn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/vk/core/network/NetworkProxyHost;)Ljava/security/PublicKey;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/NetworkProxyHost;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->rsaKey:Ljava/security/PublicKey;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/core/network/NetworkProxyHost;Lokhttp3/Request;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/NetworkProxyHost;
    .param p1, "x1"    # Lokhttp3/Request;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/vk/core/network/NetworkProxyHost;->canUseRequestWithHost(Lokhttp3/Request;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/vk/core/network/NetworkProxyHost;Lokhttp3/Request;)Lokhttp3/Request;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/NetworkProxyHost;
    .param p1, "x1"    # Lokhttp3/Request;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/vk/core/network/NetworkProxyHost;->getRequestWithHost(Lokhttp3/Request;)Lokhttp3/Request;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/vk/core/network/NetworkProxyHost;Lokhttp3/Request;)Lokhttp3/Request;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/NetworkProxyHost;
    .param p1, "x1"    # Lokhttp3/Request;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/vk/core/network/NetworkProxyHost;->getRequest(Lokhttp3/Request;)Lokhttp3/Request;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/vk/core/network/NetworkProxyHost;Lokhttp3/Response;)Lokhttp3/Request;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/NetworkProxyHost;
    .param p1, "x1"    # Lokhttp3/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/vk/core/network/NetworkProxyHost;->followUpRequest(Lokhttp3/Response;)Lokhttp3/Request;

    move-result-object v0

    return-object v0
.end method

.method private canUseRequestWithHost(Lokhttp3/Request;)Z
    .locals 4
    .param p1, "request"    # Lokhttp3/Request;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 312
    iget-boolean v3, p0, Lcom/vk/core/network/NetworkProxyHost;->useHosts:Z

    if-eqz v3, :cond_1

    move v1, v2

    .line 321
    :cond_0
    :goto_0
    return v1

    .line 316
    :cond_1
    iget-boolean v3, p0, Lcom/vk/core/network/NetworkProxyHost;->useHostsTemporary:Z

    if-eqz v3, :cond_0

    .line 317
    invoke-virtual {p1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v0

    .line 318
    .local v0, "url":Ljava/lang/String;
    const-string/jumbo v3, "https://vk.com/ping.txt"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string/jumbo v3, "https://m.vk.com"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string/jumbo v3, "utils.getProxiesPreferences"

    .line 319
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_2
    move v1, v2

    goto :goto_0
.end method

.method private followUpRequest(Lokhttp3/Response;)Lokhttp3/Request;
    .locals 8
    .param p1, "userResponse"    # Lokhttp3/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 257
    if-nez p1, :cond_0

    new-instance v7, Ljava/lang/IllegalStateException;

    invoke-direct {v7}, Ljava/lang/IllegalStateException;-><init>()V

    throw v7

    .line 258
    :cond_0
    invoke-virtual {p1}, Lokhttp3/Response;->code()I

    move-result v5

    .line 260
    .local v5, "responseCode":I
    invoke-virtual {p1}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v7

    invoke-virtual {v7}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object v2

    .line 261
    .local v2, "method":Ljava/lang/String;
    sparse-switch v5, :sswitch_data_0

    .line 307
    :cond_1
    :goto_0
    return-object v3

    .line 266
    :sswitch_0
    const-string/jumbo v7, "GET"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    const-string/jumbo v7, "HEAD"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 274
    :cond_2
    :sswitch_1
    const-string/jumbo v7, "Location"

    invoke-virtual {p1, v7}, Lokhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 275
    .local v0, "location":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 276
    invoke-virtual {p1}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v7

    invoke-virtual {v7}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v7

    invoke-virtual {v7, v0}, Lokhttp3/HttpUrl;->resolve(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v6

    .line 279
    .local v6, "url":Lokhttp3/HttpUrl;
    if-eqz v6, :cond_1

    .line 282
    invoke-virtual {p1}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v7

    invoke-virtual {v7}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object v4

    .line 283
    .local v4, "requestBuilder":Lokhttp3/Request$Builder;
    invoke-static {v2}, Lokhttp3/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 284
    invoke-static {v2}, Lokhttp3/internal/http/HttpMethod;->redirectsWithBody(Ljava/lang/String;)Z

    move-result v1

    .line 285
    .local v1, "maintainBody":Z
    invoke-static {v2}, Lokhttp3/internal/http/HttpMethod;->redirectsToGet(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 286
    const-string/jumbo v7, "GET"

    invoke-virtual {v4, v7, v3}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    .line 291
    :goto_1
    if-nez v1, :cond_3

    .line 292
    const-string/jumbo v7, "Transfer-Encoding"

    invoke-virtual {v4, v7}, Lokhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 293
    const-string/jumbo v7, "Content-Length"

    invoke-virtual {v4, v7}, Lokhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 294
    const-string/jumbo v7, "Content-Type"

    invoke-virtual {v4, v7}, Lokhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 297
    .end local v1    # "maintainBody":Z
    :cond_3
    invoke-virtual {v4, v6}, Lokhttp3/Request$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;

    move-result-object v7

    invoke-virtual {v7}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v3

    goto :goto_0

    .line 288
    .restart local v1    # "maintainBody":Z
    :cond_4
    if-eqz v1, :cond_5

    invoke-virtual {p1}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v7

    invoke-virtual {v7}, Lokhttp3/Request;->body()Lokhttp3/RequestBody;

    move-result-object v3

    .line 289
    .local v3, "requestBody":Lokhttp3/RequestBody;
    :cond_5
    invoke-virtual {v4, v2, v3}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    goto :goto_1

    .line 302
    .end local v0    # "location":Ljava/lang/String;
    .end local v1    # "maintainBody":Z
    .end local v3    # "requestBody":Lokhttp3/RequestBody;
    .end local v4    # "requestBuilder":Lokhttp3/Request$Builder;
    .end local v6    # "url":Lokhttp3/HttpUrl;
    :sswitch_2
    invoke-virtual {p1}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v7

    invoke-virtual {v7}, Lokhttp3/Request;->body()Lokhttp3/RequestBody;

    move-result-object v7

    instance-of v7, v7, Lokhttp3/internal/http/UnrepeatableRequestBody;

    if-nez v7, :cond_1

    .line 305
    invoke-virtual {p1}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v3

    goto/16 :goto_0

    .line 261
    nop

    :sswitch_data_0
    .sparse-switch
        0x12c -> :sswitch_1
        0x12d -> :sswitch_1
        0x12e -> :sswitch_1
        0x12f -> :sswitch_1
        0x133 -> :sswitch_0
        0x134 -> :sswitch_0
        0x198 -> :sswitch_2
    .end sparse-switch
.end method

.method private getRequest(Lokhttp3/Request;)Lokhttp3/Request;
    .locals 3
    .param p1, "request"    # Lokhttp3/Request;

    .prologue
    .line 336
    invoke-virtual {p1}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object v1

    const-string/jumbo v2, "User-Agent"

    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->userAgentCheck:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->userAgentCheck:Ljava/lang/String;

    .line 337
    :goto_0
    invoke-virtual {v1, v2, v0}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 338
    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    return-object v0

    .line 336
    :cond_0
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->userAgent:Ljava/lang/String;

    goto :goto_0
.end method

.method private getRequestWithHost(Lokhttp3/Request;)Lokhttp3/Request;
    .locals 4
    .param p1, "request"    # Lokhttp3/Request;

    .prologue
    .line 325
    invoke-virtual {p1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v1

    .line 326
    .local v1, "url":Lokhttp3/HttpUrl;
    invoke-virtual {v1}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vk/core/network/NetworkProxyHost;->getHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 327
    .local v0, "host":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 328
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "!! no proxy: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lokhttp3/HttpUrl;->url()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " host: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " -> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vk/core/network/NetworkProxyHost;->log(Ljava/lang/String;)V

    .line 330
    invoke-direct {p0, p1}, Lcom/vk/core/network/NetworkProxyHost;->getRequest(Lokhttp3/Request;)Lokhttp3/Request;

    move-result-object v2

    .line 332
    :goto_0
    return-object v2

    :cond_0
    invoke-direct {p0, p1, v0}, Lcom/vk/core/network/NetworkProxyHost;->getRequestWithHostProxy(Lokhttp3/Request;Ljava/lang/String;)Lokhttp3/Request;

    move-result-object v2

    goto :goto_0
.end method

.method private getRequestWithHostProxy(Lokhttp3/Request;Ljava/lang/String;)Lokhttp3/Request;
    .locals 5
    .param p1, "request"    # Lokhttp3/Request;
    .param p2, "host"    # Ljava/lang/String;

    .prologue
    .line 342
    invoke-virtual {p1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v1

    .line 343
    .local v1, "url":Lokhttp3/HttpUrl;
    invoke-virtual {p1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v2

    .line 344
    invoke-virtual {v2, p2}, Lokhttp3/HttpUrl$Builder;->host(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v2

    .line 345
    invoke-virtual {v2}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v0

    .line 346
    .local v0, "newUrl":Lokhttp3/HttpUrl;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "proxy: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " -> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->url()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vk/core/network/NetworkProxyHost;->log(Ljava/lang/String;)V

    .line 347
    invoke-virtual {p1}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object v2

    const-string/jumbo v3, "User-Agent"

    iget-object v4, p0, Lcom/vk/core/network/NetworkProxyHost;->userAgent:Ljava/lang/String;

    .line 348
    invoke-virtual {v2, v3, v4}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    const-string/jumbo v3, "Host"

    .line 349
    invoke-virtual {v1}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    .line 350
    invoke-virtual {v2, v0}, Lokhttp3/Request$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;

    move-result-object v2

    .line 351
    invoke-virtual {v2}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v2

    return-object v2
.end method

.method private isCustomVerify()Z
    .locals 1

    .prologue
    .line 429
    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxyHost;->isEnable()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/vk/core/network/NetworkProxyHost;->useHostsTemporary:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isTrustedDn(Ljava/lang/String;)Z
    .locals 3
    .param p1, "dn"    # Ljava/lang/String;

    .prologue
    .line 355
    sget-object v1, Lcom/vk/core/network/NetworkProxyHost;->TRUSTED_DOMAINS:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 356
    .local v0, "domain":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 357
    const/4 v1, 0x1

    .line 360
    .end local v0    # "domain":Ljava/lang/String;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private readPublicKey(Landroid/content/Context;)Ljava/lang/String;
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 364
    const/4 v3, 0x0

    .line 365
    .local v3, "cert":Ljava/lang/String;
    const/4 v4, 0x0

    .line 366
    .local v4, "raw":Ljava/io/InputStream;
    const/4 v0, 0x0

    .line 369
    .local v0, "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/vk/core/R$raw;->cert:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v4

    .line 370
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 372
    .end local v0    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .local v1, "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    :try_start_1
    invoke-virtual {v4}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 373
    .local v2, "bytes":I
    :goto_0
    const/4 v5, -0x1

    if-eq v2, v5, :cond_0

    .line 374
    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 375
    invoke-virtual {v4}, Ljava/io/InputStream;->read()I

    move-result v2

    goto :goto_0

    .line 377
    :cond_0
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_8
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_7
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v3

    .line 382
    .end local v2    # "bytes":I
    :goto_1
    if-eqz v1, :cond_1

    .line 384
    :try_start_2
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 388
    :cond_1
    :goto_2
    if-eqz v4, :cond_2

    .line 389
    :try_start_3
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    :cond_2
    move-object v0, v1

    .line 393
    .end local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    :cond_3
    :goto_3
    return-object v3

    .line 391
    .end local v0    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    :catch_0
    move-exception v5

    move-object v0, v1

    .line 392
    .end local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    goto :goto_3

    .line 380
    :catch_1
    move-exception v5

    .line 382
    :goto_4
    if-eqz v0, :cond_4

    .line 384
    :try_start_4
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 388
    :cond_4
    :goto_5
    if-eqz v4, :cond_3

    .line 389
    :try_start_5
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_3

    .line 391
    :catch_2
    move-exception v5

    goto :goto_3

    .line 382
    :catchall_0
    move-exception v5

    :goto_6
    if-eqz v0, :cond_5

    .line 384
    :try_start_6
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    .line 388
    :cond_5
    :goto_7
    if-eqz v4, :cond_6

    .line 389
    :try_start_7
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    .line 391
    :cond_6
    :goto_8
    throw v5

    .line 385
    .end local v0    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    :catch_3
    move-exception v5

    goto :goto_2

    .end local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    :catch_4
    move-exception v5

    goto :goto_5

    :catch_5
    move-exception v6

    goto :goto_7

    .line 391
    :catch_6
    move-exception v6

    goto :goto_8

    .line 382
    .end local v0    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    :catchall_1
    move-exception v5

    move-object v0, v1

    .end local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    goto :goto_6

    .line 380
    .end local v0    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    :catch_7
    move-exception v5

    move-object v0, v1

    .end local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    goto :goto_4

    .line 378
    .end local v0    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    :catch_8
    move-exception v5

    goto :goto_1
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 1
    .param p1, "chain"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 407
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxyHost;->isCustomVerify()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 411
    :goto_0
    return-void

    .line 410
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/vk/core/network/NetworkTrustManager;->checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 1
    .param p1, "chain"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 415
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxyHost;->isCustomVerify()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 419
    :goto_0
    return-void

    .line 418
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/vk/core/network/NetworkTrustManager;->checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected findNewProxy()V
    .locals 0

    .prologue
    .line 397
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .locals 1

    .prologue
    .line 422
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxyHost;->isCustomVerify()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 423
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/security/cert/X509Certificate;

    .line 425
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Lcom/vk/core/network/NetworkTrustManager;->getAcceptedIssuers()[Ljava/security/cert/X509Certificate;

    move-result-object v0

    goto :goto_0
.end method

.method protected getHost(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 240
    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxyHost;->getProxyHost()Ljava/lang/String;

    move-result-object v0

    .line 241
    .local v0, "proxy":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-direct {p0, p1}, Lcom/vk/core/network/NetworkProxyHost;->isTrustedDn(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .end local v0    # "proxy":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "proxy":Ljava/lang/String;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected getHost(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "proxyHost"    # Ljava/lang/String;

    .prologue
    .line 245
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    move-object v0, p2

    .line 246
    .local v0, "proxy":Ljava/lang/String;
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-direct {p0, p1}, Lcom/vk/core/network/NetworkProxyHost;->isTrustedDn(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .end local v0    # "proxy":Ljava/lang/String;
    :goto_1
    return-object v0

    .line 245
    :cond_0
    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxyHost;->getProxyHost()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 246
    .restart local v0    # "proxy":Ljava/lang/String;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->hostNameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-object v0
.end method

.method public getInterceptor()Lokhttp3/Interceptor;
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->hostInterceptor:Lokhttp3/Interceptor;

    return-object v0
.end method

.method public getNetworkInterceptor()Lokhttp3/Interceptor;
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->networkInterceptor:Lokhttp3/Interceptor;

    return-object v0
.end method

.method protected getProxyHost()Ljava/lang/String;
    .locals 2

    .prologue
    .line 250
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->proxies:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vk/core/network/NetworkProxyHost;->proxyIndex:I

    iget-object v1, p0, Lcom/vk/core/network/NetworkProxyHost;->proxies:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 251
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->proxies:Ljava/util/ArrayList;

    iget v1, p0, Lcom/vk/core/network/NetworkProxyHost;->proxyIndex:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 253
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTrustManager()Lcom/vk/core/network/NetworkTrustManager;
    .locals 0

    .prologue
    .line 175
    return-object p0
.end method

.method public hasProxies()Z
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->proxies:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->proxies:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public host()Ljava/lang/String;
    .locals 2

    .prologue
    .line 233
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->proxies:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vk/core/network/NetworkProxyHost;->proxyIndex:I

    iget-object v1, p0, Lcom/vk/core/network/NetworkProxyHost;->proxies:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 234
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->proxies:Ljava/util/ArrayList;

    iget v1, p0, Lcom/vk/core/network/NetworkProxyHost;->proxyIndex:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 236
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public init(Landroid/content/Context;)Z
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x1

    .line 64
    iget-object v7, p0, Lcom/vk/core/network/NetworkProxyHost;->rsaKey:Ljava/security/PublicKey;

    if-eqz v7, :cond_1

    .line 88
    :cond_0
    :goto_0
    return v6

    .line 68
    :cond_1
    const/4 v3, 0x0

    .line 69
    .local v3, "error":I
    const/4 v4, 0x0

    .line 70
    .local v4, "exception":Ljava/lang/Exception;
    invoke-direct {p0, p1}, Lcom/vk/core/network/NetworkProxyHost;->readPublicKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 71
    .local v0, "cert":Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 73
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    invoke-static {v7}, Ljavax/security/cert/X509Certificate;->getInstance([B)Ljavax/security/cert/X509Certificate;

    move-result-object v1

    .line 74
    .local v1, "certRSA":Ljavax/security/cert/X509Certificate;
    add-int/lit8 v3, v3, 0x1

    .line 75
    invoke-virtual {v1}, Ljavax/security/cert/X509Certificate;->checkValidity()V

    .line 76
    add-int/lit8 v3, v3, 0x1

    .line 77
    invoke-virtual {v1}, Ljavax/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v7

    iput-object v7, p0, Lcom/vk/core/network/NetworkProxyHost;->rsaKey:Ljava/security/PublicKey;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .end local v1    # "certRSA":Ljavax/security/cert/X509Certificate;
    :cond_2
    :goto_1
    iget-object v7, p0, Lcom/vk/core/network/NetworkProxyHost;->rsaKey:Ljava/security/PublicKey;

    if-nez v7, :cond_0

    .line 86
    new-instance v5, Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "error:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ", ex:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-eqz v4, :cond_3

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    :goto_2
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ", cert:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-eqz v0, :cond_4

    const-string/jumbo v6, "yes"

    :goto_3
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 87
    .local v5, "msg":Ljava/lang/String;
    new-instance v6, Lcom/vk/core/network/NetworkTrustManager$NetworkException;

    invoke-direct {v6, p0, v5}, Lcom/vk/core/network/NetworkTrustManager$NetworkException;-><init>(Lcom/vk/core/network/NetworkTrustManager;Ljava/lang/String;)V

    invoke-static {v6}, Lcom/vk/analytics/Analytics;->logException(Ljava/lang/Throwable;)V

    .line 88
    const/4 v6, 0x0

    goto :goto_0

    .line 78
    .end local v5    # "msg":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 79
    .local v2, "e":Ljava/lang/Exception;
    move-object v4, v2

    goto :goto_1

    .line 86
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_3
    const-string/jumbo v6, ""

    goto :goto_2

    :cond_4
    const-string/jumbo v6, "no"

    goto :goto_3
.end method

.method public isEnable()Z
    .locals 1

    .prologue
    .line 206
    iget-boolean v0, p0, Lcom/vk/core/network/NetworkProxyHost;->useHosts:Z

    return v0
.end method

.method protected log(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 403
    return-void
.end method

.method protected log(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 400
    return-void
.end method

.method public parse(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 4
    .param p1, "proxies"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 210
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 211
    const-string/jumbo v3, "parse: no proxies"

    invoke-virtual {p0, v3}, Lcom/vk/core/network/NetworkProxyHost;->log(Ljava/lang/String;)V

    move-object v1, v2

    .line 225
    :goto_0
    return-object v1

    .line 216
    :cond_0
    :try_start_0
    const-string/jumbo v3, "\\s+"

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 217
    .local v0, "p":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_1

    .line 218
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 219
    .local v1, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 223
    .end local v0    # "p":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v1    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_0
    move-exception v3

    move-object v1, v2

    .line 225
    goto :goto_0

    .restart local v0    # "p":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    move-object v1, v2

    .line 222
    goto :goto_0
.end method

.method public setProxyIndex(I)V
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 200
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->proxies:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->proxies:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 201
    iput p1, p0, Lcom/vk/core/network/NetworkProxyHost;->proxyIndex:I

    .line 203
    :cond_0
    return-void
.end method

.method public setUseHosts(Z)V
    .locals 3
    .param p1, "useHosts"    # Z

    .prologue
    const/4 v1, 0x0

    .line 187
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "use proxy "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/core/network/NetworkProxyHost;->log(Ljava/lang/String;)V

    .line 188
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->rsaKey:Ljava/security/PublicKey;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vk/core/network/NetworkProxyHost;->useHosts:Z

    .line 189
    if-nez p1, :cond_0

    .line 190
    iput-boolean v1, p0, Lcom/vk/core/network/NetworkProxyHost;->useHostsTemporary:Z

    .line 192
    :cond_0
    return-void

    :cond_1
    move v0, v1

    .line 188
    goto :goto_0
.end method

.method public setUseHostsTemprary(Z)V
    .locals 2
    .param p1, "useHosts"    # Z

    .prologue
    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "use proxy temporary "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/core/network/NetworkProxyHost;->log(Ljava/lang/String;)V

    .line 196
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost;->rsaKey:Ljava/security/PublicKey;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vk/core/network/NetworkProxyHost;->useHostsTemporary:Z

    .line 197
    return-void

    .line 196
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setUserAgent(Ljava/lang/String;)V
    .locals 0
    .param p1, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 167
    iput-object p1, p0, Lcom/vk/core/network/NetworkProxyHost;->userAgent:Ljava/lang/String;

    .line 168
    return-void
.end method
