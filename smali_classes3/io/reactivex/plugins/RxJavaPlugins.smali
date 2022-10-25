.class public final Lio/reactivex/plugins/RxJavaPlugins;
.super Ljava/lang/Object;
.source "RxJavaPlugins.java"


# static fields
.field static volatile errorHandler:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile failNonBlockingScheduler:Z

.field static volatile lockdown:Z

.field static volatile onBeforeBlocking:Lio/reactivex/functions/BooleanSupplier;
    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onCompletableAssembly:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Completable;",
            "+",
            "Lio/reactivex/Completable;",
            ">;"
        }
    .end annotation
.end field

.field static volatile onCompletableSubscribe:Lio/reactivex/functions/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Lio/reactivex/Completable;",
            "-",
            "Lio/reactivex/CompletableObserver;",
            "+",
            "Lio/reactivex/CompletableObserver;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onComputationHandler:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Scheduler;",
            "+",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onConnectableFlowableAssembly:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/flowables/ConnectableFlowable;",
            "+",
            "Lio/reactivex/flowables/ConnectableFlowable;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onConnectableObservableAssembly:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/observables/ConnectableObservable;",
            "+",
            "Lio/reactivex/observables/ConnectableObservable;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onFlowableAssembly:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Flowable;",
            "+",
            "Lio/reactivex/Flowable;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onFlowableSubscribe:Lio/reactivex/functions/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Lio/reactivex/Flowable;",
            "-",
            "Lorg/reactivestreams/Subscriber;",
            "+",
            "Lorg/reactivestreams/Subscriber;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onInitComputationHandler:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;+",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onInitIoHandler:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;+",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onInitNewThreadHandler:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;+",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onInitSingleHandler:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;+",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onIoHandler:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Scheduler;",
            "+",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onMaybeAssembly:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Maybe;",
            "+",
            "Lio/reactivex/Maybe;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onMaybeSubscribe:Lio/reactivex/functions/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Lio/reactivex/Maybe;",
            "-",
            "Lio/reactivex/MaybeObserver;",
            "+",
            "Lio/reactivex/MaybeObserver;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onNewThreadHandler:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Scheduler;",
            "+",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onObservableAssembly:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable;",
            "+",
            "Lio/reactivex/Observable;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onObservableSubscribe:Lio/reactivex/functions/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Lio/reactivex/Observable;",
            "-",
            "Lio/reactivex/Observer;",
            "+",
            "Lio/reactivex/Observer;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onParallelAssembly:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/parallel/ParallelFlowable;",
            "+",
            "Lio/reactivex/parallel/ParallelFlowable;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onScheduleHandler:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/lang/Runnable;",
            "+",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onSingleAssembly:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Single;",
            "+",
            "Lio/reactivex/Single;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onSingleHandler:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Scheduler;",
            "+",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field static volatile onSingleSubscribe:Lio/reactivex/functions/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Lio/reactivex/Single;",
            "-",
            "Lio/reactivex/SingleObserver;",
            "+",
            "Lio/reactivex/SingleObserver;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 1321
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1322
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "No instances!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static apply(Lio/reactivex/functions/BiFunction;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p0    # Lio/reactivex/functions/BiFunction;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/BiFunction",
            "<TT;TU;TR;>;TT;TU;)TR;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 1285
    .local p0, "f":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TT;TU;TR;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    .local p2, "u":Ljava/lang/Object;, "TU;"
    :try_start_0
    invoke-interface {p0, p1, p2}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 1286
    :catch_0
    move-exception v0

    .line 1287
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method static apply(Lio/reactivex/functions/Function;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<TT;TR;>;TT;)TR;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 1265
    .local p0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<TT;TR;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    :try_start_0
    invoke-interface {p0, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 1266
    :catch_0
    move-exception v0

    .line 1267
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method static applyRequireNonNull(Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)Lio/reactivex/Scheduler;
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;+",
            "Lio/reactivex/Scheduler;",
            ">;",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;)",
            "Lio/reactivex/Scheduler;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 1317
    .local p0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/util/concurrent/Callable<Lio/reactivex/Scheduler;>;+Lio/reactivex/Scheduler;>;"
    .local p1, "s":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Lio/reactivex/Scheduler;>;"
    invoke-static {p0, p1}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string/jumbo v1, "Scheduler Callable result can\'t be null"

    invoke-static {v0, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/Scheduler;

    return-object v0
.end method

.method static callRequireNonNull(Ljava/util/concurrent/Callable;)Lio/reactivex/Scheduler;
    .locals 3
    .param p0    # Ljava/util/concurrent/Callable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;)",
            "Lio/reactivex/Scheduler;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 1301
    .local p0, "s":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Lio/reactivex/Scheduler;>;"
    :try_start_0
    invoke-interface {p0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v1

    const-string/jumbo v2, "Scheduler Callable result can\'t be null"

    invoke-static {v1, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/Scheduler;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 1302
    :catch_0
    move-exception v0

    .line 1303
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static createComputationScheduler(Ljava/util/concurrent/ThreadFactory;)Lio/reactivex/Scheduler;
    .locals 2
    .param p0, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 1208
    new-instance v1, Lio/reactivex/internal/schedulers/ComputationScheduler;

    const-string/jumbo v0, "threadFactory is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ThreadFactory;

    invoke-direct {v1, v0}, Lio/reactivex/internal/schedulers/ComputationScheduler;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    return-object v1
.end method

.method public static createIoScheduler(Ljava/util/concurrent/ThreadFactory;)Lio/reactivex/Scheduler;
    .locals 2
    .param p0, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 1222
    new-instance v1, Lio/reactivex/internal/schedulers/IoScheduler;

    const-string/jumbo v0, "threadFactory is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ThreadFactory;

    invoke-direct {v1, v0}, Lio/reactivex/internal/schedulers/IoScheduler;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    return-object v1
.end method

.method public static createNewThreadScheduler(Ljava/util/concurrent/ThreadFactory;)Lio/reactivex/Scheduler;
    .locals 2
    .param p0, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 1236
    new-instance v1, Lio/reactivex/internal/schedulers/NewThreadScheduler;

    const-string/jumbo v0, "threadFactory is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ThreadFactory;

    invoke-direct {v1, v0}, Lio/reactivex/internal/schedulers/NewThreadScheduler;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    return-object v1
.end method

.method public static createSingleScheduler(Ljava/util/concurrent/ThreadFactory;)Lio/reactivex/Scheduler;
    .locals 2
    .param p0, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 1250
    new-instance v1, Lio/reactivex/internal/schedulers/SingleScheduler;

    const-string/jumbo v0, "threadFactory is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ThreadFactory;

    invoke-direct {v1, v0}, Lio/reactivex/internal/schedulers/SingleScheduler;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    return-object v1
.end method

.method public static getComputationSchedulerHandler()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Scheduler;",
            "+",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 193
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onComputationHandler:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static getErrorHandler()Lio/reactivex/functions/Consumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 202
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->errorHandler:Lio/reactivex/functions/Consumer;

    return-object v0
.end method

.method public static getInitComputationSchedulerHandler()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;+",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 211
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onInitComputationHandler:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static getInitIoSchedulerHandler()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;+",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 220
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onInitIoHandler:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static getInitNewThreadSchedulerHandler()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;+",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 229
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onInitNewThreadHandler:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static getInitSingleSchedulerHandler()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;+",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 238
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onInitSingleHandler:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static getIoSchedulerHandler()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Scheduler;",
            "+",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 247
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onIoHandler:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static getNewThreadSchedulerHandler()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Scheduler;",
            "+",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 256
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onNewThreadHandler:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static getOnBeforeBlocking()Lio/reactivex/functions/BooleanSupplier;
    .locals 1
    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 1194
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onBeforeBlocking:Lio/reactivex/functions/BooleanSupplier;

    return-object v0
.end method

.method public static getOnCompletableAssembly()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Completable;",
            "+",
            "Lio/reactivex/Completable;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 653
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onCompletableAssembly:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static getOnCompletableSubscribe()Lio/reactivex/functions/BiFunction;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Lio/reactivex/Completable;",
            "-",
            "Lio/reactivex/CompletableObserver;",
            "+",
            "Lio/reactivex/CompletableObserver;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 662
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onCompletableSubscribe:Lio/reactivex/functions/BiFunction;

    return-object v0
.end method

.method public static getOnConnectableFlowableAssembly()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/flowables/ConnectableFlowable;",
            "+",
            "Lio/reactivex/flowables/ConnectableFlowable;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 682
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onConnectableFlowableAssembly:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static getOnConnectableObservableAssembly()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/observables/ConnectableObservable;",
            "+",
            "Lio/reactivex/observables/ConnectableObservable;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 752
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onConnectableObservableAssembly:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static getOnFlowableAssembly()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Flowable;",
            "+",
            "Lio/reactivex/Flowable;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 672
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onFlowableAssembly:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static getOnFlowableSubscribe()Lio/reactivex/functions/BiFunction;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Lio/reactivex/Flowable;",
            "-",
            "Lorg/reactivestreams/Subscriber;",
            "+",
            "Lorg/reactivestreams/Subscriber;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 692
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onFlowableSubscribe:Lio/reactivex/functions/BiFunction;

    return-object v0
.end method

.method public static getOnMaybeAssembly()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Maybe;",
            "+",
            "Lio/reactivex/Maybe;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 712
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onMaybeAssembly:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static getOnMaybeSubscribe()Lio/reactivex/functions/BiFunction;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Lio/reactivex/Maybe;",
            "-",
            "Lio/reactivex/MaybeObserver;",
            "+",
            "Lio/reactivex/MaybeObserver;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 702
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onMaybeSubscribe:Lio/reactivex/functions/BiFunction;

    return-object v0
.end method

.method public static getOnObservableAssembly()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable;",
            "+",
            "Lio/reactivex/Observable;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 742
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onObservableAssembly:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static getOnObservableSubscribe()Lio/reactivex/functions/BiFunction;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Lio/reactivex/Observable;",
            "-",
            "Lio/reactivex/Observer;",
            "+",
            "Lio/reactivex/Observer;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 762
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onObservableSubscribe:Lio/reactivex/functions/BiFunction;

    return-object v0
.end method

.method public static getOnParallelAssembly()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/parallel/ParallelFlowable;",
            "+",
            "Lio/reactivex/parallel/ParallelFlowable;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 1125
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onParallelAssembly:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static getOnSingleAssembly()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Single;",
            "+",
            "Lio/reactivex/Single;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 722
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onSingleAssembly:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static getOnSingleSubscribe()Lio/reactivex/functions/BiFunction;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Lio/reactivex/Single;",
            "-",
            "Lio/reactivex/SingleObserver;",
            "+",
            "Lio/reactivex/SingleObserver;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 732
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onSingleSubscribe:Lio/reactivex/functions/BiFunction;

    return-object v0
.end method

.method public static getScheduleHandler()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/lang/Runnable;",
            "+",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 265
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onScheduleHandler:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static getSingleSchedulerHandler()Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Scheduler;",
            "+",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 274
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onSingleHandler:Lio/reactivex/functions/Function;

    return-object v0
.end method

.method public static initComputationScheduler(Ljava/util/concurrent/Callable;)Lio/reactivex/Scheduler;
    .locals 2
    .param p0    # Ljava/util/concurrent/Callable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;)",
            "Lio/reactivex/Scheduler;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 285
    .local p0, "defaultScheduler":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Lio/reactivex/Scheduler;>;"
    const-string/jumbo v1, "Scheduler Callable can\'t be null"

    invoke-static {p0, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 286
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onInitComputationHandler:Lio/reactivex/functions/Function;

    .line 287
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/util/concurrent/Callable<Lio/reactivex/Scheduler;>;+Lio/reactivex/Scheduler;>;"
    if-nez v0, :cond_0

    .line 288
    invoke-static {p0}, Lio/reactivex/plugins/RxJavaPlugins;->callRequireNonNull(Ljava/util/concurrent/Callable;)Lio/reactivex/Scheduler;

    move-result-object v1

    .line 290
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->applyRequireNonNull(Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)Lio/reactivex/Scheduler;

    move-result-object v1

    goto :goto_0
.end method

.method public static initIoScheduler(Ljava/util/concurrent/Callable;)Lio/reactivex/Scheduler;
    .locals 2
    .param p0    # Ljava/util/concurrent/Callable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;)",
            "Lio/reactivex/Scheduler;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 301
    .local p0, "defaultScheduler":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Lio/reactivex/Scheduler;>;"
    const-string/jumbo v1, "Scheduler Callable can\'t be null"

    invoke-static {p0, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 302
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onInitIoHandler:Lio/reactivex/functions/Function;

    .line 303
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/util/concurrent/Callable<Lio/reactivex/Scheduler;>;+Lio/reactivex/Scheduler;>;"
    if-nez v0, :cond_0

    .line 304
    invoke-static {p0}, Lio/reactivex/plugins/RxJavaPlugins;->callRequireNonNull(Ljava/util/concurrent/Callable;)Lio/reactivex/Scheduler;

    move-result-object v1

    .line 306
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->applyRequireNonNull(Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)Lio/reactivex/Scheduler;

    move-result-object v1

    goto :goto_0
.end method

.method public static initNewThreadScheduler(Ljava/util/concurrent/Callable;)Lio/reactivex/Scheduler;
    .locals 2
    .param p0    # Ljava/util/concurrent/Callable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;)",
            "Lio/reactivex/Scheduler;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 317
    .local p0, "defaultScheduler":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Lio/reactivex/Scheduler;>;"
    const-string/jumbo v1, "Scheduler Callable can\'t be null"

    invoke-static {p0, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 318
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onInitNewThreadHandler:Lio/reactivex/functions/Function;

    .line 319
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/util/concurrent/Callable<Lio/reactivex/Scheduler;>;+Lio/reactivex/Scheduler;>;"
    if-nez v0, :cond_0

    .line 320
    invoke-static {p0}, Lio/reactivex/plugins/RxJavaPlugins;->callRequireNonNull(Ljava/util/concurrent/Callable;)Lio/reactivex/Scheduler;

    move-result-object v1

    .line 322
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->applyRequireNonNull(Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)Lio/reactivex/Scheduler;

    move-result-object v1

    goto :goto_0
.end method

.method public static initSingleScheduler(Ljava/util/concurrent/Callable;)Lio/reactivex/Scheduler;
    .locals 2
    .param p0    # Ljava/util/concurrent/Callable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;)",
            "Lio/reactivex/Scheduler;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 333
    .local p0, "defaultScheduler":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Lio/reactivex/Scheduler;>;"
    const-string/jumbo v1, "Scheduler Callable can\'t be null"

    invoke-static {p0, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 334
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onInitSingleHandler:Lio/reactivex/functions/Function;

    .line 335
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/util/concurrent/Callable<Lio/reactivex/Scheduler;>;+Lio/reactivex/Scheduler;>;"
    if-nez v0, :cond_0

    .line 336
    invoke-static {p0}, Lio/reactivex/plugins/RxJavaPlugins;->callRequireNonNull(Ljava/util/concurrent/Callable;)Lio/reactivex/Scheduler;

    move-result-object v1

    .line 338
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->applyRequireNonNull(Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)Lio/reactivex/Scheduler;

    move-result-object v1

    goto :goto_0
.end method

.method static isBug(Ljava/lang/Throwable;)Z
    .locals 2
    .param p0, "error"    # Ljava/lang/Throwable;

    .prologue
    const/4 v0, 0x1

    .line 395
    instance-of v1, p0, Lio/reactivex/exceptions/OnErrorNotImplementedException;

    if-eqz v1, :cond_1

    .line 422
    :cond_0
    :goto_0
    return v0

    .line 400
    :cond_1
    instance-of v1, p0, Lio/reactivex/exceptions/MissingBackpressureException;

    if-nez v1, :cond_0

    .line 405
    instance-of v1, p0, Ljava/lang/IllegalStateException;

    if-nez v1, :cond_0

    .line 410
    instance-of v1, p0, Ljava/lang/NullPointerException;

    if-nez v1, :cond_0

    .line 414
    instance-of v1, p0, Ljava/lang/IllegalArgumentException;

    if-nez v1, :cond_0

    .line 418
    instance-of v1, p0, Lio/reactivex/exceptions/CompositeException;

    if-nez v1, :cond_0

    .line 422
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isFailOnNonBlockingScheduler()Z
    .locals 1
    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 184
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->failNonBlockingScheduler:Z

    return v0
.end method

.method public static isLockdown()Z
    .locals 1

    .prologue
    .line 157
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    return v0
.end method

.method public static lockdown()V
    .locals 1

    .prologue
    .line 149
    const/4 v0, 0x1

    sput-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    .line 150
    return-void
.end method

.method public static onAssembly(Lio/reactivex/Completable;)Lio/reactivex/Completable;
    .locals 2
    .param p0, "source"    # Lio/reactivex/Completable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 1095
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onCompletableAssembly:Lio/reactivex/functions/Function;

    .line 1096
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Completable;+Lio/reactivex/Completable;>;"
    if-eqz v0, :cond_0

    .line 1097
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/Completable;

    .line 1099
    :goto_0
    return-object v1

    :cond_0
    move-object v1, p0

    goto :goto_0
.end method

.method public static onAssembly(Lio/reactivex/Flowable;)Lio/reactivex/Flowable;
    .locals 2
    .param p0    # Lio/reactivex/Flowable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Flowable",
            "<TT;>;)",
            "Lio/reactivex/Flowable",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 1017
    .local p0, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onFlowableAssembly:Lio/reactivex/functions/Function;

    .line 1018
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Flowable;+Lio/reactivex/Flowable;>;"
    if-eqz v0, :cond_0

    .line 1019
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/Flowable;

    .line 1021
    :goto_0
    return-object v1

    :cond_0
    move-object v1, p0

    goto :goto_0
.end method

.method public static onAssembly(Lio/reactivex/Maybe;)Lio/reactivex/Maybe;
    .locals 2
    .param p0    # Lio/reactivex/Maybe;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Maybe",
            "<TT;>;)",
            "Lio/reactivex/Maybe",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 1001
    .local p0, "source":Lio/reactivex/Maybe;, "Lio/reactivex/Maybe<TT;>;"
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onMaybeAssembly:Lio/reactivex/functions/Function;

    .line 1002
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Maybe;+Lio/reactivex/Maybe;>;"
    if-eqz v0, :cond_0

    .line 1003
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/Maybe;

    .line 1005
    :goto_0
    return-object v1

    :cond_0
    move-object v1, p0

    goto :goto_0
.end method

.method public static onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;
    .locals 2
    .param p0    # Lio/reactivex/Observable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Observable",
            "<TT;>;)",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 1049
    .local p0, "source":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onObservableAssembly:Lio/reactivex/functions/Function;

    .line 1050
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable;+Lio/reactivex/Observable;>;"
    if-eqz v0, :cond_0

    .line 1051
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/Observable;

    .line 1053
    :goto_0
    return-object v1

    :cond_0
    move-object v1, p0

    goto :goto_0
.end method

.method public static onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;
    .locals 2
    .param p0    # Lio/reactivex/Single;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Single",
            "<TT;>;)",
            "Lio/reactivex/Single",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 1081
    .local p0, "source":Lio/reactivex/Single;, "Lio/reactivex/Single<TT;>;"
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onSingleAssembly:Lio/reactivex/functions/Function;

    .line 1082
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Single;+Lio/reactivex/Single;>;"
    if-eqz v0, :cond_0

    .line 1083
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/Single;

    .line 1085
    :goto_0
    return-object v1

    :cond_0
    move-object v1, p0

    goto :goto_0
.end method

.method public static onAssembly(Lio/reactivex/flowables/ConnectableFlowable;)Lio/reactivex/flowables/ConnectableFlowable;
    .locals 2
    .param p0    # Lio/reactivex/flowables/ConnectableFlowable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/flowables/ConnectableFlowable",
            "<TT;>;)",
            "Lio/reactivex/flowables/ConnectableFlowable",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 1033
    .local p0, "source":Lio/reactivex/flowables/ConnectableFlowable;, "Lio/reactivex/flowables/ConnectableFlowable<TT;>;"
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onConnectableFlowableAssembly:Lio/reactivex/functions/Function;

    .line 1034
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/flowables/ConnectableFlowable;+Lio/reactivex/flowables/ConnectableFlowable;>;"
    if-eqz v0, :cond_0

    .line 1035
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/flowables/ConnectableFlowable;

    .line 1037
    :goto_0
    return-object v1

    :cond_0
    move-object v1, p0

    goto :goto_0
.end method

.method public static onAssembly(Lio/reactivex/observables/ConnectableObservable;)Lio/reactivex/observables/ConnectableObservable;
    .locals 2
    .param p0    # Lio/reactivex/observables/ConnectableObservable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;)",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 1065
    .local p0, "source":Lio/reactivex/observables/ConnectableObservable;, "Lio/reactivex/observables/ConnectableObservable<TT;>;"
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onConnectableObservableAssembly:Lio/reactivex/functions/Function;

    .line 1066
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/observables/ConnectableObservable;+Lio/reactivex/observables/ConnectableObservable;>;"
    if-eqz v0, :cond_0

    .line 1067
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/observables/ConnectableObservable;

    .line 1069
    :goto_0
    return-object v1

    :cond_0
    move-object v1, p0

    goto :goto_0
.end method

.method public static onAssembly(Lio/reactivex/parallel/ParallelFlowable;)Lio/reactivex/parallel/ParallelFlowable;
    .locals 2
    .param p0    # Lio/reactivex/parallel/ParallelFlowable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/parallel/ParallelFlowable",
            "<TT;>;)",
            "Lio/reactivex/parallel/ParallelFlowable",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 1139
    .local p0, "source":Lio/reactivex/parallel/ParallelFlowable;, "Lio/reactivex/parallel/ParallelFlowable<TT;>;"
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onParallelAssembly:Lio/reactivex/functions/Function;

    .line 1140
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/parallel/ParallelFlowable;+Lio/reactivex/parallel/ParallelFlowable;>;"
    if-eqz v0, :cond_0

    .line 1141
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/parallel/ParallelFlowable;

    .line 1143
    :goto_0
    return-object v1

    :cond_0
    move-object v1, p0

    goto :goto_0
.end method

.method public static onBeforeBlocking()Z
    .locals 3
    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 1157
    sget-object v1, Lio/reactivex/plugins/RxJavaPlugins;->onBeforeBlocking:Lio/reactivex/functions/BooleanSupplier;

    .line 1158
    .local v1, "f":Lio/reactivex/functions/BooleanSupplier;
    if-eqz v1, :cond_0

    .line 1160
    :try_start_0
    invoke-interface {v1}, Lio/reactivex/functions/BooleanSupplier;->getAsBoolean()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 1165
    :goto_0
    return v2

    .line 1161
    :catch_0
    move-exception v0

    .line 1162
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1165
    .end local v0    # "ex":Ljava/lang/Throwable;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static onComputationScheduler(Lio/reactivex/Scheduler;)Lio/reactivex/Scheduler;
    .locals 2
    .param p0, "defaultScheduler"    # Lio/reactivex/Scheduler;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 348
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onComputationHandler:Lio/reactivex/functions/Function;

    .line 349
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Scheduler;+Lio/reactivex/Scheduler;>;"
    if-nez v0, :cond_0

    .line 352
    .end local p0    # "defaultScheduler":Lio/reactivex/Scheduler;
    :goto_0
    return-object p0

    .restart local p0    # "defaultScheduler":Lio/reactivex/Scheduler;
    :cond_0
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/Scheduler;

    move-object p0, v1

    goto :goto_0
.end method

.method public static onError(Ljava/lang/Throwable;)V
    .locals 4
    .param p0, "error"    # Ljava/lang/Throwable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param

    .prologue
    .line 360
    sget-object v2, Lio/reactivex/plugins/RxJavaPlugins;->errorHandler:Lio/reactivex/functions/Consumer;

    .line 362
    .local v2, "f":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    if-nez p0, :cond_1

    .line 363
    new-instance p0, Ljava/lang/NullPointerException;

    .end local p0    # "error":Ljava/lang/Throwable;
    const-string/jumbo v3, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {p0, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 370
    .restart local p0    # "error":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    if-eqz v2, :cond_2

    .line 372
    :try_start_0
    invoke-interface {v2, p0}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 383
    :goto_1
    return-void

    .line 365
    :cond_1
    invoke-static {p0}, Lio/reactivex/plugins/RxJavaPlugins;->isBug(Ljava/lang/Throwable;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 366
    new-instance v1, Lio/reactivex/exceptions/UndeliverableException;

    invoke-direct {v1, p0}, Lio/reactivex/exceptions/UndeliverableException;-><init>(Ljava/lang/Throwable;)V

    .end local p0    # "error":Ljava/lang/Throwable;
    .local v1, "error":Ljava/lang/Throwable;
    move-object p0, v1

    .end local v1    # "error":Ljava/lang/Throwable;
    .restart local p0    # "error":Ljava/lang/Throwable;
    goto :goto_0

    .line 374
    :catch_0
    move-exception v0

    .line 376
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 377
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->uncaught(Ljava/lang/Throwable;)V

    .line 381
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 382
    invoke-static {p0}, Lio/reactivex/plugins/RxJavaPlugins;->uncaught(Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public static onIoScheduler(Lio/reactivex/Scheduler;)Lio/reactivex/Scheduler;
    .locals 2
    .param p0, "defaultScheduler"    # Lio/reactivex/Scheduler;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 438
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onIoHandler:Lio/reactivex/functions/Function;

    .line 439
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Scheduler;+Lio/reactivex/Scheduler;>;"
    if-nez v0, :cond_0

    .line 442
    .end local p0    # "defaultScheduler":Lio/reactivex/Scheduler;
    :goto_0
    return-object p0

    .restart local p0    # "defaultScheduler":Lio/reactivex/Scheduler;
    :cond_0
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/Scheduler;

    move-object p0, v1

    goto :goto_0
.end method

.method public static onNewThreadScheduler(Lio/reactivex/Scheduler;)Lio/reactivex/Scheduler;
    .locals 2
    .param p0, "defaultScheduler"    # Lio/reactivex/Scheduler;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 452
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onNewThreadHandler:Lio/reactivex/functions/Function;

    .line 453
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Scheduler;+Lio/reactivex/Scheduler;>;"
    if-nez v0, :cond_0

    .line 456
    .end local p0    # "defaultScheduler":Lio/reactivex/Scheduler;
    :goto_0
    return-object p0

    .restart local p0    # "defaultScheduler":Lio/reactivex/Scheduler;
    :cond_0
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/Scheduler;

    move-object p0, v1

    goto :goto_0
.end method

.method public static onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 2
    .param p0, "run"    # Ljava/lang/Runnable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 466
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onScheduleHandler:Lio/reactivex/functions/Function;

    .line 467
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/lang/Runnable;+Ljava/lang/Runnable;>;"
    if-nez v0, :cond_0

    .line 470
    .end local p0    # "run":Ljava/lang/Runnable;
    :goto_0
    return-object p0

    .restart local p0    # "run":Ljava/lang/Runnable;
    :cond_0
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    move-object p0, v1

    goto :goto_0
.end method

.method public static onSingleScheduler(Lio/reactivex/Scheduler;)Lio/reactivex/Scheduler;
    .locals 2
    .param p0, "defaultScheduler"    # Lio/reactivex/Scheduler;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 480
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onSingleHandler:Lio/reactivex/functions/Function;

    .line 481
    .local v0, "f":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Scheduler;+Lio/reactivex/Scheduler;>;"
    if-nez v0, :cond_0

    .line 484
    .end local p0    # "defaultScheduler":Lio/reactivex/Scheduler;
    :goto_0
    return-object p0

    .restart local p0    # "defaultScheduler":Lio/reactivex/Scheduler;
    :cond_0
    invoke-static {v0, p0}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/Scheduler;

    move-object p0, v1

    goto :goto_0
.end method

.method public static onSubscribe(Lio/reactivex/Completable;Lio/reactivex/CompletableObserver;)Lio/reactivex/CompletableObserver;
    .locals 2
    .param p0, "source"    # Lio/reactivex/Completable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p1, "observer"    # Lio/reactivex/CompletableObserver;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 968
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onCompletableSubscribe:Lio/reactivex/functions/BiFunction;

    .line 969
    .local v0, "f":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Lio/reactivex/Completable;-Lio/reactivex/CompletableObserver;+Lio/reactivex/CompletableObserver;>;"
    if-eqz v0, :cond_0

    .line 970
    invoke-static {v0, p0, p1}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/BiFunction;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/CompletableObserver;

    .line 972
    :goto_0
    return-object v1

    :cond_0
    move-object v1, p1

    goto :goto_0
.end method

.method public static onSubscribe(Lio/reactivex/Maybe;Lio/reactivex/MaybeObserver;)Lio/reactivex/MaybeObserver;
    .locals 2
    .param p0    # Lio/reactivex/Maybe;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p1    # Lio/reactivex/MaybeObserver;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Maybe",
            "<TT;>;",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;)",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 985
    .local p0, "source":Lio/reactivex/Maybe;, "Lio/reactivex/Maybe<TT;>;"
    .local p1, "subscriber":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onMaybeSubscribe:Lio/reactivex/functions/BiFunction;

    .line 986
    .local v0, "f":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Lio/reactivex/Maybe;-Lio/reactivex/MaybeObserver;+Lio/reactivex/MaybeObserver;>;"
    if-eqz v0, :cond_0

    .line 987
    invoke-static {v0, p0, p1}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/BiFunction;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/MaybeObserver;

    .line 989
    :goto_0
    return-object v1

    :cond_0
    move-object v1, p1

    goto :goto_0
.end method

.method public static onSubscribe(Lio/reactivex/Observable;Lio/reactivex/Observer;)Lio/reactivex/Observer;
    .locals 2
    .param p0    # Lio/reactivex/Observable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p1    # Lio/reactivex/Observer;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Observable",
            "<TT;>;",
            "Lio/reactivex/Observer",
            "<-TT;>;)",
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 936
    .local p0, "source":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onObservableSubscribe:Lio/reactivex/functions/BiFunction;

    .line 937
    .local v0, "f":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Lio/reactivex/Observable;-Lio/reactivex/Observer;+Lio/reactivex/Observer;>;"
    if-eqz v0, :cond_0

    .line 938
    invoke-static {v0, p0, p1}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/BiFunction;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/Observer;

    .line 940
    :goto_0
    return-object v1

    :cond_0
    move-object v1, p1

    goto :goto_0
.end method

.method public static onSubscribe(Lio/reactivex/Single;Lio/reactivex/SingleObserver;)Lio/reactivex/SingleObserver;
    .locals 2
    .param p0    # Lio/reactivex/Single;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p1    # Lio/reactivex/SingleObserver;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Single",
            "<TT;>;",
            "Lio/reactivex/SingleObserver",
            "<-TT;>;)",
            "Lio/reactivex/SingleObserver",
            "<-TT;>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 953
    .local p0, "source":Lio/reactivex/Single;, "Lio/reactivex/Single<TT;>;"
    .local p1, "observer":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TT;>;"
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onSingleSubscribe:Lio/reactivex/functions/BiFunction;

    .line 954
    .local v0, "f":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Lio/reactivex/Single;-Lio/reactivex/SingleObserver;+Lio/reactivex/SingleObserver;>;"
    if-eqz v0, :cond_0

    .line 955
    invoke-static {v0, p0, p1}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/BiFunction;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/SingleObserver;

    .line 957
    :goto_0
    return-object v1

    :cond_0
    move-object v1, p1

    goto :goto_0
.end method

.method public static onSubscribe(Lio/reactivex/Flowable;Lorg/reactivestreams/Subscriber;)Lorg/reactivestreams/Subscriber;
    .locals 2
    .param p0    # Lio/reactivex/Flowable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p1    # Lorg/reactivestreams/Subscriber;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Flowable",
            "<TT;>;",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 919
    .local p0, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    .local p1, "subscriber":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    sget-object v0, Lio/reactivex/plugins/RxJavaPlugins;->onFlowableSubscribe:Lio/reactivex/functions/BiFunction;

    .line 920
    .local v0, "f":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Lio/reactivex/Flowable;-Lorg/reactivestreams/Subscriber;+Lorg/reactivestreams/Subscriber;>;"
    if-eqz v0, :cond_0

    .line 921
    invoke-static {v0, p0, p1}, Lio/reactivex/plugins/RxJavaPlugins;->apply(Lio/reactivex/functions/BiFunction;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/reactivestreams/Subscriber;

    .line 923
    :goto_0
    return-object v1

    :cond_0
    move-object v1, p1

    goto :goto_0
.end method

.method public static reset()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 491
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setErrorHandler(Lio/reactivex/functions/Consumer;)V

    .line 492
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setScheduleHandler(Lio/reactivex/functions/Function;)V

    .line 494
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setComputationSchedulerHandler(Lio/reactivex/functions/Function;)V

    .line 495
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setInitComputationSchedulerHandler(Lio/reactivex/functions/Function;)V

    .line 497
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setIoSchedulerHandler(Lio/reactivex/functions/Function;)V

    .line 498
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setInitIoSchedulerHandler(Lio/reactivex/functions/Function;)V

    .line 500
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setSingleSchedulerHandler(Lio/reactivex/functions/Function;)V

    .line 501
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setInitSingleSchedulerHandler(Lio/reactivex/functions/Function;)V

    .line 503
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setNewThreadSchedulerHandler(Lio/reactivex/functions/Function;)V

    .line 504
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setInitNewThreadSchedulerHandler(Lio/reactivex/functions/Function;)V

    .line 506
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setOnFlowableAssembly(Lio/reactivex/functions/Function;)V

    .line 507
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setOnFlowableSubscribe(Lio/reactivex/functions/BiFunction;)V

    .line 509
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setOnObservableAssembly(Lio/reactivex/functions/Function;)V

    .line 510
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setOnObservableSubscribe(Lio/reactivex/functions/BiFunction;)V

    .line 512
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setOnSingleAssembly(Lio/reactivex/functions/Function;)V

    .line 513
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setOnSingleSubscribe(Lio/reactivex/functions/BiFunction;)V

    .line 515
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setOnCompletableAssembly(Lio/reactivex/functions/Function;)V

    .line 516
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setOnCompletableSubscribe(Lio/reactivex/functions/BiFunction;)V

    .line 518
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setOnConnectableFlowableAssembly(Lio/reactivex/functions/Function;)V

    .line 519
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setOnConnectableObservableAssembly(Lio/reactivex/functions/Function;)V

    .line 521
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setOnMaybeAssembly(Lio/reactivex/functions/Function;)V

    .line 522
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setOnMaybeSubscribe(Lio/reactivex/functions/BiFunction;)V

    .line 524
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setOnParallelAssembly(Lio/reactivex/functions/Function;)V

    .line 526
    const/4 v0, 0x0

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->setFailOnNonBlockingScheduler(Z)V

    .line 527
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->setOnBeforeBlocking(Lio/reactivex/functions/BooleanSupplier;)V

    .line 528
    return-void
.end method

.method public static setComputationSchedulerHandler(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Scheduler;",
            "+",
            "Lio/reactivex/Scheduler;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 535
    .local p0, "handler":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Scheduler;+Lio/reactivex/Scheduler;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 536
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 538
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onComputationHandler:Lio/reactivex/functions/Function;

    .line 539
    return-void
.end method

.method public static setErrorHandler(Lio/reactivex/functions/Consumer;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Consumer;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 546
    .local p0, "handler":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 547
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 549
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->errorHandler:Lio/reactivex/functions/Consumer;

    .line 550
    return-void
.end method

.method public static setFailOnNonBlockingScheduler(Z)V
    .locals 2
    .param p0, "enable"    # Z
    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 169
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 170
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 172
    :cond_0
    sput-boolean p0, Lio/reactivex/plugins/RxJavaPlugins;->failNonBlockingScheduler:Z

    .line 173
    return-void
.end method

.method public static setInitComputationSchedulerHandler(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;+",
            "Lio/reactivex/Scheduler;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 557
    .local p0, "handler":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/util/concurrent/Callable<Lio/reactivex/Scheduler;>;+Lio/reactivex/Scheduler;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 558
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 560
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onInitComputationHandler:Lio/reactivex/functions/Function;

    .line 561
    return-void
.end method

.method public static setInitIoSchedulerHandler(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;+",
            "Lio/reactivex/Scheduler;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 568
    .local p0, "handler":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/util/concurrent/Callable<Lio/reactivex/Scheduler;>;+Lio/reactivex/Scheduler;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 569
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 571
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onInitIoHandler:Lio/reactivex/functions/Function;

    .line 572
    return-void
.end method

.method public static setInitNewThreadSchedulerHandler(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;+",
            "Lio/reactivex/Scheduler;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 579
    .local p0, "handler":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/util/concurrent/Callable<Lio/reactivex/Scheduler;>;+Lio/reactivex/Scheduler;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 580
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 582
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onInitNewThreadHandler:Lio/reactivex/functions/Function;

    .line 583
    return-void
.end method

.method public static setInitSingleSchedulerHandler(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/Scheduler;",
            ">;+",
            "Lio/reactivex/Scheduler;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 590
    .local p0, "handler":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/util/concurrent/Callable<Lio/reactivex/Scheduler;>;+Lio/reactivex/Scheduler;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 591
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 593
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onInitSingleHandler:Lio/reactivex/functions/Function;

    .line 594
    return-void
.end method

.method public static setIoSchedulerHandler(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Scheduler;",
            "+",
            "Lio/reactivex/Scheduler;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 601
    .local p0, "handler":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Scheduler;+Lio/reactivex/Scheduler;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 602
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 604
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onIoHandler:Lio/reactivex/functions/Function;

    .line 605
    return-void
.end method

.method public static setNewThreadSchedulerHandler(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Scheduler;",
            "+",
            "Lio/reactivex/Scheduler;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 612
    .local p0, "handler":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Scheduler;+Lio/reactivex/Scheduler;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 613
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 615
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onNewThreadHandler:Lio/reactivex/functions/Function;

    .line 616
    return-void
.end method

.method public static setOnBeforeBlocking(Lio/reactivex/functions/BooleanSupplier;)V
    .locals 2
    .param p0, "handler"    # Lio/reactivex/functions/BooleanSupplier;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 1179
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 1180
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1182
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onBeforeBlocking:Lio/reactivex/functions/BooleanSupplier;

    .line 1183
    return-void
.end method

.method public static setOnCompletableAssembly(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Completable;",
            "+",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 770
    .local p0, "onCompletableAssembly":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Completable;+Lio/reactivex/Completable;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 771
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 773
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onCompletableAssembly:Lio/reactivex/functions/Function;

    .line 774
    return-void
.end method

.method public static setOnCompletableSubscribe(Lio/reactivex/functions/BiFunction;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/BiFunction;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Lio/reactivex/Completable;",
            "-",
            "Lio/reactivex/CompletableObserver;",
            "+",
            "Lio/reactivex/CompletableObserver;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 782
    .local p0, "onCompletableSubscribe":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Lio/reactivex/Completable;-Lio/reactivex/CompletableObserver;+Lio/reactivex/CompletableObserver;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 783
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 785
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onCompletableSubscribe:Lio/reactivex/functions/BiFunction;

    .line 786
    return-void
.end method

.method public static setOnConnectableFlowableAssembly(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/flowables/ConnectableFlowable;",
            "+",
            "Lio/reactivex/flowables/ConnectableFlowable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 818
    .local p0, "onConnectableFlowableAssembly":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/flowables/ConnectableFlowable;+Lio/reactivex/flowables/ConnectableFlowable;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 819
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 821
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onConnectableFlowableAssembly:Lio/reactivex/functions/Function;

    .line 822
    return-void
.end method

.method public static setOnConnectableObservableAssembly(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/observables/ConnectableObservable;",
            "+",
            "Lio/reactivex/observables/ConnectableObservable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 866
    .local p0, "onConnectableObservableAssembly":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/observables/ConnectableObservable;+Lio/reactivex/observables/ConnectableObservable;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 867
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 869
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onConnectableObservableAssembly:Lio/reactivex/functions/Function;

    .line 870
    return-void
.end method

.method public static setOnFlowableAssembly(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Flowable;",
            "+",
            "Lio/reactivex/Flowable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 794
    .local p0, "onFlowableAssembly":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Flowable;+Lio/reactivex/Flowable;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 795
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 797
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onFlowableAssembly:Lio/reactivex/functions/Function;

    .line 798
    return-void
.end method

.method public static setOnFlowableSubscribe(Lio/reactivex/functions/BiFunction;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/BiFunction;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Lio/reactivex/Flowable;",
            "-",
            "Lorg/reactivestreams/Subscriber;",
            "+",
            "Lorg/reactivestreams/Subscriber;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 830
    .local p0, "onFlowableSubscribe":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Lio/reactivex/Flowable;-Lorg/reactivestreams/Subscriber;+Lorg/reactivestreams/Subscriber;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 831
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 833
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onFlowableSubscribe:Lio/reactivex/functions/BiFunction;

    .line 834
    return-void
.end method

.method public static setOnMaybeAssembly(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Maybe;",
            "+",
            "Lio/reactivex/Maybe;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 806
    .local p0, "onMaybeAssembly":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Maybe;+Lio/reactivex/Maybe;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 807
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 809
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onMaybeAssembly:Lio/reactivex/functions/Function;

    .line 810
    return-void
.end method

.method public static setOnMaybeSubscribe(Lio/reactivex/functions/BiFunction;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/BiFunction;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Lio/reactivex/Maybe;",
            "Lio/reactivex/MaybeObserver;",
            "+",
            "Lio/reactivex/MaybeObserver;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 842
    .local p0, "onMaybeSubscribe":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Lio/reactivex/Maybe;Lio/reactivex/MaybeObserver;+Lio/reactivex/MaybeObserver;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 843
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 845
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onMaybeSubscribe:Lio/reactivex/functions/BiFunction;

    .line 846
    return-void
.end method

.method public static setOnObservableAssembly(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable;",
            "+",
            "Lio/reactivex/Observable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 854
    .local p0, "onObservableAssembly":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable;+Lio/reactivex/Observable;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 855
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 857
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onObservableAssembly:Lio/reactivex/functions/Function;

    .line 858
    return-void
.end method

.method public static setOnObservableSubscribe(Lio/reactivex/functions/BiFunction;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/BiFunction;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Lio/reactivex/Observable;",
            "-",
            "Lio/reactivex/Observer;",
            "+",
            "Lio/reactivex/Observer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 879
    .local p0, "onObservableSubscribe":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Lio/reactivex/Observable;-Lio/reactivex/Observer;+Lio/reactivex/Observer;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 880
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 882
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onObservableSubscribe:Lio/reactivex/functions/BiFunction;

    .line 883
    return-void
.end method

.method public static setOnParallelAssembly(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/parallel/ParallelFlowable;",
            "+",
            "Lio/reactivex/parallel/ParallelFlowable;",
            ">;)V"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 1110
    .local p0, "handler":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/parallel/ParallelFlowable;+Lio/reactivex/parallel/ParallelFlowable;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 1111
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1113
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onParallelAssembly:Lio/reactivex/functions/Function;

    .line 1114
    return-void
.end method

.method public static setOnSingleAssembly(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Single;",
            "+",
            "Lio/reactivex/Single;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 891
    .local p0, "onSingleAssembly":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Single;+Lio/reactivex/Single;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 892
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 894
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onSingleAssembly:Lio/reactivex/functions/Function;

    .line 895
    return-void
.end method

.method public static setOnSingleSubscribe(Lio/reactivex/functions/BiFunction;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/BiFunction;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Lio/reactivex/Single;",
            "-",
            "Lio/reactivex/SingleObserver;",
            "+",
            "Lio/reactivex/SingleObserver;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 903
    .local p0, "onSingleSubscribe":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Lio/reactivex/Single;-Lio/reactivex/SingleObserver;+Lio/reactivex/SingleObserver;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 904
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 906
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onSingleSubscribe:Lio/reactivex/functions/BiFunction;

    .line 907
    return-void
.end method

.method public static setScheduleHandler(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/lang/Runnable;",
            "+",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 623
    .local p0, "handler":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/lang/Runnable;+Ljava/lang/Runnable;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 624
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 626
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onScheduleHandler:Lio/reactivex/functions/Function;

    .line 627
    return-void
.end method

.method public static setSingleSchedulerHandler(Lio/reactivex/functions/Function;)V
    .locals 2
    .param p0    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Scheduler;",
            "+",
            "Lio/reactivex/Scheduler;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 634
    .local p0, "handler":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Scheduler;+Lio/reactivex/Scheduler;>;"
    sget-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    if-eqz v0, :cond_0

    .line 635
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Plugins can\'t be changed anymore"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 637
    :cond_0
    sput-object p0, Lio/reactivex/plugins/RxJavaPlugins;->onSingleHandler:Lio/reactivex/functions/Function;

    .line 638
    return-void
.end method

.method static uncaught(Ljava/lang/Throwable;)V
    .locals 2
    .param p0, "error"    # Ljava/lang/Throwable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param

    .prologue
    .line 426
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 427
    .local v0, "currentThread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->getUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v1

    .line 428
    .local v1, "handler":Ljava/lang/Thread$UncaughtExceptionHandler;
    invoke-interface {v1, v0, p0}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 429
    return-void
.end method

.method static unlock()V
    .locals 1

    .prologue
    .line 644
    const/4 v0, 0x0

    sput-boolean v0, Lio/reactivex/plugins/RxJavaPlugins;->lockdown:Z

    .line 645
    return-void
.end method
