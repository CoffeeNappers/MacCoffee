.class final Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayPublisher;
.super Ljava/lang/Object;
.source "FlowableReplay.java"

# interfaces
.implements Lorg/reactivestreams/Publisher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableReplay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ReplayPublisher"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/reactivestreams/Publisher",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final bufferFactory:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field private final curr:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber",
            "<TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/Callable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    .line 1209
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayPublisher;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayPublisher<TT;>;"
    .local p1, "curr":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;>;"
    .local p2, "bufferFactory":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer<TT;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1210
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayPublisher;->curr:Ljava/util/concurrent/atomic/AtomicReference;

    .line 1211
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayPublisher;->bufferFactory:Ljava/util/concurrent/Callable;

    .line 1212
    return-void
.end method


# virtual methods
.method public subscribe(Lorg/reactivestreams/Subscriber;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 1220
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayPublisher;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayPublisher<TT;>;"
    .local p1, "child":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :cond_0
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayPublisher;->curr:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;

    .line 1222
    .local v3, "r":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;"
    if-nez v3, :cond_1

    .line 1226
    :try_start_0
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayPublisher;->bufferFactory:Ljava/util/concurrent/Callable;

    invoke-interface {v5}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 1232
    .local v0, "buf":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer<TT;>;"
    new-instance v4, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;

    invoke-direct {v4, v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;)V

    .line 1234
    .local v4, "u":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayPublisher;->curr:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v6, 0x0

    invoke-virtual {v5, v6, v4}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1240
    move-object v3, v4

    .line 1244
    .end local v0    # "buf":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer<TT;>;"
    .end local v4    # "u":Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber<TT;>;"
    :cond_1
    new-instance v2, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;

    invoke-direct {v2, v3, p1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;-><init>(Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;Lorg/reactivestreams/Subscriber;)V

    .line 1249
    .local v2, "inner":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    invoke-interface {p1, v2}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 1253
    invoke-virtual {v3, v2}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->add(Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;)Z

    .line 1255
    invoke-virtual {v2}, Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;->isDisposed()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1256
    invoke-virtual {v3, v2}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->remove(Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;)V

    .line 1267
    :goto_0
    return-void

    .line 1227
    .end local v2    # "inner":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    :catch_0
    move-exception v1

    .line 1228
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 1229
    invoke-static {v1}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5

    .line 1260
    .end local v1    # "ex":Ljava/lang/Throwable;
    .restart local v2    # "inner":Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription<TT;>;"
    :cond_2
    invoke-virtual {v3}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->manageRequests()V

    .line 1263
    iget-object v5, v3, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplaySubscriber;->buffer:Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;

    invoke-interface {v5, v2}, Lio/reactivex/internal/operators/flowable/FlowableReplay$ReplayBuffer;->replay(Lio/reactivex/internal/operators/flowable/FlowableReplay$InnerSubscription;)V

    goto :goto_0
.end method
