.class final Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;
.super Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;
.source "FlowableDoFinally.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableDoFinally;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DoFinallySubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription",
        "<TT;>;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x3907ba0b13897e3dL


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final onFinally:Lio/reactivex/functions/Action;

.field qs:Lio/reactivex/internal/fuseable/QueueSubscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/QueueSubscription",
            "<TT;>;"
        }
    .end annotation
.end field

.field s:Lorg/reactivestreams/Subscription;

.field syncFused:Z


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Action;)V
    .locals 0
    .param p2, "onFinally"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/functions/Action;",
            ")V"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0}, Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;-><init>()V

    .line 66
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 67
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->onFinally:Lio/reactivex/functions/Action;

    .line 68
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 102
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 103
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->runFinally()V

    .line 104
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 126
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/QueueSubscription;->clear()V

    .line 127
    return-void
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 131
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/QueueSubscription;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 96
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 97
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->runFinally()V

    .line 98
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 90
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 91
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->runFinally()V

    .line 92
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 85
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 86
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 73
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 74
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 75
    instance-of v0, p1, Lio/reactivex/internal/fuseable/QueueSubscription;

    if-eqz v0, :cond_0

    .line 76
    check-cast p1, Lio/reactivex/internal/fuseable/QueueSubscription;

    .end local p1    # "s":Lorg/reactivestreams/Subscription;
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    .line 79
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 81
    :cond_1
    return-void
.end method

.method public poll()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
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
    .line 137
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    invoke-interface {v1}, Lio/reactivex/internal/fuseable/QueueSubscription;->poll()Ljava/lang/Object;

    move-result-object v0

    .line 138
    .local v0, "v":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_0

    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->syncFused:Z

    if-eqz v1, :cond_0

    .line 139
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->runFinally()V

    .line 141
    :cond_0
    return-object v0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 108
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 109
    return-void
.end method

.method public requestFusion(I)I
    .locals 5
    .param p1, "mode"    # I

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber<TT;>;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 113
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    .line 114
    .local v1, "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    if-eqz v1, :cond_2

    and-int/lit8 v4, p1, 0x4

    if-nez v4, :cond_2

    .line 115
    invoke-interface {v1, p1}, Lio/reactivex/internal/fuseable/QueueSubscription;->requestFusion(I)I

    move-result v0

    .line 116
    .local v0, "m":I
    if-eqz v0, :cond_0

    .line 117
    if-ne v0, v2, :cond_1

    :goto_0
    iput-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->syncFused:Z

    .line 121
    .end local v0    # "m":I
    :cond_0
    :goto_1
    return v0

    .restart local v0    # "m":I
    :cond_1
    move v2, v3

    .line 117
    goto :goto_0

    .end local v0    # "m":I
    :cond_2
    move v0, v3

    .line 121
    goto :goto_1
.end method

.method runFinally()V
    .locals 3

    .prologue
    .line 145
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber<TT;>;"
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->compareAndSet(II)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 147
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallySubscriber;->onFinally:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    :cond_0
    :goto_0
    return-void

    .line 148
    :catch_0
    move-exception v0

    .line 149
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 150
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
