.class public final Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "InnerQueuedSubscriber.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Lorg/reactivestreams/Subscription;",
        ">;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x51462814a312b8L


# instance fields
.field volatile done:Z

.field fusionMode:I

.field final limit:I

.field final parent:Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport",
            "<TT;>;"
        }
    .end annotation
.end field

.field final prefetch:I

.field produced:J

.field volatile queue:Lio/reactivex/internal/fuseable/SimpleQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport;I)V
    .locals 1
    .param p2, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport",
            "<TT;>;I)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TT;>;"
    .local p1, "parent":Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 53
    iput-object p1, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->parent:Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport;

    .line 54
    iput p2, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->prefetch:I

    .line 55
    shr-int/lit8 v0, p2, 0x2

    sub-int v0, p2, v0

    iput v0, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->limit:I

    .line 56
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 0

    .prologue
    .line 133
    .local p0, "this":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TT;>;"
    invoke-static {p0}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->cancel(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 134
    return-void
.end method

.method public isDone()Z
    .locals 1

    .prologue
    .line 137
    .local p0, "this":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->done:Z

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 103
    .local p0, "this":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->parent:Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport;

    invoke-interface {v0, p0}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport;->innerComplete(Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;)V

    .line 104
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 98
    .local p0, "this":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->parent:Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport;

    invoke-interface {v0, p0, p1}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport;->innerError(Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;Ljava/lang/Throwable;)V

    .line 99
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
    .line 89
    .local p0, "this":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget v0, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->fusionMode:I

    if-nez v0, :cond_0

    .line 90
    iget-object v0, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->parent:Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport;

    invoke-interface {v0, p0, p1}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport;->innerNext(Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;Ljava/lang/Object;)V

    .line 94
    :goto_0
    return-void

    .line 92
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->parent:Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport;

    invoke-interface {v0}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport;->drain()V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 4
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .local p0, "this":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TT;>;"
    const/4 v3, 0x1

    .line 60
    invoke-static {p0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lorg/reactivestreams/Subscription;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 61
    instance-of v2, p1, Lio/reactivex/internal/fuseable/QueueSubscription;

    if-eqz v2, :cond_2

    move-object v1, p1

    .line 63
    check-cast v1, Lio/reactivex/internal/fuseable/QueueSubscription;

    .line 65
    .local v1, "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    const/4 v2, 0x3

    invoke-interface {v1, v2}, Lio/reactivex/internal/fuseable/QueueSubscription;->requestFusion(I)I

    move-result v0

    .line 66
    .local v0, "m":I
    if-ne v0, v3, :cond_1

    .line 67
    iput v0, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->fusionMode:I

    .line 68
    iput-object v1, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 69
    iput-boolean v3, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->done:Z

    .line 70
    iget-object v2, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->parent:Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport;

    invoke-interface {v2, p0}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriberSupport;->innerComplete(Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;)V

    .line 85
    .end local v0    # "m":I
    .end local v1    # "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    :cond_0
    :goto_0
    return-void

    .line 73
    .restart local v0    # "m":I
    .restart local v1    # "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    :cond_1
    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    .line 74
    iput v0, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->fusionMode:I

    .line 75
    iput-object v1, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 76
    iget v2, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->prefetch:I

    invoke-static {p1, v2}, Lio/reactivex/internal/util/QueueDrainHelper;->request(Lorg/reactivestreams/Subscription;I)V

    goto :goto_0

    .line 81
    .end local v0    # "m":I
    .end local v1    # "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    :cond_2
    iget v2, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->prefetch:I

    invoke-static {v2}, Lio/reactivex/internal/util/QueueDrainHelper;->createQueue(I)Lio/reactivex/internal/fuseable/SimpleQueue;

    move-result-object v2

    iput-object v2, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 83
    iget v2, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->prefetch:I

    invoke-static {p1, v2}, Lio/reactivex/internal/util/QueueDrainHelper;->request(Lorg/reactivestreams/Subscription;I)V

    goto :goto_0
.end method

.method public queue()Lio/reactivex/internal/fuseable/SimpleQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 145
    .local p0, "this":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    return-object v0
.end method

.method public request(J)V
    .locals 5
    .param p1, "n"    # J

    .prologue
    .line 108
    .local p0, "this":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TT;>;"
    iget v2, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->fusionMode:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_0

    .line 109
    iget-wide v2, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->produced:J

    add-long v0, v2, p1

    .line 110
    .local v0, "p":J
    iget v2, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->limit:I

    int-to-long v2, v2

    cmp-long v2, v0, v2

    if-ltz v2, :cond_1

    .line 111
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->produced:J

    .line 112
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/reactivestreams/Subscription;

    invoke-interface {v2, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 117
    .end local v0    # "p":J
    :cond_0
    :goto_0
    return-void

    .line 114
    .restart local v0    # "p":J
    :cond_1
    iput-wide v0, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->produced:J

    goto :goto_0
.end method

.method public requestOne()V
    .locals 6

    .prologue
    .line 120
    .local p0, "this":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TT;>;"
    iget v2, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->fusionMode:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_0

    .line 121
    iget-wide v2, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->produced:J

    const-wide/16 v4, 0x1

    add-long v0, v2, v4

    .line 122
    .local v0, "p":J
    iget v2, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->limit:I

    int-to-long v2, v2

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    .line 123
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->produced:J

    .line 124
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/reactivestreams/Subscription;

    invoke-interface {v2, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 129
    .end local v0    # "p":J
    :cond_0
    :goto_0
    return-void

    .line 126
    .restart local v0    # "p":J
    :cond_1
    iput-wide v0, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->produced:J

    goto :goto_0
.end method

.method public setDone()V
    .locals 1

    .prologue
    .line 141
    .local p0, "this":Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;, "Lio/reactivex/internal/subscribers/InnerQueuedSubscriber<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/subscribers/InnerQueuedSubscriber;->done:Z

    .line 142
    return-void
.end method
