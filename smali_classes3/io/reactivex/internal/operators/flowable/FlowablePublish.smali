.class public final Lio/reactivex/internal/operators/flowable/FlowablePublish;
.super Lio/reactivex/flowables/ConnectableFlowable;
.source "FlowablePublish.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/HasUpstreamPublisher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowablePublish$FlowablePublisher;,
        Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;,
        Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;
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
        "<TT;>;"
    }
.end annotation


# static fields
.field static final CANCELLED:J = -0x8000000000000000L


# instance fields
.field final bufferSize:I

.field final current:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber",
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
.method private constructor <init>(Lorg/reactivestreams/Publisher;Lio/reactivex/Flowable;Ljava/util/concurrent/atomic/AtomicReference;I)V
    .locals 0
    .param p4, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Publisher",
            "<TT;>;",
            "Lio/reactivex/Flowable",
            "<TT;>;",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber",
            "<TT;>;>;I)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublish;, "Lio/reactivex/internal/operators/flowable/FlowablePublish<TT;>;"
    .local p1, "onSubscribe":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TT;>;"
    .local p2, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    .local p3, "current":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber<TT;>;>;"
    invoke-direct {p0}, Lio/reactivex/flowables/ConnectableFlowable;-><init>()V

    .line 69
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish;->onSubscribe:Lorg/reactivestreams/Publisher;

    .line 70
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish;->source:Lio/reactivex/Flowable;

    .line 71
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish;->current:Ljava/util/concurrent/atomic/AtomicReference;

    .line 72
    iput p4, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish;->bufferSize:I

    .line 73
    return-void
.end method

.method public static create(Lio/reactivex/Flowable;I)Lio/reactivex/flowables/ConnectableFlowable;
    .locals 3
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
    .line 62
    .local p0, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 63
    .local v0, "curr":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber<TT;>;>;"
    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$FlowablePublisher;

    invoke-direct {v1, v0, p1}, Lio/reactivex/internal/operators/flowable/FlowablePublish$FlowablePublisher;-><init>(Ljava/util/concurrent/atomic/AtomicReference;I)V

    .line 64
    .local v1, "onSubscribe":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TT;>;"
    new-instance v2, Lio/reactivex/internal/operators/flowable/FlowablePublish;

    invoke-direct {v2, v1, p0, v0, p1}, Lio/reactivex/internal/operators/flowable/FlowablePublish;-><init>(Lorg/reactivestreams/Publisher;Lio/reactivex/Flowable;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/flowables/ConnectableFlowable;)Lio/reactivex/flowables/ConnectableFlowable;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public connect(Lio/reactivex/functions/Consumer;)V
    .locals 7
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
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublish;, "Lio/reactivex/internal/operators/flowable/FlowablePublish<TT;>;"
    .local p1, "connection":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Lio/reactivex/disposables/Disposable;>;"
    const/4 v0, 0x1

    const/4 v4, 0x0

    .line 92
    :cond_0
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;

    .line 94
    .local v2, "ps":Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber<TT;>;"
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->isDisposed()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 96
    :cond_1
    new-instance v3, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;

    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish;->current:Ljava/util/concurrent/atomic/AtomicReference;

    iget v6, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish;->bufferSize:I

    invoke-direct {v3, v5, v6}, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;-><init>(Ljava/util/concurrent/atomic/AtomicReference;I)V

    .line 98
    .local v3, "u":Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber<TT;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 103
    move-object v2, v3

    .line 107
    .end local v3    # "u":Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber<TT;>;"
    :cond_2
    iget-object v5, v2, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v5

    if-nez v5, :cond_4

    iget-object v5, v2, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5, v4, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 124
    .local v0, "doConnect":Z
    :goto_0
    :try_start_0
    invoke-interface {p1, v2}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    if-eqz v0, :cond_3

    .line 130
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish;->source:Lio/reactivex/Flowable;

    invoke-virtual {v4, v2}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/FlowableSubscriber;)V

    .line 132
    :cond_3
    return-void

    .end local v0    # "doConnect":Z
    :cond_4
    move v0, v4

    .line 107
    goto :goto_0

    .line 125
    .restart local v0    # "doConnect":Z
    :catch_0
    move-exception v1

    .line 126
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 127
    invoke-static {v1}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4
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
    .line 77
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublish;, "Lio/reactivex/internal/operators/flowable/FlowablePublish<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish;->source:Lio/reactivex/Flowable;

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
    .line 82
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublish;, "Lio/reactivex/internal/operators/flowable/FlowablePublish<TT;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish;->onSubscribe:Lorg/reactivestreams/Publisher;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 83
    return-void
.end method
