.class final Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;
.super Ljava/lang/Object;
.source "FlowableSingleMaybe.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SingleElementSubscriber"
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

.field s:Lorg/reactivestreams/Subscription;

.field value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/MaybeObserver;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 53
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber<TT;>;"
    .local p1, "actual":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->actual:Lio/reactivex/MaybeObserver;

    .line 55
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 110
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 111
    sget-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 112
    return-void
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 116
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->s:Lorg/reactivestreams/Subscription;

    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 94
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber<TT;>;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->done:Z

    if-eqz v1, :cond_0

    .line 106
    :goto_0
    return-void

    .line 97
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->done:Z

    .line 98
    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 99
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->value:Ljava/lang/Object;

    .line 100
    .local v0, "v":Ljava/lang/Object;, "TT;"
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->value:Ljava/lang/Object;

    .line 101
    if-nez v0, :cond_1

    .line 102
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v1}, Lio/reactivex/MaybeObserver;->onComplete()V

    goto :goto_0

    .line 104
    :cond_1
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v1, v0}, Lio/reactivex/MaybeObserver;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 83
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 84
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 90
    :goto_0
    return-void

    .line 87
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->done:Z

    .line 88
    sget-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 89
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 79
    :goto_0
    return-void

    .line 71
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->value:Ljava/lang/Object;

    if-eqz v0, :cond_1

    .line 72
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->done:Z

    .line 73
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 74
    sget-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 75
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->actual:Lio/reactivex/MaybeObserver;

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Sequence contains more than one element!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 78
    :cond_1
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->value:Ljava/lang/Object;

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 59
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 61
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSingleMaybe$SingleElementSubscriber;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p0}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 62
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 64
    :cond_0
    return-void
.end method
