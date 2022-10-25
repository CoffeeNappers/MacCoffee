.class Lcom/vkontakte/android/data/BenchmarkTracker$VigoInitRunnable;
.super Ljava/lang/Object;
.source "BenchmarkTracker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/data/BenchmarkTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "VigoInitRunnable"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 297
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/data/BenchmarkTracker$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/data/BenchmarkTracker$1;

    .prologue
    .line 297
    invoke-direct {p0}, Lcom/vkontakte/android/data/BenchmarkTracker$VigoInitRunnable;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    const/4 v14, 0x2

    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 300
    new-array v7, v14, [Ljava/lang/Object;

    const-string/jumbo v8, "Benchmark"

    aput-object v8, v7, v12

    const-string/jumbo v8, "Vigo init"

    aput-object v8, v7, v13

    invoke-static {v7}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 301
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$600()Lcom/vkontakte/android/media/Vigo;

    move-result-object v7

    const-string/jumbo v8, "http://api.vigo.ru/uxzoom/2/network_status"

    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    invoke-virtual {v8}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/media/Vigo;->fillApiUrlParams(Landroid/net/Uri$Builder;)Landroid/net/Uri$Builder;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v6

    .line 302
    .local v6, "uri":Landroid/net/Uri;
    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/vkontakte/android/data/Analytics;->sendRequest(Ljava/lang/String;)[B

    move-result-object v2

    .line 303
    .local v2, "result":[B
    if-nez v2, :cond_0

    .line 304
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$600()Lcom/vkontakte/android/media/Vigo;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vkontakte/android/media/Vigo;->collectApiChangesON()V

    .line 305
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$700()Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;

    move-result-object v7

    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$700()Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;

    move-result-object v8

    iget-wide v8, v8, Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;->timeout:J

    invoke-static {v7, v8, v9}, Lcom/vkontakte/android/api/APIController;->runInBgDelayed(Ljava/lang/Runnable;J)V

    .line 322
    :goto_0
    return-void

    .line 308
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v2}, Ljava/lang/String;-><init>([B)V

    invoke-direct {v1, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 309
    .local v1, "response":Lorg/json/JSONObject;
    const-string/jumbo v7, "supported"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    .line 310
    .local v3, "supported":Z
    const-string/jumbo v7, "timeout"

    const/16 v8, 0x3c

    invoke-virtual {v1, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    int-to-long v8, v7

    const-wide/16 v10, 0x3e8

    mul-long v4, v8, v10

    .line 311
    .local v4, "timeout":J
    if-eqz v3, :cond_1

    .line 312
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$600()Lcom/vkontakte/android/media/Vigo;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vkontakte/android/media/Vigo;->collectApiChangesON()V

    .line 313
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$700()Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;

    move-result-object v7

    invoke-virtual {v7, v4, v5}, Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;->setTimeout(J)V

    .line 314
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$700()Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;

    move-result-object v7

    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$700()Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;

    move-result-object v8

    iget-wide v8, v8, Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;->timeout:J

    invoke-static {v7, v8, v9}, Lcom/vkontakte/android/api/APIController;->runInBgDelayed(Ljava/lang/Runnable;J)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 318
    .end local v1    # "response":Lorg/json/JSONObject;
    .end local v3    # "supported":Z
    .end local v4    # "timeout":J
    :catch_0
    move-exception v0

    .line 319
    .local v0, "e":Lorg/json/JSONException;
    new-array v7, v14, [Ljava/lang/Object;

    const-string/jumbo v8, "Vigo"

    aput-object v8, v7, v12

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Parsing error "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v13

    invoke-static {v7}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto :goto_0

    .line 316
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v1    # "response":Lorg/json/JSONObject;
    .restart local v3    # "supported":Z
    .restart local v4    # "timeout":J
    :cond_1
    :try_start_1
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$600()Lcom/vkontakte/android/media/Vigo;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vkontakte/android/media/Vigo;->collectApiChangesOFF()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
