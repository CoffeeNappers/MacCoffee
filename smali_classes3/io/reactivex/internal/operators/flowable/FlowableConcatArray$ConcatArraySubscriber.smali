.class final Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;
.super Lio/reactivex/internal/subscriptions/SubscriptionArbiter;
.source "FlowableConcatArray.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableConcatArray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ConcatArraySubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscriptions/SubscriptionArbiter;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x71382f6d553150acL


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final delayError:Z

.field errors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field index:I

.field produced:J

.field final sources:[Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;"
        }
    .end annotation
.end field

.field final wip:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method constructor <init>([Lorg/reactivestreams/Publisher;ZLorg/reactivestreams/Subscriber;)V
    .locals 1
    .param p2, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;Z",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber<TT;>;"
    .local p1, "sources":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    .local p3, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;-><init>()V

    .line 62
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 63
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->sources:[Lorg/reactivestreams/Publisher;

    .line 64
    iput-boolean p2, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->delayError:Z

    .line 65
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 66
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 12

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber<TT;>;"
    const-wide/16 v10, 0x0

    .line 96
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v8

    if-nez v8, :cond_1

    .line 97
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->sources:[Lorg/reactivestreams/Publisher;

    .line 98
    .local v5, "sources":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    array-length v3, v5

    .line 99
    .local v3, "n":I
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->index:I

    .line 102
    .local v1, "i":I
    :cond_0
    :goto_0
    if-ne v1, v3, :cond_4

    .line 103
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->errors:Ljava/util/List;

    .line 104
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    if-eqz v2, :cond_3

    .line 105
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_2

    .line 106
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    const/4 v8, 0x0

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Throwable;

    invoke-interface {v9, v8}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 149
    .end local v1    # "i":I
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .end local v3    # "n":I
    .end local v5    # "sources":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    :cond_1
    :goto_1
    return-void

    .line 108
    .restart local v1    # "i":I
    .restart local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v3    # "n":I
    .restart local v5    # "sources":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    :cond_2
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    new-instance v9, Lio/reactivex/exceptions/CompositeException;

    invoke-direct {v9, v2}, Lio/reactivex/exceptions/CompositeException;-><init>(Ljava/lang/Iterable;)V

    invoke-interface {v8, v9}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 111
    :cond_3
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v8}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1

    .line 116
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :cond_4
    aget-object v4, v5, v1

    .line 118
    .local v4, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    if-nez v4, :cond_7

    .line 119
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v8, "A Publisher entry is null"

    invoke-direct {v0, v8}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 120
    .local v0, "ex":Ljava/lang/Throwable;
    iget-boolean v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->delayError:Z

    if-eqz v8, :cond_6

    .line 121
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->errors:Ljava/util/List;

    .line 122
    .restart local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    if-nez v2, :cond_5

    .line 123
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    sub-int v8, v3, v1

    add-int/lit8 v8, v8, 0x1

    invoke-direct {v2, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 124
    .restart local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->errors:Ljava/util/List;

    .line 126
    :cond_5
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    add-int/lit8 v1, v1, 0x1

    .line 128
    goto :goto_0

    .line 130
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :cond_6
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v8, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 134
    .end local v0    # "ex":Ljava/lang/Throwable;
    :cond_7
    iget-wide v6, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->produced:J

    .line 135
    .local v6, "r":J
    cmp-long v8, v6, v10

    if-eqz v8, :cond_8

    .line 136
    iput-wide v10, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->produced:J

    .line 137
    invoke-virtual {p0, v6, v7}, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->produced(J)V

    .line 139
    :cond_8
    invoke-interface {v4, p0}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 142
    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->index:I

    .line 144
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v8

    if-nez v8, :cond_0

    goto :goto_1
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 81
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber<TT;>;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->delayError:Z

    if-eqz v1, :cond_1

    .line 82
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->errors:Ljava/util/List;

    .line 83
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    if-nez v0, :cond_0

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->sources:[Lorg/reactivestreams/Publisher;

    array-length v1, v1

    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->index:I

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 85
    .restart local v0    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->errors:Ljava/util/List;

    .line 87
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->onComplete()V

    .line 92
    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :goto_0
    return-void

    .line 90
    :cond_1
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

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
    .line 75
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->produced:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->produced:J

    .line 76
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 77
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 0
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 70
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber<TT;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableConcatArray$ConcatArraySubscriber;->setSubscription(Lorg/reactivestreams/Subscription;)V

    .line 71
    return-void
.end method
