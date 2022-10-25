.class public Lcom/vk/core/network/NetworkProxy;
.super Lcom/vk/core/network/NetworkProxyHost;
.source "NetworkProxy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/core/network/NetworkProxy$ProxyCallback;
    }
.end annotation


# static fields
.field private static final CHECK_UA_GOOGLE:Ljava/lang/String; = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36"

.field private static final CHECK_URL_GOOGLE:Ljava/lang/String; = "https://google.com"

.field private static final CHECK_URL_GOOGLE_REDIRECT:Ljava/lang/String; = "google.com.ua"

.field private static final CLIENT_TIMEOUT_SEC:I = 0xa

.field private static final PROXY_CACHE_LIVE_SEC:J = 0x15180L

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private callback:Lcom/vk/core/network/NetworkProxy$ProxyCallback;

.field private canUseProxy:Z

.field private executor:Ljava/util/concurrent/ExecutorService;

.field private forceUseProxy:Z

.field private getProxiesAttempts:I

.field private handler:Landroid/os/Handler;

.field public preferenceLastProxy:Lcom/vk/core/util/Preference$PreferenceString;

.field public preferenceState:Lcom/vk/core/util/Preference$PreferenceBoolean;

.field public preferenceTime:Lcom/vk/core/util/Preference$PreferenceLong;

.field public preferenceUserState:Lcom/vk/core/util/Preference$PreferenceBoolean;

.field private proxyClient:Lokhttp3/OkHttpClient;

.field private running:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-class v0, Lcom/vk/core/network/NetworkProxy;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/core/network/NetworkProxy;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 29
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxyHost;-><init>()V

    .line 43
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/network/NetworkProxy;->executor:Ljava/util/concurrent/ExecutorService;

    .line 45
    iput-boolean v2, p0, Lcom/vk/core/network/NetworkProxy;->forceUseProxy:Z

    .line 46
    iput-boolean v2, p0, Lcom/vk/core/network/NetworkProxy;->canUseProxy:Z

    .line 47
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/core/network/NetworkProxy;->handler:Landroid/os/Handler;

    .line 48
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/core/network/NetworkProxy;->proxyClient:Lokhttp3/OkHttpClient;

    .line 49
    iput v2, p0, Lcom/vk/core/network/NetworkProxy;->getProxiesAttempts:I

    .line 50
    iput-boolean v2, p0, Lcom/vk/core/network/NetworkProxy;->running:Z

    return-void
.end method

.method static synthetic access$002(Lcom/vk/core/network/NetworkProxy;Lokhttp3/OkHttpClient;)Lokhttp3/OkHttpClient;
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/network/NetworkProxy;
    .param p1, "x1"    # Lokhttp3/OkHttpClient;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/vk/core/network/NetworkProxy;->proxyClient:Lokhttp3/OkHttpClient;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vk/core/network/NetworkProxy;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/NetworkProxy;

    .prologue
    .line 29
    iget-boolean v0, p0, Lcom/vk/core/network/NetworkProxy;->forceUseProxy:Z

    return v0
.end method

.method static synthetic access$200(Lcom/vk/core/network/NetworkProxy;Z)Lokhttp3/OkHttpClient;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/NetworkProxy;
    .param p1, "x1"    # Z

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/vk/core/network/NetworkProxy;->makeClient(Z)Lokhttp3/OkHttpClient;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/core/network/NetworkProxy;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/NetworkProxy;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->verifyPing()Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/vk/core/network/NetworkProxy;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/NetworkProxy;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->verifyUrls()Z

    move-result v0

    return v0
.end method

.method static synthetic access$502(Lcom/vk/core/network/NetworkProxy;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/network/NetworkProxy;
    .param p1, "x1"    # Z

    .prologue
    .line 29
    iput-boolean p1, p0, Lcom/vk/core/network/NetworkProxy;->canUseProxy:Z

    return p1
.end method

.method static synthetic access$600(Lcom/vk/core/network/NetworkProxy;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/NetworkProxy;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->verifyHost()Z

    move-result v0

    return v0
.end method

.method static synthetic access$700(Lcom/vk/core/network/NetworkProxy;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/network/NetworkProxy;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->disableProxy()V

    return-void
.end method

.method static synthetic access$800(Lcom/vk/core/network/NetworkProxy;)Lcom/vk/core/network/NetworkProxy$ProxyCallback;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/NetworkProxy;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxy;->callback:Lcom/vk/core/network/NetworkProxy$ProxyCallback;

    return-object v0
.end method

.method private clearProxies()V
    .locals 2

    .prologue
    .line 401
    const-string/jumbo v1, "clear proxies"

    invoke-virtual {p0, v1}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 402
    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->resetTime()V

    .line 403
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/analytics/Analytics;->database()Lcom/vk/analytics/Firebase;

    move-result-object v0

    .line 404
    .local v0, "db":Lcom/vk/analytics/Firebase;
    if-eqz v0, :cond_0

    .line 405
    invoke-virtual {v0}, Lcom/vk/analytics/Firebase;->clearProxies()V

    .line 407
    :cond_0
    return-void
.end method

.method private clearProxiesIfNeeded()V
    .locals 8

    .prologue
    const-wide/16 v6, 0x0

    .line 392
    iget-object v4, p0, Lcom/vk/core/network/NetworkProxy;->preferenceTime:Lcom/vk/core/util/Preference$PreferenceLong;

    invoke-virtual {v4}, Lcom/vk/core/util/Preference$PreferenceLong;->get()Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 393
    .local v2, "time":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 394
    .local v0, "now":J
    cmp-long v4, v2, v6

    if-eqz v4, :cond_0

    cmp-long v4, v2, v6

    if-lez v4, :cond_1

    sub-long v4, v0, v2

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    const-wide/32 v6, 0x15180

    cmp-long v4, v4, v6

    if-gez v4, :cond_1

    .line 398
    :cond_0
    :goto_0
    return-void

    .line 397
    :cond_1
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->clearProxies()V

    goto :goto_0
.end method

.method private disableProxy()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 229
    iput v0, p0, Lcom/vk/core/network/NetworkProxy;->getProxiesAttempts:I

    .line 230
    invoke-virtual {p0, v0}, Lcom/vk/core/network/NetworkProxy;->setUseHostsTemprary(Z)V

    .line 231
    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->isEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 232
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/core/network/Network;->disableProxy(Z)Z

    .line 234
    :cond_0
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->notifyOnProxyHostDisconnected()V

    .line 235
    return-void
.end method

.method private enableProxy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 200
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->isDisabledByUser()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 201
    invoke-virtual {p0, v1}, Lcom/vk/core/network/NetworkProxy;->setUseHosts(Z)V

    .line 208
    :cond_0
    :goto_0
    return-void

    .line 205
    :cond_1
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vk/core/network/Network;->enableProxy(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 206
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->notifyOnProxyHostConnected()V

    goto :goto_0
.end method

.method private executeResponse(Ljava/lang/String;)Lokhttp3/Response;
    .locals 4
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 274
    iget-object v3, p0, Lcom/vk/core/network/NetworkProxy;->proxyClient:Lokhttp3/OkHttpClient;

    if-nez v3, :cond_0

    .line 283
    :goto_0
    return-object v2

    .line 278
    :cond_0
    :try_start_0
    new-instance v3, Lokhttp3/Request$Builder;

    invoke-direct {v3}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v3, p1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    .line 279
    .local v1, "request":Lokhttp3/Request;
    iget-object v3, p0, Lcom/vk/core/network/NetworkProxy;->proxyClient:Lokhttp3/OkHttpClient;

    invoke-virtual {v3, v1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v3

    invoke-interface {v3}, Lokhttp3/Call;->execute()Lokhttp3/Response;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 280
    .end local v1    # "request":Lokhttp3/Request;
    :catch_0
    move-exception v0

    .line 281
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v0}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method private findProxy()Z
    .locals 7

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 300
    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->hasProxies()Z

    move-result v5

    if-nez v5, :cond_0

    .line 326
    :goto_0
    return v3

    .line 304
    :cond_0
    const-string/jumbo v5, "check: findProxy"

    invoke-virtual {p0, v5}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 305
    invoke-virtual {p0, v4}, Lcom/vk/core/network/NetworkProxy;->setUseHostsTemprary(Z)V

    .line 307
    iget-object v2, p0, Lcom/vk/core/network/NetworkProxy;->proxies:Ljava/util/ArrayList;

    .line 308
    .local v2, "proxies":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->isShuffleEnable()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 309
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "proxies":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 310
    .restart local v2    # "proxies":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/vk/core/network/NetworkProxy;->proxies:Ljava/util/ArrayList;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 311
    invoke-static {v2}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 314
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v0, v5, :cond_3

    .line 315
    iget-object v5, p0, Lcom/vk/core/network/NetworkProxy;->proxies:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    .line 316
    .local v1, "index":I
    invoke-virtual {p0, v1}, Lcom/vk/core/network/NetworkProxy;->setProxyIndex(I)V

    .line 317
    const-string/jumbo v5, "https://vk.com/ping.txt"

    invoke-direct {p0, v5}, Lcom/vk/core/network/NetworkProxy;->verifyPing(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 318
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "check: founded new host "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->host()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 319
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->enableProxy()V

    move v3, v4

    .line 320
    goto :goto_0

    .line 322
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "check: failed on host "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->host()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 314
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 324
    .end local v1    # "index":I
    :cond_3
    invoke-virtual {p0, v3}, Lcom/vk/core/network/NetworkProxy;->setProxyIndex(I)V

    .line 325
    invoke-virtual {p0, v3}, Lcom/vk/core/network/NetworkProxy;->setUseHostsTemprary(Z)V

    goto :goto_0
.end method

.method private static getProxiesList()Ljava/lang/String;
    .locals 1

    .prologue
    .line 142
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/analytics/Analytics;->getProxies()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private isDisabledByUser()Z
    .locals 2

    .prologue
    .line 211
    iget-object v1, p0, Lcom/vk/core/network/NetworkProxy;->preferenceUserState:Lcom/vk/core/util/Preference$PreferenceBoolean;

    invoke-virtual {v1}, Lcom/vk/core/util/Preference$PreferenceBoolean;->get()Ljava/lang/Boolean;

    move-result-object v0

    .line 212
    .local v0, "state":Ljava/lang/Boolean;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    .line 213
    const-string/jumbo v1, "proxy disabled by user"

    invoke-virtual {p0, v1}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 214
    const/4 v1, 0x1

    .line 216
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isProxyMenuEnable()Z
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 460
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/analytics/Analytics;->database()Lcom/vk/analytics/Firebase;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/analytics/Firebase;->getSettings()Ljava/util/HashMap;

    move-result-object v1

    .line 461
    .local v1, "settings":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 462
    const-string/jumbo v3, "config_settings_proxy_menu"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 463
    .local v0, "enable":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "true"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    .line 465
    .end local v0    # "enable":Ljava/lang/String;
    :cond_0
    return v2
.end method

.method private isRedirect(Lokhttp3/Response;Ljava/lang/String;)Z
    .locals 3
    .param p1, "response"    # Lokhttp3/Response;
    .param p2, "redirect"    # Ljava/lang/String;

    .prologue
    .line 288
    :try_start_0
    invoke-virtual {p1}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/HttpUrl;->url()Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 289
    .local v1, "url":Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-static {v1, p2}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    move-result v2

    if-lez v2, :cond_0

    .line 290
    const-string/jumbo v2, "check: has redirect!"

    invoke-virtual {p0, v2}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 291
    const/4 v2, 0x1

    .line 296
    .end local v1    # "url":Ljava/lang/String;
    :goto_0
    return v2

    .line 293
    :catch_0
    move-exception v0

    .line 294
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v0}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/Exception;)V

    .line 296
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private isRedirectCheckEnable()Z
    .locals 3

    .prologue
    .line 440
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/analytics/Analytics;->database()Lcom/vk/analytics/Firebase;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/analytics/Firebase;->getSettings()Ljava/util/HashMap;

    move-result-object v1

    .line 441
    .local v1, "settings":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 442
    const-string/jumbo v2, "config_settings_proxy_check"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 443
    .local v0, "enable":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "false"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 444
    const/4 v2, 0x0

    .line 447
    .end local v0    # "enable":Ljava/lang/String;
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private isShuffleEnable()Z
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 451
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/analytics/Analytics;->database()Lcom/vk/analytics/Firebase;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/analytics/Firebase;->getSettings()Ljava/util/HashMap;

    move-result-object v1

    .line 452
    .local v1, "settings":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 453
    const-string/jumbo v3, "config_settings_proxy_shuffle"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 454
    .local v0, "enable":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "true"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    .line 456
    .end local v0    # "enable":Ljava/lang/String;
    :cond_0
    return v2
.end method

.method private makeClient(Z)Lokhttp3/OkHttpClient;
    .locals 4
    .param p1, "useHosts"    # Z

    .prologue
    .line 169
    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    .line 170
    .local v0, "client":Lokhttp3/OkHttpClient$Builder;
    const-wide/16 v2, 0xa

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 171
    const-wide/16 v2, 0xf

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 173
    if-nez p1, :cond_1

    .line 174
    invoke-static {v0}, Lcom/vk/core/network/NetworkTrustManager;->sslDefaultSocketFactory(Lokhttp3/OkHttpClient$Builder;)V

    .line 179
    :goto_0
    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->getInterceptor()Lokhttp3/Interceptor;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    .line 181
    if-eqz p1, :cond_0

    .line 182
    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->hostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lokhttp3/OkHttpClient$Builder;

    .line 184
    :cond_0
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v1

    return-object v1

    .line 176
    :cond_1
    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->getTrustManager()Lcom/vk/core/network/NetworkTrustManager;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/core/network/NetworkTrustManager;->sslSocketFactory(Lokhttp3/OkHttpClient$Builder;Lcom/vk/core/network/NetworkTrustManager;)V

    goto :goto_0
.end method

.method private notifyOnProxyHostConnected()V
    .locals 2

    .prologue
    .line 410
    const-string/jumbo v0, "notifyOnProxyHostConnected"

    invoke-virtual {p0, v0}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 411
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/core/network/NetworkProxy;->running:Z

    .line 412
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxy;->preferenceLastProxy:Lcom/vk/core/util/Preference$PreferenceString;

    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->getProxyHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/core/util/Preference$PreferenceString;->set(Ljava/lang/String;)V

    .line 413
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxy;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/vk/core/network/NetworkProxy$3;

    invoke-direct {v1, p0}, Lcom/vk/core/network/NetworkProxy$3;-><init>(Lcom/vk/core/network/NetworkProxy;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 421
    return-void
.end method

.method private notifyOnProxyHostDisconnected()V
    .locals 2

    .prologue
    .line 424
    const-string/jumbo v0, "notifyOnProxyHostDisconnected"

    invoke-virtual {p0, v0}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 425
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/core/network/NetworkProxy;->running:Z

    .line 426
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxy;->preferenceLastProxy:Lcom/vk/core/util/Preference$PreferenceString;

    if-eqz v0, :cond_0

    .line 427
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxy;->preferenceLastProxy:Lcom/vk/core/util/Preference$PreferenceString;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/core/util/Preference$PreferenceString;->set(Ljava/lang/String;)V

    .line 429
    :cond_0
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxy;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/vk/core/network/NetworkProxy$4;

    invoke-direct {v1, p0}, Lcom/vk/core/network/NetworkProxy$4;-><init>(Lcom/vk/core/network/NetworkProxy;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 437
    return-void
.end method

.method private subscribe()Z
    .locals 3

    .prologue
    .line 377
    iget v1, p0, Lcom/vk/core/network/NetworkProxy;->getProxiesAttempts:I

    const/4 v2, 0x2

    if-lt v1, v2, :cond_0

    .line 378
    const-string/jumbo v1, "can\'t use proxy"

    invoke-virtual {p0, v1}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 379
    const/4 v1, 0x0

    .line 388
    :goto_0
    return v1

    .line 382
    :cond_0
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/analytics/Analytics;->database()Lcom/vk/analytics/Firebase;

    move-result-object v0

    .line 383
    .local v0, "db":Lcom/vk/analytics/Firebase;
    if-eqz v0, :cond_1

    .line 384
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "subscribe for proxies attempt "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vk/core/network/NetworkProxy;->getProxiesAttempts:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 385
    const-string/jumbo v1, "config_proxies_list"

    iget-object v2, p0, Lcom/vk/core/network/NetworkProxy;->databaseListener:Lcom/vk/analytics/Analytics$OnValueEventListener;

    invoke-virtual {v0, v1, v2}, Lcom/vk/analytics/Firebase;->subscribe(Ljava/lang/String;Lcom/vk/analytics/Analytics$OnValueEventListener;)Z

    .line 386
    iget v1, p0, Lcom/vk/core/network/NetworkProxy;->getProxiesAttempts:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/vk/core/network/NetworkProxy;->getProxiesAttempts:I

    .line 388
    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private verify()V
    .locals 2

    .prologue
    .line 146
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxy;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/vk/core/network/NetworkProxy$1;

    invoke-direct {v1, p0}, Lcom/vk/core/network/NetworkProxy$1;-><init>(Lcom/vk/core/network/NetworkProxy;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 166
    return-void
.end method

.method private verifyHost()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 188
    iget-boolean v2, p0, Lcom/vk/core/network/NetworkProxy;->canUseProxy:Z

    if-nez v2, :cond_0

    .line 196
    :goto_0
    return v0

    .line 191
    :cond_0
    invoke-static {}, Lcom/vk/core/network/NetworkProxy;->getProxiesList()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vk/core/network/NetworkProxy;->parse(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/core/network/NetworkProxy;->proxies:Ljava/util/ArrayList;

    .line 192
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "check: verifyHost proxies: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/core/network/NetworkProxy;->proxies:Ljava/util/ArrayList;

    if-eqz v3, :cond_1

    iget-object v0, p0, Lcom/vk/core/network/NetworkProxy;->proxies:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :cond_1
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 193
    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->hasProxies()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->findProxy()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 194
    iget-boolean v0, p0, Lcom/vk/core/network/NetworkProxy;->forceUseProxy:Z

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vk/core/network/Network;->enableProxy(Z)Z

    move-result v0

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_0

    .line 196
    :cond_3
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->subscribe()Z

    move-result v0

    goto :goto_0
.end method

.method private verifyPing()Z
    .locals 1

    .prologue
    .line 238
    const-string/jumbo v0, "https://vk.com/ping.txt"

    invoke-direct {p0, v0}, Lcom/vk/core/network/NetworkProxy;->verifyPing(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "https://m.vk.com"

    invoke-direct {p0, v0}, Lcom/vk/core/network/NetworkProxy;->verifyPing(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private verifyPing(Ljava/lang/String;)Z
    .locals 5
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 242
    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->hasProxies()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->isEnable()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 243
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "check: ping proxy: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v2, p0, Lcom/vk/core/network/NetworkProxy;->proxies:Ljava/util/ArrayList;

    iget v4, p0, Lcom/vk/core/network/NetworkProxy;->proxyIndex:I

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 245
    :cond_0
    const-string/jumbo v2, "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36"

    iput-object v2, p0, Lcom/vk/core/network/NetworkProxy;->userAgentCheck:Ljava/lang/String;

    .line 246
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "check: ping begin "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 247
    invoke-direct {p0, p1}, Lcom/vk/core/network/NetworkProxy;->executeResponse(Ljava/lang/String;)Lokhttp3/Response;

    move-result-object v0

    .line 248
    .local v0, "result":Lokhttp3/Response;
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vk/core/network/NetworkProxy;->userAgentCheck:Ljava/lang/String;

    .line 250
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lokhttp3/Response;->isSuccessful()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    .line 251
    .local v1, "status":Z
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "check: ping end "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " result: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lokhttp3/Response;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 252
    return v1

    .line 250
    .end local v1    # "status":Z
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 251
    .restart local v1    # "status":Z
    :cond_2
    const-string/jumbo v2, "empty"

    goto :goto_1
.end method

.method private verifyUrls()Z
    .locals 4

    .prologue
    .line 256
    const-string/jumbo v2, "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36"

    iput-object v2, p0, Lcom/vk/core/network/NetworkProxy;->userAgentCheck:Ljava/lang/String;

    .line 257
    const-string/jumbo v2, "check: site begin"

    invoke-virtual {p0, v2}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 258
    const/4 v1, 0x0

    .line 259
    .local v1, "response":Lokhttp3/Response;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/4 v2, 0x2

    if-ge v0, v2, :cond_0

    .line 260
    const-string/jumbo v2, "https://google.com"

    invoke-direct {p0, v2}, Lcom/vk/core/network/NetworkProxy;->executeResponse(Ljava/lang/String;)Lokhttp3/Response;

    move-result-object v1

    .line 261
    if-eqz v1, :cond_1

    .line 265
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "check: site end result: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lokhttp3/Response;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 266
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vk/core/network/NetworkProxy;->userAgentCheck:Ljava/lang/String;

    .line 267
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Lokhttp3/Response;->isSuccessful()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 268
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->isRedirectCheckEnable()Z

    move-result v2

    if-eqz v2, :cond_3

    const-string/jumbo v2, "google.com.ua"

    invoke-direct {p0, v1, v2}, Lcom/vk/core/network/NetworkProxy;->isRedirect(Lokhttp3/Response;Ljava/lang/String;)Z

    move-result v2

    .line 270
    :goto_2
    return v2

    .line 259
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 265
    :cond_2
    const-string/jumbo v2, "empty"

    goto :goto_1

    .line 268
    :cond_3
    const/4 v2, 0x1

    goto :goto_2

    .line 270
    :cond_4
    const/4 v2, 0x0

    goto :goto_2
.end method

.method private wasEnabled()Z
    .locals 2

    .prologue
    .line 220
    iget-object v1, p0, Lcom/vk/core/network/NetworkProxy;->preferenceState:Lcom/vk/core/util/Preference$PreferenceBoolean;

    invoke-virtual {v1}, Lcom/vk/core/util/Preference$PreferenceBoolean;->get()Ljava/lang/Boolean;

    move-result-object v0

    .line 221
    .local v0, "state":Ljava/lang/Boolean;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 222
    const-string/jumbo v1, "proxy was enabled"

    invoke-virtual {p0, v1}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 223
    const/4 v1, 0x1

    .line 225
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public canUseProxy()Z
    .locals 1

    .prologue
    .line 104
    iget-boolean v0, p0, Lcom/vk/core/network/NetworkProxy;->forceUseProxy:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->isEnable()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->isProxyMenuEnable()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public enableProxyByUser(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "enable by user "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 97
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxy;->preferenceUserState:Lcom/vk/core/util/Preference$PreferenceBoolean;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/core/util/Preference$PreferenceBoolean;->set(Ljava/lang/Boolean;)V

    .line 98
    if-nez p1, :cond_0

    .line 99
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/core/network/NetworkProxy;->setUseHosts(Z)V

    .line 101
    :cond_0
    return-void
.end method

.method protected findNewProxy()V
    .locals 3

    .prologue
    .line 331
    const-string/jumbo v1, "findNewProxy"

    invoke-virtual {p0, v1}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 332
    iget-object v1, p0, Lcom/vk/core/network/NetworkProxy;->proxyClient:Lokhttp3/OkHttpClient;

    if-nez v1, :cond_0

    .line 333
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->verify()V

    .line 360
    :goto_0
    return-void

    .line 337
    :cond_0
    invoke-static {}, Lcom/vk/core/network/NetworkProxy;->getProxiesList()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vk/core/network/NetworkProxy;->parse(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 338
    .local v0, "p":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "proxies size="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 339
    if-nez v0, :cond_2

    .line 340
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vk/core/network/NetworkProxy;->proxies:Ljava/util/ArrayList;

    .line 341
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->disableProxy()V

    goto :goto_0

    .line 338
    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 345
    :cond_2
    iget-object v1, p0, Lcom/vk/core/network/NetworkProxy;->proxies:Ljava/util/ArrayList;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/vk/core/network/NetworkProxy;->proxies:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->isEnable()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 346
    const-string/jumbo v1, "proxies same"

    invoke-virtual {p0, v1}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 347
    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->isEnable()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 348
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->notifyOnProxyHostConnected()V

    goto :goto_0

    .line 350
    :cond_3
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->notifyOnProxyHostDisconnected()V

    goto :goto_0

    .line 354
    :cond_4
    iget-object v1, p0, Lcom/vk/core/network/NetworkProxy;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/vk/core/network/NetworkProxy$2;

    invoke-direct {v2, p0}, Lcom/vk/core/network/NetworkProxy$2;-><init>(Lcom/vk/core/network/NetworkProxy;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public init(Landroid/content/Context;Z)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "logging"    # Z

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 58
    const-string/jumbo v1, "NetworkProxy"

    invoke-virtual {p1, v1, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 59
    .local v0, "preferences":Landroid/content/SharedPreferences;
    new-instance v1, Lcom/vk/core/util/Preference$PreferenceLong;

    const-string/jumbo v2, "proxy_time"

    new-instance v3, Ljava/lang/Long;

    const-wide/16 v4, 0x0

    invoke-direct {v3, v4, v5}, Ljava/lang/Long;-><init>(J)V

    invoke-direct {v1, v0, v2, v3}, Lcom/vk/core/util/Preference$PreferenceLong;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Long;)V

    iput-object v1, p0, Lcom/vk/core/network/NetworkProxy;->preferenceTime:Lcom/vk/core/util/Preference$PreferenceLong;

    .line 60
    new-instance v1, Lcom/vk/core/util/Preference$PreferenceBoolean;

    const-string/jumbo v2, "proxy_user_state"

    new-instance v3, Ljava/lang/Boolean;

    invoke-direct {v3, v7}, Ljava/lang/Boolean;-><init>(Z)V

    invoke-direct {v1, v0, v2, v3}, Lcom/vk/core/util/Preference$PreferenceBoolean;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object v1, p0, Lcom/vk/core/network/NetworkProxy;->preferenceUserState:Lcom/vk/core/util/Preference$PreferenceBoolean;

    .line 61
    new-instance v1, Lcom/vk/core/util/Preference$PreferenceBoolean;

    const-string/jumbo v2, "proxy_state"

    new-instance v3, Ljava/lang/Boolean;

    invoke-direct {v3, v6}, Ljava/lang/Boolean;-><init>(Z)V

    invoke-direct {v1, v0, v2, v3}, Lcom/vk/core/util/Preference$PreferenceBoolean;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object v1, p0, Lcom/vk/core/network/NetworkProxy;->preferenceState:Lcom/vk/core/util/Preference$PreferenceBoolean;

    .line 62
    new-instance v1, Lcom/vk/core/util/Preference$PreferenceString;

    const-string/jumbo v2, "proxy_last"

    const/4 v3, 0x0

    invoke-direct {v1, v0, v2, v3}, Lcom/vk/core/util/Preference$PreferenceString;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/vk/core/network/NetworkProxy;->preferenceLastProxy:Lcom/vk/core/util/Preference$PreferenceString;

    .line 64
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/Network;->getUserAgent()Lcom/vk/core/network/NetworkUserAgent;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/NetworkUserAgent;->userAgent()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vk/core/network/NetworkProxy;->setUserAgent(Ljava/lang/String;)V

    .line 65
    iput-boolean p2, p0, Lcom/vk/core/network/NetworkProxy;->logging:Z

    .line 67
    invoke-virtual {p0, p1}, Lcom/vk/core/network/NetworkProxy;->init(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 68
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->notifyOnProxyHostDisconnected()V

    .line 79
    :cond_0
    :goto_0
    return-void

    .line 72
    :cond_1
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string/jumbo v2, "__dbg_proxy_enable"

    invoke-interface {v1, v2, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vk/core/network/NetworkProxy;->forceUseProxy:Z

    .line 73
    iget-boolean v1, p0, Lcom/vk/core/network/NetworkProxy;->forceUseProxy:Z

    if-nez v1, :cond_0

    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->wasEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->isDisabledByUser()Z

    move-result v1

    if-nez v1, :cond_0

    .line 74
    invoke-static {}, Lcom/vk/core/network/NetworkProxy;->getProxiesList()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vk/core/network/NetworkProxy;->parse(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/core/network/NetworkProxy;->proxies:Ljava/util/ArrayList;

    .line 75
    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->hasProxies()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 76
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v1

    invoke-virtual {v1, v7}, Lcom/vk/core/network/Network;->enableProxy(Z)Z

    goto :goto_0
.end method

.method public loadUrl(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 6
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 125
    :try_start_0
    invoke-virtual {p0}, Lcom/vk/core/network/NetworkProxy;->isEnable()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->wasEnabled()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 126
    :cond_0
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 127
    .local v3, "uri":Ljava/net/URL;
    invoke-virtual {v3}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/vk/core/network/NetworkProxy;->preferenceLastProxy:Lcom/vk/core/util/Preference$PreferenceString;

    invoke-virtual {v5}, Lcom/vk/core/util/Preference$PreferenceString;->get()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/vk/core/network/NetworkProxy;->getHost(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 128
    .local v1, "host":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 129
    new-instance v2, Ljava/net/URL;

    invoke-virtual {v3}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v4, v1, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .local v2, "newUri":Ljava/net/URL;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 131
    .local v0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v4, "Host"

    invoke-virtual {v3}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    const/4 v4, 0x1

    .line 138
    .end local v0    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "host":Ljava/lang/String;
    .end local v2    # "newUri":Ljava/net/URL;
    .end local v3    # "uri":Ljava/net/URL;
    :goto_0
    return v4

    .line 136
    :catch_0
    move-exception v4

    .line 137
    :cond_1
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 138
    const/4 v4, 0x0

    goto :goto_0
.end method

.method protected log(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 371
    iget-boolean v0, p0, Lcom/vk/core/network/NetworkProxy;->logging:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 372
    sget-object v1, Lcom/vk/core/network/NetworkProxy;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " msg: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " cause: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    :cond_0
    return-void

    .line 372
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected log(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 364
    iget-boolean v0, p0, Lcom/vk/core/network/NetworkProxy;->logging:Z

    if-eqz v0, :cond_0

    .line 365
    sget-object v0, Lcom/vk/core/network/NetworkProxy;->TAG:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 367
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 118
    iput-boolean v1, p0, Lcom/vk/core/network/NetworkProxy;->canUseProxy:Z

    .line 119
    invoke-virtual {p0, v1}, Lcom/vk/core/network/NetworkProxy;->setUseHosts(Z)V

    .line 120
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxy;->preferenceState:Lcom/vk/core/util/Preference$PreferenceBoolean;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/core/util/Preference$PreferenceBoolean;->set(Ljava/lang/Boolean;)V

    .line 121
    return-void
.end method

.method public resetTime()V
    .locals 4

    .prologue
    .line 113
    const-string/jumbo v0, "reset time"

    invoke-virtual {p0, v0}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 114
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxy;->preferenceTime:Lcom/vk/core/util/Preference$PreferenceLong;

    new-instance v1, Ljava/lang/Long;

    const-wide/16 v2, 0x0

    invoke-direct {v1, v2, v3}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v0, v1}, Lcom/vk/core/util/Preference$PreferenceLong;->set(Ljava/lang/Long;)V

    .line 115
    return-void
.end method

.method public storeTime()V
    .locals 4

    .prologue
    .line 108
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxy;->preferenceTime:Lcom/vk/core/util/Preference$PreferenceLong;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/core/util/Preference$PreferenceLong;->set(Ljava/lang/Long;)V

    .line 109
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxy;->preferenceState:Lcom/vk/core/util/Preference$PreferenceBoolean;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/core/util/Preference$PreferenceBoolean;->set(Ljava/lang/Boolean;)V

    .line 110
    return-void
.end method

.method public verify(Lcom/vk/core/network/NetworkProxy$ProxyCallback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/core/network/NetworkProxy$ProxyCallback;

    .prologue
    .line 82
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/analytics/Analytics;->database()Lcom/vk/analytics/Firebase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/analytics/Firebase;->isEnableProxies()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->isDisabledByUser()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 83
    :cond_0
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->notifyOnProxyHostDisconnected()V

    .line 93
    :goto_0
    return-void

    .line 87
    :cond_1
    const-string/jumbo v0, "check: begin"

    invoke-virtual {p0, v0}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 88
    iput-object p1, p0, Lcom/vk/core/network/NetworkProxy;->callback:Lcom/vk/core/network/NetworkProxy$ProxyCallback;

    .line 89
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/core/network/NetworkProxy;->running:Z

    .line 90
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/core/network/NetworkProxy;->useHosts:Z

    .line 91
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->clearProxiesIfNeeded()V

    .line 92
    invoke-direct {p0}, Lcom/vk/core/network/NetworkProxy;->verify()V

    goto :goto_0
.end method
