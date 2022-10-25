.class public Lio/fabric/sdk/android/Fabric;
.super Ljava/lang/Object;
.source "Fabric.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/fabric/sdk/android/Fabric$Builder;
    }
.end annotation


# static fields
.field static final DEFAULT_DEBUGGABLE:Z = false

.field static final DEFAULT_LOGGER:Lio/fabric/sdk/android/Logger;

.field static final ROOT_DIR:Ljava/lang/String; = ".Fabric"

.field public static final TAG:Ljava/lang/String; = "Fabric"

.field static volatile singleton:Lio/fabric/sdk/android/Fabric;


# instance fields
.field private activity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private activityLifecycleManager:Lio/fabric/sdk/android/ActivityLifecycleManager;

.field private final context:Landroid/content/Context;

.field final debuggable:Z

.field private final executorService:Ljava/util/concurrent/ExecutorService;

.field private final idManager:Lio/fabric/sdk/android/services/common/IdManager;

.field private final initializationCallback:Lio/fabric/sdk/android/InitializationCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/fabric/sdk/android/InitializationCallback",
            "<",
            "Lio/fabric/sdk/android/Fabric;",
            ">;"
        }
    .end annotation
.end field

.field private initialized:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final kitInitializationCallback:Lio/fabric/sdk/android/InitializationCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/fabric/sdk/android/InitializationCallback",
            "<*>;"
        }
    .end annotation
.end field

.field private final kits:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lio/fabric/sdk/android/Kit;",
            ">;",
            "Lio/fabric/sdk/android/Kit;",
            ">;"
        }
    .end annotation
.end field

.field final logger:Lio/fabric/sdk/android/Logger;

.field private final mainHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    new-instance v0, Lio/fabric/sdk/android/DefaultLogger;

    invoke-direct {v0}, Lio/fabric/sdk/android/DefaultLogger;-><init>()V

    sput-object v0, Lio/fabric/sdk/android/Fabric;->DEFAULT_LOGGER:Lio/fabric/sdk/android/Logger;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/util/Map;Lio/fabric/sdk/android/services/concurrency/PriorityThreadPoolExecutor;Landroid/os/Handler;Lio/fabric/sdk/android/Logger;ZLio/fabric/sdk/android/InitializationCallback;Lio/fabric/sdk/android/services/common/IdManager;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "threadPoolExecutor"    # Lio/fabric/sdk/android/services/concurrency/PriorityThreadPoolExecutor;
    .param p4, "mainHandler"    # Landroid/os/Handler;
    .param p5, "logger"    # Lio/fabric/sdk/android/Logger;
    .param p6, "debuggable"    # Z
    .param p7, "callback"    # Lio/fabric/sdk/android/InitializationCallback;
    .param p8, "idManager"    # Lio/fabric/sdk/android/services/common/IdManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lio/fabric/sdk/android/Kit;",
            ">;",
            "Lio/fabric/sdk/android/Kit;",
            ">;",
            "Lio/fabric/sdk/android/services/concurrency/PriorityThreadPoolExecutor;",
            "Landroid/os/Handler;",
            "Lio/fabric/sdk/android/Logger;",
            "Z",
            "Lio/fabric/sdk/android/InitializationCallback;",
            "Lio/fabric/sdk/android/services/common/IdManager;",
            ")V"
        }
    .end annotation

    .prologue
    .line 283
    .local p2, "kits":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<+Lio/fabric/sdk/android/Kit;>;Lio/fabric/sdk/android/Kit;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 284
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lio/fabric/sdk/android/Fabric;->context:Landroid/content/Context;

    .line 285
    iput-object p2, p0, Lio/fabric/sdk/android/Fabric;->kits:Ljava/util/Map;

    .line 286
    iput-object p3, p0, Lio/fabric/sdk/android/Fabric;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 287
    iput-object p4, p0, Lio/fabric/sdk/android/Fabric;->mainHandler:Landroid/os/Handler;

    .line 288
    iput-object p5, p0, Lio/fabric/sdk/android/Fabric;->logger:Lio/fabric/sdk/android/Logger;

    .line 289
    iput-boolean p6, p0, Lio/fabric/sdk/android/Fabric;->debuggable:Z

    .line 290
    iput-object p7, p0, Lio/fabric/sdk/android/Fabric;->initializationCallback:Lio/fabric/sdk/android/InitializationCallback;

    .line 291
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lio/fabric/sdk/android/Fabric;->initialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 292
    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result v0

    invoke-virtual {p0, v0}, Lio/fabric/sdk/android/Fabric;->createKitInitializationCallback(I)Lio/fabric/sdk/android/InitializationCallback;

    move-result-object v0

    iput-object v0, p0, Lio/fabric/sdk/android/Fabric;->kitInitializationCallback:Lio/fabric/sdk/android/InitializationCallback;

    .line 293
    iput-object p8, p0, Lio/fabric/sdk/android/Fabric;->idManager:Lio/fabric/sdk/android/services/common/IdManager;

    .line 294
    invoke-direct {p0, p1}, Lio/fabric/sdk/android/Fabric;->extractActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/fabric/sdk/android/Fabric;->setCurrentActivity(Landroid/app/Activity;)Lio/fabric/sdk/android/Fabric;

    .line 295
    return-void
.end method

.method static synthetic access$000(Ljava/util/Collection;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Ljava/util/Collection;

    .prologue
    .line 48
    invoke-static {p0}, Lio/fabric/sdk/android/Fabric;->getKitMap(Ljava/util/Collection;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lio/fabric/sdk/android/Fabric;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1
    .param p0, "x0"    # Lio/fabric/sdk/android/Fabric;

    .prologue
    .line 48
    iget-object v0, p0, Lio/fabric/sdk/android/Fabric;->initialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic access$200(Lio/fabric/sdk/android/Fabric;)Lio/fabric/sdk/android/InitializationCallback;
    .locals 1
    .param p0, "x0"    # Lio/fabric/sdk/android/Fabric;

    .prologue
    .line 48
    iget-object v0, p0, Lio/fabric/sdk/android/Fabric;->initializationCallback:Lio/fabric/sdk/android/InitializationCallback;

    return-object v0
.end method

.method private static addToKitMap(Ljava/util/Map;Ljava/util/Collection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lio/fabric/sdk/android/Kit;",
            ">;",
            "Lio/fabric/sdk/android/Kit;",
            ">;",
            "Ljava/util/Collection",
            "<+",
            "Lio/fabric/sdk/android/Kit;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 580
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<+Lio/fabric/sdk/android/Kit;>;Lio/fabric/sdk/android/Kit;>;"
    .local p1, "kits":Ljava/util/Collection;, "Ljava/util/Collection<+Lio/fabric/sdk/android/Kit;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/fabric/sdk/android/Kit;

    .line 581
    .local v0, "kit":Lio/fabric/sdk/android/Kit;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-interface {p0, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 583
    instance-of v2, v0, Lio/fabric/sdk/android/KitGroup;

    if-eqz v2, :cond_0

    .line 584
    check-cast v0, Lio/fabric/sdk/android/KitGroup;

    .end local v0    # "kit":Lio/fabric/sdk/android/Kit;
    invoke-interface {v0}, Lio/fabric/sdk/android/KitGroup;->getKits()Ljava/util/Collection;

    move-result-object v2

    invoke-static {p0, v2}, Lio/fabric/sdk/android/Fabric;->addToKitMap(Ljava/util/Map;Ljava/util/Collection;)V

    goto :goto_0

    .line 587
    :cond_1
    return-void
.end method

.method private extractActivity(Landroid/content/Context;)Landroid/app/Activity;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 488
    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 489
    check-cast p1, Landroid/app/Activity;

    .line 491
    .end local p1    # "context":Landroid/content/Context;
    :goto_0
    return-object p1

    .restart local p1    # "context":Landroid/content/Context;
    :cond_0
    const/4 p1, 0x0

    goto :goto_0
.end method

.method public static getKit(Ljava/lang/Class;)Lio/fabric/sdk/android/Kit;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lio/fabric/sdk/android/Kit;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 524
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->singleton()Lio/fabric/sdk/android/Fabric;

    move-result-object v0

    iget-object v0, v0, Lio/fabric/sdk/android/Fabric;->kits:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/fabric/sdk/android/Kit;

    return-object v0
.end method

.method private static getKitMap(Ljava/util/Collection;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Lio/fabric/sdk/android/Kit;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lio/fabric/sdk/android/Kit;",
            ">;",
            "Lio/fabric/sdk/android/Kit;",
            ">;"
        }
    .end annotation

    .prologue
    .line 569
    .local p0, "kits":Ljava/util/Collection;, "Ljava/util/Collection<+Lio/fabric/sdk/android/Kit;>;"
    new-instance v0, Ljava/util/HashMap;

    .line 570
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 572
    .local v0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Class<+Lio/fabric/sdk/android/Kit;>;Lio/fabric/sdk/android/Kit;>;"
    invoke-static {v0, p0}, Lio/fabric/sdk/android/Fabric;->addToKitMap(Ljava/util/Map;Ljava/util/Collection;)V

    .line 574
    return-object v0
.end method

.method public static getLogger()Lio/fabric/sdk/android/Logger;
    .locals 1

    .prologue
    .line 531
    sget-object v0, Lio/fabric/sdk/android/Fabric;->singleton:Lio/fabric/sdk/android/Fabric;

    if-nez v0, :cond_0

    .line 532
    sget-object v0, Lio/fabric/sdk/android/Fabric;->DEFAULT_LOGGER:Lio/fabric/sdk/android/Logger;

    .line 534
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lio/fabric/sdk/android/Fabric;->singleton:Lio/fabric/sdk/android/Fabric;

    iget-object v0, v0, Lio/fabric/sdk/android/Fabric;->logger:Lio/fabric/sdk/android/Logger;

    goto :goto_0
.end method

.method private init()V
    .locals 2

    .prologue
    .line 364
    new-instance v0, Lio/fabric/sdk/android/ActivityLifecycleManager;

    iget-object v1, p0, Lio/fabric/sdk/android/Fabric;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lio/fabric/sdk/android/ActivityLifecycleManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lio/fabric/sdk/android/Fabric;->activityLifecycleManager:Lio/fabric/sdk/android/ActivityLifecycleManager;

    .line 365
    iget-object v0, p0, Lio/fabric/sdk/android/Fabric;->activityLifecycleManager:Lio/fabric/sdk/android/ActivityLifecycleManager;

    new-instance v1, Lio/fabric/sdk/android/Fabric$1;

    invoke-direct {v1, p0}, Lio/fabric/sdk/android/Fabric$1;-><init>(Lio/fabric/sdk/android/Fabric;)V

    invoke-virtual {v0, v1}, Lio/fabric/sdk/android/ActivityLifecycleManager;->registerCallbacks(Lio/fabric/sdk/android/ActivityLifecycleManager$Callbacks;)Z

    .line 383
    iget-object v0, p0, Lio/fabric/sdk/android/Fabric;->context:Landroid/content/Context;

    invoke-virtual {p0, v0}, Lio/fabric/sdk/android/Fabric;->initializeKits(Landroid/content/Context;)V

    .line 384
    return-void
.end method

.method public static isDebuggable()Z
    .locals 1

    .prologue
    .line 541
    sget-object v0, Lio/fabric/sdk/android/Fabric;->singleton:Lio/fabric/sdk/android/Fabric;

    if-nez v0, :cond_0

    .line 542
    const/4 v0, 0x0

    .line 544
    :goto_0
    return v0

    :cond_0
    sget-object v0, Lio/fabric/sdk/android/Fabric;->singleton:Lio/fabric/sdk/android/Fabric;

    iget-boolean v0, v0, Lio/fabric/sdk/android/Fabric;->debuggable:Z

    goto :goto_0
.end method

.method public static isInitialized()Z
    .locals 1

    .prologue
    .line 551
    sget-object v0, Lio/fabric/sdk/android/Fabric;->singleton:Lio/fabric/sdk/android/Fabric;

    if-eqz v0, :cond_0

    sget-object v0, Lio/fabric/sdk/android/Fabric;->singleton:Lio/fabric/sdk/android/Fabric;

    iget-object v0, v0, Lio/fabric/sdk/android/Fabric;->initialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static setFabric(Lio/fabric/sdk/android/Fabric;)V
    .locals 0
    .param p0, "fabric"    # Lio/fabric/sdk/android/Fabric;

    .prologue
    .line 340
    sput-object p0, Lio/fabric/sdk/android/Fabric;->singleton:Lio/fabric/sdk/android/Fabric;

    .line 341
    invoke-direct {p0}, Lio/fabric/sdk/android/Fabric;->init()V

    .line 342
    return-void
.end method

.method static singleton()Lio/fabric/sdk/android/Fabric;
    .locals 2

    .prologue
    .line 272
    sget-object v0, Lio/fabric/sdk/android/Fabric;->singleton:Lio/fabric/sdk/android/Fabric;

    if-nez v0, :cond_0

    .line 273
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Must Initialize Fabric before using singleton()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 275
    :cond_0
    sget-object v0, Lio/fabric/sdk/android/Fabric;->singleton:Lio/fabric/sdk/android/Fabric;

    return-object v0
.end method

.method public static varargs with(Landroid/content/Context;[Lio/fabric/sdk/android/Kit;)Lio/fabric/sdk/android/Fabric;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "kits"    # [Lio/fabric/sdk/android/Kit;

    .prologue
    .line 309
    sget-object v0, Lio/fabric/sdk/android/Fabric;->singleton:Lio/fabric/sdk/android/Fabric;

    if-nez v0, :cond_1

    .line 310
    const-class v1, Lio/fabric/sdk/android/Fabric;

    monitor-enter v1

    .line 311
    :try_start_0
    sget-object v0, Lio/fabric/sdk/android/Fabric;->singleton:Lio/fabric/sdk/android/Fabric;

    if-nez v0, :cond_0

    .line 312
    new-instance v0, Lio/fabric/sdk/android/Fabric$Builder;

    invoke-direct {v0, p0}, Lio/fabric/sdk/android/Fabric$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Lio/fabric/sdk/android/Fabric$Builder;->kits([Lio/fabric/sdk/android/Kit;)Lio/fabric/sdk/android/Fabric$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lio/fabric/sdk/android/Fabric$Builder;->build()Lio/fabric/sdk/android/Fabric;

    move-result-object v0

    invoke-static {v0}, Lio/fabric/sdk/android/Fabric;->setFabric(Lio/fabric/sdk/android/Fabric;)V

    .line 314
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 316
    :cond_1
    sget-object v0, Lio/fabric/sdk/android/Fabric;->singleton:Lio/fabric/sdk/android/Fabric;

    return-object v0

    .line 314
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public static with(Lio/fabric/sdk/android/Fabric;)Lio/fabric/sdk/android/Fabric;
    .locals 2
    .param p0, "fabric"    # Lio/fabric/sdk/android/Fabric;

    .prologue
    .line 329
    sget-object v0, Lio/fabric/sdk/android/Fabric;->singleton:Lio/fabric/sdk/android/Fabric;

    if-nez v0, :cond_1

    .line 330
    const-class v1, Lio/fabric/sdk/android/Fabric;

    monitor-enter v1

    .line 331
    :try_start_0
    sget-object v0, Lio/fabric/sdk/android/Fabric;->singleton:Lio/fabric/sdk/android/Fabric;

    if-nez v0, :cond_0

    .line 332
    invoke-static {p0}, Lio/fabric/sdk/android/Fabric;->setFabric(Lio/fabric/sdk/android/Fabric;)V

    .line 334
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 336
    :cond_1
    sget-object v0, Lio/fabric/sdk/android/Fabric;->singleton:Lio/fabric/sdk/android/Fabric;

    return-object v0

    .line 334
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method addAnnotatedDependencies(Ljava/util/Map;Lio/fabric/sdk/android/Kit;)V
    .locals 9
    .param p2, "dependentKit"    # Lio/fabric/sdk/android/Kit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lio/fabric/sdk/android/Kit;",
            ">;",
            "Lio/fabric/sdk/android/Kit;",
            ">;",
            "Lio/fabric/sdk/android/Kit;",
            ")V"
        }
    .end annotation

    .prologue
    .line 460
    .local p1, "kits":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<+Lio/fabric/sdk/android/Kit;>;Lio/fabric/sdk/android/Kit;>;"
    iget-object v2, p2, Lio/fabric/sdk/android/Kit;->dependsOnAnnotation:Lio/fabric/sdk/android/services/concurrency/DependsOn;

    .line 461
    .local v2, "dependsOn":Lio/fabric/sdk/android/services/concurrency/DependsOn;
    if-eqz v2, :cond_4

    .line 462
    invoke-interface {v2}, Lio/fabric/sdk/android/services/concurrency/DependsOn;->value()[Ljava/lang/Class;

    move-result-object v0

    .line 463
    .local v0, "dependencies":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v6, v0

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v6, :cond_4

    aget-object v1, v0, v5

    .line 464
    .local v1, "dependency":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->isInterface()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 466
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/fabric/sdk/android/Kit;

    .line 467
    .local v3, "kit":Lio/fabric/sdk/android/Kit;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 468
    iget-object v7, p2, Lio/fabric/sdk/android/Kit;->initializationTask:Lio/fabric/sdk/android/InitializationTask;

    iget-object v8, v3, Lio/fabric/sdk/android/Kit;->initializationTask:Lio/fabric/sdk/android/InitializationTask;

    invoke-virtual {v7, v8}, Lio/fabric/sdk/android/InitializationTask;->addDependency(Lio/fabric/sdk/android/services/concurrency/Task;)V

    goto :goto_1

    .line 474
    .end local v3    # "kit":Lio/fabric/sdk/android/Kit;
    :cond_1
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/fabric/sdk/android/Kit;

    .line 475
    .restart local v3    # "kit":Lio/fabric/sdk/android/Kit;
    if-nez v3, :cond_2

    .line 476
    new-instance v4, Lio/fabric/sdk/android/services/concurrency/UnmetDependencyException;

    const-string/jumbo v5, "Referenced Kit was null, does the kit exist?"

    invoke-direct {v4, v5}, Lio/fabric/sdk/android/services/concurrency/UnmetDependencyException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 480
    :cond_2
    iget-object v7, p2, Lio/fabric/sdk/android/Kit;->initializationTask:Lio/fabric/sdk/android/InitializationTask;

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/fabric/sdk/android/Kit;

    iget-object v4, v4, Lio/fabric/sdk/android/Kit;->initializationTask:Lio/fabric/sdk/android/InitializationTask;

    invoke-virtual {v7, v4}, Lio/fabric/sdk/android/InitializationTask;->addDependency(Lio/fabric/sdk/android/services/concurrency/Task;)V

    .line 463
    .end local v3    # "kit":Lio/fabric/sdk/android/Kit;
    :cond_3
    add-int/lit8 v4, v5, 0x1

    move v5, v4

    goto :goto_0

    .line 485
    .end local v0    # "dependencies":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v1    # "dependency":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_4
    return-void
.end method

.method createKitInitializationCallback(I)Lio/fabric/sdk/android/InitializationCallback;
    .locals 1
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lio/fabric/sdk/android/InitializationCallback",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 590
    new-instance v0, Lio/fabric/sdk/android/Fabric$2;

    invoke-direct {v0, p0, p1}, Lio/fabric/sdk/android/Fabric$2;-><init>(Lio/fabric/sdk/android/Fabric;I)V

    return-object v0
.end method

.method public getActivityLifecycleManager()Lio/fabric/sdk/android/ActivityLifecycleManager;
    .locals 1

    .prologue
    .line 496
    iget-object v0, p0, Lio/fabric/sdk/android/Fabric;->activityLifecycleManager:Lio/fabric/sdk/android/ActivityLifecycleManager;

    return-object v0
.end method

.method public getAppIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 558
    iget-object v0, p0, Lio/fabric/sdk/android/Fabric;->idManager:Lio/fabric/sdk/android/services/common/IdManager;

    invoke-virtual {v0}, Lio/fabric/sdk/android/services/common/IdManager;->getAppIdentifier()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAppInstallIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 565
    iget-object v0, p0, Lio/fabric/sdk/android/Fabric;->idManager:Lio/fabric/sdk/android/services/common/IdManager;

    invoke-virtual {v0}, Lio/fabric/sdk/android/services/common/IdManager;->getAppInstallIdentifier()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 357
    iget-object v0, p0, Lio/fabric/sdk/android/Fabric;->activity:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    .line 358
    iget-object v0, p0, Lio/fabric/sdk/android/Fabric;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 360
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getExecutorService()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .prologue
    .line 500
    iget-object v0, p0, Lio/fabric/sdk/android/Fabric;->executorService:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 398
    const-string/jumbo v0, "io.fabric.sdk.android:fabric"

    return-object v0
.end method

.method public getKits()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lio/fabric/sdk/android/Kit;",
            ">;"
        }
    .end annotation

    .prologue
    .line 511
    iget-object v0, p0, Lio/fabric/sdk/android/Fabric;->kits:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method getKitsFinderFuture(Landroid/content/Context;)Ljava/util/concurrent/Future;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lio/fabric/sdk/android/KitInfo;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 613
    new-instance v1, Lio/fabric/sdk/android/FabricKitsFinder;

    .line 614
    invoke-virtual {p1}, Landroid/content/Context;->getPackageCodePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lio/fabric/sdk/android/FabricKitsFinder;-><init>(Ljava/lang/String;)V

    .line 615
    .local v1, "fabricKitsFinder":Lio/fabric/sdk/android/FabricKitsFinder;
    invoke-virtual {p0}, Lio/fabric/sdk/android/Fabric;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 616
    .local v0, "executorService":Ljava/util/concurrent/ExecutorService;
    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v2

    return-object v2
.end method

.method public getMainHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 504
    iget-object v0, p0, Lio/fabric/sdk/android/Fabric;->mainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 390
    const-string/jumbo v0, "1.3.16.dev"

    return-object v0
.end method

.method initializeKits(Landroid/content/Context;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 403
    .line 404
    invoke-virtual {p0, p1}, Lio/fabric/sdk/android/Fabric;->getKitsFinderFuture(Landroid/content/Context;)Ljava/util/concurrent/Future;

    move-result-object v1

    .line 406
    .local v1, "installedKitsFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/util/Map<Ljava/lang/String;Lio/fabric/sdk/android/KitInfo;>;>;"
    invoke-virtual {p0}, Lio/fabric/sdk/android/Fabric;->getKits()Ljava/util/Collection;

    move-result-object v5

    .line 407
    .local v5, "providedKits":Ljava/util/Collection;, "Ljava/util/Collection<Lio/fabric/sdk/android/Kit;>;"
    new-instance v4, Lio/fabric/sdk/android/Onboarding;

    invoke-direct {v4, v1, v5}, Lio/fabric/sdk/android/Onboarding;-><init>(Ljava/util/concurrent/Future;Ljava/util/Collection;)V

    .line 408
    .local v4, "onboarding":Lio/fabric/sdk/android/Onboarding;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 409
    .local v3, "kits":Ljava/util/List;, "Ljava/util/List<Lio/fabric/sdk/android/Kit;>;"
    invoke-static {v3}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 413
    sget-object v6, Lio/fabric/sdk/android/InitializationCallback;->EMPTY:Lio/fabric/sdk/android/InitializationCallback;

    iget-object v7, p0, Lio/fabric/sdk/android/Fabric;->idManager:Lio/fabric/sdk/android/services/common/IdManager;

    invoke-virtual {v4, p1, p0, v6, v7}, Lio/fabric/sdk/android/Onboarding;->injectParameters(Landroid/content/Context;Lio/fabric/sdk/android/Fabric;Lio/fabric/sdk/android/InitializationCallback;Lio/fabric/sdk/android/services/common/IdManager;)V

    .line 414
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/fabric/sdk/android/Kit;

    .line 415
    .local v2, "kit":Lio/fabric/sdk/android/Kit;
    iget-object v7, p0, Lio/fabric/sdk/android/Fabric;->kitInitializationCallback:Lio/fabric/sdk/android/InitializationCallback;

    iget-object v8, p0, Lio/fabric/sdk/android/Fabric;->idManager:Lio/fabric/sdk/android/services/common/IdManager;

    invoke-virtual {v2, p1, p0, v7, v8}, Lio/fabric/sdk/android/Kit;->injectParameters(Landroid/content/Context;Lio/fabric/sdk/android/Fabric;Lio/fabric/sdk/android/InitializationCallback;Lio/fabric/sdk/android/services/common/IdManager;)V

    goto :goto_0

    .line 420
    .end local v2    # "kit":Lio/fabric/sdk/android/Kit;
    :cond_0
    invoke-virtual {v4}, Lio/fabric/sdk/android/Onboarding;->initialize()V

    .line 424
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v6

    const-string/jumbo v7, "Fabric"

    const/4 v8, 0x3

    invoke-interface {v6, v7, v8}, Lio/fabric/sdk/android/Logger;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 425
    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "Initializing "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 426
    invoke-virtual {p0}, Lio/fabric/sdk/android/Fabric;->getIdentifier()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " [Version: "

    .line 427
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 428
    invoke-virtual {p0}, Lio/fabric/sdk/android/Fabric;->getVersion()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "], with the following kits:\n"

    .line 429
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 434
    .local v0, "initInfo":Ljava/lang/StringBuilder;
    :goto_1
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_1
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/fabric/sdk/android/Kit;

    .line 435
    .restart local v2    # "kit":Lio/fabric/sdk/android/Kit;
    iget-object v7, v2, Lio/fabric/sdk/android/Kit;->initializationTask:Lio/fabric/sdk/android/InitializationTask;

    iget-object v8, v4, Lio/fabric/sdk/android/Onboarding;->initializationTask:Lio/fabric/sdk/android/InitializationTask;

    invoke-virtual {v7, v8}, Lio/fabric/sdk/android/InitializationTask;->addDependency(Lio/fabric/sdk/android/services/concurrency/Task;)V

    .line 437
    iget-object v7, p0, Lio/fabric/sdk/android/Fabric;->kits:Ljava/util/Map;

    invoke-virtual {p0, v7, v2}, Lio/fabric/sdk/android/Fabric;->addAnnotatedDependencies(Ljava/util/Map;Lio/fabric/sdk/android/Kit;)V

    .line 439
    invoke-virtual {v2}, Lio/fabric/sdk/android/Kit;->initialize()V

    .line 441
    if-eqz v0, :cond_1

    .line 442
    invoke-virtual {v2}, Lio/fabric/sdk/android/Kit;->getIdentifier()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " [Version: "

    .line 443
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 444
    invoke-virtual {v2}, Lio/fabric/sdk/android/Kit;->getVersion()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "]\n"

    .line 445
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 431
    .end local v0    # "initInfo":Ljava/lang/StringBuilder;
    .end local v2    # "kit":Lio/fabric/sdk/android/Kit;
    :cond_2
    const/4 v0, 0x0

    .restart local v0    # "initInfo":Ljava/lang/StringBuilder;
    goto :goto_1

    .line 449
    :cond_3
    if-eqz v0, :cond_4

    .line 450
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v6

    const-string/jumbo v7, "Fabric"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 452
    :cond_4
    return-void
.end method

.method public setCurrentActivity(Landroid/app/Activity;)Lio/fabric/sdk/android/Fabric;
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 348
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/fabric/sdk/android/Fabric;->activity:Ljava/lang/ref/WeakReference;

    .line 349
    return-object p0
.end method
