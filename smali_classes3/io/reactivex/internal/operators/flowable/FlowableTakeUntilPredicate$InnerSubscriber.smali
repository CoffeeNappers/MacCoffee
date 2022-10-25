.class final Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;
.super Ljava/lang/Object;
.source "FlowableTakeUntilPredicate.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "InnerSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

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
            "<-TT;>;",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 43
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->predicate:Lio/reactivex/functions/Predicate;

    .line 44
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 100
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 101
    return-void
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 87
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->done:Z

    if-nez v0, :cond_0

    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->done:Z

    .line 89
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 91
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 77
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->done:Z

    if-nez v0, :cond_0

    .line 78
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->done:Z

    .line 79
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 83
    :goto_0
    return-void

    .line 81
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

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
    .line 56
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->done:Z

    if-nez v2, :cond_0

    .line 57
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 60
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->predicate:Lio/reactivex/functions/Predicate;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 67
    .local v0, "b":Z
    if-eqz v0, :cond_0

    .line 68
    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->done:Z

    .line 69
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 70
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 73
    .end local v0    # "b":Z
    :cond_0
    :goto_0
    return-void

    .line 61
    :catch_0
    move-exception v1

    .line 62
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 63
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 64
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 48
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 50
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 52
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 95
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTakeUntilPredicate$InnerSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 96
    return-void
.end method
