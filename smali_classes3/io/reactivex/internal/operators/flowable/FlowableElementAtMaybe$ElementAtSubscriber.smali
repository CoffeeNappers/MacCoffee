.class final Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;
.super Ljava/lang/Object;
.source "FlowableElementAtMaybe.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ElementAtSubscriber"
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

.field count:J

.field done:Z

.field final index:J

.field s:Lorg/reactivestreams/Subscription;


# direct methods
.method constructor <init>(Lio/reactivex/MaybeObserver;J)V
    .locals 0
    .param p2, "index"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;J)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber<TT;>;"
    .local p1, "actual":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->actual:Lio/reactivex/MaybeObserver;

    .line 58
    iput-wide p2, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->index:J

    .line 59
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 108
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 109
    sget-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 110
    return-void
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 114
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->s:Lorg/reactivestreams/Subscription;

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
    .locals 1

    .prologue
    .line 99
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber<TT;>;"
    sget-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 100
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->done:Z

    if-nez v0, :cond_0

    .line 101
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->done:Z

    .line 102
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0}, Lio/reactivex/MaybeObserver;->onComplete()V

    .line 104
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 88
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 89
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 95
    :goto_0
    return-void

    .line 92
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->done:Z

    .line 93
    sget-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 94
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->actual:Lio/reactivex/MaybeObserver;

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
    .line 72
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->done:Z

    if-eqz v2, :cond_0

    .line 84
    :goto_0
    return-void

    .line 75
    :cond_0
    iget-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->count:J

    .line 76
    .local v0, "c":J
    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->index:J

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    .line 77
    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->done:Z

    .line 78
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 79
    sget-object v2, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 80
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v2, p1}, Lio/reactivex/MaybeObserver;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0

    .line 83
    :cond_1
    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->count:J

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 63
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 64
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 65
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p0}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 66
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 68
    :cond_0
    return-void
.end method
