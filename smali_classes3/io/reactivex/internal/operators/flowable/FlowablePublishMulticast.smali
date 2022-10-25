.class public final Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast;
.super Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;
.source "FlowablePublishMulticast.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastSubscription;,
        Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;,
        Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$OutputCanceller;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream",
        "<TT;TR;>;"
    }
.end annotation


# instance fields
.field final delayError:Z

.field final prefetch:I

.field final selector:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Flowable",
            "<TT;>;+",
            "Lorg/reactivestreams/Publisher",
            "<+TR;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/Flowable;Lio/reactivex/functions/Function;IZ)V
    .locals 0
    .param p3, "prefetch"    # I
    .param p4, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Flowable",
            "<TT;>;",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Flowable",
            "<TT;>;+",
            "Lorg/reactivestreams/Publisher",
            "<+TR;>;>;IZ)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast<TT;TR;>;"
    .local p1, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    .local p2, "selector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Flowable<TT;>;+Lorg/reactivestreams/Publisher<+TR;>;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;-><init>(Lio/reactivex/Flowable;)V

    .line 51
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast;->selector:Lio/reactivex/functions/Function;

    .line 52
    iput p3, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast;->prefetch:I

    .line 53
    iput-boolean p4, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast;->delayError:Z

    .line 54
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast<TT;TR;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;

    iget v4, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast;->prefetch:I

    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast;->delayError:Z

    invoke-direct {v1, v4, v5}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;-><init>(IZ)V

    .line 63
    .local v1, "mp":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor<TT;>;"
    :try_start_0
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast;->selector:Lio/reactivex/functions/Function;

    invoke-interface {v4, v1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    const-string/jumbo v5, "selector returned a null Publisher"

    invoke-static {v4, v5}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/reactivestreams/Publisher;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .local v2, "other":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    new-instance v3, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$OutputCanceller;

    invoke-direct {v3, p1, v1}, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$OutputCanceller;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$MulticastProcessor;)V

    .line 72
    .local v3, "out":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$OutputCanceller;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$OutputCanceller<TR;>;"
    invoke-interface {v2, v3}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 74
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast;->source:Lio/reactivex/Flowable;

    invoke-virtual {v4, v1}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/FlowableSubscriber;)V

    .line 75
    .end local v2    # "other":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    .end local v3    # "out":Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$OutputCanceller;, "Lio/reactivex/internal/operators/flowable/FlowablePublishMulticast$OutputCanceller<TR;>;"
    :goto_0
    return-void

    .line 64
    :catch_0
    move-exception v0

    .line 65
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 66
    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method
