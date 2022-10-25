.class public final Lio/reactivex/internal/schedulers/SchedulerPoolFactory;
.super Ljava/lang/Object;
.source "SchedulerPoolFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/schedulers/SchedulerPoolFactory$ScheduledTask;
    }
.end annotation


# static fields
.field static final POOLS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/concurrent/ScheduledThreadPoolExecutor;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final PURGE_ENABLED:Z

.field static final PURGE_ENABLED_KEY:Ljava/lang/String; = "rx2.purge-enabled"

.field public static final PURGE_PERIOD_SECONDS:I

.field static final PURGE_PERIOD_SECONDS_KEY:Ljava/lang/String; = "rx2.purge-period-seconds"

.field static final PURGE_THREAD:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 48
    new-instance v3, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v3}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    sput-object v3, Lio/reactivex/internal/schedulers/SchedulerPoolFactory;->PURGE_THREAD:Ljava/util/concurrent/atomic/AtomicReference;

    .line 53
    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v3, Lio/reactivex/internal/schedulers/SchedulerPoolFactory;->POOLS:Ljava/util/Map;

    .line 86
    const/4 v1, 0x1

    .line 87
    .local v1, "purgeEnable":Z
    const/4 v2, 0x1

    .line 89
    .local v2, "purgePeriod":I
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v0

    .line 91
    .local v0, "properties":Ljava/util/Properties;
    const-string/jumbo v3, "rx2.purge-enabled"

    invoke-virtual {v0, v3}, Ljava/util/Properties;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 92
    const-string/jumbo v3, "rx2.purge-enabled"

    invoke-static {v3}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    .line 94
    if-eqz v1, :cond_0

    const-string/jumbo v3, "rx2.purge-period-seconds"

    invoke-virtual {v0, v3}, Ljava/util/Properties;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 95
    const-string/jumbo v3, "rx2.purge-period-seconds"

    invoke-static {v3, v2}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 99
    :cond_0
    sput-boolean v1, Lio/reactivex/internal/schedulers/SchedulerPoolFactory;->PURGE_ENABLED:Z

    .line 100
    sput v2, Lio/reactivex/internal/schedulers/SchedulerPoolFactory;->PURGE_PERIOD_SECONDS:I

    .line 102
    invoke-static {}, Lio/reactivex/internal/schedulers/SchedulerPoolFactory;->start()V

    .line 103
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "No instances!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static create(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 3
    .param p0, "factory"    # Ljava/util/concurrent/ThreadFactory;

    .prologue
    .line 111
    const/4 v2, 0x1

    invoke-static {v2, p0}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    .line 112
    .local v1, "exec":Ljava/util/concurrent/ScheduledExecutorService;
    instance-of v2, v1, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    if-eqz v2, :cond_0

    move-object v0, v1

    .line 113
    check-cast v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 114
    .local v0, "e":Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    sget-object v2, Lio/reactivex/internal/schedulers/SchedulerPoolFactory;->POOLS:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .end local v0    # "e":Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    :cond_0
    return-object v1
.end method

.method public static shutdown()V
    .locals 1

    .prologue
    .line 81
    sget-object v0, Lio/reactivex/internal/schedulers/SchedulerPoolFactory;->PURGE_THREAD:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdownNow()Ljava/util/List;

    .line 82
    sget-object v0, Lio/reactivex/internal/schedulers/SchedulerPoolFactory;->POOLS:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 83
    return-void
.end method

.method public static start()V
    .locals 8

    .prologue
    .line 61
    .local v0, "next":Ljava/util/concurrent/ScheduledExecutorService;
    .local v7, "curr":Ljava/util/concurrent/ScheduledExecutorService;
    :goto_0
    sget-object v1, Lio/reactivex/internal/schedulers/SchedulerPoolFactory;->PURGE_THREAD:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "curr":Ljava/util/concurrent/ScheduledExecutorService;
    check-cast v7, Ljava/util/concurrent/ScheduledExecutorService;

    .line 62
    .restart local v7    # "curr":Ljava/util/concurrent/ScheduledExecutorService;
    if-eqz v7, :cond_0

    .end local v0    # "next":Ljava/util/concurrent/ScheduledExecutorService;
    invoke-interface {v7}, Ljava/util/concurrent/ScheduledExecutorService;->isShutdown()Z

    move-result v1

    if-nez v1, :cond_0

    .line 70
    :goto_1
    return-void

    .line 65
    :cond_0
    const/4 v1, 0x1

    new-instance v2, Lio/reactivex/internal/schedulers/RxThreadFactory;

    const-string/jumbo v3, "RxSchedulerPurge"

    invoke-direct {v2, v3}, Lio/reactivex/internal/schedulers/RxThreadFactory;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v2}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    .line 66
    .restart local v0    # "next":Ljava/util/concurrent/ScheduledExecutorService;
    sget-object v1, Lio/reactivex/internal/schedulers/SchedulerPoolFactory;->PURGE_THREAD:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v7, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 68
    new-instance v1, Lio/reactivex/internal/schedulers/SchedulerPoolFactory$ScheduledTask;

    invoke-direct {v1}, Lio/reactivex/internal/schedulers/SchedulerPoolFactory$ScheduledTask;-><init>()V

    sget v2, Lio/reactivex/internal/schedulers/SchedulerPoolFactory;->PURGE_PERIOD_SECONDS:I

    int-to-long v2, v2

    sget v4, Lio/reactivex/internal/schedulers/SchedulerPoolFactory;->PURGE_PERIOD_SECONDS:I

    int-to-long v4, v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    goto :goto_1

    .line 72
    :cond_1
    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdownNow()Ljava/util/List;

    goto :goto_0
.end method
