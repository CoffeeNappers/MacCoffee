.class public Lcom/vkontakte/android/data/BenchmarkTracker;
.super Ljava/lang/Object;
.source "BenchmarkTracker.java"

# interfaces
.implements Lcom/vk/imageloader/OkHttpNetworkFetcher$HttpImageBenchmarkReporter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;,
        Lcom/vkontakte/android/data/BenchmarkTracker$ApplicationStateTracker;,
        Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;,
        Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;,
        Lcom/vkontakte/android/data/BenchmarkTracker$VigoInitRunnable;,
        Lcom/vkontakte/android/data/BenchmarkTracker$Holder;
    }
.end annotation


# static fields
.field private static isResumed:Z

.field private static final mfRunnable:Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;

.field private static final vigo:Lcom/vkontakte/android/media/Vigo;

.field private static final vigoInit:Ljava/lang/Runnable;

.field private static final vigoSender:Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;


# instance fields
.field private apiConsecutiveFailuresCount:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private audioLoadFailures:I

.field private final audioLoadTimeTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

.field private currentConsecutiveFailures:I

.field private downloadPatterns:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;",
            ">;"
        }
    .end annotation
.end field

.field private imageLoadFailures:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final imageLoadTimeTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

.field private profilerEnabled:Z

.field private final random:Ljava/util/Random;

.field private final responseTimeTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

.field private final videoSpeedTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 48
    sget-object v0, Lcom/vkontakte/android/VKApplication;->vigo:Lcom/vkontakte/android/media/Vigo;

    sput-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->vigo:Lcom/vkontakte/android/media/Vigo;

    .line 49
    new-instance v0, Lcom/vkontakte/android/data/BenchmarkTracker$VigoInitRunnable;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/data/BenchmarkTracker$VigoInitRunnable;-><init>(Lcom/vkontakte/android/data/BenchmarkTracker$1;)V

    sput-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->vigoInit:Ljava/lang/Runnable;

    .line 50
    new-instance v0, Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;-><init>(Lcom/vkontakte/android/data/BenchmarkTracker$1;)V

    sput-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->vigoSender:Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;

    .line 51
    new-instance v0, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;-><init>(Lcom/vkontakte/android/data/BenchmarkTracker$1;)V

    sput-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->mfRunnable:Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->random:Ljava/util/Random;

    .line 56
    new-instance v0, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    invoke-direct {v0}, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->videoSpeedTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    .line 57
    new-instance v0, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    invoke-direct {v0}, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->responseTimeTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    .line 58
    new-instance v0, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    invoke-direct {v0}, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->imageLoadTimeTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    .line 59
    new-instance v0, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    invoke-direct {v0}, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->audioLoadTimeTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    .line 63
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->imageLoadFailures:Ljava/util/HashMap;

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->apiConsecutiveFailuresCount:Ljava/util/ArrayList;

    .line 67
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->downloadPatterns:Ljava/util/List;

    .line 74
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/data/BenchmarkTracker;->updateProfileConfig(Lcom/vkontakte/android/auth/VKAccount;)V

    .line 75
    invoke-static {p0}, Lcom/vk/imageloader/OkHttpNetworkFetcher;->setBenchmarkReporter(Lcom/vk/imageloader/OkHttpNetworkFetcher$HttpImageBenchmarkReporter;)V

    .line 76
    new-instance v0, Lcom/vkontakte/android/data/BenchmarkTracker$ApplicationStateTracker;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/data/BenchmarkTracker$ApplicationStateTracker;-><init>(Lcom/vkontakte/android/data/BenchmarkTracker;Lcom/vkontakte/android/data/BenchmarkTracker$1;)V

    invoke-static {v0}, Lcom/vkontakte/android/AppStateTracker;->addCallback(Lcom/vkontakte/android/AppStateTracker$Callback;)V

    .line 77
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/data/BenchmarkTracker$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/data/BenchmarkTracker$1;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/vkontakte/android/data/BenchmarkTracker;-><init>()V

    return-void
.end method

.method static synthetic access$1000()Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->mfRunnable:Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/data/BenchmarkTracker;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/data/BenchmarkTracker;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/vkontakte/android/data/BenchmarkTracker;->startVigoTracking()V

    return-void
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/data/BenchmarkTracker;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/data/BenchmarkTracker;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/vkontakte/android/data/BenchmarkTracker;->startMFTracking()V

    return-void
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/data/BenchmarkTracker;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/data/BenchmarkTracker;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/vkontakte/android/data/BenchmarkTracker;->stopVigoTracking()V

    return-void
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/data/BenchmarkTracker;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/data/BenchmarkTracker;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/vkontakte/android/data/BenchmarkTracker;->stopMFTracking()V

    return-void
.end method

.method static synthetic access$600()Lcom/vkontakte/android/media/Vigo;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->vigo:Lcom/vkontakte/android/media/Vigo;

    return-object v0
.end method

.method static synthetic access$700()Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->vigoSender:Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;

    return-object v0
.end method

.method static synthetic access$800()Z
    .locals 1

    .prologue
    .line 39
    sget-boolean v0, Lcom/vkontakte/android/data/BenchmarkTracker;->isResumed:Z

    return v0
.end method

.method static synthetic access$802(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .prologue
    .line 39
    sput-boolean p0, Lcom/vkontakte/android/data/BenchmarkTracker;->isResumed:Z

    return p0
.end method

.method static synthetic access$900()V
    .locals 0

    .prologue
    .line 39
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->sentVigoData()V

    return-void
.end method

.method private checkIsConnectedNow()Z
    .locals 2

    .prologue
    .line 225
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 228
    :goto_0
    return v1

    .line 227
    :catch_0
    move-exception v0

    .line 228
    .local v0, "exc":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static convertToCategory(Ljava/lang/String;)B
    .locals 6
    .param p0, "method"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x4

    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 343
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v3, -0x1

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v3, :pswitch_data_0

    move v0, v2

    .line 355
    :goto_1
    :pswitch_0
    return v0

    .line 343
    :sswitch_0
    const-string/jumbo v5, "execute.getNewsfeedSmart"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v3, v2

    goto :goto_0

    :sswitch_1
    const-string/jumbo v5, "photo.upload"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v3, v0

    goto :goto_0

    :sswitch_2
    const-string/jumbo v5, "messages.getById"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v3, 0x2

    goto :goto_0

    :sswitch_3
    const-string/jumbo v5, "messages.getHistory"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v3, 0x3

    goto :goto_0

    :sswitch_4
    const-string/jumbo v5, "messages.send"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v3, v1

    goto :goto_0

    :pswitch_1
    move v0, v1

    .line 347
    goto :goto_1

    .line 349
    :pswitch_2
    const/4 v0, 0x5

    goto :goto_1

    .line 351
    :pswitch_3
    const/4 v0, 0x6

    goto :goto_1

    .line 353
    :pswitch_4
    const/4 v0, 0x7

    goto :goto_1

    .line 343
    nop

    :sswitch_data_0
    .sparse-switch
        -0x71d7365a -> :sswitch_2
        -0x2a0e0916 -> :sswitch_4
        0x136f66fb -> :sswitch_0
        0x4f80793d -> :sswitch_1
        0x60f2b640 -> :sswitch_3
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private fetchServerName(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    .line 200
    if-nez p1, :cond_0

    .line 201
    const-string/jumbo v2, ""

    .line 220
    :goto_0
    return-object v2

    .line 203
    :cond_0
    const-string/jumbo v2, "/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 205
    .local v1, "splitStrings":[Ljava/lang/String;
    array-length v2, v1

    if-le v2, v5, :cond_2

    .line 206
    aget-object v2, v1, v4

    const-string/jumbo v3, "pp.vk.me"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 208
    aget-object v2, v1, v5

    goto :goto_0

    .line 213
    :cond_1
    aget-object v2, v1, v4

    const-string/jumbo v3, "\\."

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 214
    .local v0, "hostNameSplit":[Ljava/lang/String;
    array-length v2, v0

    if-lez v2, :cond_2

    .line 215
    const/4 v2, 0x0

    aget-object v2, v0, v2

    goto :goto_0

    .line 220
    .end local v0    # "hostNameSplit":[Ljava/lang/String;
    :cond_2
    const-string/jumbo v2, ""

    goto :goto_0
.end method

.method public static getInstance()Lcom/vkontakte/android/data/BenchmarkTracker;
    .locals 1

    .prologue
    .line 46
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker$Holder;->access$100()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v0

    return-object v0
.end method

.method private reset()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->responseTimeTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->reset()V

    .line 82
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->apiConsecutiveFailuresCount:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 83
    iput v1, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->currentConsecutiveFailures:I

    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->imageLoadTimeTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->reset()V

    .line 87
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->imageLoadFailures:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->audioLoadTimeTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->reset()V

    .line 91
    iput v1, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->audioLoadFailures:I

    .line 93
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->videoSpeedTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->reset()V

    .line 94
    return-void
.end method

.method private static sentVigoData()V
    .locals 4

    .prologue
    .line 292
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "Benchmark"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string/jumbo v3, "Vigo data send"

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 293
    sget-object v1, Lcom/vkontakte/android/data/BenchmarkTracker;->vigo:Lcom/vkontakte/android/media/Vigo;

    const-string/jumbo v2, "http://api.vigo.ru/uxzoom/2/notify"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/media/Vigo;->fillApiUrlParams(Landroid/net/Uri$Builder;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    .line 294
    .local v0, "uri":Landroid/net/Uri;
    new-instance v1, Lcom/vkontakte/android/statistics/StatisticUrl;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/statistics/StatisticUrl;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lcom/vkontakte/android/data/Analytics;->trackExternal(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    .line 295
    return-void
.end method

.method private startMFTracking()V
    .locals 1

    .prologue
    .line 370
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->mfRunnable:Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 371
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->mfRunnable:Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;

    invoke-static {v0}, Lcom/vkontakte/android/api/APIController;->runInBg(Ljava/lang/Runnable;)V

    .line 373
    :cond_0
    return-void
.end method

.method private startVigoTracking()V
    .locals 1

    .prologue
    .line 278
    iget-boolean v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->profilerEnabled:Z

    if-eqz v0, :cond_0

    .line 279
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->vigoInit:Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/vkontakte/android/api/APIController;->runInBg(Ljava/lang/Runnable;)V

    .line 281
    :cond_0
    return-void
.end method

.method private stopMFTracking()V
    .locals 2

    .prologue
    .line 381
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->mfRunnable:Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;

    invoke-static {v0}, Lcom/vkontakte/android/api/APIController;->removeBgCallbacks(Ljava/lang/Runnable;)V

    .line 382
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->mfRunnable:Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;->setRunning(Z)V

    .line 383
    return-void
.end method

.method private stopVigoTracking()V
    .locals 1

    .prologue
    .line 284
    iget-boolean v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->profilerEnabled:Z

    if-eqz v0, :cond_0

    .line 285
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->vigoSender:Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;

    invoke-static {v0}, Lcom/vkontakte/android/api/APIController;->removeBgCallbacks(Ljava/lang/Runnable;)V

    .line 286
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->sentVigoData()V

    .line 287
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->vigo:Lcom/vkontakte/android/media/Vigo;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/Vigo;->collectApiChangesOFF()V

    .line 289
    :cond_0
    return-void
.end method


# virtual methods
.method public addErrorApiMeasurement(Ljava/lang/String;II)V
    .locals 2
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "requestRtt"    # I
    .param p3, "requestPt"    # I

    .prologue
    .line 264
    invoke-static {p1}, Lcom/vkontakte/android/data/BenchmarkTracker;->convertToCategory(Ljava/lang/String;)B

    move-result v0

    .line 265
    .local v0, "cat":B
    if-lez v0, :cond_0

    .line 266
    sget-object v1, Lcom/vkontakte/android/data/BenchmarkTracker;->vigo:Lcom/vkontakte/android/media/Vigo;

    invoke-virtual {v1, v0, p2, p3}, Lcom/vkontakte/android/media/Vigo;->addErrorApiMeasurement(BII)V

    .line 268
    :cond_0
    return-void
.end method

.method public addSuccessApiMeasurement(Ljava/lang/String;IIJ)V
    .locals 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "requestRtt"    # I
    .param p3, "requestPt"    # I
    .param p4, "contentLength"    # J

    .prologue
    .line 257
    invoke-static {p1}, Lcom/vkontakte/android/data/BenchmarkTracker;->convertToCategory(Ljava/lang/String;)B

    move-result v1

    .line 258
    .local v1, "cat":B
    if-lez v1, :cond_0

    .line 259
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->vigo:Lcom/vkontakte/android/media/Vigo;

    move v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/media/Vigo;->addSuccessApiMeasurement(BIIJ)V

    .line 261
    :cond_0
    return-void
.end method

.method public countFailedApiMeasurement(Ljava/lang/String;)V
    .locals 2
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 271
    invoke-static {p1}, Lcom/vkontakte/android/data/BenchmarkTracker;->convertToCategory(Ljava/lang/String;)B

    move-result v0

    .line 272
    .local v0, "cat":B
    if-lez v0, :cond_0

    .line 273
    sget-object v1, Lcom/vkontakte/android/data/BenchmarkTracker;->vigo:Lcom/vkontakte/android/media/Vigo;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/media/Vigo;->countFailedApiMeasurement(B)V

    .line 275
    :cond_0
    return-void
.end method

.method public declared-synchronized reportApiResponseFailed()V
    .locals 1

    .prologue
    .line 116
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/vkontakte/android/data/BenchmarkTracker;->checkIsConnectedNow()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 121
    :goto_0
    monitor-exit p0

    return-void

    .line 120
    :cond_0
    :try_start_1
    iget v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->currentConsecutiveFailures:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->currentConsecutiveFailures:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 116
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized reportApiResponseSucceeded(I)V
    .locals 2
    .param p1, "responseTimeMiliseconds"    # I

    .prologue
    .line 106
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->responseTimeTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->reportObserviation(I)V

    .line 108
    iget v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->currentConsecutiveFailures:I

    if-lez v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->apiConsecutiveFailuresCount:Ljava/util/ArrayList;

    iget v1, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->currentConsecutiveFailures:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->currentConsecutiveFailures:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    :cond_0
    monitor-exit p0

    return-void

    .line 106
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized reportAudioLoadFailure()V
    .locals 1

    .prologue
    .line 172
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->audioLoadFailures:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->audioLoadFailures:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 173
    monitor-exit p0

    return-void

    .line 172
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized reportAudioLoadSucceeded(I)V
    .locals 1
    .param p1, "loadTimeMilliseconds"    # I

    .prologue
    .line 168
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->audioLoadTimeTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->reportObserviation(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 169
    monitor-exit p0

    return-void

    .line 168
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized reportImageLoadFailure(Ljava/lang/String;ILjava/lang/Exception;ZZ)V
    .locals 10
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "responseCode"    # I
    .param p3, "e"    # Ljava/lang/Exception;
    .param p4, "apiError"    # Z
    .param p5, "originalSize"    # Z

    .prologue
    .line 137
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/vkontakte/android/data/BenchmarkTracker;->checkIsConnectedNow()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_1

    .line 165
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 142
    :cond_1
    :try_start_1
    invoke-direct {p0, p1}, Lcom/vkontakte/android/data/BenchmarkTracker;->fetchServerName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 144
    .local v9, "serverName":Ljava/lang/String;
    if-eqz v9, :cond_0

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->imageLoadFailures:Ljava/util/HashMap;

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 148
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->imageLoadFailures:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    :goto_1
    if-eqz p4, :cond_2

    .line 154
    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v6, p2

    move-object v7, p3

    invoke-virtual/range {v0 .. v7}, Lcom/vkontakte/android/data/BenchmarkTracker;->trackContentDownload(Ljava/lang/String;JJILjava/lang/Exception;)V

    .line 157
    :cond_2
    iget-boolean v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->profilerEnabled:Z

    if-eqz v0, :cond_0

    .line 158
    if-eqz p5, :cond_4

    const/4 v8, 0x3

    .line 159
    .local v8, "category":B
    :goto_2
    if-eqz p4, :cond_5

    .line 160
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->vigo:Lcom/vkontakte/android/media/Vigo;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v8, v1, v2}, Lcom/vkontakte/android/media/Vigo;->addErrorApiMeasurement(BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 137
    .end local v8    # "category":B
    .end local v9    # "serverName":Ljava/lang/String;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 150
    .restart local v9    # "serverName":Ljava/lang/String;
    :cond_3
    :try_start_2
    iget-object v1, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->imageLoadFailures:Ljava/util/HashMap;

    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->imageLoadFailures:Ljava/util/HashMap;

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v9, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 158
    :cond_4
    const/4 v8, 0x2

    goto :goto_2

    .line 162
    .restart local v8    # "category":B
    :cond_5
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->vigo:Lcom/vkontakte/android/media/Vigo;

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/media/Vigo;->countFailedApiMeasurement(B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized reportImageLoadSucceeded(Ljava/lang/String;IIIZ)V
    .locals 8
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "loadTimeMilliseconds"    # I
    .param p3, "fetchTimeMilliseconds"    # I
    .param p4, "byteSize"    # I
    .param p5, "originalSize"    # Z

    .prologue
    .line 126
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->imageLoadTimeTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    invoke-virtual {v0, p2}, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->reportObserviation(I)V

    .line 127
    int-to-long v2, p4

    int-to-long v4, p2

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v7}, Lcom/vkontakte/android/data/BenchmarkTracker;->trackContentDownload(Ljava/lang/String;JJILjava/lang/Exception;)V

    .line 128
    iget-boolean v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->profilerEnabled:Z

    if-eqz v0, :cond_0

    .line 129
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->vigo:Lcom/vkontakte/android/media/Vigo;

    if-eqz p5, :cond_1

    const/4 v1, 0x3

    :goto_0
    const/4 v3, 0x0

    int-to-long v4, p4

    move v2, p3

    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/media/Vigo;->addSuccessApiMeasurement(BIIJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 132
    :cond_0
    monitor-exit p0

    return-void

    .line 129
    :cond_1
    const/4 v1, 0x2

    goto :goto_0

    .line 126
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized reportVideoSpeed(I)V
    .locals 1
    .param p1, "videoSpeedBytesPerSecond"    # I

    .prologue
    .line 176
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->videoSpeedTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->reportObserviation(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 177
    monitor-exit p0

    return-void

    .line 176
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized sendBenchmarkData()V
    .locals 8

    .prologue
    .line 180
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/vkontakte/android/api/stats/StatsBenchmark;

    iget-object v1, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->responseTimeTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    .line 181
    invoke-virtual {v1}, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->getAverage()I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->apiConsecutiveFailuresCount:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->imageLoadTimeTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    .line 183
    invoke-virtual {v3}, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->getAverage()I

    move-result v3

    iget-object v4, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->imageLoadFailures:Ljava/util/HashMap;

    iget-object v5, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->audioLoadTimeTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    .line 185
    invoke-virtual {v5}, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->getAverage()I

    move-result v5

    iget v6, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->audioLoadFailures:I

    iget-object v7, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->videoSpeedTracker:Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;

    .line 187
    invoke-virtual {v7}, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->getAverage()I

    move-result v7

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/api/stats/StatsBenchmark;-><init>(ILjava/util/ArrayList;ILjava/util/HashMap;III)V

    .line 189
    .local v0, "benchmarkRequest":Lcom/vkontakte/android/api/stats/StatsBenchmark;
    invoke-direct {p0}, Lcom/vkontakte/android/data/BenchmarkTracker;->reset()V

    .line 191
    invoke-virtual {v0}, Lcom/vkontakte/android/api/stats/StatsBenchmark;->getHaveDataToSend()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 194
    invoke-virtual {v0}, Lcom/vkontakte/android/api/stats/StatsBenchmark;->exec()Lcom/vkontakte/android/api/VKAPIRequest;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 197
    :cond_0
    monitor-exit p0

    return-void

    .line 180
    .end local v0    # "benchmarkRequest":Lcom/vkontakte/android/api/stats/StatsBenchmark;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public startMFTracking(Ljava/lang/String;J)V
    .locals 2
    .param p1, "endPointUrl"    # Ljava/lang/String;
    .param p2, "timeInterval"    # J

    .prologue
    .line 364
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->mfRunnable:Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;->setEndPointUrl(Ljava/lang/String;)V

    .line 365
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->mfRunnable:Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;

    invoke-virtual {v0, p2, p3}, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;->setTimeInterval(J)V

    .line 366
    invoke-direct {p0}, Lcom/vkontakte/android/data/BenchmarkTracker;->startMFTracking()V

    .line 367
    return-void
.end method

.method public stopAndResetMFTracking()V
    .locals 2

    .prologue
    .line 376
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker;->mfRunnable:Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;->setEndPointUrl(Ljava/lang/String;)V

    .line 377
    invoke-direct {p0}, Lcom/vkontakte/android/data/BenchmarkTracker;->stopMFTracking()V

    .line 378
    return-void
.end method

.method public trackContentDownload(Ljava/lang/String;JJILjava/lang/Exception;)V
    .locals 12
    .param p1, "uri"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "byteSize"    # J
    .param p4, "loadTimeMilliseconds"    # J
    .param p6, "responseCode"    # I
    .param p7, "exception"    # Ljava/lang/Exception;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 235
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->downloadPatterns:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;

    .line 236
    .local v10, "pattern":Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;
    invoke-virtual {v10}, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->getPattern()Ljava/util/regex/Pattern;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 237
    if-nez p7, :cond_2

    invoke-virtual {v10}, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->getProbability()F

    move-result v11

    .line 238
    .local v11, "probability":F
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->random:Ljava/util/Random;

    invoke-virtual {v2}, Ljava/util/Random;->nextFloat()F

    move-result v2

    cmpg-float v2, v2, v11

    if-gtz v2, :cond_1

    .line 239
    new-instance v1, Lcom/vkontakte/android/api/stats/StatsTrackDownloadServerState;

    invoke-virtual {v10}, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->getType()Ljava/lang/String;

    move-result-object v2

    move-object v3, p1

    move-wide v4, p2

    move-wide/from16 v6, p4

    move/from16 v8, p6

    move-object/from16 v9, p7

    invoke-direct/range {v1 .. v9}, Lcom/vkontakte/android/api/stats/StatsTrackDownloadServerState;-><init>(Ljava/lang/String;Ljava/lang/String;JJILjava/lang/Exception;)V

    .line 241
    .local v1, "apiRequest":Lcom/vkontakte/android/api/ResultlessAPIRequest;
    invoke-virtual {v1}, Lcom/vkontakte/android/api/ResultlessAPIRequest;->persistWithToken()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 242
    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/vkontakte/android/api/ResultlessAPIRequest;->background:Z

    .line 243
    invoke-virtual {v1}, Lcom/vkontakte/android/api/ResultlessAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 252
    .end local v1    # "apiRequest":Lcom/vkontakte/android/api/ResultlessAPIRequest;
    .end local v10    # "pattern":Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;
    .end local v11    # "probability":F
    :cond_1
    :goto_1
    return-void

    .line 237
    .restart local v10    # "pattern":Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;
    :cond_2
    invoke-virtual {v10}, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->getErrorProbability()F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v11

    goto :goto_0

    .line 248
    .end local v10    # "pattern":Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;
    :catch_0
    move-exception v0

    .line 249
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lcom/vk/analytics/Analytics;->logException(Ljava/lang/Throwable;)V

    .line 250
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string/jumbo v4, "BenchmarkTracker"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object v0, v2, v3

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public updateProfileConfig(Lcom/vkontakte/android/auth/VKAccount;)V
    .locals 2
    .param p1, "account"    # Lcom/vkontakte/android/auth/VKAccount;

    .prologue
    .line 97
    invoke-virtual {p1}, Lcom/vkontakte/android/auth/VKAccount;->getProfilerConfig()Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    move-result-object v0

    .line 98
    .local v0, "profilerConfig":Lcom/vkontakte/android/auth/configs/ProfilerConfig;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/configs/ProfilerConfig;->isApiRequests()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    iput-boolean v1, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->profilerEnabled:Z

    .line 99
    if-nez v0, :cond_1

    .line 100
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    .line 101
    :goto_1
    iput-object v1, p0, Lcom/vkontakte/android/data/BenchmarkTracker;->downloadPatterns:Ljava/util/List;

    .line 102
    return-void

    .line 98
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 101
    :cond_1
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/configs/ProfilerConfig;->getDownloadPatterns()Ljava/util/List;

    move-result-object v1

    goto :goto_1
.end method
