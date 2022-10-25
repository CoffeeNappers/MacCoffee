.class public Lcom/vkontakte/android/api/APIController;
.super Ljava/lang/Object;
.source "APIController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/APIController$RequestRunner;
    }
.end annotation


# static fields
.field public static final API_DEBUG:Z

.field public static final API_URL:Ljava/lang/String;

.field private static final COUNTER_RESET_TIME:J = 0x7d0L

.field public static final FUCKING_AD_USER_AGENT:Ljava/lang/String;

.field private static final MAX_REQUESTS_PER_COUNT:J = 0xaL

.field public static final USER_AGENT:Ljava/lang/String;

.field private static final benchmarkTracker:Lcom/vkontakte/android/data/BenchmarkTracker;

.field private static bgThread:Lcom/vkontakte/android/background/WorkerThread;

.field static cancelerThread:Lcom/vkontakte/android/background/WorkerThread;

.field private static volatile counterResetTime:J

.field private static reqThread:Lcom/vkontakte/android/background/WorkerThread;

.field private static final requestCounter:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static validation:Ljava/util/concurrent/Semaphore;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 48
    new-instance v0, Lcom/vkontakte/android/background/WorkerThread;

    const-string/jumbo v3, "API Main Thread"

    invoke-direct {v0, v3}, Lcom/vkontakte/android/background/WorkerThread;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/api/APIController;->reqThread:Lcom/vkontakte/android/background/WorkerThread;

    new-instance v0, Lcom/vkontakte/android/background/WorkerThread;

    const-string/jumbo v3, "API Background Thread"

    invoke-direct {v0, v3}, Lcom/vkontakte/android/background/WorkerThread;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/api/APIController;->bgThread:Lcom/vkontakte/android/background/WorkerThread;

    .line 49
    new-instance v0, Lcom/vkontakte/android/background/WorkerThread;

    const-string/jumbo v3, "API Canceler Thread"

    invoke-direct {v0, v3}, Lcom/vkontakte/android/background/WorkerThread;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/api/APIController;->cancelerThread:Lcom/vkontakte/android/background/WorkerThread;

    .line 56
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v3, "__dbg_api"

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    const v3, 0xf2e1

    if-eq v0, v3, :cond_0

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    const v3, 0xb0f705d

    if-ne v0, v3, :cond_1

    :cond_0
    move v0, v2

    :goto_0
    sput-boolean v0, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string/jumbo v4, "apiHost"

    const-string/jumbo v5, "api.vk.com"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v3, "/method/"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/api/APIController;->API_URL:Ljava/lang/String;

    .line 61
    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, v2, v2}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    sput-object v0, Lcom/vkontakte/android/api/APIController;->validation:Ljava/util/concurrent/Semaphore;

    .line 63
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/vkontakte/android/api/APIController;->requestCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 64
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/vkontakte/android/api/APIController;->counterResetTime:J

    .line 66
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->getInstance()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/api/APIController;->benchmarkTracker:Lcom/vkontakte/android/data/BenchmarkTracker;

    .line 69
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/network/Network;->getUserAgent()Lcom/vk/core/network/NetworkUserAgent;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/network/NetworkUserAgent;->userAgent()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/api/APIController;->USER_AGENT:Ljava/lang/String;

    .line 70
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/network/Network;->getUserAgent()Lcom/vk/core/network/NetworkUserAgent;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/network/NetworkUserAgent;->userAgentAd()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/api/APIController;->FUCKING_AD_USER_AGENT:Ljava/lang/String;

    .line 71
    sget-object v0, Lcom/vkontakte/android/api/APIController;->reqThread:Lcom/vkontakte/android/background/WorkerThread;

    invoke-virtual {v0}, Lcom/vkontakte/android/background/WorkerThread;->start()V

    .line 72
    sget-object v0, Lcom/vkontakte/android/api/APIController;->bgThread:Lcom/vkontakte/android/background/WorkerThread;

    invoke-virtual {v0}, Lcom/vkontakte/android/background/WorkerThread;->start()V

    .line 73
    sget-object v0, Lcom/vkontakte/android/api/APIController;->cancelerThread:Lcom/vkontakte/android/background/WorkerThread;

    invoke-virtual {v0}, Lcom/vkontakte/android/background/WorkerThread;->start()V

    .line 74
    return-void

    :cond_1
    move v0, v1

    .line 56
    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static executeRequest(Lcom/vkontakte/android/api/VKAPIRequest;)V
    .locals 4
    .param p0, "req"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 77
    iget-boolean v0, p0, Lcom/vkontakte/android/api/VKAPIRequest;->background:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/vkontakte/android/api/APIController;->bgThread:Lcom/vkontakte/android/background/WorkerThread;

    :goto_0
    new-instance v1, Lcom/vkontakte/android/api/APIController$RequestRunner;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/api/APIController$RequestRunner;-><init>(Lcom/vkontakte/android/api/VKAPIRequest;)V

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/background/WorkerThread;->postRunnable(Ljava/lang/Runnable;J)V

    .line 78
    return-void

    .line 77
    :cond_0
    sget-object v0, Lcom/vkontakte/android/api/APIController;->reqThread:Lcom/vkontakte/android/background/WorkerThread;

    goto :goto_0
.end method

.method private static generateApiError(Lorg/json/JSONObject;)V
    .locals 4
    .param p0, "error"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 442
    const-string/jumbo v1, "error_code"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 443
    .local v0, "code":I
    const-string/jumbo v1, "error_text"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 444
    new-instance v1, Lcom/vkontakte/android/api/APIException;

    const/high16 v2, 0x40000000    # 2.0f

    or-int/2addr v2, v0

    const-string/jumbo v3, "error_text"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/api/APIException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 446
    :cond_0
    new-instance v1, Lcom/vkontakte/android/api/APIException;

    const-string/jumbo v2, "error_msg"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/vkontakte/android/api/APIException;-><init>(ILjava/lang/String;)V

    throw v1
.end method

.method private static getProceedTime(Lokhttp3/Response;)I
    .locals 6
    .param p0, "resp"    # Lokhttp3/Response;

    .prologue
    const/4 v3, 0x0

    .line 450
    invoke-virtual {p0}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v4

    const-string/jumbo v5, "x-request-processing-time"

    invoke-virtual {v4, v5}, Lokhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 451
    .local v1, "stringValue":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 458
    :goto_0
    return v3

    .line 455
    :cond_0
    :try_start_0
    invoke-static {v1}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 456
    .local v2, "value":F
    const/high16 v3, 0x447a0000    # 1000.0f

    mul-float/2addr v3, v2

    float-to-int v3, v3

    goto :goto_0

    .line 457
    .end local v2    # "value":F
    :catch_0
    move-exception v0

    .line 458
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public static removeBgCallbacks(Ljava/lang/Runnable;)V
    .locals 1
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 540
    sget-object v0, Lcom/vkontakte/android/api/APIController;->bgThread:Lcom/vkontakte/android/background/WorkerThread;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/background/WorkerThread;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 541
    return-void
.end method

.method public static runInApi(Ljava/lang/Runnable;)V
    .locals 4
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 544
    sget-object v0, Lcom/vkontakte/android/api/APIController;->reqThread:Lcom/vkontakte/android/background/WorkerThread;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, p0, v2, v3}, Lcom/vkontakte/android/background/WorkerThread;->postRunnable(Ljava/lang/Runnable;J)V

    .line 545
    return-void
.end method

.method public static runInBg(Ljava/lang/Runnable;)V
    .locals 4
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 532
    sget-object v0, Lcom/vkontakte/android/api/APIController;->bgThread:Lcom/vkontakte/android/background/WorkerThread;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, p0, v2, v3}, Lcom/vkontakte/android/background/WorkerThread;->postRunnable(Ljava/lang/Runnable;J)V

    .line 533
    return-void
.end method

.method public static runInBgDelayed(Ljava/lang/Runnable;J)V
    .locals 1
    .param p0, "runnable"    # Ljava/lang/Runnable;
    .param p1, "delay"    # J

    .prologue
    .line 536
    sget-object v0, Lcom/vkontakte/android/api/APIController;->bgThread:Lcom/vkontakte/android/background/WorkerThread;

    invoke-virtual {v0, p0, p1, p2}, Lcom/vkontakte/android/background/WorkerThread;->postRunnable(Ljava/lang/Runnable;J)V

    .line 537
    return-void
.end method

.method public static runRequest(Lcom/vkontakte/android/api/VKAPIRequest;)Lorg/json/JSONObject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<*>;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .prologue
    .line 103
    .local p0, "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<*>;"
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/vkontakte/android/api/APIController;->runRequest(Lcom/vkontakte/android/api/VKAPIRequest;I)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method private static runRequest(Lcom/vkontakte/android/api/VKAPIRequest;I)Lorg/json/JSONObject;
    .locals 49
    .param p1, "recurseCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<*>;I)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .prologue
    .line 107
    .local p0, "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<*>;"
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->ignoreValidation:Z

    if-nez v4, :cond_0

    .line 109
    :try_start_0
    sget-object v4, Lcom/vkontakte/android/api/APIController;->validation:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 110
    sget-object v4, Lcom/vkontakte/android/api/APIController;->validation:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 116
    :cond_0
    :goto_0
    invoke-static {}, Lcom/vkontakte/android/api/APIController;->waitTooManyRequest()V

    .line 118
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v38

    move-wide/from16 v0, v38

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/vkontakte/android/api/VKAPIRequest;->initTime:J

    .line 120
    .local v38, "time":J
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "https://"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/vkontakte/android/api/APIController;->API_URL:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v6, "method"

    invoke-virtual {v4, v6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v47

    .line 123
    .local v47, "url":Ljava/lang/String;
    const/16 v27, 0x0

    .line 124
    .local v27, "obj":Lorg/json/JSONObject;
    const/16 v44, 0x0

    .line 125
    .local v44, "timeTotal":I
    const/4 v7, 0x0

    .line 126
    .local v7, "timeProceed":I
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v11

    .line 127
    .local v11, "account":Lcom/vkontakte/android/auth/VKAccount;
    invoke-virtual {v11}, Lcom/vkontakte/android/auth/VKAccount;->getProfilerConfig()Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    move-result-object v30

    .line 128
    .local v30, "profilerConfig":Lcom/vkontakte/android/auth/configs/ProfilerConfig;
    if-eqz v30, :cond_8

    invoke-virtual/range {v30 .. v30}, Lcom/vkontakte/android/auth/configs/ProfilerConfig;->isApiRequests()Z

    move-result v4

    if-eqz v4, :cond_8

    const/16 v31, 0x1

    .line 130
    .local v31, "profilerEnabled":Z
    :goto_1
    :try_start_1
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->unreliable3rdPartyRequest:Z

    if-nez v4, :cond_1

    .line 131
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v5, "access_token"

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 132
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getAccessToken()Ljava/lang/String;

    move-result-object v10

    .line 133
    .local v10, "accessToken":Ljava/lang/String;
    if-eqz v10, :cond_9

    .line 134
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v5, "access_token"

    invoke-virtual {v4, v5, v10}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .end local v10    # "accessToken":Ljava/lang/String;
    :cond_1
    :goto_2
    new-instance v21, Lokhttp3/FormBody$Builder;

    invoke-direct/range {v21 .. v21}, Lokhttp3/FormBody$Builder;-><init>()V

    .line 141
    .local v21, "formData":Lokhttp3/FormBody$Builder;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v17

    .line 142
    .local v17, "e":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/16 v46, 0x0

    .line 143
    .local v46, "uri":Landroid/net/Uri$Builder;
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_2

    .line 144
    invoke-static/range {v47 .. v47}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v46

    .line 146
    :cond_2
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_3

    .line 147
    const-string/jumbo v5, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "====="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v8, "method"

    invoke-virtual {v4, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    :cond_3
    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_4
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/String;

    .line 150
    .local v25, "key":Ljava/lang/String;
    const-string/jumbo v4, "method"

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 153
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_5

    .line 154
    const-string/jumbo v6, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v8, "="

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    move-object/from16 v0, v25

    invoke-virtual {v4, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    :cond_5
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_6

    .line 157
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    move-object/from16 v0, v25

    invoke-virtual {v4, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    move-object/from16 v0, v46

    move-object/from16 v1, v25

    invoke-virtual {v0, v1, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 159
    :cond_6
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    move-object/from16 v0, v25

    invoke-virtual {v4, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    move-object/from16 v0, v21

    move-object/from16 v1, v25

    invoke-virtual {v0, v1, v4}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/vkontakte/android/api/APIException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_3

    goto :goto_3

    .line 418
    .end local v17    # "e":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v21    # "formData":Lokhttp3/FormBody$Builder;
    .end local v25    # "key":Ljava/lang/String;
    .end local v46    # "uri":Landroid/net/Uri$Builder;
    :catch_0
    move-exception v16

    .line 419
    .local v16, "e":Ljava/io/IOException;
    const-string/jumbo v5, "vk"

    if-eqz v16, :cond_45

    invoke-virtual/range {v16 .. v16}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_4
    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 420
    sget-object v4, Lcom/vkontakte/android/api/APIController;->benchmarkTracker:Lcom/vkontakte/android/data/BenchmarkTracker;

    invoke-virtual {v4}, Lcom/vkontakte/android/data/BenchmarkTracker;->reportApiResponseFailed()V

    .line 421
    if-eqz v31, :cond_7

    .line 422
    sget-object v4, Lcom/vkontakte/android/api/APIController;->benchmarkTracker:Lcom/vkontakte/android/data/BenchmarkTracker;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/api/VKAPIRequest;->getMethod()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/data/BenchmarkTracker;->countFailedApiMeasurement(Ljava/lang/String;)V

    .line 438
    :cond_7
    const/4 v4, 0x0

    .end local v16    # "e":Ljava/io/IOException;
    :goto_5
    return-object v4

    .line 111
    .end local v7    # "timeProceed":I
    .end local v11    # "account":Lcom/vkontakte/android/auth/VKAccount;
    .end local v27    # "obj":Lorg/json/JSONObject;
    .end local v30    # "profilerConfig":Lcom/vkontakte/android/auth/configs/ProfilerConfig;
    .end local v31    # "profilerEnabled":Z
    .end local v38    # "time":J
    .end local v44    # "timeTotal":I
    .end local v47    # "url":Ljava/lang/String;
    :catch_1
    move-exception v48

    .line 112
    .local v48, "x":Ljava/lang/Exception;
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    move-object/from16 v0, v48

    invoke-static {v0, v4}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 128
    .end local v48    # "x":Ljava/lang/Exception;
    .restart local v7    # "timeProceed":I
    .restart local v11    # "account":Lcom/vkontakte/android/auth/VKAccount;
    .restart local v27    # "obj":Lorg/json/JSONObject;
    .restart local v30    # "profilerConfig":Lcom/vkontakte/android/auth/configs/ProfilerConfig;
    .restart local v38    # "time":J
    .restart local v44    # "timeTotal":I
    .restart local v47    # "url":Ljava/lang/String;
    :cond_8
    const/16 v31, 0x0

    goto/16 :goto_1

    .line 136
    .restart local v10    # "accessToken":Ljava/lang/String;
    .restart local v31    # "profilerEnabled":Z
    :cond_9
    :try_start_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v5, "api_id"

    const-string/jumbo v6, "2274003"

    invoke-virtual {v4, v5, v6}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lcom/vkontakte/android/api/APIException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_3

    goto/16 :goto_2

    .line 424
    .end local v10    # "accessToken":Ljava/lang/String;
    :catch_2
    move-exception v16

    .line 425
    .local v16, "e":Lcom/vkontakte/android/api/APIException;
    if-eqz v31, :cond_a

    .line 426
    sget-object v4, Lcom/vkontakte/android/api/APIController;->benchmarkTracker:Lcom/vkontakte/android/data/BenchmarkTracker;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/api/VKAPIRequest;->getMethod()Ljava/lang/String;

    move-result-object v5

    move/from16 v0, v44

    invoke-virtual {v4, v5, v0, v7}, Lcom/vkontakte/android/data/BenchmarkTracker;->addErrorApiMeasurement(Ljava/lang/String;II)V

    :cond_a
    move-object/from16 v4, v27

    .line 428
    goto :goto_5

    .line 161
    .end local v16    # "e":Lcom/vkontakte/android/api/APIException;
    .restart local v17    # "e":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v21    # "formData":Lokhttp3/FormBody$Builder;
    .restart local v46    # "uri":Landroid/net/Uri$Builder;
    :cond_b
    :try_start_3
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_c

    .line 162
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "====="

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    const-string/jumbo v4, "sig"

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/api/VKAPIRequest;->getSig()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v46

    invoke-virtual {v0, v4, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 164
    const-string/jumbo v4, "vk"

    invoke-virtual/range {v46 .. v46}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    :cond_c
    invoke-virtual {v11}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v4

    if-eqz v4, :cond_d

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v5, "sig"

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_d

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->unreliable3rdPartyRequest:Z

    if-nez v4, :cond_d

    .line 168
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/api/VKAPIRequest;->getSig()Ljava/lang/String;

    move-result-object v37

    .line 169
    .local v37, "sig":Ljava/lang/String;
    const-string/jumbo v4, "sig"

    move-object/from16 v0, v21

    move-object/from16 v1, v37

    invoke-virtual {v0, v4, v1}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    .line 171
    .end local v37    # "sig":Ljava/lang/String;
    :cond_d
    new-instance v4, Lokhttp3/Request$Builder;

    invoke-direct {v4}, Lokhttp3/Request$Builder;-><init>()V

    .line 172
    move-object/from16 v0, v47

    invoke-virtual {v4, v0}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v4

    const-string/jumbo v5, "User-Agent"

    sget-object v6, Lcom/vkontakte/android/api/APIController;->USER_AGENT:Ljava/lang/String;

    .line 173
    invoke-virtual {v4, v5, v6}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v4

    .line 174
    invoke-virtual/range {v21 .. v21}, Lokhttp3/FormBody$Builder;->build()Lokhttp3/FormBody;

    move-result-object v5

    invoke-virtual {v4, v5}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v32

    .line 175
    .local v32, "reqBuilder":Lokhttp3/Request$Builder;
    if-eqz v31, :cond_e

    .line 176
    const-string/jumbo v4, "X-Get-Processing-Time"

    const-string/jumbo v5, "1"

    move-object/from16 v0, v32

    invoke-virtual {v0, v4, v5}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 178
    :cond_e
    invoke-virtual/range {v32 .. v32}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v33

    .line 180
    .local v33, "request":Lokhttp3/Request;
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_f

    .line 181
    const-string/jumbo v5, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "["

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v8, "method"

    invoke-virtual {v4, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v6, "] Prepare: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long v8, v8, v38

    invoke-virtual {v4, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v38

    .line 185
    :cond_f
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v42

    .line 186
    .local v42, "timeBeforeCall":J
    invoke-static {}, Lcom/vk/core/network/Network;->getDefaultClient()Lokhttp3/OkHttpClient;

    move-result-object v4

    move-object/from16 v0, v33

    invoke-virtual {v4, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v12

    .line 187
    .local v12, "call":Lokhttp3/Call;
    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/vkontakte/android/api/VKAPIRequest;->httpCall:Lokhttp3/Call;

    .line 188
    invoke-interface {v12}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v34

    .line 189
    .local v34, "resp":Lokhttp3/Response;
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/api/VKAPIRequest;->isCanceled()Z

    move-result v4

    if-eqz v4, :cond_10

    .line 190
    const/4 v4, 0x0

    goto/16 :goto_5

    .line 193
    :cond_10
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_11

    .line 194
    const-string/jumbo v5, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "["

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v8, "method"

    invoke-virtual {v4, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v6, "] Execute: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long v8, v8, v38

    invoke-virtual {v4, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v38

    .line 197
    :cond_11
    invoke-virtual/range {v34 .. v34}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v35

    .line 199
    .local v35, "s":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v40

    .line 201
    .local v40, "timeAfterCall":J
    sub-long v4, v40, v42

    const-wide/16 v8, 0x0

    cmp-long v4, v4, v8

    if-lez v4, :cond_12

    sub-long v4, v40, v42

    const-wide/32 v8, 0x7fffffff

    cmp-long v4, v4, v8

    if-gez v4, :cond_12

    .line 202
    sub-long v4, v40, v42

    long-to-int v0, v4

    move/from16 v44, v0

    .line 203
    sget-object v4, Lcom/vkontakte/android/api/APIController;->benchmarkTracker:Lcom/vkontakte/android/data/BenchmarkTracker;

    move/from16 v0, v44

    invoke-virtual {v4, v0}, Lcom/vkontakte/android/data/BenchmarkTracker;->reportApiResponseSucceeded(I)V

    .line 204
    if-eqz v31, :cond_12

    .line 205
    invoke-static/range {v34 .. v34}, Lcom/vkontakte/android/api/APIController;->getProceedTime(Lokhttp3/Response;)I

    move-result v7

    .line 206
    sget-object v4, Lcom/vkontakte/android/api/APIController;->benchmarkTracker:Lcom/vkontakte/android/data/BenchmarkTracker;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/api/VKAPIRequest;->getMethod()Ljava/lang/String;

    move-result-object v5

    sub-int v6, v44, v7

    .line 207
    invoke-virtual/range {v33 .. v33}, Lokhttp3/Request;->body()Lokhttp3/RequestBody;

    move-result-object v8

    invoke-virtual {v8}, Lokhttp3/RequestBody;->contentLength()J

    move-result-wide v8

    .line 206
    invoke-virtual/range {v4 .. v9}, Lcom/vkontakte/android/data/BenchmarkTracker;->addSuccessApiMeasurement(Ljava/lang/String;IIJ)V

    .line 210
    :cond_12
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_13

    .line 211
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v14, v4, v38

    .line 212
    .local v14, "delta":J
    const-string/jumbo v5, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "["

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v8, "method"

    invoke-virtual {v4, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v6, "] Receive: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v38

    .line 216
    .end local v14    # "delta":J
    :cond_13
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_14

    .line 217
    const-string/jumbo v4, "vk"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Resp status="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v34 .. v34}, Lokhttp3/Response;->message()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    const-string/jumbo v4, "vk"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Response="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v35

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    :cond_14
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->httpCall:Lokhttp3/Call;

    .line 222
    new-instance v4, Lorg/json/JSONTokener;

    move-object/from16 v0, v35

    invoke-direct {v4, v0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lorg/json/JSONObject;

    move-object/from16 v27, v0

    .line 223
    const-string/jumbo v4, "error"

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v19

    .line 224
    .local v19, "error":Lorg/json/JSONObject;
    const-string/jumbo v4, "execute_errors"

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_16

    .line 225
    const-string/jumbo v4, "execute_errors"

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v20

    .line 226
    .local v20, "errs":Lorg/json/JSONArray;
    const/16 v22, 0x0

    .local v22, "i":I
    :goto_6
    invoke-virtual/range {v20 .. v20}, Lorg/json/JSONArray;->length()I

    move-result v4

    move/from16 v0, v22

    if-ge v0, v4, :cond_16

    .line 227
    move-object/from16 v0, v20

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v18

    .line 228
    .local v18, "err":Lorg/json/JSONObject;
    const-string/jumbo v4, "error_code"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v13

    .line 229
    .local v13, "code":I
    const/16 v4, 0xe

    if-eq v13, v4, :cond_15

    const/16 v4, 0x11

    if-eq v13, v4, :cond_15

    const/16 v4, 0x68

    if-eq v13, v4, :cond_15

    const/16 v4, 0x19

    if-ne v13, v4, :cond_17

    .line 233
    :cond_15
    move-object/from16 v19, v18

    .line 238
    .end local v13    # "code":I
    .end local v18    # "err":Lorg/json/JSONObject;
    .end local v20    # "errs":Lorg/json/JSONArray;
    .end local v22    # "i":I
    :cond_16
    if-eqz v19, :cond_3e

    .line 239
    const-string/jumbo v4, "error_code"

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v13

    .line 243
    .restart local v13    # "code":I
    const/4 v4, 0x5

    if-ne v13, v4, :cond_1b

    .line 246
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->handleAuthErrorsManually:Z

    if-eqz v4, :cond_18

    .line 247
    new-instance v4, Lcom/vkontakte/android/api/APIException;

    const/4 v5, 0x5

    const-string/jumbo v6, "auth error"

    invoke-direct {v4, v5, v6}, Lcom/vkontakte/android/api/APIException;-><init>(ILjava/lang/String;)V

    throw v4
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lcom/vkontakte/android/api/APIException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3

    .line 429
    .end local v12    # "call":Lokhttp3/Call;
    .end local v13    # "code":I
    .end local v17    # "e":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v19    # "error":Lorg/json/JSONObject;
    .end local v21    # "formData":Lokhttp3/FormBody$Builder;
    .end local v32    # "reqBuilder":Lokhttp3/Request$Builder;
    .end local v33    # "request":Lokhttp3/Request;
    .end local v34    # "resp":Lokhttp3/Response;
    .end local v35    # "s":Ljava/lang/String;
    .end local v40    # "timeAfterCall":J
    .end local v42    # "timeBeforeCall":J
    .end local v46    # "uri":Landroid/net/Uri$Builder;
    :catch_3
    move-exception v16

    .line 430
    .local v16, "e":Ljava/lang/Throwable;
    move-object/from16 v0, v16

    instance-of v4, v0, Ljava/lang/OutOfMemoryError;

    if-eqz v4, :cond_46

    .line 431
    invoke-static {}, Lcom/vk/imageloader/VKImageLoader;->clearMemoryCache()V

    .line 432
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/api/APIController;->runRequest(Lcom/vkontakte/android/api/VKAPIRequest;)Lorg/json/JSONObject;

    move-result-object v4

    goto/16 :goto_5

    .line 226
    .end local v16    # "e":Ljava/lang/Throwable;
    .restart local v12    # "call":Lokhttp3/Call;
    .restart local v13    # "code":I
    .restart local v17    # "e":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v18    # "err":Lorg/json/JSONObject;
    .restart local v19    # "error":Lorg/json/JSONObject;
    .restart local v20    # "errs":Lorg/json/JSONArray;
    .restart local v21    # "formData":Lokhttp3/FormBody$Builder;
    .restart local v22    # "i":I
    .restart local v32    # "reqBuilder":Lokhttp3/Request$Builder;
    .restart local v33    # "request":Lokhttp3/Request;
    .restart local v34    # "resp":Lokhttp3/Response;
    .restart local v35    # "s":Ljava/lang/String;
    .restart local v40    # "timeAfterCall":J
    .restart local v42    # "timeBeforeCall":J
    .restart local v46    # "uri":Landroid/net/Uri$Builder;
    :cond_17
    add-int/lit8 v22, v22, 0x1

    goto :goto_6

    .line 250
    .end local v18    # "err":Lorg/json/JSONObject;
    .end local v20    # "errs":Lorg/json/JSONArray;
    .end local v22    # "i":I
    :cond_18
    :try_start_4
    const-string/jumbo v4, "account.unregisterDevice"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v6, "method"

    invoke-virtual {v5, v6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_19

    .line 251
    new-instance v4, Lcom/vkontakte/android/api/APIException;

    const/4 v5, 0x0

    const-string/jumbo v6, "already unregistered"

    invoke-direct {v4, v5, v6}, Lcom/vkontakte/android/api/APIException;-><init>(ILjava/lang/String;)V

    throw v4

    .line 253
    :cond_19
    const-string/jumbo v4, "account.unregisterDevice"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v6, "method"

    invoke-virtual {v5, v6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1a

    .line 254
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->onReauthError()V

    .line 256
    :cond_1a
    new-instance v4, Lcom/vkontakte/android/api/APIException;

    const/4 v5, 0x0

    const-string/jumbo v6, "reauth error"

    invoke-direct {v4, v5, v6}, Lcom/vkontakte/android/api/APIException;-><init>(ILjava/lang/String;)V

    throw v4

    .line 257
    :cond_1b
    const/4 v4, 0x7

    if-ne v13, v4, :cond_1c

    move-object/from16 v4, v27

    .line 258
    goto/16 :goto_5

    .line 259
    :cond_1c
    const/16 v4, 0xe

    if-ne v13, v4, :cond_24

    .line 260
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->ignoreValidation:Z

    if-eqz v4, :cond_1d

    new-instance v4, Lcom/vkontakte/android/api/APIException;

    const/4 v5, 0x1

    const-string/jumbo v6, "Current request is not support validation"

    invoke-direct {v4, v5, v6}, Lcom/vkontakte/android/api/APIException;-><init>(ILjava/lang/String;)V

    throw v4

    .line 261
    :cond_1d
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_1e

    .line 262
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "API captcha"

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    :cond_1e
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->isInBackground()Z
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lcom/vkontakte/android/api/APIException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_3

    move-result v4

    if-nez v4, :cond_23

    .line 266
    :try_start_5
    sget-object v4, Lcom/vkontakte/android/api/APIController;->validation:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_8
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Lcom/vkontakte/android/api/APIException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_3

    .line 269
    :goto_7
    :try_start_6
    new-instance v23, Landroid/content/Intent;

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-class v5, Lcom/vkontakte/android/CaptchaActivity;

    move-object/from16 v0, v23

    invoke-direct {v0, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 270
    .local v23, "intent":Landroid/content/Intent;
    const/high16 v4, 0x10000000

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 271
    const-string/jumbo v4, "url"

    const-string/jumbo v5, "captcha_img"

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v23

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 272
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    move-object/from16 v0, v23

    invoke-virtual {v4, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 273
    :goto_8
    sget-boolean v4, Lcom/vkontakte/android/CaptchaActivity;->isReady:Z

    if-nez v4, :cond_1f

    .line 274
    const-wide/16 v4, 0x64

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_8

    .line 276
    :cond_1f
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_20

    .line 277
    const-string/jumbo v4, "vk"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Captcha activity returned with "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-boolean v6, Lcom/vkontakte/android/CaptchaActivity;->isReady:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Lcom/vkontakte/android/CaptchaActivity;->lastKey:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    :cond_20
    const/4 v4, 0x0

    sput-boolean v4, Lcom/vkontakte/android/CaptchaActivity;->isReady:Z

    .line 280
    sget-object v4, Lcom/vkontakte/android/CaptchaActivity;->lastKey:Ljava/lang/String;

    if-eqz v4, :cond_22

    .line 281
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v5, "captcha_sid"

    const-string/jumbo v6, "captcha_sid"

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v5, "captcha_key"

    sget-object v6, Lcom/vkontakte/android/CaptchaActivity;->lastKey:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_21

    .line 284
    const-string/jumbo v5, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Resending request "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v8, "method"

    invoke-virtual {v4, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    :cond_21
    sget-object v4, Lcom/vkontakte/android/api/APIController;->validation:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->release()V

    .line 287
    add-int/lit8 v4, p1, 0x1

    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/vkontakte/android/api/APIController;->runRequest(Lcom/vkontakte/android/api/VKAPIRequest;I)Lorg/json/JSONObject;

    move-result-object v4

    goto/16 :goto_5

    .line 289
    :cond_22
    sget-object v4, Lcom/vkontakte/android/api/APIController;->validation:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->release()V

    .line 294
    .end local v23    # "intent":Landroid/content/Intent;
    :goto_9
    new-instance v4, Lcom/vkontakte/android/api/APIException;

    const-string/jumbo v5, "error_msg"

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v13, v5}, Lcom/vkontakte/android/api/APIException;-><init>(ILjava/lang/String;)V

    throw v4

    .line 291
    :cond_23
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Skipping captcha because app is in background"

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9

    .line 295
    :cond_24
    const/16 v4, 0x10

    if-ne v13, v4, :cond_26

    .line 296
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_25

    .line 297
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Force HTTPS"

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    :cond_25
    add-int/lit8 v4, p1, 0x1

    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/vkontakte/android/api/APIController;->runRequest(Lcom/vkontakte/android/api/VKAPIRequest;I)Lorg/json/JSONObject;

    move-result-object v4

    goto/16 :goto_5

    .line 300
    :cond_26
    const/16 v4, 0x11

    if-ne v13, v4, :cond_2d

    .line 301
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->ignoreValidation:Z

    if-eqz v4, :cond_27

    new-instance v4, Lcom/vkontakte/android/api/APIException;

    const/4 v5, 0x1

    const-string/jumbo v6, "Current request is not support validation"

    invoke-direct {v4, v5, v6}, Lcom/vkontakte/android/api/APIException;-><init>(ILjava/lang/String;)V

    throw v4

    .line 302
    :cond_27
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_28

    .line 303
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Need validation"

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    :cond_28
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->isInBackground()Z
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Lcom/vkontakte/android/api/APIException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_3

    move-result v4

    if-nez v4, :cond_2c

    .line 307
    :try_start_7
    sget-object v4, Lcom/vkontakte/android/api/APIController;->validation:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Lcom/vkontakte/android/api/APIException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_3

    .line 310
    :goto_a
    :try_start_8
    new-instance v23, Landroid/content/Intent;

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-class v5, Lcom/vkontakte/android/ValidationActivity;

    move-object/from16 v0, v23

    invoke-direct {v0, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 311
    .restart local v23    # "intent":Landroid/content/Intent;
    const/high16 v4, 0x10000000

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 312
    const-string/jumbo v4, "url"

    const-string/jumbo v5, "redirect_uri"

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v23

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 313
    const/4 v4, 0x0

    sput v4, Lcom/vkontakte/android/ValidationActivity;->result:I

    .line 314
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    move-object/from16 v0, v23

    invoke-virtual {v4, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 315
    :goto_b
    sget v4, Lcom/vkontakte/android/ValidationActivity;->result:I

    if-nez v4, :cond_29

    .line 316
    const-wide/16 v4, 0x64

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_b

    .line 318
    :cond_29
    sget v4, Lcom/vkontakte/android/ValidationActivity;->result:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_2b

    .line 319
    const/4 v4, 0x0

    sput v4, Lcom/vkontakte/android/ValidationActivity;->result:I

    .line 320
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_2a

    .line 321
    const-string/jumbo v5, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Repeating request "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v8, "method"

    invoke-virtual {v4, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    :cond_2a
    sget-object v4, Lcom/vkontakte/android/api/APIController;->validation:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->release()V

    .line 324
    add-int/lit8 v4, p1, 0x1

    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/vkontakte/android/api/APIController;->runRequest(Lcom/vkontakte/android/api/VKAPIRequest;I)Lorg/json/JSONObject;

    move-result-object v4

    goto/16 :goto_5

    .line 326
    :cond_2b
    const/4 v4, 0x0

    sput v4, Lcom/vkontakte/android/ValidationActivity;->result:I

    .line 327
    sget-object v4, Lcom/vkontakte/android/api/APIController;->validation:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->release()V

    .line 332
    .end local v23    # "intent":Landroid/content/Intent;
    :goto_c
    new-instance v4, Lcom/vkontakte/android/api/APIException;

    const-string/jumbo v5, "error_msg"

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v13, v5}, Lcom/vkontakte/android/api/APIException;-><init>(ILjava/lang/String;)V

    throw v4

    .line 329
    :cond_2c
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Skipping validation because app is in background"

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_c

    .line 333
    :cond_2d
    const/16 v4, 0x18

    if-ne v13, v4, :cond_35

    .line 334
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->ignoreValidation:Z

    if-nez v4, :cond_2e

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->unreliable3rdPartyRequest:Z

    if-eqz v4, :cond_2f

    :cond_2e
    new-instance v4, Lcom/vkontakte/android/api/APIException;

    const/4 v5, 0x1

    const-string/jumbo v6, "Current request is not support validation"

    invoke-direct {v4, v5, v6}, Lcom/vkontakte/android/api/APIException;-><init>(ILjava/lang/String;)V

    throw v4

    .line 335
    :cond_2f
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_30

    .line 336
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Need confirmation"

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 338
    :cond_30
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->isInBackground()Z
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0
    .catch Lcom/vkontakte/android/api/APIException; {:try_start_8 .. :try_end_8} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_3

    move-result v4

    if-nez v4, :cond_34

    .line 340
    :try_start_9
    sget-object v4, Lcom/vkontakte/android/api/APIController;->validation:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_0
    .catch Lcom/vkontakte/android/api/APIException; {:try_start_9 .. :try_end_9} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_3

    .line 343
    :goto_d
    :try_start_a
    new-instance v23, Landroid/content/Intent;

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-class v5, Lcom/vkontakte/android/ConfirmationActivity;

    move-object/from16 v0, v23

    invoke-direct {v0, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 344
    .restart local v23    # "intent":Landroid/content/Intent;
    const/high16 v4, 0x10000000

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 345
    const-string/jumbo v4, "confirm_text"

    const-string/jumbo v5, "confirmation_text"

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v23

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 346
    const/4 v4, 0x0

    sput-boolean v4, Lcom/vkontakte/android/ConfirmationActivity;->ready:Z

    .line 347
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    move-object/from16 v0, v23

    invoke-virtual {v4, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 348
    :goto_e
    sget-boolean v4, Lcom/vkontakte/android/ConfirmationActivity;->ready:Z

    if-nez v4, :cond_31

    .line 349
    const-wide/16 v4, 0x64

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_e

    .line 351
    :cond_31
    sget-boolean v4, Lcom/vkontakte/android/ConfirmationActivity;->result:Z

    if-eqz v4, :cond_33

    .line 352
    const-string/jumbo v4, "confirm"

    const/4 v5, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 353
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_32

    .line 354
    const-string/jumbo v5, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Repeating request "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v8, "method"

    invoke-virtual {v4, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 356
    :cond_32
    sget-object v4, Lcom/vkontakte/android/api/APIController;->validation:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->release()V

    .line 357
    add-int/lit8 v4, p1, 0x1

    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/vkontakte/android/api/APIController;->runRequest(Lcom/vkontakte/android/api/VKAPIRequest;I)Lorg/json/JSONObject;

    move-result-object v4

    goto/16 :goto_5

    .line 359
    :cond_33
    sget-object v4, Lcom/vkontakte/android/api/APIController;->validation:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->release()V

    .line 364
    .end local v23    # "intent":Landroid/content/Intent;
    :goto_f
    new-instance v4, Lcom/vkontakte/android/api/APIException;

    const-string/jumbo v5, "error_msg"

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v13, v5}, Lcom/vkontakte/android/api/APIException;-><init>(ILjava/lang/String;)V

    throw v4

    .line 361
    :cond_34
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Skipping confirmation because app is in background"

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_f

    .line 365
    :cond_35
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->unreliable3rdPartyRequest:Z

    if-nez v4, :cond_43

    const/16 v4, 0x19

    if-ne v13, v4, :cond_43

    .line 366
    const-string/jumbo v4, "auth.refreshToken"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v6, "method"

    invoke-virtual {v5, v6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_36

    if-eqz p1, :cond_37

    :cond_36
    move-object/from16 v4, v27

    .line 367
    goto/16 :goto_5

    .line 369
    :cond_37
    new-instance v45, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v4, "auth.refreshToken"

    move-object/from16 v0, v45

    invoke-direct {v0, v4}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0
    .catch Lcom/vkontakte/android/api/APIException; {:try_start_a .. :try_end_a} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_3

    .line 371
    .local v45, "tokenConfirmationRequest":Lcom/vkontakte/android/api/VKAPIRequest;
    :try_start_b
    const-string/jumbo v4, "receipt"

    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/vkontakte/android/C2DM;->getToken(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v45

    invoke-virtual {v0, v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_4
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_0
    .catch Lcom/vkontakte/android/api/APIException; {:try_start_b .. :try_end_b} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_3

    .line 376
    :goto_10
    :try_start_c
    invoke-static/range {v45 .. v45}, Lcom/vkontakte/android/api/APIController;->runRequest(Lcom/vkontakte/android/api/VKAPIRequest;)Lorg/json/JSONObject;

    move-result-object v28

    .line 377
    .local v28, "object":Lorg/json/JSONObject;
    if-nez v28, :cond_3a

    const/16 v28, 0x0

    .line 378
    :goto_11
    if-nez v28, :cond_3b

    const/4 v10, 0x0

    .line 379
    .restart local v10    # "accessToken":Ljava/lang/String;
    :goto_12
    if-nez v28, :cond_3c

    const/16 v36, 0x0

    .line 380
    .local v36, "secret":Ljava/lang/String;
    :goto_13
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3d

    .line 381
    move-object/from16 v0, v36

    invoke-static {v10, v0}, Lcom/vkontakte/android/auth/VKAccountManager;->updateCurrentAccessData(Ljava/lang/String;Ljava/lang/String;)Z

    .line 382
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v5, "access_token"

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_38

    .line 383
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v5, "access_token"

    invoke-virtual {v4, v5, v10}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 385
    :cond_38
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v5, "sig"

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_39

    .line 386
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v5, "sig"

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/api/VKAPIRequest;->getSig()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 388
    :cond_39
    add-int/lit8 v4, p1, 0x1

    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/vkontakte/android/api/APIController;->runRequest(Lcom/vkontakte/android/api/VKAPIRequest;I)Lorg/json/JSONObject;

    move-result-object v4

    goto/16 :goto_5

    .line 372
    .end local v10    # "accessToken":Ljava/lang/String;
    .end local v28    # "object":Lorg/json/JSONObject;
    .end local v36    # "secret":Ljava/lang/String;
    :catch_4
    move-exception v24

    .line 373
    .local v24, "ioe":Ljava/lang/Exception;
    const-string/jumbo v4, "receipt"

    const-string/jumbo v5, ""

    move-object/from16 v0, v45

    invoke-virtual {v0, v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_10

    .line 377
    .end local v24    # "ioe":Ljava/lang/Exception;
    .restart local v28    # "object":Lorg/json/JSONObject;
    :cond_3a
    const-string/jumbo v4, "response"

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v28

    goto :goto_11

    .line 378
    :cond_3b
    const-string/jumbo v4, "token"

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    goto :goto_12

    .line 379
    .restart local v10    # "accessToken":Ljava/lang/String;
    :cond_3c
    const-string/jumbo v4, "secret"

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v36

    goto :goto_13

    .line 390
    .restart local v36    # "secret":Ljava/lang/String;
    :cond_3d
    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/api/APIController;->generateApiError(Lorg/json/JSONObject;)V

    .line 396
    .end local v10    # "accessToken":Ljava/lang/String;
    .end local v13    # "code":I
    .end local v28    # "object":Lorg/json/JSONObject;
    .end local v36    # "secret":Ljava/lang/String;
    .end local v45    # "tokenConfirmationRequest":Lcom/vkontakte/android/api/VKAPIRequest;
    :cond_3e
    :goto_14
    sget-boolean v4, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v4, :cond_3f

    .line 397
    const-string/jumbo v5, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "["

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v8, "method"

    invoke-virtual {v4, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v6, "] Parse JSON: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long v8, v8, v38

    invoke-virtual {v4, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 398
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v38

    .line 402
    :cond_3f
    if-nez v27, :cond_42

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->persistent:Z
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_0
    .catch Lcom/vkontakte/android/api/APIException; {:try_start_c .. :try_end_c} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_3

    if-eqz v4, :cond_42

    .line 404
    :try_start_d
    new-instance v29, Lorg/json/JSONObject;

    invoke-direct/range {v29 .. v29}, Lorg/json/JSONObject;-><init>()V

    .line 405
    .local v29, "params":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v26

    .line 406
    .local v26, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface/range {v26 .. v26}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_40
    :goto_15
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_44

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/String;

    .line 407
    .restart local v25    # "key":Ljava/lang/String;
    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string/jumbo v8, "method"

    aput-object v8, v5, v6

    const/4 v6, 0x1

    const-string/jumbo v8, "v"

    aput-object v8, v5, v6

    const/4 v6, 0x2

    const-string/jumbo v8, "access_token"

    aput-object v8, v5, v6

    const/4 v6, 0x3

    const-string/jumbo v8, "sig"

    aput-object v8, v5, v6

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    move-object/from16 v0, v25

    invoke-interface {v5, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_41

    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/vkontakte/android/api/VKAPIRequest;->persistentWithToken:Z

    if-eqz v5, :cond_40

    .line 410
    :cond_41
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    move-object/from16 v0, v25

    invoke-virtual {v5, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v0, v29

    move-object/from16 v1, v25

    invoke-virtual {v0, v1, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_5
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_0
    .catch Lcom/vkontakte/android/api/APIException; {:try_start_d .. :try_end_d} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_3

    goto :goto_15

    .line 413
    .end local v25    # "key":Ljava/lang/String;
    .end local v26    # "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v29    # "params":Lorg/json/JSONObject;
    :catch_5
    move-exception v4

    :cond_42
    :goto_16
    move-object/from16 v4, v27

    .line 417
    goto/16 :goto_5

    .line 393
    .restart local v13    # "code":I
    :cond_43
    :try_start_e
    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/api/APIController;->generateApiError(Lorg/json/JSONObject;)V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_0
    .catch Lcom/vkontakte/android/api/APIException; {:try_start_e .. :try_end_e} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_e} :catch_3

    goto/16 :goto_14

    .line 412
    .end local v13    # "code":I
    .restart local v26    # "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v29    # "params":Lorg/json/JSONObject;
    :cond_44
    :try_start_f
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v5, "method"

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/api/VKAPIRequest;->persistentMethod:Ljava/lang/reflect/Method;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/api/VKAPIRequest;->persistentUserData:Lorg/json/JSONObject;

    move-object/from16 v0, v29

    invoke-static {v4, v0, v5, v6}, Lcom/vkontakte/android/cache/Cache;->putApiRequest(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/reflect/Method;Lorg/json/JSONObject;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_5
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_0
    .catch Lcom/vkontakte/android/api/APIException; {:try_start_f .. :try_end_f} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_f} :catch_3

    goto :goto_16

    .line 419
    .end local v12    # "call":Lokhttp3/Call;
    .end local v17    # "e":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v19    # "error":Lorg/json/JSONObject;
    .end local v21    # "formData":Lokhttp3/FormBody$Builder;
    .end local v26    # "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v29    # "params":Lorg/json/JSONObject;
    .end local v32    # "reqBuilder":Lokhttp3/Request$Builder;
    .end local v33    # "request":Lokhttp3/Request;
    .end local v34    # "resp":Lokhttp3/Response;
    .end local v35    # "s":Ljava/lang/String;
    .end local v40    # "timeAfterCall":J
    .end local v42    # "timeBeforeCall":J
    .end local v46    # "uri":Landroid/net/Uri$Builder;
    .local v16, "e":Ljava/io/IOException;
    :cond_45
    const/4 v4, 0x0

    goto/16 :goto_4

    .line 435
    .local v16, "e":Ljava/lang/Throwable;
    :cond_46
    const-string/jumbo v5, "vk"

    if-eqz v16, :cond_47

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_17
    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 436
    const/4 v4, 0x0

    goto/16 :goto_5

    .line 435
    :cond_47
    const/4 v4, 0x0

    goto :goto_17

    .line 341
    .end local v16    # "e":Ljava/lang/Throwable;
    .restart local v12    # "call":Lokhttp3/Call;
    .restart local v13    # "code":I
    .restart local v17    # "e":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v19    # "error":Lorg/json/JSONObject;
    .restart local v21    # "formData":Lokhttp3/FormBody$Builder;
    .restart local v32    # "reqBuilder":Lokhttp3/Request$Builder;
    .restart local v33    # "request":Lokhttp3/Request;
    .restart local v34    # "resp":Lokhttp3/Response;
    .restart local v35    # "s":Ljava/lang/String;
    .restart local v40    # "timeAfterCall":J
    .restart local v42    # "timeBeforeCall":J
    .restart local v46    # "uri":Landroid/net/Uri$Builder;
    :catch_6
    move-exception v4

    goto/16 :goto_d

    .line 308
    :catch_7
    move-exception v4

    goto/16 :goto_a

    .line 267
    :catch_8
    move-exception v4

    goto/16 :goto_7
.end method

.method public static waitTooManyRequest()V
    .locals 10

    .prologue
    const-wide/16 v8, 0x7d0

    .line 82
    sget-object v3, Lcom/vkontakte/android/api/APIController;->requestCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    monitor-enter v3

    .line 83
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sget-wide v6, Lcom/vkontakte/android/api/APIController;->counterResetTime:J

    sub-long/2addr v4, v6

    cmp-long v2, v4, v8

    if-lez v2, :cond_0

    .line 84
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sput-wide v4, Lcom/vkontakte/android/api/APIController;->counterResetTime:J

    .line 85
    sget-object v2, Lcom/vkontakte/android/api/APIController;->requestCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 87
    :cond_0
    sget-object v2, Lcom/vkontakte/android/api/APIController;->requestCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    int-to-long v4, v2

    const-wide/16 v6, 0xa

    cmp-long v2, v4, v6

    if-lez v2, :cond_1

    .line 89
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sget-wide v6, Lcom/vkontakte/android/api/APIController;->counterResetTime:J

    sub-long/2addr v4, v6

    sub-long v0, v8, v4

    .line 90
    .local v0, "sleepTime":J
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "sleep:"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v2, v4

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 91
    const-wide/16 v4, 0x0

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    .line 92
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sput-wide v4, Lcom/vkontakte/android/api/APIController;->counterResetTime:J

    .line 93
    sget-object v2, Lcom/vkontakte/android/api/APIController;->requestCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 98
    :cond_1
    :goto_0
    :try_start_2
    sget-object v2, Lcom/vkontakte/android/api/APIController;->requestCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 99
    monitor-exit v3

    .line 100
    return-void

    .line 99
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 94
    :catch_0
    move-exception v2

    goto :goto_0
.end method
