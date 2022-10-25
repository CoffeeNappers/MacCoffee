.class final Lio/reactivex/internal/operators/flowable/FlowableReplay$MultiCastPublisher;
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
    name = "MultiCastPublisher"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableReplay$MultiCastPublisher$DisposableConsumer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/reactivestreams/Publisher",
        "<TR;>;"
    }
.end annotation


# instance fields
.field private final connectableFactory:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/flowables/ConnectableFlowable",
            "<TU;>;>;"
        }
    .end annotation
.end field

.field private final selector:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Flowable",
            "<TU;>;+",
            "Lorg/reactivestreams/Publisher",
            "<TR;>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/flowables/ConnectableFlowable",
            "<TU;>;>;",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Flowable",
            "<TU;>;+",
            "Lorg/reactivestreams/Publisher",
            "<TR;>;>;)V"
        }
    .end annotation

    .prologue
    .line 1107
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$MultiCastPublisher;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$MultiCastPublisher<TR;TU;>;"
    .local p1, "connectableFactory":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lio/reactivex/flowables/ConnectableFlowable<TU;>;>;"
    .local p2, "selector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Flowable<TU;>;+Lorg/reactivestreams/Publisher<TR;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1108
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$MultiCastPublisher;->connectableFactory:Ljava/util/concurrent/Callable;

    .line 1109
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$MultiCastPublisher;->selector:Lio/reactivex/functions/Function;

    .line 1110
    return-void
.end method


# virtual methods
.method public subscribe(Lorg/reactivestreams/Subscriber;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .line 1116
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$MultiCastPublisher;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$MultiCastPublisher<TR;TU;>;"
    .local p1, "child":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    :try_start_0
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$MultiCastPublisher;->connectableFactory:Ljava/util/concurrent/Callable;

    invoke-interface {v4}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v4

    const-string/jumbo v5, "The connectableFactory returned null"

    invoke-static {v4, v5}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/flowables/ConnectableFlowable;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 1125
    .local v0, "co":Lio/reactivex/flowables/ConnectableFlowable;, "Lio/reactivex/flowables/ConnectableFlowable<TU;>;"
    :try_start_1
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$MultiCastPublisher;->selector:Lio/reactivex/functions/Function;

    invoke-interface {v4, v0}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    const-string/jumbo v5, "The selector returned a null Publisher"

    invoke-static {v4, v5}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/reactivestreams/Publisher;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 1132
    .local v2, "observable":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TR;>;"
    new-instance v3, Lio/reactivex/internal/subscribers/SubscriberResourceWrapper;

    invoke-direct {v3, p1}, Lio/reactivex/internal/subscribers/SubscriberResourceWrapper;-><init>(Lorg/reactivestreams/Subscriber;)V

    .line 1134
    .local v3, "srw":Lio/reactivex/internal/subscribers/SubscriberResourceWrapper;, "Lio/reactivex/internal/subscribers/SubscriberResourceWrapper<TR;>;"
    invoke-interface {v2, v3}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 1136
    new-instance v4, Lio/reactivex/internal/operators/flowable/FlowableReplay$MultiCastPublisher$DisposableConsumer;

    invoke-direct {v4, p0, v3}, Lio/reactivex/internal/operators/flowable/FlowableReplay$MultiCastPublisher$DisposableConsumer;-><init>(Lio/reactivex/internal/operators/flowable/FlowableReplay$MultiCastPublisher;Lio/reactivex/internal/subscribers/SubscriberResourceWrapper;)V

    invoke-virtual {v0, v4}, Lio/reactivex/flowables/ConnectableFlowable;->connect(Lio/reactivex/functions/Consumer;)V

    .line 1137
    .end local v0    # "co":Lio/reactivex/flowables/ConnectableFlowable;, "Lio/reactivex/flowables/ConnectableFlowable<TU;>;"
    .end local v2    # "observable":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TR;>;"
    .end local v3    # "srw":Lio/reactivex/internal/subscribers/SubscriberResourceWrapper;, "Lio/reactivex/internal/subscribers/SubscriberResourceWrapper<TR;>;"
    :goto_0
    return-void

    .line 1117
    :catch_0
    move-exception v1

    .line 1118
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 1119
    invoke-static {v1, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 1126
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v0    # "co":Lio/reactivex/flowables/ConnectableFlowable;, "Lio/reactivex/flowables/ConnectableFlowable<TU;>;"
    :catch_1
    move-exception v1

    .line 1127
    .restart local v1    # "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 1128
    invoke-static {v1, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method
