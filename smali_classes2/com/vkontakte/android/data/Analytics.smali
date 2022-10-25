.class public Lcom/vkontakte/android/data/Analytics;
.super Ljava/lang/Object;
.source "Analytics.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/data/Analytics$ViewPostTime;,
        Lcom/vkontakte/android/data/Analytics$EventBuilder;,
        Lcom/vkontakte/android/data/Analytics$StatsBackgroundRunner;
    }
.end annotation


# static fields
.field private static final SENDER_EXTERNAL:Lcom/vkontakte/android/statistics/StatisticSender;

.field private static final SENDER_PRETTY_CARD_IMPRESSION:Lcom/vkontakte/android/statistics/StatisticSender;

.field private static final SENDER_STATISTIC_URL_IMPRESSION:Lcom/vkontakte/android/statistics/StatisticSender;

.field private static collapsedEvents:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private static elog:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static elogWriteQueue:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static events:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private static googleDeviceID:Ljava/lang/String;

.field private static googleDeviceIdLimited:Z

.field private static logWriteQueue:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static postedRunner:Lcom/vkontakte/android/background/CancellableRunnable;

.field private static queueAccess:Ljava/util/concurrent/Semaphore;

.field private static thread:Lcom/vkontakte/android/background/WorkerThread;

.field private static unique:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final videoViewedSegments:Lcom/vkontakte/android/media/ViewedSegments;

.field public static final viewPostTime:Lcom/vkontakte/android/data/Analytics$ViewPostTime;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 68
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    sput-object v1, Lcom/vkontakte/android/data/Analytics;->events:Ljava/util/HashSet;

    .line 69
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v1, Lcom/vkontakte/android/data/Analytics;->collapsedEvents:Ljava/util/concurrent/ConcurrentHashMap;

    .line 70
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v1, Lcom/vkontakte/android/data/Analytics;->unique:Ljava/util/concurrent/ConcurrentHashMap;

    .line 72
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    sput-object v1, Lcom/vkontakte/android/data/Analytics;->logWriteQueue:Ljava/util/Vector;

    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    sput-object v1, Lcom/vkontakte/android/data/Analytics;->elogWriteQueue:Ljava/util/Vector;

    .line 73
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/vkontakte/android/data/Analytics;->elog:Ljava/util/ArrayList;

    .line 74
    new-instance v1, Ljava/util/concurrent/Semaphore;

    invoke-direct {v1, v2, v2}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    sput-object v1, Lcom/vkontakte/android/data/Analytics;->queueAccess:Ljava/util/concurrent/Semaphore;

    .line 75
    const-string/jumbo v1, "-1"

    sput-object v1, Lcom/vkontakte/android/data/Analytics;->googleDeviceID:Ljava/lang/String;

    .line 76
    sput-boolean v3, Lcom/vkontakte/android/data/Analytics;->googleDeviceIdLimited:Z

    .line 79
    new-instance v1, Lcom/vkontakte/android/data/Analytics$ViewPostTime;

    invoke-direct {v1}, Lcom/vkontakte/android/data/Analytics$ViewPostTime;-><init>()V

    sput-object v1, Lcom/vkontakte/android/data/Analytics;->viewPostTime:Lcom/vkontakte/android/data/Analytics$ViewPostTime;

    .line 82
    new-instance v1, Lcom/vkontakte/android/media/ViewedSegments;

    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/vkontakte/android/media/ViewedSegments;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/vkontakte/android/data/Analytics;->videoViewedSegments:Lcom/vkontakte/android/media/ViewedSegments;

    .line 83
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 84
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v1, "google_device_id"

    const-string/jumbo v2, "-1"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/vkontakte/android/data/Analytics;->googleDeviceID:Ljava/lang/String;

    .line 85
    new-instance v1, Lcom/vkontakte/android/background/WorkerThread;

    const-string/jumbo v2, "Analytics background"

    invoke-direct {v1, v2}, Lcom/vkontakte/android/background/WorkerThread;-><init>(Ljava/lang/String;)V

    sput-object v1, Lcom/vkontakte/android/data/Analytics;->thread:Lcom/vkontakte/android/background/WorkerThread;

    .line 86
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->thread:Lcom/vkontakte/android/background/WorkerThread;

    invoke-virtual {v1}, Lcom/vkontakte/android/background/WorkerThread;->start()V

    .line 87
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->thread:Lcom/vkontakte/android/background/WorkerThread;

    invoke-static {}, Lcom/vkontakte/android/data/Analytics$$Lambda$3;->lambdaFactory$()Ljava/lang/Runnable;

    move-result-object v2

    const-wide/16 v4, 0x0

    invoke-virtual {v1, v2, v4, v5}, Lcom/vkontakte/android/background/WorkerThread;->postRunnable(Ljava/lang/Runnable;J)V

    .line 153
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->thread:Lcom/vkontakte/android/background/WorkerThread;

    invoke-static {}, Lcom/vkontakte/android/data/Analytics$$Lambda$4;->lambdaFactory$()Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/background/WorkerThread;->postRunnable(Ljava/lang/Runnable;)V

    .line 184
    new-instance v1, Lcom/vkontakte/android/data/Analytics$1;

    invoke-direct {v1}, Lcom/vkontakte/android/data/Analytics$1;-><init>()V

    sput-object v1, Lcom/vkontakte/android/data/Analytics;->SENDER_STATISTIC_URL_IMPRESSION:Lcom/vkontakte/android/statistics/StatisticSender;

    .line 203
    new-instance v1, Lcom/vkontakte/android/data/Analytics$2;

    invoke-direct {v1}, Lcom/vkontakte/android/data/Analytics$2;-><init>()V

    sput-object v1, Lcom/vkontakte/android/data/Analytics;->SENDER_PRETTY_CARD_IMPRESSION:Lcom/vkontakte/android/statistics/StatisticSender;

    .line 224
    new-instance v1, Lcom/vkontakte/android/data/Analytics$3;

    invoke-direct {v1}, Lcom/vkontakte/android/data/Analytics$3;-><init>()V

    sput-object v1, Lcom/vkontakte/android/data/Analytics;->SENDER_EXTERNAL:Lcom/vkontakte/android/statistics/StatisticSender;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$200()Ljava/util/concurrent/Semaphore;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->queueAccess:Ljava/util/concurrent/Semaphore;

    return-object v0
.end method

.method static synthetic access$300()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->logWriteQueue:Ljava/util/Vector;

    return-object v0
.end method

.method static synthetic access$400()Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->collapsedEvents:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method static synthetic access$500()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->elogWriteQueue:Ljava/util/Vector;

    return-object v0
.end method

.method static synthetic access$602(Lcom/vkontakte/android/background/CancellableRunnable;)Lcom/vkontakte/android/background/CancellableRunnable;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/background/CancellableRunnable;

    .prologue
    .line 65
    sput-object p0, Lcom/vkontakte/android/data/Analytics;->postedRunner:Lcom/vkontakte/android/background/CancellableRunnable;

    return-object p0
.end method

.method static synthetic access$700()Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->unique:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method static synthetic access$800()V
    .locals 0

    .prologue
    .line 65
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->flushFile()V

    return-void
.end method

.method static synthetic access$900(Lorg/json/JSONObject;)V
    .locals 0
    .param p0, "x0"    # Lorg/json/JSONObject;

    .prologue
    .line 65
    invoke-static {p0}, Lcom/vkontakte/android/data/Analytics;->trackEvent(Lorg/json/JSONObject;)V

    return-void
.end method

.method private static addCellData(Lcom/vkontakte/android/data/Analytics$EventBuilder;)V
    .locals 6
    .param p0, "builder"    # Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .prologue
    .line 549
    :try_start_0
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v5, "phone"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    .line 550
    .local v3, "manager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v3}, Landroid/telephony/TelephonyManager;->getCellLocation()Landroid/telephony/CellLocation;

    move-result-object v1

    .line 551
    .local v1, "cellLocation":Landroid/telephony/CellLocation;
    instance-of v4, v1, Landroid/telephony/gsm/GsmCellLocation;

    if-eqz v4, :cond_1

    .line 552
    check-cast v1, Landroid/telephony/gsm/GsmCellLocation;

    .end local v1    # "cellLocation":Landroid/telephony/CellLocation;
    invoke-virtual {v1}, Landroid/telephony/gsm/GsmCellLocation;->getCid()I

    move-result v2

    .line 553
    .local v2, "cid":I
    if-ltz v2, :cond_0

    .line 554
    const-string/jumbo v4, "cell_id"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 555
    const-string/jumbo v4, "cell_type"

    const-string/jumbo v5, "gsm"

    invoke-virtual {p0, v4, v5}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 567
    .end local v2    # "cid":I
    .end local v3    # "manager":Landroid/telephony/TelephonyManager;
    :cond_0
    :goto_0
    return-void

    .line 557
    .restart local v1    # "cellLocation":Landroid/telephony/CellLocation;
    .restart local v3    # "manager":Landroid/telephony/TelephonyManager;
    :cond_1
    instance-of v4, v1, Landroid/telephony/cdma/CdmaCellLocation;

    if-eqz v4, :cond_0

    .line 558
    check-cast v1, Landroid/telephony/cdma/CdmaCellLocation;

    .end local v1    # "cellLocation":Landroid/telephony/CellLocation;
    invoke-virtual {v1}, Landroid/telephony/cdma/CdmaCellLocation;->getBaseStationId()I

    move-result v0

    .line 559
    .local v0, "bsid":I
    if-ltz v0, :cond_0

    .line 560
    const-string/jumbo v4, "cell_id"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 561
    const-string/jumbo v4, "cell_type"

    const-string/jumbo v5, "cdma"

    invoke-virtual {p0, v4, v5}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 564
    .end local v0    # "bsid":I
    .end local v3    # "manager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method public static cleanGeoDataEvents()Z
    .locals 7

    .prologue
    .line 763
    const/4 v2, 0x0

    .line 765
    .local v2, "hasGeo":Z
    :try_start_0
    new-instance v0, Ljava/util/HashSet;

    sget-object v4, Lcom/vkontakte/android/data/Analytics;->events:Ljava/util/HashSet;

    invoke-direct {v0, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 766
    .local v0, "copy":Ljava/util/Set;, "Ljava/util/Set<Lorg/json/JSONObject;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    .line 767
    .local v3, "obj":Lorg/json/JSONObject;
    const-string/jumbo v5, "e"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "geo_data"

    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 768
    sget-object v5, Lcom/vkontakte/android/data/Analytics;->events:Ljava/util/HashSet;

    invoke-virtual {v5, v3}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 769
    const/4 v2, 0x1

    goto :goto_0

    .line 772
    .end local v0    # "copy":Ljava/util/Set;, "Ljava/util/Set<Lorg/json/JSONObject;>;"
    .end local v3    # "obj":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 773
    .local v1, "e":Lorg/json/JSONException;
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string/jumbo v6, "VK"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object v1, v4, v5

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 775
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_1
    return v2
.end method

.method public static clear(Z)V
    .locals 4
    .param p0, "full"    # Z

    .prologue
    .line 290
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->events:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->clear()V

    .line 291
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->collapsedEvents:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 292
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->unique:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 293
    if-eqz p0, :cond_0

    .line 294
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->elog:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 297
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/File;

    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string/jumbo v3, "analytics.log"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 298
    new-instance v1, Ljava/io/File;

    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string/jumbo v3, "analytics_collapsed.log"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 299
    if-eqz p0, :cond_1

    .line 300
    new-instance v1, Ljava/io/File;

    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string/jumbo v3, "analytics_events.log"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 305
    :cond_1
    :goto_0
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->postedRunner:Lcom/vkontakte/android/background/CancellableRunnable;

    if-eqz v1, :cond_2

    .line 306
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->postedRunner:Lcom/vkontakte/android/background/CancellableRunnable;

    invoke-virtual {v1}, Lcom/vkontakte/android/background/CancellableRunnable;->cancel()V

    .line 307
    const/4 v1, 0x0

    sput-object v1, Lcom/vkontakte/android/data/Analytics;->postedRunner:Lcom/vkontakte/android/background/CancellableRunnable;

    .line 309
    :cond_2
    return-void

    .line 302
    :catch_0
    move-exception v0

    .line 303
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static collectData(Landroid/content/Context;)Landroid/location/Location;
    .locals 15
    .param p0, "context"    # Landroid/content/Context;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 593
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->isManufacturerAskPermission()Z

    move-result v9

    if-nez v9, :cond_0

    .line 594
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v9

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v12

    if-ne v9, v12, :cond_1

    .line 595
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v12, 0x0

    const-string/jumbo v13, "send_geo: You must not call collectData method from main thread"

    aput-object v13, v9, v12

    invoke-static {v9}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 623
    :cond_0
    const/4 v2, 0x0

    :goto_0
    return-object v2

    .line 597
    :cond_1
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    .line 598
    .local v1, "bestAccuracy":F
    const-wide/16 v4, 0x0

    .line 599
    .local v4, "bestTime":J
    const/4 v2, 0x0

    .line 600
    .local v2, "bestResult":Landroid/location/Location;
    const-string/jumbo v9, "location"

    invoke-virtual {p0, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/location/LocationManager;

    .line 601
    .local v6, "lm":Landroid/location/LocationManager;
    invoke-virtual {v6}, Landroid/location/LocationManager;->getAllProviders()Ljava/util/List;

    move-result-object v7

    .line 602
    .local v7, "matchingProviders":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v7, :cond_2

    const/4 v2, 0x0

    goto :goto_0

    .line 603
    :cond_2
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_3
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_5

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 605
    .local v8, "provider":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v6, v8}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v3

    .line 606
    .local v3, "e":Landroid/location/Location;
    if-eqz v3, :cond_3

    .line 607
    invoke-virtual {v3}, Landroid/location/Location;->getAccuracy()F

    move-result v0

    .line 608
    .local v0, "accuracy":F
    invoke-virtual {v3}, Landroid/location/Location;->getTime()J
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v10

    .line 609
    .local v10, "time":J
    if-eqz v2, :cond_4

    cmp-long v12, v10, v4

    if-lez v12, :cond_3

    cmpg-float v12, v0, v1

    if-gez v12, :cond_3

    .line 610
    :cond_4
    move-object v2, v3

    .line 611
    move v1, v0

    .line 612
    move-wide v4, v10

    goto :goto_1

    .line 619
    .end local v0    # "accuracy":F
    .end local v3    # "e":Landroid/location/Location;
    .end local v8    # "provider":Ljava/lang/String;
    .end local v10    # "time":J
    :cond_5
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v12, 0x0

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "send_geo: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v9, v12

    invoke-static {v9}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto :goto_0

    .line 615
    .restart local v8    # "provider":Ljava/lang/String;
    :catch_0
    move-exception v12

    goto :goto_1
.end method

.method private static flushFile()V
    .locals 4

    .prologue
    .line 174
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->postedRunner:Lcom/vkontakte/android/background/CancellableRunnable;

    if-nez v0, :cond_0

    .line 175
    new-instance v0, Lcom/vkontakte/android/data/Analytics$StatsBackgroundRunner;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/data/Analytics$StatsBackgroundRunner;-><init>(Lcom/vkontakte/android/data/Analytics$1;)V

    sput-object v0, Lcom/vkontakte/android/data/Analytics;->postedRunner:Lcom/vkontakte/android/background/CancellableRunnable;

    .line 176
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->thread:Lcom/vkontakte/android/background/WorkerThread;

    sget-object v1, Lcom/vkontakte/android/data/Analytics;->postedRunner:Lcom/vkontakte/android/background/CancellableRunnable;

    invoke-virtual {v1}, Lcom/vkontakte/android/background/CancellableRunnable;->toRunnable()Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/background/WorkerThread;->postRunnable(Ljava/lang/Runnable;J)V

    .line 178
    :cond_0
    return-void
.end method

.method public static formatForGeo(D)Ljava/lang/String;
    .locals 4
    .param p0, "d"    # D

    .prologue
    .line 588
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    double-to-int v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-wide v2, 0x40c3880000000000L    # 10000.0

    mul-double/2addr v2, p0

    double-to-int v1, v2

    rem-int/lit16 v1, v1, 0x2710

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDeviceID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 340
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->googleDeviceID:Ljava/lang/String;

    return-object v0
.end method

.method public static declared-synchronized getEvents(Ljava/util/ArrayList;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/json/JSONObject;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 278
    .local p0, "out":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/json/JSONObject;>;"
    const-class v4, Lcom/vkontakte/android/data/Analytics;

    monitor-enter v4

    :try_start_0
    sget-object v3, Lcom/vkontakte/android/data/Analytics;->events:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    .line 279
    .local v0, "e":Lorg/json/JSONObject;
    new-instance v5, Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/ConcurrentModificationException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 284
    .end local v0    # "e":Lorg/json/JSONObject;
    :catch_0
    move-exception v3

    move-object v2, v3

    .line 285
    .local v2, "xx":Ljava/lang/Exception;
    :goto_1
    const/4 v3, 0x0

    :try_start_1
    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 287
    .end local v2    # "xx":Ljava/lang/Exception;
    :cond_0
    monitor-exit v4

    return-void

    .line 281
    :cond_1
    :try_start_2
    sget-object v3, Lcom/vkontakte/android/data/Analytics;->collapsedEvents:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 282
    .local v1, "k":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/json/JSONObject;>;"
    new-instance v6, Lorg/json/JSONObject;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v6, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/util/ConcurrentModificationException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 284
    .end local v1    # "k":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/json/JSONObject;>;"
    :catch_1
    move-exception v3

    move-object v2, v3

    goto :goto_1

    .line 278
    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3
.end method

.method public static getOnBindViewForNewsEntry(Lcom/vkontakte/android/NewsEntry;)Lcom/vkontakte/android/ui/posts/PostDisplayItem$OnBindView;
    .locals 2
    .param p0, "post"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 701
    if-eqz p0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v1, 0xc

    if-eq v0, v1, :cond_1

    .line 702
    :cond_0
    const/4 v0, 0x0

    .line 704
    :goto_0
    return-object v0

    :cond_1
    invoke-static {p0}, Lcom/vkontakte/android/data/Analytics$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/NewsEntry;)Lcom/vkontakte/android/ui/posts/PostDisplayItem$OnBindView;

    move-result-object v0

    goto :goto_0
.end method

.method public static isLimitAdTrackingEnabled()Z
    .locals 1

    .prologue
    .line 344
    sget-boolean v0, Lcom/vkontakte/android/data/Analytics;->googleDeviceIdLimited:Z

    return v0
.end method

.method public static isLogged(Ljava/lang/String;)Z
    .locals 1
    .param p0, "event"    # Ljava/lang/String;

    .prologue
    .line 414
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->elog:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isManufacturerAskPermission()Z
    .locals 2

    .prologue
    .line 627
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 628
    .local v0, "manufacturer":Ljava/lang/String;
    const-string/jumbo v1, "Xiaomi"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "Meizu"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method static synthetic lambda$getOnBindViewForNewsEntry$3(Lcom/vkontakte/android/NewsEntry;Landroid/view/View;)V
    .locals 1
    .param p0, "post"    # Lcom/vkontakte/android/NewsEntry;
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 704
    const-string/jumbo v0, "impression"

    invoke-static {p0, v0}, Lcom/vkontakte/android/data/Analytics;->sendPromoPostActionByType(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$static$0()V
    .locals 15

    .prologue
    const/4 v14, 0x2

    .line 89
    :try_start_0
    new-instance v0, Ljava/io/File;

    sget-object v10, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v10

    const-string/jumbo v11, "analytics.log"

    invoke-direct {v0, v10, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 90
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 91
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v10, Ljava/io/FileReader;

    invoke-direct {v10, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v6, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 93
    .local v6, "reader":Ljava/io/BufferedReader;
    :cond_0
    :goto_0
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .local v1, "line":Ljava/lang/String;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_1

    .line 94
    const-string/jumbo v10, ","

    const/4 v11, 0x2

    invoke-virtual {v1, v10, v11}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v7

    .line 95
    .local v7, "x":[Ljava/lang/String;
    array-length v10, v7

    if-ge v10, v14, :cond_8

    .line 104
    .end local v7    # "x":[Ljava/lang/String;
    :cond_1
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V

    .line 106
    .end local v1    # "line":Ljava/lang/String;
    .end local v6    # "reader":Ljava/io/BufferedReader;
    :cond_2
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    sget-object v10, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v10

    const-string/jumbo v11, "analytics_collapsed.log"

    invoke-direct {v0, v10, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 107
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 108
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v10, Ljava/io/FileReader;

    invoke-direct {v10, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v6, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 110
    .restart local v6    # "reader":Ljava/io/BufferedReader;
    :cond_3
    :goto_1
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "line":Ljava/lang/String;
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_4

    .line 111
    const-string/jumbo v10, ","

    const/4 v11, 0x2

    invoke-virtual {v1, v10, v11}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v7

    .line 112
    .restart local v7    # "x":[Ljava/lang/String;
    array-length v10, v7

    if-ge v10, v14, :cond_9

    .line 121
    .end local v7    # "x":[Ljava/lang/String;
    :cond_4
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V

    .line 123
    .end local v1    # "line":Ljava/lang/String;
    .end local v6    # "reader":Ljava/io/BufferedReader;
    :cond_5
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    sget-object v10, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v10

    const-string/jumbo v11, "analytics_events.log"

    invoke-direct {v0, v10, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 124
    .restart local v0    # "file":Ljava/io/File;
    const/4 v3, 0x0

    .line 125
    .local v3, "needRewrite":Z
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_7

    .line 126
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v10, Ljava/io/FileReader;

    invoke-direct {v10, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v6, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 128
    .restart local v6    # "reader":Ljava/io/BufferedReader;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .local v2, "lines":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_2
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "line":Ljava/lang/String;
    if-eqz v1, :cond_6

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_6

    .line 130
    const-string/jumbo v10, ","

    const/4 v11, 0x2

    invoke-virtual {v1, v10, v11}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v7

    .line 131
    .restart local v7    # "x":[Ljava/lang/String;
    array-length v10, v7

    if-ge v10, v14, :cond_a

    .line 142
    .end local v7    # "x":[Ljava/lang/String;
    :cond_6
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V

    .line 143
    if-eqz v3, :cond_7

    .line 144
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 145
    .local v5, "out":Ljava/io/FileOutputStream;
    const-string/jumbo v10, "\n"

    invoke-static {v10, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/io/FileOutputStream;->write([B)V

    .line 146
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 152
    .end local v1    # "line":Ljava/lang/String;
    .end local v2    # "lines":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v5    # "out":Ljava/io/FileOutputStream;
    .end local v6    # "reader":Ljava/io/BufferedReader;
    :cond_7
    :goto_3
    return-void

    .line 98
    .end local v3    # "needRewrite":Z
    .restart local v1    # "line":Ljava/lang/String;
    .restart local v6    # "reader":Ljava/io/BufferedReader;
    .restart local v7    # "x":[Ljava/lang/String;
    :cond_8
    const/4 v10, 0x0

    aget-object v10, v7, v10

    invoke-static {v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    .line 99
    .local v8, "time":J
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v10

    int-to-long v10, v10

    sub-long/2addr v10, v8

    const-wide/32 v12, 0x15180

    cmp-long v10, v10, v12

    if-gez v10, :cond_0

    .line 100
    new-instance v4, Lorg/json/JSONObject;

    const/4 v10, 0x1

    aget-object v10, v7, v10

    invoke-direct {v4, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 101
    .local v4, "obj":Lorg/json/JSONObject;
    sget-object v10, Lcom/vkontakte/android/data/Analytics;->events:Ljava/util/HashSet;

    invoke-virtual {v10, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 149
    .end local v1    # "line":Ljava/lang/String;
    .end local v4    # "obj":Lorg/json/JSONObject;
    .end local v6    # "reader":Ljava/io/BufferedReader;
    .end local v7    # "x":[Ljava/lang/String;
    .end local v8    # "time":J
    .restart local v3    # "needRewrite":Z
    :catch_0
    move-exception v7

    .line 150
    .local v7, "x":Ljava/lang/Exception;
    const-string/jumbo v10, "vk"

    invoke-static {v10, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    .line 115
    .end local v3    # "needRewrite":Z
    .restart local v1    # "line":Ljava/lang/String;
    .restart local v6    # "reader":Ljava/io/BufferedReader;
    .local v7, "x":[Ljava/lang/String;
    :cond_9
    const/4 v10, 0x0

    :try_start_1
    aget-object v10, v7, v10

    invoke-static {v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    .line 116
    .restart local v8    # "time":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    sub-long/2addr v10, v8

    const-wide/32 v12, 0x5265c00

    cmp-long v10, v10, v12

    if-gez v10, :cond_3

    .line 117
    new-instance v4, Lorg/json/JSONObject;

    const/4 v10, 0x1

    aget-object v10, v7, v10

    invoke-direct {v4, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 118
    .restart local v4    # "obj":Lorg/json/JSONObject;
    sget-object v10, Lcom/vkontakte/android/data/Analytics;->collapsedEvents:Ljava/util/concurrent/ConcurrentHashMap;

    const-string/jumbo v11, "e"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11, v4}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    .line 134
    .end local v4    # "obj":Lorg/json/JSONObject;
    .end local v8    # "time":J
    .restart local v2    # "lines":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v3    # "needRewrite":Z
    :cond_a
    const/4 v10, 0x0

    aget-object v10, v7, v10

    invoke-static {v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    .line 135
    .restart local v8    # "time":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    cmp-long v10, v10, v8

    if-gez v10, :cond_b

    .line 136
    sget-object v10, Lcom/vkontakte/android/data/Analytics;->elog:Ljava/util/ArrayList;

    const/4 v11, 0x1

    aget-object v11, v7, v11

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 137
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2

    .line 139
    :cond_b
    const/4 v3, 0x1

    goto/16 :goto_2
.end method

.method static synthetic lambda$static$1()V
    .locals 1

    .prologue
    .line 153
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->updateDeviceID(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$updateDeviceID$2(Ljava/lang/Runnable;)V
    .locals 8
    .param p0, "onDone"    # Ljava/lang/Runnable;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 314
    :try_start_0
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v3}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    move-result-object v0

    .line 316
    .local v0, "info":Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    invoke-virtual {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/vkontakte/android/data/Analytics;->googleDeviceID:Ljava/lang/String;

    .line 317
    invoke-virtual {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->isLimitAdTrackingEnabled()Z

    move-result v3

    sput-boolean v3, Lcom/vkontakte/android/data/Analytics;->googleDeviceIdLimited:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 330
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v3, v7, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 331
    .local v1, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "google_device_id"

    sget-object v5, Lcom/vkontakte/android/data/Analytics;->googleDeviceID:Ljava/lang/String;

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 333
    .end local v0    # "info":Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    :goto_0
    if-eqz p0, :cond_0

    .line 334
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 336
    :cond_0
    return-void

    .line 327
    .end local v1    # "prefs":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v2

    .line 328
    .local v2, "x":Ljava/lang/Exception;
    :try_start_1
    sget-wide v4, Lcom/vkontakte/android/VKApplication;->deviceID:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/vkontakte/android/data/Analytics;->googleDeviceID:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 330
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v3, v7, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 331
    .restart local v1    # "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "google_device_id"

    sget-object v5, Lcom/vkontakte/android/data/Analytics;->googleDeviceID:Ljava/lang/String;

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0

    .line 330
    .end local v1    # "prefs":Landroid/content/SharedPreferences;
    .end local v2    # "x":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4, v7, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 331
    .restart local v1    # "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "google_device_id"

    sget-object v6, Lcom/vkontakte/android/data/Analytics;->googleDeviceID:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 332
    throw v3
.end method

.method public static logEvent(Ljava/lang/String;J)V
    .locals 7
    .param p0, "event"    # Ljava/lang/String;
    .param p1, "ttl"    # J

    .prologue
    .line 402
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->elog:Ljava/util/ArrayList;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 404
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->queueAccess:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 408
    :goto_0
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->elogWriteQueue:Ljava/util/Vector;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    add-long/2addr v4, p1

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 409
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->queueAccess:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 410
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->flushFile()V

    .line 411
    return-void

    .line 405
    :catch_0
    move-exception v0

    .line 406
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static sendDailyStatistic(Landroid/content/Context;)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 739
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 740
    .local v2, "preferences":Landroid/content/SharedPreferences;
    const-string/jumbo v3, "stats_daily_last_updated"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 741
    .local v1, "lastSendTime":I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    long-to-int v0, v4

    .line 742
    .local v0, "currentTime":I
    sub-int v3, v0, v1

    const v4, 0x15180

    if-le v3, v4, :cond_0

    .line 743
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->sendGifAutoPlayState()V

    .line 744
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->sendVideoAutoPlayState()V

    .line 745
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "stats_daily_last_updated"

    invoke-interface {v3, v4, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 747
    :cond_0
    return-void
.end method

.method public static sendGeoData()V
    .locals 10

    .prologue
    const/4 v5, 0x1

    .line 525
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v3

    if-nez v3, :cond_0

    .line 545
    .local v0, "builder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    .local v1, "isLocationEnable":Z
    .local v2, "l":Landroid/location/Location;
    :goto_0
    return-void

    .line 528
    .end local v0    # "builder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    .end local v1    # "isLocationEnable":Z
    .end local v2    # "l":Landroid/location/Location;
    :cond_0
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string/jumbo v4, "mytrackerLocationCrapEnabled"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 529
    .restart local v1    # "isLocationEnable":Z
    if-eqz v1, :cond_1

    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v3}, Lcom/vkontakte/android/data/Analytics;->collectData(Landroid/content/Context;)Landroid/location/Location;

    move-result-object v2

    .line 530
    .restart local v2    # "l":Landroid/location/Location;
    :goto_1
    const-string/jumbo v3, "geo_data"

    invoke-static {v3}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    .line 531
    .restart local v0    # "builder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    if-nez v1, :cond_2

    .line 532
    const-string/jumbo v3, "no_data_reason"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 544
    :goto_2
    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    goto :goto_0

    .line 529
    .end local v0    # "builder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    .end local v2    # "l":Landroid/location/Location;
    :cond_1
    const/4 v2, 0x0

    goto :goto_1

    .line 533
    .restart local v0    # "builder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    .restart local v2    # "l":Landroid/location/Location;
    :cond_2
    if-nez v2, :cond_3

    .line 534
    const-string/jumbo v3, "no_data_reason"

    const/4 v4, 0x2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 535
    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->addCellData(Lcom/vkontakte/android/data/Analytics$EventBuilder;)V

    goto :goto_2

    .line 537
    :cond_3
    const-string/jumbo v3, "accuracy"

    invoke-virtual {v2}, Landroid/location/Location;->getAccuracy()F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v3

    const-string/jumbo v4, "ts"

    .line 538
    invoke-virtual {v2}, Landroid/location/Location;->getTime()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v3

    const-string/jumbo v4, "lat"

    .line 539
    invoke-virtual {v2}, Landroid/location/Location;->getLatitude()D

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/vkontakte/android/data/Analytics;->formatForGeo(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v3

    const-string/jumbo v4, "lon"

    .line 540
    invoke-virtual {v2}, Landroid/location/Location;->getLongitude()D

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/vkontakte/android/data/Analytics;->formatForGeo(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 541
    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->addCellData(Lcom/vkontakte/android/data/Analytics$EventBuilder;)V

    goto :goto_2
.end method

.method private static sendGifAutoPlayState()V
    .locals 3

    .prologue
    .line 755
    const-string/jumbo v0, "autoplay_state"

    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->unique()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v1, "type"

    const-string/jumbo v2, "gif"

    .line 756
    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v1, "value"

    invoke-static {}, Lcom/vkontakte/android/cache/Gifs;->getAutoPlayState()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 757
    return-void
.end method

.method static sendPromoAction(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/statistics/StatisticUrl;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 729
    .local p0, "urls":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/statistics/StatisticUrl;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/statistics/StatisticUrl;

    .line 730
    .local v0, "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->trackExternal(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    goto :goto_0

    .line 732
    .end local v0    # "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    :cond_0
    return-void
.end method

.method public static sendPromoActionByType(Lcom/vkontakte/android/statistics/Statistic;Ljava/lang/String;)V
    .locals 3
    .param p0, "statistic"    # Lcom/vkontakte/android/statistics/Statistic;
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 719
    invoke-interface {p0, p1}, Lcom/vkontakte/android/statistics/Statistic;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/statistics/StatisticUrl;

    .line 720
    .local v0, "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->trackExternal(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    goto :goto_0

    .line 723
    .end local v0    # "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    :cond_0
    const-string/jumbo v1, "impression"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 724
    check-cast p0, Lcom/vkontakte/android/attachments/ShitAttachment;

    .end local p0    # "statistic":Lcom/vkontakte/android/statistics/Statistic;
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->dataImpression:Lcom/vkontakte/android/statistics/StatisticUrl;

    invoke-static {v1}, Lcom/vkontakte/android/data/Analytics;->trackImpression(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    .line 726
    :cond_1
    return-void
.end method

.method public static sendPromoPostActionByType(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;)V
    .locals 3
    .param p0, "post"    # Lcom/vkontakte/android/NewsEntry;
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 709
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v2, 0xc

    if-ne v1, v2, :cond_1

    .line 710
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 711
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v2, v0, Lcom/vkontakte/android/statistics/Statistic;

    if-eqz v2, :cond_0

    .line 712
    check-cast v0, Lcom/vkontakte/android/statistics/Statistic;

    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-static {v0, p1}, Lcom/vkontakte/android/data/Analytics;->sendPromoActionByType(Lcom/vkontakte/android/statistics/Statistic;Ljava/lang/String;)V

    goto :goto_0

    .line 716
    :cond_1
    return-void
.end method

.method public static sendRequest(Ljava/lang/String;)[B
    .locals 6
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 249
    :try_start_0
    new-instance v3, Lokhttp3/Request$Builder;

    invoke-direct {v3}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v3, p0}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v3

    const-string/jumbo v4, "User-Agent"

    sget-object v5, Lcom/vkontakte/android/api/APIController;->FUCKING_AD_USER_AGENT:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 250
    .local v0, "req":Lokhttp3/Request;
    invoke-static {}, Lcom/vk/core/network/Network;->getDefaultClient()Lokhttp3/OkHttpClient;

    move-result-object v3

    invoke-virtual {v3, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v3

    invoke-interface {v3}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v1

    .line 251
    .local v1, "resp":Lokhttp3/Response;
    invoke-virtual {v1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/ResponseBody;->bytes()[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 254
    .end local v0    # "req":Lokhttp3/Request;
    .end local v1    # "resp":Lokhttp3/Response;
    :goto_0
    return-object v3

    .line 252
    :catch_0
    move-exception v2

    .line 254
    .local v2, "x":Ljava/lang/Exception;
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private static sendVideoAutoPlayState()V
    .locals 3

    .prologue
    .line 750
    const-string/jumbo v0, "autoplay_state"

    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->unique()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v1, "type"

    const-string/jumbo v2, "video"

    .line 751
    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v1, "value"

    invoke-static {}, Lcom/vkontakte/android/cache/Videos;->getAutoPlayState()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 752
    return-void
.end method

.method public static sendVideoViewedSegments()V
    .locals 1

    .prologue
    .line 735
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->videoViewedSegments:Lcom/vkontakte/android/media/ViewedSegments;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/ViewedSegments;->sendLastSessionStats()V

    .line 736
    return-void
.end method

.method public static track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;
    .locals 2
    .param p0, "ev"    # Ljava/lang/String;

    .prologue
    .line 181
    new-instance v0, Lcom/vkontakte/android/data/Analytics$EventBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;-><init>(Ljava/lang/String;Lcom/vkontakte/android/data/Analytics$1;)V

    return-object v0
.end method

.method private static trackEvent(Lorg/json/JSONObject;)V
    .locals 4
    .param p0, "e"    # Lorg/json/JSONObject;

    .prologue
    .line 157
    const/4 v0, 0x0

    .line 159
    .local v0, "needWrite":Z
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->queueAccess:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    :goto_0
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->events:Ljava/util/HashSet;

    invoke-virtual {v1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 164
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->logWriteQueue:Ljava/util/Vector;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 165
    const/4 v0, 0x1

    .line 167
    :cond_0
    sget-object v1, Lcom/vkontakte/android/data/Analytics;->queueAccess:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 168
    if-eqz v0, :cond_1

    .line 169
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->flushFile()V

    .line 171
    :cond_1
    return-void

    .line 160
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static trackExternal(Lcom/vkontakte/android/statistics/StatisticUrl;)V
    .locals 4
    .param p0, "url"    # Lcom/vkontakte/android/statistics/StatisticUrl;

    .prologue
    .line 271
    if-eqz p0, :cond_0

    .line 272
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->SENDER_EXTERNAL:Lcom/vkontakte/android/statistics/StatisticSender;

    const/16 v1, 0xa

    const-wide/32 v2, 0xea60

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/vkontakte/android/statistics/StatisticUrl;->sendAsync(Lcom/vkontakte/android/statistics/StatisticSender;IJ)V

    .line 274
    :cond_0
    return-void
.end method

.method public static trackImpression(Lcom/vkontakte/android/statistics/StatisticPrettyCard;)V
    .locals 1
    .param p0, "statisticPrettyCard"    # Lcom/vkontakte/android/statistics/StatisticPrettyCard;

    .prologue
    .line 265
    if-eqz p0, :cond_0

    .line 266
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->SENDER_PRETTY_CARD_IMPRESSION:Lcom/vkontakte/android/statistics/StatisticSender;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/statistics/StatisticPrettyCard;->sendSync(Lcom/vkontakte/android/statistics/StatisticSender;)V

    .line 268
    :cond_0
    return-void
.end method

.method public static trackImpression(Lcom/vkontakte/android/statistics/StatisticUrl;)V
    .locals 1
    .param p0, "statisticUrl"    # Lcom/vkontakte/android/statistics/StatisticUrl;

    .prologue
    .line 259
    if-eqz p0, :cond_0

    .line 260
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->SENDER_STATISTIC_URL_IMPRESSION:Lcom/vkontakte/android/statistics/StatisticSender;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/statistics/StatisticUrl;->sendSync(Lcom/vkontakte/android/statistics/StatisticSender;)V

    .line 262
    :cond_0
    return-void
.end method

.method public static updateDeviceID(Ljava/lang/Runnable;)V
    .locals 2
    .param p0, "onDone"    # Ljava/lang/Runnable;

    .prologue
    .line 312
    new-instance v0, Ljava/lang/Thread;

    invoke-static {p0}, Lcom/vkontakte/android/data/Analytics$$Lambda$1;->lambdaFactory$(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 336
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 337
    return-void
.end method
