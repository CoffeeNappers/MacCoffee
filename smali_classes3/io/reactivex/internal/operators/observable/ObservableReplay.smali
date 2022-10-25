.class public final Lio/reactivex/internal/operators/observable/ObservableReplay;
.super Lio/reactivex/observables/ConnectableObservable;
.source "ObservableReplay.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/HasUpstreamObservableSource;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableReplay$Replay;,
        Lio/reactivex/internal/operators/observable/ObservableReplay$MulticastReplay;,
        Lio/reactivex/internal/operators/observable/ObservableReplay$ReplaySource;,
        Lio/reactivex/internal/operators/observable/ObservableReplay$ScheduledReplaySupplier;,
        Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBufferSupplier;,
        Lio/reactivex/internal/operators/observable/ObservableReplay$DisposeConsumer;,
        Lio/reactivex/internal/operators/observable/ObservableReplay$UnBoundedFactory;,
        Lio/reactivex/internal/operators/observable/ObservableReplay$SizeAndTimeBoundReplayBuffer;,
        Lio/reactivex/internal/operators/observable/ObservableReplay$SizeBoundReplayBuffer;,
        Lio/reactivex/internal/operators/observable/ObservableReplay$BoundedReplayBuffer;,
        Lio/reactivex/internal/operators/observable/ObservableReplay$Node;,
        Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;,
        Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;,
        Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;,
        Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;,
        Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/observables/ConnectableObservable",
        "<TT;>;",
        "Lio/reactivex/internal/fuseable/HasUpstreamObservableSource",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field static final DEFAULT_UNBOUNDED_FACTORY:Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;


# instance fields
.field final bufferFactory:Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier",
            "<TT;>;"
        }
    .end annotation
.end field

.field final current:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final onSubscribe:Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableSource",
            "<TT;>;"
        }
    .end annotation
.end field

.field final source:Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableSource",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableReplay$UnBoundedFactory;

    invoke-direct {v0}, Lio/reactivex/internal/operators/observable/ObservableReplay$UnBoundedFactory;-><init>()V

    sput-object v0, Lio/reactivex/internal/operators/observable/ObservableReplay;->DEFAULT_UNBOUNDED_FACTORY:Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;

    return-void
.end method

.method private constructor <init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;",
            "Lio/reactivex/ObservableSource",
            "<TT;>;",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver",
            "<TT;>;>;",
            "Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 149
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay;, "Lio/reactivex/internal/operators/observable/ObservableReplay<TT;>;"
    .local p1, "onSubscribe":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    .local p2, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    .local p3, "current":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver<TT;>;>;"
    .local p4, "bufferFactory":Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;, "Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier<TT;>;"
    invoke-direct {p0}, Lio/reactivex/observables/ConnectableObservable;-><init>()V

    .line 150
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableReplay;->onSubscribe:Lio/reactivex/ObservableSource;

    .line 151
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableReplay;->source:Lio/reactivex/ObservableSource;

    .line 152
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableReplay;->current:Ljava/util/concurrent/atomic/AtomicReference;

    .line 153
    iput-object p4, p0, Lio/reactivex/internal/operators/observable/ObservableReplay;->bufferFactory:Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;

    .line 154
    return-void
.end method

.method public static create(Lio/reactivex/ObservableSource;I)Lio/reactivex/observables/ConnectableObservable;
    .locals 1
    .param p1, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;I)",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 98
    .local p0, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    const v0, 0x7fffffff

    if-ne p1, v0, :cond_0

    .line 99
    invoke-static {p0}, Lio/reactivex/internal/operators/observable/ObservableReplay;->createFrom(Lio/reactivex/ObservableSource;)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    .line 101
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBufferSupplier;

    invoke-direct {v0, p1}, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBufferSupplier;-><init>(I)V

    invoke-static {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableReplay;->create(Lio/reactivex/ObservableSource;Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    goto :goto_0
.end method

.method public static create(Lio/reactivex/ObservableSource;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/observables/ConnectableObservable;
    .locals 7
    .param p1, "maxAge"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    const v6, 0x7fffffff

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-static/range {v1 .. v6}, Lio/reactivex/internal/operators/observable/ObservableReplay;->create(Lio/reactivex/ObservableSource;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;I)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lio/reactivex/ObservableSource;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;I)Lio/reactivex/observables/ConnectableObservable;
    .locals 7
    .param p1, "maxAge"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .param p5, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "I)",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 130
    .local p0, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableReplay$ScheduledReplaySupplier;

    move v1, p5

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableReplay$ScheduledReplaySupplier;-><init>(IJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V

    invoke-static {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableReplay;->create(Lio/reactivex/ObservableSource;Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    return-object v0
.end method

.method static create(Lio/reactivex/ObservableSource;Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;)Lio/reactivex/observables/ConnectableObservable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;",
            "Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier",
            "<TT;>;)",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 142
    .local p0, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    .local p1, "bufferFactory":Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;, "Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier<TT;>;"
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 143
    .local v0, "curr":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver<TT;>;>;"
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplaySource;

    invoke-direct {v1, v0, p1}, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplaySource;-><init>(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;)V

    .line 144
    .local v1, "onSubscribe":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    new-instance v2, Lio/reactivex/internal/operators/observable/ObservableReplay;

    invoke-direct {v2, v1, p0, v0, p1}, Lio/reactivex/internal/operators/observable/ObservableReplay;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/observables/ConnectableObservable;)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v2

    return-object v2
.end method

.method public static createFrom(Lio/reactivex/ObservableSource;)Lio/reactivex/observables/ConnectableObservable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 86
    .local p0, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    sget-object v0, Lio/reactivex/internal/operators/observable/ObservableReplay;->DEFAULT_UNBOUNDED_FACTORY:Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;

    invoke-static {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableReplay;->create(Lio/reactivex/ObservableSource;Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    return-object v0
.end method

.method public static multicastSelector(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TU;>;>;",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<TU;>;+",
            "Lio/reactivex/ObservableSource",
            "<TR;>;>;)",
            "Lio/reactivex/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "connectableFactory":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lio/reactivex/observables/ConnectableObservable<TU;>;>;"
    .local p1, "selector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<TU;>;+Lio/reactivex/ObservableSource<TR;>;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableReplay$MulticastReplay;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/observable/ObservableReplay$MulticastReplay;-><init>(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Observable;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static observeOn(Lio/reactivex/observables/ConnectableObservable;Lio/reactivex/Scheduler;)Lio/reactivex/observables/ConnectableObservable;
    .locals 2
    .param p1, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "co":Lio/reactivex/observables/ConnectableObservable;, "Lio/reactivex/observables/ConnectableObservable<TT;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/observables/ConnectableObservable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    .line 75
    .local v0, "observable":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableReplay$Replay;

    invoke-direct {v1, p0, v0}, Lio/reactivex/internal/operators/observable/ObservableReplay$Replay;-><init>(Lio/reactivex/observables/ConnectableObservable;Lio/reactivex/Observable;)V

    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/observables/ConnectableObservable;)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public connect(Lio/reactivex/functions/Consumer;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Lio/reactivex/disposables/Disposable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay;, "Lio/reactivex/internal/operators/observable/ObservableReplay<TT;>;"
    .local p1, "connection":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Lio/reactivex/disposables/Disposable;>;"
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 184
    :cond_0
    iget-object v7, p0, Lio/reactivex/internal/operators/observable/ObservableReplay;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;

    .line 186
    .local v3, "ps":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver<TT;>;"
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->isDisposed()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 188
    :cond_1
    iget-object v7, p0, Lio/reactivex/internal/operators/observable/ObservableReplay;->bufferFactory:Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;

    invoke-interface {v7}, Lio/reactivex/internal/operators/observable/ObservableReplay$BufferSupplier;->call()Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;

    move-result-object v0

    .line 190
    .local v0, "buf":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer<TT;>;"
    new-instance v4, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;

    invoke-direct {v4, v0}, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;)V

    .line 192
    .local v4, "u":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver<TT;>;"
    iget-object v7, p0, Lio/reactivex/internal/operators/observable/ObservableReplay;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v7, v3, v4}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 197
    move-object v3, v4

    .line 201
    .end local v0    # "buf":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer<TT;>;"
    .end local v4    # "u":Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;, "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver<TT;>;"
    :cond_2
    iget-object v7, v3, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v7

    if-nez v7, :cond_4

    iget-object v7, v3, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v7, v6, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v7

    if-eqz v7, :cond_4

    move v1, v5

    .line 219
    .local v1, "doConnect":Z
    :goto_0
    :try_start_0
    invoke-interface {p1, v3}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    if-eqz v1, :cond_3

    .line 228
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableReplay;->source:Lio/reactivex/ObservableSource;

    invoke-interface {v5, v3}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 230
    :cond_3
    return-void

    .end local v1    # "doConnect":Z
    :cond_4
    move v1, v6

    .line 201
    goto :goto_0

    .line 220
    .restart local v1    # "doConnect":Z
    :catch_0
    move-exception v2

    .line 221
    .local v2, "ex":Ljava/lang/Throwable;
    if-eqz v1, :cond_5

    .line 222
    iget-object v7, v3, Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayObserver;->shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v7, v5, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 224
    :cond_5
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 225
    invoke-static {v2}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5
.end method

.method public dispose()V
    .locals 2

    .prologue
    .line 163
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay;, "Lio/reactivex/internal/operators/observable/ObservableReplay<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay;->current:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 164
    return-void
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 168
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay;, "Lio/reactivex/internal/operators/observable/ObservableReplay<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableReplay;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    .line 169
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

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

.method public source()Lio/reactivex/ObservableSource;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/ObservableSource",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 158
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay;, "Lio/reactivex/internal/operators/observable/ObservableReplay<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay;->source:Lio/reactivex/ObservableSource;

    return-object v0
.end method

.method protected subscribeActual(Lio/reactivex/Observer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 174
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay;, "Lio/reactivex/internal/operators/observable/ObservableReplay<TT;>;"
    .local p1, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay;->onSubscribe:Lio/reactivex/ObservableSource;

    invoke-interface {v0, p1}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 175
    return-void
.end method
