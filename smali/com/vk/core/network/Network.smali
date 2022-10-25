.class public Lcom/vk/core/network/Network;
.super Ljava/lang/Object;
.source "Network.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/core/network/Network$ClientHolder;,
        Lcom/vk/core/network/Network$UserAgentInterceptor;,
        Lcom/vk/core/network/Network$ClientType;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static sInstance:Lcom/vk/core/network/Network;


# instance fields
.field private clients:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/core/network/Network$ClientHolder;",
            ">;"
        }
    .end annotation
.end field

.field private context:Landroid/content/Context;

.field private debug:Z

.field private proxy:Lcom/vk/core/network/NetworkProxy;

.field private userAgent:Lcom/vk/core/network/NetworkUserAgent;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const-class v0, Lcom/vk/core/network/Network;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/core/network/Network;->TAG:Ljava/lang/String;

    .line 33
    const/4 v0, 0x0

    sput-object v0, Lcom/vk/core/network/Network;->sInstance:Lcom/vk/core/network/Network;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/core/network/Network;->clients:Ljava/util/ArrayList;

    .line 36
    new-instance v0, Lcom/vk/core/network/NetworkUserAgent;

    invoke-direct {v0}, Lcom/vk/core/network/NetworkUserAgent;-><init>()V

    iput-object v0, p0, Lcom/vk/core/network/Network;->userAgent:Lcom/vk/core/network/NetworkUserAgent;

    .line 37
    new-instance v0, Lcom/vk/core/network/NetworkProxy;

    invoke-direct {v0}, Lcom/vk/core/network/NetworkProxy;-><init>()V

    iput-object v0, p0, Lcom/vk/core/network/Network;->proxy:Lcom/vk/core/network/NetworkProxy;

    return-void
.end method

.method static synthetic access$000(Lcom/vk/core/network/Network;)Lcom/vk/core/network/NetworkUserAgent;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/Network;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/vk/core/network/Network;->userAgent:Lcom/vk/core/network/NetworkUserAgent;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/core/network/Network;Lokhttp3/OkHttpClient$Builder;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/network/Network;
    .param p1, "x1"    # Lokhttp3/OkHttpClient$Builder;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/vk/core/network/Network;->addHost(Lokhttp3/OkHttpClient$Builder;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vk/core/network/Network;Lokhttp3/OkHttpClient$Builder;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/network/Network;
    .param p1, "x1"    # Lokhttp3/OkHttpClient$Builder;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/vk/core/network/Network;->removeHost(Lokhttp3/OkHttpClient$Builder;)V

    return-void
.end method

.method private addHost(Lokhttp3/OkHttpClient$Builder;)V
    .locals 3
    .param p1, "builder"    # Lokhttp3/OkHttpClient$Builder;

    .prologue
    const/4 v2, 0x0

    .line 178
    invoke-virtual {p1}, Lokhttp3/OkHttpClient$Builder;->interceptors()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 180
    invoke-virtual {p1}, Lokhttp3/OkHttpClient$Builder;->interceptors()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/core/network/Network;->proxy:Lcom/vk/core/network/NetworkProxy;

    invoke-virtual {v1}, Lcom/vk/core/network/NetworkProxy;->getInterceptor()Lokhttp3/Interceptor;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/vk/core/network/Network;->proxy:Lcom/vk/core/network/NetworkProxy;

    invoke-virtual {v0}, Lcom/vk/core/network/NetworkProxy;->getInterceptor()Lokhttp3/Interceptor;

    move-result-object v0

    invoke-virtual {p1, v0}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    .line 184
    :cond_0
    invoke-virtual {p1}, Lokhttp3/OkHttpClient$Builder;->networkInterceptors()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/core/network/Network;->proxy:Lcom/vk/core/network/NetworkProxy;

    invoke-virtual {v1}, Lcom/vk/core/network/NetworkProxy;->getNetworkInterceptor()Lokhttp3/Interceptor;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 187
    :cond_1
    iget-object v0, p0, Lcom/vk/core/network/Network;->proxy:Lcom/vk/core/network/NetworkProxy;

    invoke-virtual {v0}, Lcom/vk/core/network/NetworkProxy;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v0

    invoke-virtual {p1, v0}, Lokhttp3/OkHttpClient$Builder;->hostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lokhttp3/OkHttpClient$Builder;

    .line 188
    iget-object v0, p0, Lcom/vk/core/network/Network;->proxy:Lcom/vk/core/network/NetworkProxy;

    invoke-virtual {v0}, Lcom/vk/core/network/NetworkProxy;->getTrustManager()Lcom/vk/core/network/NetworkTrustManager;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/vk/core/network/NetworkTrustManager;->sslSocketFactory(Lokhttp3/OkHttpClient$Builder;Lcom/vk/core/network/NetworkTrustManager;)V

    .line 190
    invoke-virtual {p1, v2}, Lokhttp3/OkHttpClient$Builder;->followRedirects(Z)Lokhttp3/OkHttpClient$Builder;

    .line 191
    invoke-virtual {p1, v2}, Lokhttp3/OkHttpClient$Builder;->followSslRedirects(Z)Lokhttp3/OkHttpClient$Builder;

    .line 192
    return-void
.end method

.method private createBuilder()Lokhttp3/OkHttpClient$Builder;
    .locals 8

    .prologue
    const-wide/16 v6, 0x14

    const/4 v5, 0x1

    .line 139
    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    .line 142
    .local v0, "builder":Lokhttp3/OkHttpClient$Builder;
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v6, v7, v1}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 143
    const-wide/16 v2, 0x1e

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 144
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v6, v7, v1}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 147
    new-instance v1, Lcom/vk/core/network/Network$UserAgentInterceptor;

    invoke-direct {v1}, Lcom/vk/core/network/Network$UserAgentInterceptor;-><init>()V

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    .line 149
    new-instance v1, Lcom/vk/core/network/cookies/PersistentCookieJar;

    new-instance v2, Lcom/vk/core/network/cookies/cache/SetCookieCache;

    invoke-direct {v2}, Lcom/vk/core/network/cookies/cache/SetCookieCache;-><init>()V

    new-instance v3, Lcom/vk/core/network/cookies/persistence/SharedPrefsCookiePersistor;

    iget-object v4, p0, Lcom/vk/core/network/Network;->context:Landroid/content/Context;

    invoke-direct {v3, v4}, Lcom/vk/core/network/cookies/persistence/SharedPrefsCookiePersistor;-><init>(Landroid/content/Context;)V

    iget-boolean v4, p0, Lcom/vk/core/network/Network;->debug:Z

    invoke-direct {v1, v2, v3, v4}, Lcom/vk/core/network/cookies/PersistentCookieJar;-><init>(Lcom/vk/core/network/cookies/cache/CookieCache;Lcom/vk/core/network/cookies/persistence/CookiePersistor;Z)V

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->cookieJar(Lokhttp3/CookieJar;)Lokhttp3/OkHttpClient$Builder;

    .line 151
    invoke-static {v0}, Lcom/vk/core/network/NetworkTrustManager;->sslDefaultSocketFactory(Lokhttp3/OkHttpClient$Builder;)V

    .line 153
    invoke-virtual {v0, v5}, Lokhttp3/OkHttpClient$Builder;->followRedirects(Z)Lokhttp3/OkHttpClient$Builder;

    .line 154
    invoke-virtual {v0, v5}, Lokhttp3/OkHttpClient$Builder;->followSslRedirects(Z)Lokhttp3/OkHttpClient$Builder;

    .line 155
    return-object v0
.end method

.method public static getDefaultClient()Lokhttp3/OkHttpClient;
    .locals 2

    .prologue
    .line 49
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v0

    sget-object v1, Lcom/vk/core/network/Network$ClientType;->CLIENT_DEFAULT:Lcom/vk/core/network/Network$ClientType;

    invoke-virtual {v0, v1}, Lcom/vk/core/network/Network;->getClient(Lcom/vk/core/network/Network$ClientType;)Lokhttp3/OkHttpClient;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance()Lcom/vk/core/network/Network;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/vk/core/network/Network;->sInstance:Lcom/vk/core/network/Network;

    if-nez v0, :cond_0

    .line 43
    new-instance v0, Lcom/vk/core/network/Network;

    invoke-direct {v0}, Lcom/vk/core/network/Network;-><init>()V

    sput-object v0, Lcom/vk/core/network/Network;->sInstance:Lcom/vk/core/network/Network;

    .line 45
    :cond_0
    sget-object v0, Lcom/vk/core/network/Network;->sInstance:Lcom/vk/core/network/Network;

    return-object v0
.end method

.method public static getURL(Ljava/lang/String;)[B
    .locals 6
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 55
    :try_start_0
    new-instance v4, Lokhttp3/Request$Builder;

    invoke-direct {v4}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v4, p0}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    .line 56
    .local v1, "req":Lokhttp3/Request;
    invoke-static {}, Lcom/vk/core/network/Network;->getDefaultClient()Lokhttp3/OkHttpClient;

    move-result-object v4

    invoke-virtual {v4, v1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v4

    invoke-interface {v4}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v2

    .line 57
    .local v2, "resp":Lokhttp3/Response;
    invoke-virtual {v2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/ResponseBody;->bytes()[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v4

    .line 63
    .end local v1    # "req":Lokhttp3/Request;
    .end local v2    # "resp":Lokhttp3/Response;
    :goto_0
    return-object v4

    .line 58
    :catch_0
    move-exception v3

    .line 59
    .local v3, "x":Ljava/io/IOException;
    sget-object v4, Lcom/vk/core/network/Network;->TAG:Ljava/lang/String;

    const-string/jumbo v5, ""

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 63
    .end local v3    # "x":Ljava/io/IOException;
    :goto_1
    const/4 v4, 0x0

    goto :goto_0

    .line 60
    :catch_1
    move-exception v0

    .line 61
    .local v0, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/vk/core/network/Network;->TAG:Ljava/lang/String;

    const-string/jumbo v5, ""

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method private removeHost(Lokhttp3/OkHttpClient$Builder;)V
    .locals 6
    .param p1, "builder"    # Lokhttp3/OkHttpClient$Builder;

    .prologue
    const/4 v5, 0x1

    .line 159
    invoke-virtual {p1}, Lokhttp3/OkHttpClient$Builder;->interceptors()Ljava/util/List;

    move-result-object v2

    .line 160
    .local v2, "interceptors":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Interceptor;>;"
    const/4 v0, 0x0

    .line 161
    .local v0, "found":Z
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lokhttp3/Interceptor;

    .line 162
    .local v1, "i":Lokhttp3/Interceptor;
    iget-object v4, p0, Lcom/vk/core/network/Network;->proxy:Lcom/vk/core/network/NetworkProxy;

    invoke-virtual {v4}, Lcom/vk/core/network/NetworkProxy;->getInterceptor()Lokhttp3/Interceptor;

    move-result-object v4

    if-ne v1, v4, :cond_0

    .line 163
    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 164
    const/4 v0, 0x1

    goto :goto_0

    .line 167
    .end local v1    # "i":Lokhttp3/Interceptor;
    :cond_1
    if-eqz v0, :cond_2

    .line 168
    new-instance v3, Lcom/vk/core/network/Network$UserAgentInterceptor;

    invoke-direct {v3}, Lcom/vk/core/network/Network$UserAgentInterceptor;-><init>()V

    invoke-virtual {p1, v3}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    .line 169
    sget-object v3, Lokhttp3/internal/tls/OkHostnameVerifier;->INSTANCE:Lokhttp3/internal/tls/OkHostnameVerifier;

    invoke-virtual {p1, v3}, Lokhttp3/OkHttpClient$Builder;->hostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lokhttp3/OkHttpClient$Builder;

    .line 170
    invoke-static {p1}, Lcom/vk/core/network/NetworkTrustManager;->sslDefaultSocketFactory(Lokhttp3/OkHttpClient$Builder;)V

    .line 173
    :cond_2
    invoke-virtual {p1, v5}, Lokhttp3/OkHttpClient$Builder;->followRedirects(Z)Lokhttp3/OkHttpClient$Builder;

    .line 174
    invoke-virtual {p1, v5}, Lokhttp3/OkHttpClient$Builder;->followSslRedirects(Z)Lokhttp3/OkHttpClient$Builder;

    .line 175
    return-void
.end method


# virtual methods
.method public disableProxy(Z)Z
    .locals 4
    .param p1, "force"    # Z

    .prologue
    .line 126
    sget-object v1, Lcom/vk/core/network/Network;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "disableProxy force="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    if-eqz p1, :cond_0

    .line 128
    iget-object v1, p0, Lcom/vk/core/network/Network;->proxy:Lcom/vk/core/network/NetworkProxy;

    invoke-virtual {v1}, Lcom/vk/core/network/NetworkProxy;->resetTime()V

    .line 129
    iget-object v1, p0, Lcom/vk/core/network/Network;->proxy:Lcom/vk/core/network/NetworkProxy;

    invoke-virtual {v1}, Lcom/vk/core/network/NetworkProxy;->reset()V

    .line 132
    :cond_0
    iget-object v1, p0, Lcom/vk/core/network/Network;->clients:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/core/network/Network$ClientHolder;

    .line 133
    .local v0, "c":Lcom/vk/core/network/Network$ClientHolder;
    invoke-virtual {v0}, Lcom/vk/core/network/Network$ClientHolder;->removeHost()V

    goto :goto_0

    .line 135
    .end local v0    # "c":Lcom/vk/core/network/Network$ClientHolder;
    :cond_1
    const/4 v1, 0x1

    return v1
.end method

.method public enableProxy(Z)Z
    .locals 5
    .param p1, "force"    # Z

    .prologue
    const/4 v1, 0x1

    .line 107
    iget-object v2, p0, Lcom/vk/core/network/Network;->proxy:Lcom/vk/core/network/NetworkProxy;

    invoke-virtual {v2}, Lcom/vk/core/network/NetworkProxy;->hasProxies()Z

    move-result v2

    if-nez v2, :cond_1

    .line 108
    const/4 v1, 0x0

    .line 122
    :cond_0
    return v1

    .line 110
    :cond_1
    sget-object v2, Lcom/vk/core/network/Network;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "enableProxy force="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    if-eqz p1, :cond_2

    .line 112
    iget-object v2, p0, Lcom/vk/core/network/Network;->proxy:Lcom/vk/core/network/NetworkProxy;

    invoke-virtual {v2, v1}, Lcom/vk/core/network/NetworkProxy;->setUseHosts(Z)V

    .line 113
    iget-object v2, p0, Lcom/vk/core/network/Network;->proxy:Lcom/vk/core/network/NetworkProxy;

    invoke-virtual {v2}, Lcom/vk/core/network/NetworkProxy;->storeTime()V

    .line 117
    :goto_0
    iget-object v2, p0, Lcom/vk/core/network/Network;->proxy:Lcom/vk/core/network/NetworkProxy;

    iget-object v3, p0, Lcom/vk/core/network/Network;->userAgent:Lcom/vk/core/network/NetworkUserAgent;

    invoke-virtual {v3}, Lcom/vk/core/network/NetworkUserAgent;->userAgent()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/core/network/NetworkProxy;->setUserAgent(Ljava/lang/String;)V

    .line 119
    iget-object v2, p0, Lcom/vk/core/network/Network;->clients:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/core/network/Network$ClientHolder;

    .line 120
    .local v0, "c":Lcom/vk/core/network/Network$ClientHolder;
    invoke-virtual {v0}, Lcom/vk/core/network/Network$ClientHolder;->addHost()V

    goto :goto_1

    .line 115
    .end local v0    # "c":Lcom/vk/core/network/Network$ClientHolder;
    :cond_2
    iget-object v2, p0, Lcom/vk/core/network/Network;->proxy:Lcom/vk/core/network/NetworkProxy;

    invoke-virtual {v2, v1}, Lcom/vk/core/network/NetworkProxy;->setUseHostsTemprary(Z)V

    goto :goto_0
.end method

.method public getBuilder(Lcom/vk/core/network/Network$ClientType;)Lokhttp3/OkHttpClient$Builder;
    .locals 2
    .param p1, "id"    # Lcom/vk/core/network/Network$ClientType;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/vk/core/network/Network;->clients:Ljava/util/ArrayList;

    invoke-virtual {p1}, Lcom/vk/core/network/Network$ClientType;->ordinal()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/core/network/Network$ClientHolder;

    invoke-virtual {v0}, Lcom/vk/core/network/Network$ClientHolder;->builder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getClient(Lcom/vk/core/network/Network$ClientType;)Lokhttp3/OkHttpClient;
    .locals 2
    .param p1, "id"    # Lcom/vk/core/network/Network$ClientType;

    .prologue
    .line 87
    iget-object v0, p0, Lcom/vk/core/network/Network;->clients:Ljava/util/ArrayList;

    invoke-virtual {p1}, Lcom/vk/core/network/Network$ClientType;->ordinal()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/core/network/Network$ClientHolder;

    invoke-virtual {v0}, Lcom/vk/core/network/Network$ClientHolder;->client()Lokhttp3/OkHttpClient;

    move-result-object v0

    return-object v0
.end method

.method public getUserAgent()Lcom/vk/core/network/NetworkUserAgent;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/vk/core/network/Network;->userAgent:Lcom/vk/core/network/NetworkUserAgent;

    return-object v0
.end method

.method public init(Landroid/content/Context;Z)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "debug"    # Z

    .prologue
    .line 67
    iput-object p1, p0, Lcom/vk/core/network/Network;->context:Landroid/content/Context;

    .line 68
    iput-boolean p2, p0, Lcom/vk/core/network/Network;->debug:Z

    .line 69
    iget-object v1, p0, Lcom/vk/core/network/Network;->userAgent:Lcom/vk/core/network/NetworkUserAgent;

    invoke-virtual {v1, p1}, Lcom/vk/core/network/NetworkUserAgent;->init(Landroid/content/Context;)V

    .line 71
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-static {}, Lcom/vk/core/network/Network$ClientType;->values()[Lcom/vk/core/network/Network$ClientType;

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 72
    iget-object v1, p0, Lcom/vk/core/network/Network;->clients:Ljava/util/ArrayList;

    new-instance v2, Lcom/vk/core/network/Network$ClientHolder;

    invoke-static {}, Lcom/vk/core/network/Network$ClientType;->values()[Lcom/vk/core/network/Network$ClientType;

    move-result-object v3

    aget-object v3, v3, v0

    invoke-direct {v2, p0, v3}, Lcom/vk/core/network/Network$ClientHolder;-><init>(Lcom/vk/core/network/Network;Lcom/vk/core/network/Network$ClientType;)V

    invoke-virtual {v1, v0, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 71
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 75
    :cond_0
    iget-object v1, p0, Lcom/vk/core/network/Network;->proxy:Lcom/vk/core/network/NetworkProxy;

    invoke-virtual {v1, p1, p2}, Lcom/vk/core/network/NetworkProxy;->init(Landroid/content/Context;Z)V

    .line 76
    return-void
.end method

.method public makeBuilder()Lokhttp3/OkHttpClient$Builder;
    .locals 2

    .prologue
    .line 95
    invoke-direct {p0}, Lcom/vk/core/network/Network;->createBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 96
    .local v0, "builder":Lokhttp3/OkHttpClient$Builder;
    invoke-virtual {p0}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/NetworkProxy;->isEnable()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 97
    invoke-direct {p0, v0}, Lcom/vk/core/network/Network;->addHost(Lokhttp3/OkHttpClient$Builder;)V

    .line 99
    :cond_0
    return-object v0
.end method

.method public proxy()Lcom/vk/core/network/NetworkProxy;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/vk/core/network/Network;->proxy:Lcom/vk/core/network/NetworkProxy;

    return-object v0
.end method

.method public setBuilder(Lcom/vk/core/network/Network$ClientType;Lokhttp3/OkHttpClient$Builder;)Lokhttp3/OkHttpClient;
    .locals 2
    .param p1, "id"    # Lcom/vk/core/network/Network$ClientType;
    .param p2, "builder"    # Lokhttp3/OkHttpClient$Builder;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vk/core/network/Network;->clients:Ljava/util/ArrayList;

    invoke-virtual {p1}, Lcom/vk/core/network/Network$ClientType;->ordinal()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/core/network/Network$ClientHolder;

    invoke-virtual {v0, p2}, Lcom/vk/core/network/Network$ClientHolder;->setBuilder(Lokhttp3/OkHttpClient$Builder;)Lokhttp3/OkHttpClient;

    move-result-object v0

    return-object v0
.end method
