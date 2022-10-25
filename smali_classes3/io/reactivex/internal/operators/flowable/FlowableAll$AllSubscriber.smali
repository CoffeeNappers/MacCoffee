.class final Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;
.super Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;
.source "FlowableAll.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableAll;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "AllSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscriptions/DeferredScalarSubscription",
        "<",
        "Ljava/lang/Boolean;",
        ">;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x30dd8e720af3c075L


# instance fields
.field done:Z

.field final predicate:Lio/reactivex/functions/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;"
        }
    .end annotation
.end field

.field s:Lorg/reactivestreams/Subscription;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Predicate;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-",
            "Ljava/lang/Boolean;",
            ">;",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Ljava/lang/Boolean;>;"
    .local p2, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;-><init>(Lorg/reactivestreams/Subscriber;)V

    .line 48
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->predicate:Lio/reactivex/functions/Predicate;

    .line 49
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 102
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber<TT;>;"
    invoke-super {p0}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->cancel()V

    .line 103
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 104
    return-void
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber<TT;>;"
    const/4 v1, 0x1

    .line 92
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 98
    :goto_0
    return-void

    .line 95
    :cond_0
    iput-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->done:Z

    .line 97
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->complete(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 82
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 83
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 88
    :goto_0
    return-void

    .line 86
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->done:Z

    .line 87
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

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
    .line 61
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->done:Z

    if-eqz v2, :cond_1

    .line 78
    :cond_0
    :goto_0
    return-void

    .line 66
    :cond_1
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->predicate:Lio/reactivex/functions/Predicate;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 73
    .local v0, "b":Z
    if-nez v0, :cond_0

    .line 74
    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->done:Z

    .line 75
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 76
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->complete(Ljava/lang/Object;)V

    goto :goto_0

    .line 67
    .end local v0    # "b":Z
    :catch_0
    move-exception v1

    .line 68
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 69
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 70
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 52
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 54
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableAll$AllSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 55
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 57
    :cond_0
    return-void
.end method
