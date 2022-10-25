.class final Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;
.super Ljava/lang/Object;
.source "FlowableDelay.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableDelay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DelaySubscriber"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber$OnComplete;,
        Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber$OnError;,
        Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber$OnNext;
    }
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

.field final delay:J

.field final delayError:Z

.field s:Lorg/reactivestreams/Subscription;

.field final unit:Ljava/util/concurrent/TimeUnit;

.field final w:Lio/reactivex/Scheduler$Worker;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler$Worker;Z)V
    .locals 0
    .param p2, "delay"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "w"    # Lio/reactivex/Scheduler$Worker;
    .param p6, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler$Worker;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 65
    iput-wide p2, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->delay:J

    .line 66
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    .line 67
    iput-object p5, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->w:Lio/reactivex/Scheduler$Worker;

    .line 68
    iput-boolean p6, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->delayError:Z

    .line 69
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 101
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 102
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->w:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 103
    return-void
.end method

.method public onComplete()V
    .locals 5

    .prologue
    .line 91
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->w:Lio/reactivex/Scheduler$Worker;

    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber$OnComplete;

    invoke-direct {v1, p0}, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber$OnComplete;-><init>(Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;)V

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->delay:J

    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3, v4}, Lio/reactivex/Scheduler$Worker;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    .line 92
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 5
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 86
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber<TT;>;"
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->w:Lio/reactivex/Scheduler$Worker;

    new-instance v3, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber$OnError;

    invoke-direct {v3, p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber$OnError;-><init>(Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;Ljava/lang/Throwable;)V

    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->delayError:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->delay:J

    :goto_0
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3, v0, v1, v4}, Lio/reactivex/Scheduler$Worker;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    .line 87
    return-void

    .line 86
    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->w:Lio/reactivex/Scheduler$Worker;

    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber$OnNext;

    invoke-direct {v1, p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber$OnNext;-><init>(Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;Ljava/lang/Object;)V

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->delay:J

    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3, v4}, Lio/reactivex/Scheduler$Worker;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    .line 82
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 73
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 74
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 75
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 77
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 96
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 97
    return-void
.end method
