.class public Lcom/vk/core/network/cookies/persistence/SharedPrefsCookiePersistor;
.super Ljava/lang/Object;
.source "SharedPrefsCookiePersistor.java"

# interfaces
.implements Lcom/vk/core/network/cookies/persistence/CookiePersistor;


# instance fields
.field private final sharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    const-string/jumbo v0, "CookiePersistence"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/core/network/cookies/persistence/SharedPrefsCookiePersistor;-><init>(Landroid/content/SharedPreferences;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/SharedPreferences;)V
    .locals 0
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/vk/core/network/cookies/persistence/SharedPrefsCookiePersistor;->sharedPreferences:Landroid/content/SharedPreferences;

    .line 39
    return-void
.end method

.method private static createCookieKey(Lokhttp3/Cookie;)Ljava/lang/String;
    .locals 2
    .param p0, "cookie"    # Lokhttp3/Cookie;

    .prologue
    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lokhttp3/Cookie;->secure()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "https"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lokhttp3/Cookie;->domain()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lokhttp3/Cookie;->path()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lokhttp3/Cookie;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string/jumbo v0, "http"

    goto :goto_0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/vk/core/network/cookies/persistence/SharedPrefsCookiePersistor;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 80
    return-void
.end method

.method public loadAll()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lokhttp3/Cookie;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    new-instance v1, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vk/core/network/cookies/persistence/SharedPrefsCookiePersistor;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 45
    .local v1, "cookies":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Cookie;>;"
    iget-object v4, p0, Lcom/vk/core/network/cookies/persistence/SharedPrefsCookiePersistor;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 46
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;*>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 47
    .local v3, "serializedCookie":Ljava/lang/String;
    new-instance v5, Lcom/vk/core/network/cookies/persistence/SerializableCookie;

    invoke-direct {v5}, Lcom/vk/core/network/cookies/persistence/SerializableCookie;-><init>()V

    invoke-virtual {v5, v3}, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->decode(Ljava/lang/String;)Lokhttp3/Cookie;

    move-result-object v0

    .line 48
    .local v0, "cookie":Lokhttp3/Cookie;
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 50
    .end local v0    # "cookie":Lokhttp3/Cookie;
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;*>;"
    .end local v3    # "serializedCookie":Ljava/lang/String;
    :cond_0
    return-object v1
.end method

.method public removeAll(Ljava/util/Collection;)V
    .locals 4
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
    .line 66
    .local p1, "cookies":Ljava/util/Collection;, "Ljava/util/Collection<Lokhttp3/Cookie;>;"
    iget-object v2, p0, Lcom/vk/core/network/cookies/persistence/SharedPrefsCookiePersistor;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 67
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lokhttp3/Cookie;

    .line 68
    .local v0, "cookie":Lokhttp3/Cookie;
    invoke-static {v0}, Lcom/vk/core/network/cookies/persistence/SharedPrefsCookiePersistor;->createCookieKey(Lokhttp3/Cookie;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 70
    .end local v0    # "cookie":Lokhttp3/Cookie;
    :cond_0
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 71
    return-void
.end method

.method public saveAll(Ljava/util/Collection;)V
    .locals 5
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
    .line 55
    .local p1, "cookies":Ljava/util/Collection;, "Ljava/util/Collection<Lokhttp3/Cookie;>;"
    iget-object v2, p0, Lcom/vk/core/network/cookies/persistence/SharedPrefsCookiePersistor;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 56
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lokhttp3/Cookie;

    .line 57
    .local v0, "cookie":Lokhttp3/Cookie;
    invoke-virtual {v0}, Lokhttp3/Cookie;->persistent()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 58
    invoke-static {v0}, Lcom/vk/core/network/cookies/persistence/SharedPrefsCookiePersistor;->createCookieKey(Lokhttp3/Cookie;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/vk/core/network/cookies/persistence/SerializableCookie;

    invoke-direct {v4}, Lcom/vk/core/network/cookies/persistence/SerializableCookie;-><init>()V

    invoke-virtual {v4, v0}, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->encode(Lokhttp3/Cookie;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 61
    .end local v0    # "cookie":Lokhttp3/Cookie;
    :cond_1
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 62
    return-void
.end method
