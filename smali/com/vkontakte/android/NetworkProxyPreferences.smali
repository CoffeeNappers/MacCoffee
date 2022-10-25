.class public Lcom/vkontakte/android/NetworkProxyPreferences;
.super Ljava/lang/Object;
.source "NetworkProxyPreferences.java"

# interfaces
.implements Lcom/vk/core/network/NetworkProxy$ProxyCallback;
.implements Ljava/lang/Runnable;


# static fields
.field private static final FAILURE_ATTEMPTS:I = 0x2


# instance fields
.field private currentReq:Lio/reactivex/disposables/Disposable;

.field private failure:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private failureAttempts:I

.field private success:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<",
            "Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/NetworkProxyPreferences;->failureAttempts:I

    .line 53
    new-instance v0, Lcom/vkontakte/android/NetworkProxyPreferences$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/NetworkProxyPreferences$1;-><init>(Lcom/vkontakte/android/NetworkProxyPreferences;)V

    iput-object v0, p0, Lcom/vkontakte/android/NetworkProxyPreferences;->success:Lio/reactivex/functions/Consumer;

    .line 90
    new-instance v0, Lcom/vkontakte/android/NetworkProxyPreferences$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/NetworkProxyPreferences$2;-><init>(Lcom/vkontakte/android/NetworkProxyPreferences;)V

    iput-object v0, p0, Lcom/vkontakte/android/NetworkProxyPreferences;->failure:Lio/reactivex/functions/Consumer;

    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/NetworkProxyPreferences;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/NetworkProxyPreferences;
    .param p1, "x1"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/vkontakte/android/NetworkProxyPreferences;->currentReq:Lio/reactivex/disposables/Disposable;

    return-object p1
.end method

.method static synthetic access$104(Lcom/vkontakte/android/NetworkProxyPreferences;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/NetworkProxyPreferences;

    .prologue
    .line 28
    iget v0, p0, Lcom/vkontakte/android/NetworkProxyPreferences;->failureAttempts:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/NetworkProxyPreferences;->failureAttempts:I

    return v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/NetworkProxyPreferences;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/NetworkProxyPreferences;

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/vkontakte/android/NetworkProxyPreferences;->checkProxies()V

    return-void
.end method

.method private checkProxies()V
    .locals 3

    .prologue
    .line 108
    iget-object v0, p0, Lcom/vkontakte/android/NetworkProxyPreferences;->currentReq:Lio/reactivex/disposables/Disposable;

    if-nez v0, :cond_0

    .line 109
    new-instance v0, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences;

    invoke-direct {p0}, Lcom/vkontakte/android/NetworkProxyPreferences;->getUid()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Lcom/vkontakte/android/NetworkProxyPreferences;->getInfo()Ljava/util/HashMap;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 110
    invoke-virtual {v0}, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/NetworkProxyPreferences;->success:Lio/reactivex/functions/Consumer;

    iget-object v2, p0, Lcom/vkontakte/android/NetworkProxyPreferences;->failure:Lio/reactivex/functions/Consumer;

    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/NetworkProxyPreferences;->currentReq:Lio/reactivex/disposables/Disposable;

    .line 112
    :cond_0
    return-void
.end method

.method private getInfo()Ljava/util/HashMap;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 120
    sget-object v9, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 121
    .local v9, "context":Landroid/content/Context;
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 122
    .local v11, "info":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    .line 123
    .local v0, "account":Lcom/vkontakte/android/auth/VKAccount;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 124
    const-string/jumbo v2, "country"

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getCountry()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    :cond_0
    const-string/jumbo v2, "user_agent"

    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/core/network/Network;->getUserAgent()Lcom/vk/core/network/NetworkUserAgent;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/core/network/NetworkUserAgent;->userAgent()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    :try_start_0
    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget-object v10, v2, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 131
    .local v10, "current":Ljava/util/Locale;
    if-eqz v10, :cond_1

    .line 132
    const-string/jumbo v2, "locale_country"

    invoke-virtual {v10}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    const-string/jumbo v2, "locale_display_country"

    invoke-virtual {v10}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    const-string/jumbo v2, "locale_display_language"

    invoke-virtual {v10}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    const-string/jumbo v2, "locale_language"

    invoke-virtual {v10}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    :cond_1
    invoke-static {}, Lcom/vk/attachpicker/util/LocationUtils;->getLastKnownLocation()Landroid/location/Location;

    move-result-object v12

    .line 138
    .local v12, "location":Landroid/location/Location;
    if-eqz v12, :cond_2

    .line 139
    const-string/jumbo v2, "location_latitude"

    invoke-virtual {v12}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    const-string/jumbo v2, "location_longitude"

    invoke-virtual {v12}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    new-instance v1, Landroid/location/Geocoder;

    invoke-direct {v1, v9}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;)V

    .line 143
    .local v1, "geo":Landroid/location/Geocoder;
    invoke-virtual {v12}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    invoke-virtual {v12}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    const/4 v6, 0x1

    invoke-virtual/range {v1 .. v6}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    move-result-object v8

    .line 144
    .local v8, "addresses":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/location/Address;

    .line 145
    .local v7, "address":Landroid/location/Address;
    const-string/jumbo v3, "address_country_code"

    invoke-virtual {v7}, Landroid/location/Address;->getCountryCode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v11, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    const-string/jumbo v3, "address_country_name"

    invoke-virtual {v7}, Landroid/location/Address;->getCountryName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v11, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 149
    .end local v1    # "geo":Landroid/location/Geocoder;
    .end local v7    # "address":Landroid/location/Address;
    .end local v8    # "addresses":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    .end local v10    # "current":Ljava/util/Locale;
    .end local v12    # "location":Landroid/location/Location;
    :catch_0
    move-exception v2

    .line 151
    :cond_2
    return-object v11
.end method

.method private getUid()Ljava/lang/String;
    .locals 2

    .prologue
    .line 115
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    .line 116
    .local v0, "account":Lcom/vkontakte/android/auth/VKAccount;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const-string/jumbo v1, "empty"

    goto :goto_0
.end method


# virtual methods
.method protected onProxyDisabled()V
    .locals 2

    .prologue
    .line 49
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/NetworkProxyPreferences;->failureAttempts:I

    .line 50
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/core/network/Network;->disableProxy(Z)Z

    .line 51
    return-void
.end method

.method protected onProxyEnabled()V
    .locals 2

    .prologue
    .line 44
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/NetworkProxyPreferences;->failureAttempts:I

    .line 45
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/core/network/Network;->enableProxy(Z)Z

    .line 46
    return-void
.end method

.method public onProxyHostConnected()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/vkontakte/android/NetworkProxyPreferences;->checkProxies()V

    .line 36
    return-void
.end method

.method public onProxyHostDisconnected()V
    .locals 0

    .prologue
    .line 40
    invoke-virtual {p0}, Lcom/vkontakte/android/NetworkProxyPreferences;->onProxyDisabled()V

    .line 41
    return-void
.end method

.method public run()V
    .locals 1

    .prologue
    .line 156
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vk/core/network/NetworkProxy;->verify(Lcom/vk/core/network/NetworkProxy$ProxyCallback;)V

    .line 157
    return-void
.end method
