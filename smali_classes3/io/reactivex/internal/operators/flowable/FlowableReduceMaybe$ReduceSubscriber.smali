.class final Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;
.super Ljava/lang/Object;
.source "FlowableReduceMaybe.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ReduceSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field final actual:Lio/reactivex/MaybeObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;"
        }
    .end annotation
.end field

.field done:Z

.field final reducer:Lio/reactivex/functions/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiFunction",
            "<TT;TT;TT;>;"
        }
    .end annotation
.end field

.field s:Lorg/reactivestreams/Subscription;

.field value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/MaybeObserver;Lio/reactivex/functions/BiFunction;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;",
            "Lio/reactivex/functions/BiFunction",
            "<TT;TT;TT;>;)V"
        }
    .end annotation

    .prologue
    .line 71
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber<TT;>;"
    .local p1, "actual":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    .local p2, "reducer":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TT;TT;TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->actual:Lio/reactivex/MaybeObserver;

    .line 73
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->reducer:Lio/reactivex/functions/BiFunction;

    .line 74
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 78
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 79
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->done:Z

    .line 80
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 84
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->done:Z

    return v0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 129
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber<TT;>;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->done:Z

    if-eqz v1, :cond_0

    .line 140
    :goto_0
    return-void

    .line 132
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->done:Z

    .line 133
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->value:Ljava/lang/Object;

    .line 134
    .local v0, "v":Ljava/lang/Object;, "TT;"
    if-eqz v0, :cond_1

    .line 136
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v1, v0}, Lio/reactivex/MaybeObserver;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0

    .line 138
    :cond_1
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v1}, Lio/reactivex/MaybeObserver;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 119
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 120
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 125
    :goto_0
    return-void

    .line 123
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->done:Z

    .line 124
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 100
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->done:Z

    if-eqz v2, :cond_0

    .line 115
    :goto_0
    return-void

    .line 103
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->value:Ljava/lang/Object;

    .line 104
    .local v1, "v":Ljava/lang/Object;, "TT;"
    if-nez v1, :cond_1

    .line 105
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->value:Ljava/lang/Object;

    goto :goto_0

    .line 108
    :cond_1
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->reducer:Lio/reactivex/functions/BiFunction;

    invoke-interface {v2, v1, p1}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The reducer returned a null value"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->value:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 109
    :catch_0
    move-exception v0

    .line 110
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 111
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 112
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 89
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 92
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableReduceMaybe$ReduceSubscriber;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p0}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 94
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 96
    :cond_0
    return-void
.end method
