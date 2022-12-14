.class public final Lio/reactivex/internal/operators/observable/ObservableInternalHelper;
.super Ljava/lang/Object;
.source "ObservableInternalHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ReplayFunction;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$TimedReplayCallable;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$BufferedTimedReplayCallable;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$BufferedReplayCallable;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ReplayCallable;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ObservableMapper;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ZipIterableFunction;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$RetryWhenInner;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ErrorMapperFilter;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$RepeatWhenOuterHandler;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$MapToInt;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$FlatMapIntoIterable;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$FlatMapWithCombinerOuter;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$FlatMapWithCombinerInner;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ObserverOnComplete;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ObserverOnError;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ObserverOnNext;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ItemDelayFunction;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$SimpleBiGenerator;,
        Lio/reactivex/internal/operators/observable/ObservableInternalHelper$SimpleGenerator;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "No instances!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static convertSingleMapperToObservableMapper(Lio/reactivex/functions/Function;)Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/SingleSource",
            "<+TR;>;>;)",
            "Lio/reactivex/functions/Function",
            "<TT;",
            "Lio/reactivex/Observable",
            "<TR;>;>;"
        }
    .end annotation

    .prologue
    .line 307
    .local p0, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/SingleSource<+TR;>;>;"
    const-string/jumbo v0, "mapper is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 308
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ObservableMapper;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ObservableMapper;-><init>(Lio/reactivex/functions/Function;)V

    return-object v0
.end method

.method public static flatMapIntoIterable(Lio/reactivex/functions/Function;)Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Ljava/lang/Iterable",
            "<+TU;>;>;)",
            "Lio/reactivex/functions/Function",
            "<TT;",
            "Lio/reactivex/ObservableSource",
            "<TU;>;>;"
        }
    .end annotation

    .prologue
    .line 193
    .local p0, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Ljava/lang/Iterable<+TU;>;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$FlatMapIntoIterable;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$FlatMapIntoIterable;-><init>(Lio/reactivex/functions/Function;)V

    return-object v0
.end method

.method public static flatMapWithCombiner(Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;)Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-TU;+TR;>;)",
            "Lio/reactivex/functions/Function",
            "<TT;",
            "Lio/reactivex/ObservableSource",
            "<TR;>;>;"
        }
    .end annotation

    .prologue
    .line 176
    .local p0, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TU;>;>;"
    .local p1, "combiner":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT;-TU;+TR;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$FlatMapWithCombinerOuter;

    invoke-direct {v0, p1, p0}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$FlatMapWithCombinerOuter;-><init>(Lio/reactivex/functions/BiFunction;Lio/reactivex/functions/Function;)V

    return-object v0
.end method

.method public static itemDelay(Lio/reactivex/functions/Function;)Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<TU;>;>;)",
            "Lio/reactivex/functions/Function",
            "<TT;",
            "Lio/reactivex/ObservableSource",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 85
    .local p0, "itemDelay":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<TU;>;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ItemDelayFunction;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ItemDelayFunction;-><init>(Lio/reactivex/functions/Function;)V

    return-object v0
.end method

.method public static observerOnComplete(Lio/reactivex/Observer;)Lio/reactivex/functions/Action;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Observer",
            "<TT;>;)",
            "Lio/reactivex/functions/Action;"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ObserverOnComplete;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ObserverOnComplete;-><init>(Lio/reactivex/Observer;)V

    return-object v0
.end method

.method public static observerOnError(Lio/reactivex/Observer;)Lio/reactivex/functions/Consumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Observer",
            "<TT;>;)",
            "Lio/reactivex/functions/Consumer",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 133
    .local p0, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ObserverOnError;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ObserverOnError;-><init>(Lio/reactivex/Observer;)V

    return-object v0
.end method

.method public static observerOnNext(Lio/reactivex/Observer;)Lio/reactivex/functions/Consumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Observer",
            "<TT;>;)",
            "Lio/reactivex/functions/Consumer",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 129
    .local p0, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ObserverOnNext;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ObserverOnNext;-><init>(Lio/reactivex/Observer;)V

    return-object v0
.end method

.method public static repeatWhenHandler(Lio/reactivex/functions/Function;)Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/lang/Object;",
            ">;+",
            "Lio/reactivex/ObservableSource",
            "<*>;>;)",
            "Lio/reactivex/functions/Function",
            "<",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Notification",
            "<",
            "Ljava/lang/Object;",
            ">;>;",
            "Lio/reactivex/ObservableSource",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 219
    .local p0, "handler":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<Ljava/lang/Object;>;+Lio/reactivex/ObservableSource<*>;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$RepeatWhenOuterHandler;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$RepeatWhenOuterHandler;-><init>(Lio/reactivex/functions/Function;)V

    return-object v0
.end method

.method public static replayCallable(Lio/reactivex/Observable;)Ljava/util/concurrent/Callable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Observable",
            "<TT;>;)",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 223
    .local p0, "parent":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ReplayCallable;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ReplayCallable;-><init>(Lio/reactivex/Observable;)V

    return-object v0
.end method

.method public static replayCallable(Lio/reactivex/Observable;I)Ljava/util/concurrent/Callable;
    .locals 1
    .param p1, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Observable",
            "<TT;>;I)",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 227
    .local p0, "parent":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$BufferedReplayCallable;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$BufferedReplayCallable;-><init>(Lio/reactivex/Observable;I)V

    return-object v0
.end method

.method public static replayCallable(Lio/reactivex/Observable;IJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Ljava/util/concurrent/Callable;
    .locals 8
    .param p1, "bufferSize"    # I
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Observable",
            "<TT;>;IJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 231
    .local p0, "parent":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$BufferedTimedReplayCallable;

    move-object v2, p0

    move v3, p1

    move-wide v4, p2

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v1 .. v7}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$BufferedTimedReplayCallable;-><init>(Lio/reactivex/Observable;IJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V

    return-object v1
.end method

.method public static replayCallable(Lio/reactivex/Observable;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Ljava/util/concurrent/Callable;
    .locals 7
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Observable",
            "<TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Ljava/util/concurrent/Callable",
            "<",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 235
    .local p0, "parent":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$TimedReplayCallable;

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$TimedReplayCallable;-><init>(Lio/reactivex/Observable;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V

    return-object v0
.end method

.method public static replayFunction(Lio/reactivex/functions/Function;Lio/reactivex/Scheduler;)Lio/reactivex/functions/Function;
    .locals 1
    .param p1, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;+",
            "Lio/reactivex/ObservableSource",
            "<TR;>;>;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/functions/Function",
            "<",
            "Lio/reactivex/Observable",
            "<TT;>;",
            "Lio/reactivex/ObservableSource",
            "<TR;>;>;"
        }
    .end annotation

    .prologue
    .line 239
    .local p0, "selector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<TT;>;+Lio/reactivex/ObservableSource<TR;>;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ReplayFunction;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ReplayFunction;-><init>(Lio/reactivex/functions/Function;Lio/reactivex/Scheduler;)V

    return-object v0
.end method

.method public static retryWhenHandler(Lio/reactivex/functions/Function;)Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/lang/Throwable;",
            ">;+",
            "Lio/reactivex/ObservableSource",
            "<*>;>;)",
            "Lio/reactivex/functions/Function",
            "<",
            "Lio/reactivex/Observable",
            "<",
            "Lio/reactivex/Notification",
            "<",
            "Ljava/lang/Object;",
            ">;>;",
            "Lio/reactivex/ObservableSource",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 275
    .local p0, "handler":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<Ljava/lang/Throwable;>;+Lio/reactivex/ObservableSource<*>;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$RetryWhenInner;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$RetryWhenInner;-><init>(Lio/reactivex/functions/Function;)V

    return-object v0
.end method

.method public static simpleBiGenerator(Lio/reactivex/functions/BiConsumer;)Lio/reactivex/functions/BiFunction;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "S:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/BiConsumer",
            "<TS;",
            "Lio/reactivex/Emitter",
            "<TT;>;>;)",
            "Lio/reactivex/functions/BiFunction",
            "<TS;",
            "Lio/reactivex/Emitter",
            "<TT;>;TS;>;"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "consumer":Lio/reactivex/functions/BiConsumer;, "Lio/reactivex/functions/BiConsumer<TS;Lio/reactivex/Emitter<TT;>;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$SimpleBiGenerator;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$SimpleBiGenerator;-><init>(Lio/reactivex/functions/BiConsumer;)V

    return-object v0
.end method

.method public static simpleGenerator(Lio/reactivex/functions/Consumer;)Lio/reactivex/functions/BiFunction;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "S:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Consumer",
            "<",
            "Lio/reactivex/Emitter",
            "<TT;>;>;)",
            "Lio/reactivex/functions/BiFunction",
            "<TS;",
            "Lio/reactivex/Emitter",
            "<TT;>;TS;>;"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, "consumer":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<Lio/reactivex/Emitter<TT;>;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$SimpleGenerator;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$SimpleGenerator;-><init>(Lio/reactivex/functions/Consumer;)V

    return-object v0
.end method

.method public static switchMapSingle(Lio/reactivex/Observable;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Observable",
            "<TT;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/SingleSource",
            "<+TR;>;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 297
    .local p0, "source":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/SingleSource<+TR;>;>;"
    invoke-static {p1}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->convertSingleMapperToObservableMapper(Lio/reactivex/functions/Function;)Lio/reactivex/functions/Function;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lio/reactivex/Observable;->switchMap(Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static switchMapSingleDelayError(Lio/reactivex/Observable;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Observable",
            "<TT;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/SingleSource",
            "<+TR;>;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 302
    .local p0, "source":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/SingleSource<+TR;>;>;"
    invoke-static {p1}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper;->convertSingleMapperToObservableMapper(Lio/reactivex/functions/Function;)Lio/reactivex/functions/Function;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lio/reactivex/Observable;->switchMapDelayError(Lio/reactivex/functions/Function;I)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static zipIterable(Lio/reactivex/functions/Function;)Lio/reactivex/functions/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;)",
            "Lio/reactivex/functions/Function",
            "<",
            "Ljava/util/List",
            "<",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;"
        }
    .end annotation

    .prologue
    .line 293
    .local p0, "zipper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ZipIterableFunction;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableInternalHelper$ZipIterableFunction;-><init>(Lio/reactivex/functions/Function;)V

    return-object v0
.end method
