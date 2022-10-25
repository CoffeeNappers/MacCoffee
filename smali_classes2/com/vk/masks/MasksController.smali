.class public Lcom/vk/masks/MasksController;
.super Ljava/lang/Object;
.source "MasksController.java"


# static fields
.field private static volatile instance:Lcom/vk/masks/MasksController;

.field private static final roundUpProgressMap:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<",
            "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
            "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final currentMasksDownloads:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/vk/masks/model/Mask;",
            ">;"
        }
    .end annotation
.end field

.field private final engineDataDownload:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<",
            "Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;",
            "Lio/reactivex/ObservableSource",
            "<",
            "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
            ">;>;"
        }
    .end annotation
.end field

.field private masksEngineModel:Lio/reactivex/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observable",
            "<",
            "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
            ">;"
        }
    .end annotation
.end field

.field private masksEngineModelDisposable:Lio/reactivex/disposables/Disposable;

.field private masksEngineVersion:I

.field private final masksPrefs:Lcom/vk/masks/MasksPrefs;

.field private final masksStorage:Lcom/vk/masks/MasksStorage;

.field private final recentMasksSectionMap:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/MaskSection;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/MaskSection;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 333
    new-instance v0, Lcom/vk/masks/MasksController$14;

    invoke-direct {v0}, Lcom/vk/masks/MasksController$14;-><init>()V

    sput-object v0, Lcom/vk/masks/MasksController;->roundUpProgressMap:Lio/reactivex/functions/Function;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 344
    new-instance v0, Lcom/vk/masks/MasksController$15;

    invoke-direct {v0, p0}, Lcom/vk/masks/MasksController$15;-><init>(Lcom/vk/masks/MasksController;)V

    iput-object v0, p0, Lcom/vk/masks/MasksController;->engineDataDownload:Lio/reactivex/functions/Function;

    .line 379
    new-instance v0, Lcom/vk/masks/MasksController$16;

    invoke-direct {v0, p0}, Lcom/vk/masks/MasksController$16;-><init>(Lcom/vk/masks/MasksController;)V

    iput-object v0, p0, Lcom/vk/masks/MasksController;->recentMasksSectionMap:Lio/reactivex/functions/Function;

    .line 63
    invoke-static {}, Lcom/vk/masks/MasksPrefs;->instance()Lcom/vk/masks/MasksPrefs;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/masks/MasksController;->masksPrefs:Lcom/vk/masks/MasksPrefs;

    .line 64
    invoke-static {}, Lcom/vk/masks/MasksStorage;->getInstance()Lcom/vk/masks/MasksStorage;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/masks/MasksController;->masksStorage:Lcom/vk/masks/MasksStorage;

    .line 65
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/vk/masks/MasksController;->currentMasksDownloads:Ljava/util/HashSet;

    .line 66
    invoke-static {}, Lcom/vk/media/camera/CameraEffects;->isSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    invoke-static {}, Lcom/vk/media/camera/CameraEffects;->getVersion()I

    move-result v0

    iput v0, p0, Lcom/vk/masks/MasksController;->masksEngineVersion:I

    .line 71
    :goto_0
    return-void

    .line 69
    :cond_0
    const v0, 0x7fffffff

    iput v0, p0, Lcom/vk/masks/MasksController;->masksEngineVersion:I

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/vk/masks/MasksController;)Lcom/vk/masks/MasksStorage;
    .locals 1
    .param p0, "x0"    # Lcom/vk/masks/MasksController;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/masks/MasksController;->masksStorage:Lcom/vk/masks/MasksStorage;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/masks/MasksController;)Lio/reactivex/functions/Function;
    .locals 1
    .param p0, "x0"    # Lcom/vk/masks/MasksController;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/masks/MasksController;->recentMasksSectionMap:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vk/masks/MasksController;)Lcom/vk/masks/MasksPrefs;
    .locals 1
    .param p0, "x0"    # Lcom/vk/masks/MasksController;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/masks/MasksController;->masksPrefs:Lcom/vk/masks/MasksPrefs;

    return-object v0
.end method

.method static synthetic access$300(Ljava/io/File;)Lio/reactivex/functions/Function;
    .locals 1
    .param p0, "x0"    # Ljava/io/File;

    .prologue
    .line 40
    invoke-static {p0}, Lcom/vk/masks/MasksController;->unzipFileMap(Ljava/io/File;)Lio/reactivex/functions/Function;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400()Lio/reactivex/functions/Function;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/vk/masks/MasksController;->roundUpProgressMap:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vk/masks/MasksController;)Ljava/util/HashSet;
    .locals 1
    .param p0, "x0"    # Lcom/vk/masks/MasksController;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/masks/MasksController;->currentMasksDownloads:Ljava/util/HashSet;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vk/masks/MasksController;Lio/reactivex/disposables/Disposable;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/masks/MasksController;
    .param p1, "x1"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/vk/masks/MasksController;->setMasksEngineModelDisposable(Lio/reactivex/disposables/Disposable;)V

    return-void
.end method

.method static synthetic access$702(Lcom/vk/masks/MasksController;Lio/reactivex/Observable;)Lio/reactivex/Observable;
    .locals 0
    .param p0, "x0"    # Lcom/vk/masks/MasksController;
    .param p1, "x1"    # Lio/reactivex/Observable;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/vk/masks/MasksController;->masksEngineModel:Lio/reactivex/Observable;

    return-object p1
.end method

.method static synthetic access$lambda$0(Lcom/vk/masks/MasksController;Lio/reactivex/disposables/Disposable;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/vk/masks/MasksController;->setMasksEngineModelDisposable(Lio/reactivex/disposables/Disposable;)V

    return-void
.end method

.method public static getInstance()Lcom/vk/masks/MasksController;
    .locals 2

    .prologue
    .line 45
    sget-object v0, Lcom/vk/masks/MasksController;->instance:Lcom/vk/masks/MasksController;

    if-nez v0, :cond_1

    .line 46
    const-class v1, Lcom/vk/masks/MasksController;

    monitor-enter v1

    .line 47
    :try_start_0
    sget-object v0, Lcom/vk/masks/MasksController;->instance:Lcom/vk/masks/MasksController;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Lcom/vk/masks/MasksController;

    invoke-direct {v0}, Lcom/vk/masks/MasksController;-><init>()V

    sput-object v0, Lcom/vk/masks/MasksController;->instance:Lcom/vk/masks/MasksController;

    .line 50
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    :cond_1
    sget-object v0, Lcom/vk/masks/MasksController;->instance:Lcom/vk/masks/MasksController;

    return-object v0

    .line 50
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private declared-synchronized setMasksEngineModelDisposable(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "masksEngineModelDisposable"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 304
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/vk/masks/MasksController;->masksEngineModelDisposable:Lio/reactivex/disposables/Disposable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 305
    monitor-exit p0

    return-void

    .line 304
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private static unzipFileMap(Ljava/io/File;)Lio/reactivex/functions/Function;
    .locals 1
    .param p0, "outputPath"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Lio/reactivex/functions/Function",
            "<",
            "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
            "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 319
    new-instance v0, Lcom/vk/masks/MasksController$13;

    invoke-direct {v0, p0}, Lcom/vk/masks/MasksController$13;-><init>(Ljava/io/File;)V

    return-object v0
.end method


# virtual methods
.method public checkMaskForUpdates(Lcom/vk/masks/model/Mask;)Lio/reactivex/Observable;
    .locals 2
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/masks/model/Mask;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Lcom/vk/masks/model/Mask;",
            ">;"
        }
    .end annotation

    .prologue
    .line 96
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/vk/masks/MasksController;->masksStorage:Lcom/vk/masks/MasksStorage;

    invoke-virtual {v0, p1}, Lcom/vk/masks/MasksStorage;->isDownloaded(Lcom/vk/masks/model/Mask;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    invoke-static {}, Lcom/vk/attachpicker/util/LocationUtils;->getLastKnownLocationRx()Lio/reactivex/Observable;

    move-result-object v0

    .line 98
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/masks/MasksController$3;

    invoke-direct {v1, p0, p1}, Lcom/vk/masks/MasksController$3;-><init>(Lcom/vk/masks/MasksController;Lcom/vk/masks/model/Mask;)V

    .line 99
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/masks/MasksController$2;

    invoke-direct {v1, p0}, Lcom/vk/masks/MasksController$2;-><init>(Lcom/vk/masks/MasksController;)V

    .line 109
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/masks/MasksController$1;

    invoke-direct {v1, p0, p1}, Lcom/vk/masks/MasksController$1;-><init>(Lcom/vk/masks/MasksController;Lcom/vk/masks/model/Mask;)V

    .line 115
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->doOnNext(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;

    move-result-object v0

    .line 123
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    .line 125
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized clear()V
    .locals 2

    .prologue
    .line 308
    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/vk/camera/CameraPrefs;->instance()Lcom/vk/camera/CameraPrefs;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/camera/CameraPrefs;->useMediaRecorder(Z)V

    .line 309
    iget-object v0, p0, Lcom/vk/masks/MasksController;->masksStorage:Lcom/vk/masks/MasksStorage;

    invoke-virtual {v0}, Lcom/vk/masks/MasksStorage;->clear()V

    .line 310
    invoke-virtual {p0}, Lcom/vk/masks/MasksController;->disposeMasksEngineModelGet()V

    .line 311
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/masks/MasksController;->masksEngineModel:Lio/reactivex/Observable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 312
    monitor-exit p0

    return-void

    .line 308
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized disposeMasksEngineModelGet()V
    .locals 1

    .prologue
    .line 297
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vk/masks/MasksController;->masksEngineModelDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    .line 298
    iget-object v0, p0, Lcom/vk/masks/MasksController;->masksEngineModelDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 299
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/masks/MasksController;->masksEngineModel:Lio/reactivex/Observable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 301
    :cond_0
    monitor-exit p0

    return-void

    .line 297
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getEngineModel()Lio/reactivex/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable",
            "<",
            "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 263
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vk/masks/MasksController;->masksEngineModel:Lio/reactivex/Observable;

    if-nez v0, :cond_0

    .line 264
    new-instance v0, Lcom/vkontakte/android/api/masks/MasksGetModel;

    invoke-static {}, Lcom/vk/media/camera/CameraEffects;->getVersion()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/masks/MasksGetModel;-><init>(I)V

    .line 265
    invoke-virtual {v0}, Lcom/vkontakte/android/api/masks/MasksGetModel;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    sget-object v1, Lcom/vkontakte/android/api/masks/MasksGetModel;->DEFAULT:Lcom/vkontakte/android/api/masks/MasksGetModel$MasksGetModelResponse;

    .line 266
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->onErrorReturnItem(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/masks/MasksController;->engineDataDownload:Lio/reactivex/functions/Function;

    .line 267
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    sget-object v1, Lcom/vk/masks/MasksController;->roundUpProgressMap:Lio/reactivex/functions/Function;

    .line 268
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    const/4 v1, 0x1

    .line 269
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->replay(I)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0}, Lcom/vk/masks/MasksController$$Lambda$1;->lambdaFactory$(Lcom/vk/masks/MasksController;)Lio/reactivex/functions/Consumer;

    move-result-object v2

    .line 270
    invoke-virtual {v0, v1, v2}, Lio/reactivex/observables/ConnectableObservable;->autoConnect(ILio/reactivex/functions/Consumer;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/masks/MasksController$12;

    invoke-direct {v1, p0}, Lcom/vk/masks/MasksController$12;-><init>(Lcom/vk/masks/MasksController;)V

    .line 271
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->doOnError(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/masks/MasksController$11;

    invoke-direct {v1, p0}, Lcom/vk/masks/MasksController$11;-><init>(Lcom/vk/masks/MasksController;)V

    .line 278
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->doOnDispose(Lio/reactivex/functions/Action;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/vk/masks/MasksController$10;

    invoke-direct {v1, p0}, Lcom/vk/masks/MasksController$10;-><init>(Lcom/vk/masks/MasksController;)V

    .line 284
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->doOnComplete(Lio/reactivex/functions/Action;)Lio/reactivex/Observable;

    move-result-object v0

    .line 290
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    .line 291
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/masks/MasksController;->masksEngineModel:Lio/reactivex/Observable;

    .line 293
    :cond_0
    iget-object v0, p0, Lcom/vk/masks/MasksController;->masksEngineModel:Lio/reactivex/Observable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 263
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getMask(Lcom/vk/masks/model/Mask;)Lio/reactivex/Observable;
    .locals 4
    .param p1, "maskModel"    # Lcom/vk/masks/model/Mask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/masks/model/Mask;",
            ")",
            "Lio/reactivex/Observable",
            "<",
            "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 185
    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->getFullId()Ljava/lang/String;

    move-result-object v1

    .line 187
    .local v1, "name":Ljava/lang/String;
    invoke-static {p1}, Lio/reactivex/Observable;->just(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v2

    .line 188
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v2

    new-instance v3, Lcom/vk/masks/MasksController$8;

    invoke-direct {v3, p0, p1, v1}, Lcom/vk/masks/MasksController$8;-><init>(Lcom/vk/masks/MasksController;Lcom/vk/masks/model/Mask;Ljava/lang/String;)V

    .line 189
    invoke-virtual {v2, v3}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    .line 248
    .local v0, "maskObservable":Lio/reactivex/Observable;, "Lio/reactivex/Observable<Lcom/vk/core/network/RxFileDownloader$DownloadEvent;>;"
    invoke-virtual {p0}, Lcom/vk/masks/MasksController;->getEngineModel()Lio/reactivex/Observable;

    move-result-object v2

    new-instance v3, Lcom/vk/masks/MasksController$9;

    invoke-direct {v3, p0}, Lcom/vk/masks/MasksController$9;-><init>(Lcom/vk/masks/MasksController;)V

    invoke-static {v0, v2, v3}, Lio/reactivex/Observable;->combineLatest(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Observable;

    move-result-object v2

    .line 259
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v2

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v2

    return-object v2
.end method

.method public getMasksEngineVersion()I
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lcom/vk/masks/MasksController;->masksEngineVersion:I

    return v0
.end method

.method public getSections(Z)Lio/reactivex/Observable;
    .locals 4
    .param p1, "onlyCache"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/MaskSection;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 152
    iget-object v2, p0, Lcom/vk/masks/MasksController;->masksPrefs:Lcom/vk/masks/MasksPrefs;

    .line 153
    invoke-virtual {v2}, Lcom/vk/masks/MasksPrefs;->getSections()Ljava/util/ArrayList;

    move-result-object v2

    invoke-static {v2}, Lio/reactivex/Observable;->just(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/masks/MasksController;->recentMasksSectionMap:Lio/reactivex/functions/Function;

    .line 154
    invoke-virtual {v2, v3}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v2

    new-instance v3, Lcom/vk/masks/MasksController$6;

    invoke-direct {v3, p0}, Lcom/vk/masks/MasksController$6;-><init>(Lcom/vk/masks/MasksController;)V

    .line 155
    invoke-virtual {v2, v3}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    .line 166
    .local v0, "cachedSections":Lio/reactivex/Observable;, "Lio/reactivex/Observable<Ljava/util/ArrayList<Lcom/vk/masks/model/MaskSection;>;>;"
    if-eqz p1, :cond_0

    .line 167
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v2

    invoke-virtual {v0, v2}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v2

    .line 180
    :goto_0
    return-object v2

    .line 169
    :cond_0
    new-instance v2, Lcom/vkontakte/android/api/masks/MasksGetSections;

    invoke-direct {v2}, Lcom/vkontakte/android/api/masks/MasksGetSections;-><init>()V

    .line 170
    invoke-virtual {v2}, Lcom/vkontakte/android/api/masks/MasksGetSections;->toObservable()Lio/reactivex/Observable;

    move-result-object v2

    .line 171
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v2

    new-instance v3, Lcom/vk/masks/MasksController$7;

    invoke-direct {v3, p0}, Lcom/vk/masks/MasksController$7;-><init>(Lcom/vk/masks/MasksController;)V

    .line 172
    invoke-virtual {v2, v3}, Lio/reactivex/Observable;->doOnNext(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/masks/MasksController;->recentMasksSectionMap:Lio/reactivex/functions/Function;

    .line 178
    invoke-virtual {v2, v3}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v1

    .line 179
    .local v1, "networkSections":Lio/reactivex/Observable;, "Lio/reactivex/Observable<Ljava/util/ArrayList<Lcom/vk/masks/model/MaskSection;>;>;"
    invoke-static {}, Lio/reactivex/Observable;->empty()Lio/reactivex/Observable;

    move-result-object v2

    invoke-virtual {v0, v2}, Lio/reactivex/Observable;->onErrorResumeNext(Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v2

    invoke-static {v2, v1}, Lio/reactivex/Observable;->concat(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)Lio/reactivex/Observable;

    move-result-object v2

    .line 180
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v2

    goto :goto_0
.end method

.method public isMasksAvailable()Z
    .locals 1

    .prologue
    .line 74
    invoke-static {}, Lcom/vk/media/camera/CameraEffects;->isSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isMasksAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public markSectionAsViewed(I)Lio/reactivex/Observable;
    .locals 3
    .param p1, "sectionId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lio/reactivex/Observable",
            "<",
            "Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;",
            ">;"
        }
    .end annotation

    .prologue
    .line 130
    new-instance v1, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed;

    invoke-direct {v1, p1}, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed;-><init>(I)V

    .line 131
    invoke-virtual {v1}, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    .line 134
    .local v0, "observable":Lio/reactivex/Observable;, "Lio/reactivex/Observable<Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;>;"
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v1

    new-instance v2, Lcom/vk/masks/MasksController$5;

    invoke-direct {v2, p0}, Lcom/vk/masks/MasksController$5;-><init>(Lcom/vk/masks/MasksController;)V

    .line 135
    invoke-virtual {v1, v2}, Lio/reactivex/Observable;->doOnNext(Lio/reactivex/functions/Consumer;)Lio/reactivex/Observable;

    move-result-object v1

    new-instance v2, Lcom/vk/masks/MasksController$4;

    invoke-direct {v2, p0}, Lcom/vk/masks/MasksController$4;-><init>(Lcom/vk/masks/MasksController;)V

    .line 141
    invoke-virtual {v1, v2}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v1

    .line 148
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v1

    return-object v1
.end method

.method public needDownload(Lcom/vk/masks/model/Mask;)Z
    .locals 2
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;

    .prologue
    const/4 v0, 0x0

    .line 82
    iget-object v1, p0, Lcom/vk/masks/MasksController;->masksStorage:Lcom/vk/masks/MasksStorage;

    invoke-virtual {v1, p1}, Lcom/vk/masks/MasksStorage;->isDownloaded(Lcom/vk/masks/model/Mask;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 85
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lcom/vk/masks/MasksController;->currentMasksDownloads:Ljava/util/HashSet;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public raiseMask(Lcom/vk/masks/model/Mask;)V
    .locals 1
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 90
    if-eqz p1, :cond_0

    .line 91
    iget-object v0, p0, Lcom/vk/masks/MasksController;->masksStorage:Lcom/vk/masks/MasksStorage;

    invoke-virtual {v0, p1}, Lcom/vk/masks/MasksStorage;->raiseMask(Lcom/vk/masks/model/Mask;)V

    .line 93
    :cond_0
    return-void
.end method

.method public recentMasks()Lcom/vkontakte/android/api/masks/MasksResponse;
    .locals 2

    .prologue
    .line 315
    new-instance v0, Lcom/vkontakte/android/api/masks/MasksResponse;

    iget-object v1, p0, Lcom/vk/masks/MasksController;->masksStorage:Lcom/vk/masks/MasksStorage;

    invoke-virtual {v1}, Lcom/vk/masks/MasksStorage;->recentMasks()Lcom/vkontakte/android/data/VKList;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/masks/MasksResponse;-><init>(Lcom/vkontakte/android/data/VKList;)V

    return-object v0
.end method
