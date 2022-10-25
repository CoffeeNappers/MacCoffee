.class public Lcom/vk/core/network/cookies/cache/SetCookieCache;
.super Ljava/lang/Object;
.source "SetCookieCache.java"

# interfaces
.implements Lcom/vk/core/network/cookies/cache/CookieCache;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/core/network/cookies/cache/SetCookieCache$SetCookieCacheIterator;
    }
.end annotation


# instance fields
.field private cookies:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/vk/core/network/cookies/cache/IdentifiableCookie;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/vk/core/network/cookies/cache/SetCookieCache;->cookies:Ljava/util/Set;

    .line 32
    return-void
.end method

.method static synthetic access$000(Lcom/vk/core/network/cookies/cache/SetCookieCache;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/cookies/cache/SetCookieCache;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/vk/core/network/cookies/cache/SetCookieCache;->cookies:Ljava/util/Set;

    return-object v0
.end method


# virtual methods
.method public addAll(Ljava/util/Collection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lokhttp3/Cookie;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p1, "newCookies":Ljava/util/Collection;, "Ljava/util/Collection<Lokhttp3/Cookie;>;"
    invoke-static {p1}, Lcom/vk/core/network/cookies/cache/IdentifiableCookie;->decorateAll(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/core/network/cookies/cache/IdentifiableCookie;

    .line 37
    .local v0, "cookie":Lcom/vk/core/network/cookies/cache/IdentifiableCookie;
    iget-object v2, p0, Lcom/vk/core/network/cookies/cache/SetCookieCache;->cookies:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 38
    iget-object v2, p0, Lcom/vk/core/network/cookies/cache/SetCookieCache;->cookies:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 40
    .end local v0    # "cookie":Lcom/vk/core/network/cookies/cache/IdentifiableCookie;
    :cond_0
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/vk/core/network/cookies/cache/SetCookieCache;->cookies:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 45
    return-void
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lokhttp3/Cookie;",
            ">;"
        }
    .end annotation

    .prologue
    .line 49
    new-instance v0, Lcom/vk/core/network/cookies/cache/SetCookieCache$SetCookieCacheIterator;

    invoke-direct {v0, p0}, Lcom/vk/core/network/cookies/cache/SetCookieCache$SetCookieCacheIterator;-><init>(Lcom/vk/core/network/cookies/cache/SetCookieCache;)V

    return-object v0
.end method
