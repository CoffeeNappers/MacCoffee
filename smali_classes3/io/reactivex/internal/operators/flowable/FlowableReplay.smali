.class public final Lio/reactivex/internal/operators/flowable/FlowableReplay;
.super Lio/reactivex/flowables/ConnectableFlowable;
.source "FlowableReplay.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/HasUpstreamPublisher;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableReplay$DefaultUnboundedFactory;,
        Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayPublisher;,
        Lio/reactivex/internal/operators/flowable/FlowableReplay$ScheduledReplayBufferTask;,
        Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBufferTask;,
        Lio/reactivex/internal/operators/flowable/FlowableReplay$ConnectableFlowableReplay;,
        Lio/reactivex/internal/operators/flowable/FlowableReplay$MultiCastPublisher;,
        Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;,
        Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeBoundReplayBuffer;,
        Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;,
        Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;,
        Lio/reactivex/internal/operators/flowable/FlowableReplay$UnboundedReplayBuffer;,
        Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;,
        Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;,
        Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/flowables/ConnectableFlowable",
        "<TT;>;",
        "Lio/reactivex/internal/fuseable/HasUpstreamPublisher",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field static final DEFAULT_UNBOUNDED_FACTORY:Ljava/util/concurrent/Callable;


# instance fields
.field final bufferFactory:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final current:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final onSubscribe:Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Publisher",
            "<TT;>;"
        }
    .end annotation
.end field

.field final source:Lio/reactivex/Flowable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Flowable",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 46
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$DefaultUnboundedFactory;

    invoke-direct {v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$DefaultUnboundedFactory;-><init>()V

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableReplay;->DEFAULT_UNBOUNDED_FACTORY:Ljava/util/concurrent/Callable;

    return-void
.end method

.method private constructor <init>(Lorg/reactivestreams/Publisher;Lio/reactivex/Flowable;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/Callable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Publisher",
            "<TT;>;",
            "Lio/reactivex/Flowable",
            "<TT;>;",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber",
            "<TT;>;>;",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer",
            "<TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 147
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay;, "Lio/reactivex/internal/operators/flowable/FlowableReplay<TT;>;"
    .local p1, "onSubscribe":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TT;>;"
    .local p2, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    .local p3, "current":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;>;"
    .local p4, "bufferFactory":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer<TT;>;>;"
    invoke-direct {p0}, Lio/reactivex/flowables/ConnectableFlowable;-><init>()V

    .line 148
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay;->onSubscribe:Lorg/reactivestreams/Publisher;

    .line 149
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay;->source:Lio/reactivex/Flowable;

    .line 150
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay;->current:Ljava/util/concurrent/atomic/AtomicReference;

    .line 151
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay;->bufferFactory:Ljava/util/concurrent/Callable;

    .line 152
    return-void
.end method

.method public static create(Lio/reactivex/Flowable;I)Lio/reactivex/flowables/ConnectableFlowable;
    .locals 1
    .param p1, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Flowable",
            "<TT;>;I)",
            "Lio/reactivex/flowables/ConnectableFlowable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 96
    .local p0, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    const v0, 0x7fffffff

    if-ne p1, v0, :cond_0

    .line 97
    invoke-static {p0}, Lio/reactivex/internal/operators/flowable/FlowableReplay;->createFrom(Lio/reactivex/Flowable;)Lio/reactivex/flowables/ConnectableFlowable;

    move-result-object v0

    .line 99
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBufferTask;

    invoke-direct {v0, p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBufferTask;-><init>(I)V

    invoke-static {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay;->create(Lio/reactivex/Flowable;Ljava/util/concurrent/Callable;)Lio/reactivex/flowables/ConnectableFlowable;

    move-result-object v0

    goto :goto_0
.end method

.method public static create(Lio/reactivex/Flowable;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/flowables/ConnectableFlowable;
    .locals 7
    .param p1, "maxAge"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Flowable",
            "<TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/flowables/ConnectableFlowable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 113
    .local p0, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    const v6, 0x7fffffff

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-static/range {v1 .. v6}, Lio/reactivex/internal/operators/flowable/FlowableReplay;->create(Lio/reactivex/Flowable;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;I)Lio/reactivex/flowables/ConnectableFlowable;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lio/reactivex/Flowable;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;I)Lio/reactivex/flowables/ConnectableFlowable;
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
            "Lio/reactivex/Flowable",
            "<TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "I)",
            "Lio/reactivex/flowables/ConnectableFlowable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ScheduledReplayBufferTask;

    move v1, p5

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ScheduledReplayBufferTask;-><init>(IJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V

    invoke-static {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay;->create(Lio/reactivex/Flowable;Ljava/util/concurrent/Callable;)Lio/reactivex/flowables/ConnectableFlowable;

    move-result-object v0

    return-object v0
.end method

.method static create(Lio/reactivex/Flowable;Ljava/util/concurrent/Callable;)Lio/reactivex/flowables/ConnectableFlowable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Flowable",
            "<TT;>;",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer",
            "<TT;>;>;)",
            "Lio/reactivex/flowables/ConnectableFlowable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 140
    .local p0, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    .local p1, "bufferFactory":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer<TT;>;>;"
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 141
    .local v0, "curr":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;>;"
    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayPublisher;

    invoke-direct {v1, v0, p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayPublisher;-><init>(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/Callable;)V

    .line 142
    .local v1, "onSubscribe":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TT;>;"
    new-instance v2, Lio/reactivex/internal/operators/flowable/FlowableReplay;

    invoke-direct {v2, v1, p0, v0, p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay;-><init>(Lorg/reactivestreams/Publisher;Lio/reactivex/Flowable;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/Callable;)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/flowables/ConnectableFlowable;)Lio/reactivex/flowables/ConnectableFlowable;

    move-result-object v2

    return-object v2
.end method

.method public static createFrom(Lio/reactivex/Flowable;)Lio/reactivex/flowables/ConnectableFlowable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Flowable",
            "<+TT;>;)",
            "Lio/reactivex/flowables/ConnectableFlowable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 84
    .local p0, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<+TT;>;"
    sget-object v0, Lio/reactivex/internal/operators/flowable/FlowableReplay;->DEFAULT_UNBOUNDED_FACTORY:Ljava/util/concurrent/Callable;

    invoke-static {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay;->create(Lio/reactivex/Flowable;Ljava/util/concurrent/Callable;)Lio/reactivex/flowables/ConnectableFlowable;

    move-result-object v0

    return-object v0
.end method

.method public static multicastSelector(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;
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
            "Lio/reactivex/flowables/ConnectableFlowable",
            "<TU;>;>;",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Flowable",
            "<TU;>;+",
            "Lorg/reactivestreams/Publisher",
            "<TR;>;>;)",
            "Lio/reactivex/Flowable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, "connectableFactory":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lio/reactivex/flowables/ConnectableFlowable<TU;>;>;"
    .local p1, "selector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Flowable<TU;>;+Lorg/reactivestreams/Publisher<TR;>;>;"
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$MultiCastPublisher;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$MultiCastPublisher;-><init>(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;)V

    invoke-static {v0}, Lio/reactivex/Flowable;->unsafeCreate(Lorg/reactivestreams/Publisher;)Lio/reactivex/Flowable;

    move-result-object v0

    return-object v0
.end method

.method public static observeOn(Lio/reactivex/flowables/ConnectableFlowable;Lio/reactivex/Scheduler;)Lio/reactivex/flowables/ConnectableFlowable;
    .locals 2
    .param p1, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/flowables/ConnectableFlowable",
            "<TT;>;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/flowables/ConnectableFlowable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "co":Lio/reactivex/flowables/ConnectableFlowable;, "Lio/reactivex/flowables/ConnectableFlowable<TT;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/flowables/ConnectableFlowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 73
    .local v0, "observable":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableReplay$ConnectableFlowableReplay;

    invoke-direct {v1, p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ConnectableFlowableReplay;-><init>(Lio/reactivex/flowables/ConnectableFlowable;Lio/reactivex/Flowable;)V

    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/flowables/ConnectableFlowable;)Lio/reactivex/flowables/ConnectableFlowable;

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
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay;, "Lio/reactivex/internal/operators/flowable/FlowableReplay<TT;>;"
    .local p1, "connection":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Lio/reactivex/disposables/Disposable;>;"
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 182
    :cond_0
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;

    .line 184
    .local v3, "ps":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;"
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->isDisposed()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 189
    :cond_1
    :try_start_0
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay;->bufferFactory:Ljava/util/concurrent/Callable;

    invoke-interface {v7}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 196
    .local v0, "buf":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer<TT;>;"
    new-instance v4, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;

    invoke-direct {v4, v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;)V

    .line 198
    .local v4, "u":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;"
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v7, v3, v4}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 203
    move-object v3, v4

    .line 207
    .end local v0    # "buf":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer<TT;>;"
    .end local v4    # "u":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;"
    :cond_2
    iget-object v7, v3, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v7

    if-nez v7, :cond_4

    iget-object v7, v3, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v7, v6, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v7

    if-eqz v7, :cond_4

    move v1, v5

    .line 224
    .local v1, "doConnect":Z
    :goto_0
    :try_start_1
    invoke-interface {p1, v3}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 232
    if-eqz v1, :cond_3

    .line 233
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay;->source:Lio/reactivex/Flowable;

    invoke-virtual {v5, v3}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/FlowableSubscriber;)V

    .line 235
    :cond_3
    return-void

    .line 190
    .end local v1    # "doConnect":Z
    :catch_0
    move-exception v2

    .line 191
    .local v2, "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 192
    invoke-static {v2}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5

    .end local v2    # "ex":Ljava/lang/Throwable;
    :cond_4
    move v1, v6

    .line 207
    goto :goto_0

    .line 225
    .restart local v1    # "doConnect":Z
    :catch_1
    move-exception v2

    .line 226
    .restart local v2    # "ex":Ljava/lang/Throwable;
    if-eqz v1, :cond_5

    .line 227
    iget-object v7, v3, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v7, v5, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 229
    :cond_5
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 230
    invoke-static {v2}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5
.end method

.method public dispose()V
    .locals 2

    .prologue
    .line 166
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay;, "Lio/reactivex/internal/operators/flowable/FlowableReplay<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay;->current:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 167
    return-void
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 171
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay;, "Lio/reactivex/internal/operators/flowable/FlowableReplay<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    .line 172
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

.method public source()Lorg/reactivestreams/Publisher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/reactivestreams/Publisher",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 156
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay;, "Lio/reactivex/internal/operators/flowable/FlowableReplay<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay;->source:Lio/reactivex/Flowable;

    return-object v0
.end method

.method protected subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 161
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay;, "Lio/reactivex/internal/operators/flowable/FlowableReplay<TT;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay;->onSubscribe:Lorg/reactivestreams/Publisher;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 162
    return-void
.end method
