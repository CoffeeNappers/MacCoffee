.class final Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;
.super Lio/reactivex/internal/subscribers/BasicFuseableSubscriber;
.source "FlowableMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MapSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscribers/BasicFuseableSubscriber",
        "<TT;TU;>;"
    }
.end annotation


# instance fields
.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+TU;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TU;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TU;>;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber<TT;TU;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TU;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/subscribers/BasicFuseableSubscriber;-><init>(Lorg/reactivestreams/Subscriber;)V

    .line 47
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;->mapper:Lio/reactivex/functions/Function;

    .line 48
    return-void
.end method


# virtual methods
.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber<TT;TU;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;->done:Z

    if-eqz v2, :cond_0

    .line 70
    :goto_0
    return-void

    .line 56
    :cond_0
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;->sourceMode:I

    if-eqz v2, :cond_1

    .line 57
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 64
    :cond_1
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The mapper function returned a null value."

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 69
    .local v1, "v":Ljava/lang/Object;, "TU;"
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, v1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 65
    .end local v1    # "v":Ljava/lang/Object;, "TU;"
    :catch_0
    move-exception v0

    .line 66
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;->fail(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public poll()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber<TT;TU;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    invoke-interface {v1}, Lio/reactivex/internal/fuseable/QueueSubscription;->poll()Ljava/lang/Object;

    move-result-object v0

    .line 81
    .local v0, "t":Ljava/lang/Object;, "TT;"
    if-eqz v0, :cond_0

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v1, v0}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string/jumbo v2, "The mapper function returned a null value."

    invoke-static {v1, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public requestFusion(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 74
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber<TT;TU;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;->transitiveBoundaryFusion(I)I

    move-result v0

    return v0
.end method
