.class Lcom/vkontakte/android/data/Analytics$StatsBackgroundRunner;
.super Lcom/vkontakte/android/background/CancellableRunnable;
.source "Analytics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/data/Analytics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StatsBackgroundRunner"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 347
    invoke-direct {p0}, Lcom/vkontakte/android/background/CancellableRunnable;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/data/Analytics$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/data/Analytics$1;

    .prologue
    .line 347
    invoke-direct {p0}, Lcom/vkontakte/android/data/Analytics$StatsBackgroundRunner;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 351
    :try_start_0
    sget-object v6, Lcom/vkontakte/android/data/Analytics;->viewPostTime:Lcom/vkontakte/android/data/Analytics$ViewPostTime;

    invoke-virtual {v6}, Lcom/vkontakte/android/data/Analytics$ViewPostTime;->commit()V

    .line 352
    new-instance v1, Ljava/io/File;

    sget-object v6, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v6

    const-string/jumbo v7, "analytics.log"

    invoke-direct {v1, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 353
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_0

    .line 354
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 356
    :cond_0
    new-instance v4, Ljava/io/FileOutputStream;

    const/4 v6, 0x1

    invoke-direct {v4, v1, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 357
    .local v4, "os":Ljava/io/FileOutputStream;
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->access$200()Ljava/util/concurrent/Semaphore;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 358
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "\n"

    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->access$300()Ljava/util/Vector;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 359
    .local v0, "data":Ljava/lang/String;
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->access$300()Ljava/util/Vector;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Vector;->clear()V

    .line 360
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->access$200()Ljava/util/concurrent/Semaphore;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/Semaphore;->release()V

    .line 361
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/io/FileOutputStream;->write([B)V

    .line 362
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 367
    .end local v0    # "data":Ljava/lang/String;
    .end local v1    # "file":Ljava/io/File;
    .end local v4    # "os":Ljava/io/FileOutputStream;
    :goto_0
    :try_start_1
    new-instance v1, Ljava/io/File;

    sget-object v6, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v6

    const-string/jumbo v7, "analytics_collapsed.log"

    invoke-direct {v1, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 368
    .restart local v1    # "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_1

    .line 369
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 371
    :cond_1
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 372
    .restart local v4    # "os":Ljava/io/FileOutputStream;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 373
    .local v3, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->access$400()Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 374
    .local v2, "k":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/json/JSONObject;>;"
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 379
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "k":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/json/JSONObject;>;"
    .end local v3    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v4    # "os":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v5

    .line 380
    .local v5, "x":Ljava/lang/Exception;
    const-string/jumbo v6, "vk"

    invoke-static {v6, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 383
    .end local v5    # "x":Ljava/lang/Exception;
    :goto_2
    :try_start_2
    new-instance v1, Ljava/io/File;

    sget-object v6, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v6

    const-string/jumbo v7, "analytics_events.log"

    invoke-direct {v1, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 384
    .restart local v1    # "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_2

    .line 385
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 387
    :cond_2
    new-instance v4, Ljava/io/FileOutputStream;

    const/4 v6, 0x1

    invoke-direct {v4, v1, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 388
    .restart local v4    # "os":Ljava/io/FileOutputStream;
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->access$200()Ljava/util/concurrent/Semaphore;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 389
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "\n"

    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->access$500()Ljava/util/Vector;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 390
    .restart local v0    # "data":Ljava/lang/String;
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->access$500()Ljava/util/Vector;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Vector;->clear()V

    .line 391
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->access$200()Ljava/util/concurrent/Semaphore;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/Semaphore;->release()V

    .line 392
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/io/FileOutputStream;->write([B)V

    .line 393
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 397
    .end local v0    # "data":Ljava/lang/String;
    .end local v1    # "file":Ljava/io/File;
    .end local v4    # "os":Ljava/io/FileOutputStream;
    :goto_3
    const/4 v6, 0x0

    invoke-static {v6}, Lcom/vkontakte/android/data/Analytics;->access$602(Lcom/vkontakte/android/background/CancellableRunnable;)Lcom/vkontakte/android/background/CancellableRunnable;

    .line 398
    return-void

    .line 363
    :catch_1
    move-exception v5

    .line 364
    .restart local v5    # "x":Ljava/lang/Exception;
    const-string/jumbo v6, "vk"

    invoke-static {v6, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 376
    .end local v5    # "x":Ljava/lang/Exception;
    .restart local v1    # "file":Ljava/io/File;
    .restart local v3    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v4    # "os":Ljava/io/FileOutputStream;
    :cond_3
    :try_start_3
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "\n"

    invoke-static {v7, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 377
    .restart local v0    # "data":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/io/FileOutputStream;->write([B)V

    .line 378
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_2

    .line 394
    .end local v0    # "data":Ljava/lang/String;
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v4    # "os":Ljava/io/FileOutputStream;
    :catch_2
    move-exception v5

    .line 395
    .restart local v5    # "x":Ljava/lang/Exception;
    const-string/jumbo v6, "vk"

    invoke-static {v6, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3
.end method
