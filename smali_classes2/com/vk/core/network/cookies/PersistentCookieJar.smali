.class public Lcom/vk/core/network/cookies/PersistentCookieJar;
.super Ljava/lang/Object;
.source "PersistentCookieJar.java"

# interfaces
.implements Lcom/vk/core/network/cookies/ClearableCookieJar;


# instance fields
.field private cache:Lcom/vk/core/network/cookies/cache/CookieCache;

.field private debug:Z

.field private persistor:Lcom/vk/core/network/cookies/persistence/CookiePersistor;


# direct methods
.method public constructor <init>(Lcom/vk/core/network/cookies/cache/CookieCache;Lcom/vk/core/network/cookies/persistence/CookiePersistor;Z)V
    .locals 2
    .param p1, "cache"    # Lcom/vk/core/network/cookies/cache/CookieCache;
    .param p2, "persistor"    # Lcom/vk/core/network/cookies/persistence/CookiePersistor;
    .param p3, "debug"    # Z

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/vk/core/network/cookies/PersistentCookieJar;->cache:Lcom/vk/core/network/cookies/cache/CookieCache;

    .line 38
    iput-object p2, p0, Lcom/vk/core/network/cookies/PersistentCookieJar;->persistor:Lcom/vk/core/network/cookies/persistence/CookiePersistor;

    .line 39
    iput-boolean p3, p0, Lcom/vk/core/network/cookies/PersistentCookieJar;->debug:Z

    .line 40
    iget-object v0, p0, Lcom/vk/core/network/cookies/PersistentCookieJar;->cache:Lcom/vk/core/network/cookies/cache/CookieCache;

    invoke-interface {p2}, Lcom/vk/core/network/cookies/persistence/CookiePersistor;->loadAll()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/core/network/cookies/cache/CookieCache;->addAll(Ljava/util/Collection;)V

    .line 41
    return-void
.end method

.method private static isCookieExpired(Lokhttp3/Cookie;)Z
    .locals 4
    .param p0, "cookie"    # Lokhttp3/Cookie;

    .prologue
    .line 76
    invoke-virtual {p0}, Lokhttp3/Cookie;->expiresAt()J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized clear()V
    .locals 1

    .prologue
    .line 86
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vk/core/network/cookies/PersistentCookieJar;->cache:Lcom/vk/core/network/cookies/cache/CookieCache;

    invoke-interface {v0}, Lcom/vk/core/network/cookies/cache/CookieCache;->clear()V

    .line 87
    iget-object v0, p0, Lcom/vk/core/network/cookies/PersistentCookieJar;->persistor:Lcom/vk/core/network/cookies/persistence/CookiePersistor;

    invoke-interface {v0}, Lcom/vk/core/network/cookies/persistence/CookiePersistor;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    monitor-exit p0

    return-void

    .line 86
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public clearSession()V
    .locals 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vk/core/network/cookies/PersistentCookieJar;->cache:Lcom/vk/core/network/cookies/cache/CookieCache;

    invoke-interface {v0}, Lcom/vk/core/network/cookies/cache/CookieCache;->clear()V

    .line 82
    iget-object v0, p0, Lcom/vk/core/network/cookies/PersistentCookieJar;->cache:Lcom/vk/core/network/cookies/cache/CookieCache;

    iget-object v1, p0, Lcom/vk/core/network/cookies/PersistentCookieJar;->persistor:Lcom/vk/core/network/cookies/persistence/CookiePersistor;

    invoke-interface {v1}, Lcom/vk/core/network/cookies/persistence/CookiePersistor;->loadAll()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/core/network/cookies/cache/CookieCache;->addAll(Ljava/util/Collection;)V

    .line 83
    return-void
.end method

.method public declared-synchronized loadForRequest(Lokhttp3/HttpUrl;)Ljava/util/List;
    .locals 6
    .param p1, "url"    # Lokhttp3/HttpUrl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/HttpUrl;",
            ")",
            "Ljava/util/List",
            "<",
            "Lokhttp3/Cookie;",
            ">;"
        }
    .end annotation

    .prologue
    .line 51
    monitor-enter p0

    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .local v2, "removedCookies":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Cookie;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .local v3, "validCookies":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Cookie;>;"
    iget-object v4, p0, Lcom/vk/core/network/cookies/PersistentCookieJar;->cache:Lcom/vk/core/network/cookies/cache/CookieCache;

    invoke-interface {v4}, Lcom/vk/core/network/cookies/cache/CookieCache;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lokhttp3/Cookie;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 55
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lokhttp3/Cookie;

    .line 57
    .local v0, "currentCookie":Lokhttp3/Cookie;
    invoke-static {v0}, Lcom/vk/core/network/cookies/PersistentCookieJar;->isCookieExpired(Lokhttp3/Cookie;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 58
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 51
    .end local v0    # "currentCookie":Lokhttp3/Cookie;
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lokhttp3/Cookie;>;"
    .end local v2    # "removedCookies":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Cookie;>;"
    .end local v3    # "validCookies":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Cookie;>;"
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 61
    .restart local v0    # "currentCookie":Lokhttp3/Cookie;
    .restart local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lokhttp3/Cookie;>;"
    .restart local v2    # "removedCookies":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Cookie;>;"
    .restart local v3    # "validCookies":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Cookie;>;"
    :cond_1
    :try_start_1
    invoke-virtual {v0, p1}, Lokhttp3/Cookie;->matches(Lokhttp3/HttpUrl;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 62
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 66
    .end local v0    # "currentCookie":Lokhttp3/Cookie;
    :cond_2
    iget-object v4, p0, Lcom/vk/core/network/cookies/PersistentCookieJar;->persistor:Lcom/vk/core/network/cookies/persistence/CookiePersistor;

    invoke-interface {v4, v2}, Lcom/vk/core/network/cookies/persistence/CookiePersistor;->removeAll(Ljava/util/Collection;)V

    .line 68
    iget-boolean v4, p0, Lcom/vk/core/network/cookies/PersistentCookieJar;->debug:Z

    if-eqz v4, :cond_3

    .line 69
    new-instance v4, Lokhttp3/Cookie$Builder;

    invoke-direct {v4}, Lokhttp3/Cookie$Builder;-><init>()V

    invoke-virtual {p1}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lokhttp3/Cookie$Builder;->domain(Ljava/lang/String;)Lokhttp3/Cookie$Builder;

    move-result-object v4

    const-string/jumbo v5, "XDEBUG_SESSION"

    invoke-virtual {v4, v5}, Lokhttp3/Cookie$Builder;->name(Ljava/lang/String;)Lokhttp3/Cookie$Builder;

    move-result-object v4

    const-string/jumbo v5, "PHPSTORM"

    invoke-virtual {v4, v5}, Lokhttp3/Cookie$Builder;->value(Ljava/lang/String;)Lokhttp3/Cookie$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/Cookie$Builder;->build()Lokhttp3/Cookie;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    :cond_3
    monitor-exit p0

    return-object v3
.end method

.method public declared-synchronized saveFromResponse(Lokhttp3/HttpUrl;Ljava/util/List;)V
    .locals 1
    .param p1, "url"    # Lokhttp3/HttpUrl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/HttpUrl;",
            "Ljava/util/List",
            "<",
            "Lokhttp3/Cookie;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p2, "cookies":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Cookie;>;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vk/core/network/cookies/PersistentCookieJar;->cache:Lcom/vk/core/network/cookies/cache/CookieCache;

    invoke-interface {v0, p2}, Lcom/vk/core/network/cookies/cache/CookieCache;->addAll(Ljava/util/Collection;)V

    .line 46
    iget-object v0, p0, Lcom/vk/core/network/cookies/PersistentCookieJar;->persistor:Lcom/vk/core/network/cookies/persistence/CookiePersistor;

    invoke-interface {v0, p2}, Lcom/vk/core/network/cookies/persistence/CookiePersistor;->saveAll(Ljava/util/Collection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    monitor-exit p0

    return-void

    .line 45
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
