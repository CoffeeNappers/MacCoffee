.class final Lio/reactivex/internal/schedulers/SchedulerPoolFactory$ScheduledTask;
.super Ljava/lang/Object;
.source "SchedulerPoolFactory.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/schedulers/SchedulerPoolFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ScheduledTask"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 123
    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    sget-object v3, Lio/reactivex/internal/schedulers/SchedulerPoolFactory;->POOLS:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 124
    .local v0, "e":Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->isShutdown()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 125
    sget-object v2, Lio/reactivex/internal/schedulers/SchedulerPoolFactory;->POOLS:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 130
    .end local v0    # "e":Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v0

    .line 132
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 134
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_0
    return-void

    .line 127
    .local v0, "e":Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->purge()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
