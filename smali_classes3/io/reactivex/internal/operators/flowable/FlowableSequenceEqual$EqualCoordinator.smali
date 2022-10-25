.class final Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;
.super Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;
.source "FlowableSequenceEqual.java"

# interfaces
.implements Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinatorHelper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "EqualCoordinator"
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
        "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinatorHelper;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x55bcb3aaa8a061f8L


# instance fields
.field final comparer:Lio/reactivex/functions/BiPredicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiPredicate",
            "<-TT;-TT;>;"
        }
    .end annotation
.end field

.field final error:Lio/reactivex/internal/util/AtomicThrowable;

.field final first:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber",
            "<TT;>;"
        }
    .end annotation
.end field

.field final second:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber",
            "<TT;>;"
        }
    .end annotation
.end field

.field v1:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field v2:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field final wip:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;ILio/reactivex/functions/BiPredicate;)V
    .locals 1
    .param p2, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-",
            "Ljava/lang/Boolean;",
            ">;I",
            "Lio/reactivex/functions/BiPredicate",
            "<-TT;-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Ljava/lang/Boolean;>;"
    .local p3, "comparer":Lio/reactivex/functions/BiPredicate;, "Lio/reactivex/functions/BiPredicate<-TT;-TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;-><init>(Lorg/reactivestreams/Subscriber;)V

    .line 81
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->comparer:Lio/reactivex/functions/BiPredicate;

    .line 82
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 83
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-direct {v0, p0, p2}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinatorHelper;I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->first:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    .line 84
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-direct {v0, p0, p2}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinatorHelper;I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->second:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    .line 85
    new-instance v0, Lio/reactivex/internal/util/AtomicThrowable;

    invoke-direct {v0}, Lio/reactivex/internal/util/AtomicThrowable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->error:Lio/reactivex/internal/util/AtomicThrowable;

    .line 86
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 95
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator<TT;>;"
    invoke-super {p0}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->cancel()V

    .line 96
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->first:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->cancel()V

    .line 97
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->second:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->cancel()V

    .line 98
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 99
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->first:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->clear()V

    .line 100
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->second:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->clear()V

    .line 102
    :cond_0
    return-void
.end method

.method cancelAndClear()V
    .locals 1

    .prologue
    .line 105
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->first:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->cancel()V

    .line 106
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->first:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->clear()V

    .line 107
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->second:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->cancel()V

    .line 108
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->second:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->clear()V

    .line 109
    return-void
.end method

.method public drain()V
    .locals 14

    .prologue
    .line 113
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator<TT;>;"
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v12}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v12

    if-eqz v12, :cond_0

    .line 233
    :goto_0
    return-void

    .line 117
    :cond_0
    const/4 v9, 0x1

    .line 120
    .local v9, "missed":I
    :cond_1
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->first:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    iget-object v10, v12, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 121
    .local v10, "q1":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->second:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    iget-object v11, v12, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 123
    .local v11, "q2":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    if-eqz v10, :cond_d

    if-eqz v11, :cond_d

    .line 125
    :goto_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->isCancelled()Z

    move-result v12

    if-eqz v12, :cond_2

    .line 126
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->first:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-virtual {v12}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->clear()V

    .line 127
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->second:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-virtual {v12}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->clear()V

    goto :goto_0

    .line 131
    :cond_2
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v12}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Throwable;

    .line 132
    .local v7, "ex":Ljava/lang/Throwable;
    if-eqz v7, :cond_3

    .line 133
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->cancelAndClear()V

    .line 135
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v13, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v13}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 139
    :cond_3
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->first:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    iget-boolean v3, v12, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->done:Z

    .line 141
    .local v3, "d1":Z
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->v1:Ljava/lang/Object;

    .line 142
    .local v0, "a":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_4

    .line 144
    :try_start_0
    invoke-interface {v10}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 152
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->v1:Ljava/lang/Object;

    .line 154
    :cond_4
    if-nez v0, :cond_6

    const/4 v5, 0x1

    .line 156
    .local v5, "e1":Z
    :goto_2
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->second:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    iget-boolean v4, v12, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->done:Z

    .line 157
    .local v4, "d2":Z
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->v2:Ljava/lang/Object;

    .line 158
    .local v1, "b":Ljava/lang/Object;, "TT;"
    if-nez v1, :cond_5

    .line 160
    :try_start_1
    invoke-interface {v11}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    .line 168
    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->v2:Ljava/lang/Object;

    .line 171
    :cond_5
    if-nez v1, :cond_7

    const/4 v6, 0x1

    .line 173
    .local v6, "e2":Z
    :goto_3
    if-eqz v3, :cond_8

    if-eqz v4, :cond_8

    if-eqz v5, :cond_8

    if-eqz v6, :cond_8

    .line 174
    const/4 v12, 0x1

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    invoke-virtual {p0, v12}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->complete(Ljava/lang/Object;)V

    goto :goto_0

    .line 145
    .end local v1    # "b":Ljava/lang/Object;, "TT;"
    .end local v4    # "d2":Z
    .end local v5    # "e1":Z
    .end local v6    # "e2":Z
    :catch_0
    move-exception v8

    .line 146
    .local v8, "exc":Ljava/lang/Throwable;
    invoke-static {v8}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 147
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->cancelAndClear()V

    .line 148
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v12, v8}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 149
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v13, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v13}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 154
    .end local v8    # "exc":Ljava/lang/Throwable;
    :cond_6
    const/4 v5, 0x0

    goto :goto_2

    .line 161
    .restart local v1    # "b":Ljava/lang/Object;, "TT;"
    .restart local v4    # "d2":Z
    .restart local v5    # "e1":Z
    :catch_1
    move-exception v8

    .line 162
    .restart local v8    # "exc":Ljava/lang/Throwable;
    invoke-static {v8}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 163
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->cancelAndClear()V

    .line 164
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v12, v8}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 165
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v13, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v13}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 171
    .end local v8    # "exc":Ljava/lang/Throwable;
    :cond_7
    const/4 v6, 0x0

    goto :goto_3

    .line 177
    .restart local v6    # "e2":Z
    :cond_8
    if-eqz v3, :cond_9

    if-eqz v4, :cond_9

    if-eq v5, v6, :cond_9

    .line 178
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->cancelAndClear()V

    .line 179
    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    invoke-virtual {p0, v12}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->complete(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 183
    :cond_9
    if-nez v5, :cond_a

    if-eqz v6, :cond_b

    .line 228
    .end local v0    # "a":Ljava/lang/Object;, "TT;"
    .end local v1    # "b":Ljava/lang/Object;, "TT;"
    .end local v3    # "d1":Z
    .end local v4    # "d2":Z
    .end local v5    # "e1":Z
    .end local v6    # "e2":Z
    :cond_a
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    neg-int v13, v9

    invoke-virtual {v12, v13}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move-result v9

    .line 229
    if-nez v9, :cond_1

    goto/16 :goto_0

    .line 190
    .restart local v0    # "a":Ljava/lang/Object;, "TT;"
    .restart local v1    # "b":Ljava/lang/Object;, "TT;"
    .restart local v3    # "d1":Z
    .restart local v4    # "d2":Z
    .restart local v5    # "e1":Z
    .restart local v6    # "e2":Z
    :cond_b
    :try_start_2
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->comparer:Lio/reactivex/functions/BiPredicate;

    invoke-interface {v12, v0, v1}, Lio/reactivex/functions/BiPredicate;->test(Ljava/lang/Object;Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    move-result v2

    .line 199
    .local v2, "c":Z
    if-nez v2, :cond_c

    .line 200
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->cancelAndClear()V

    .line 201
    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    invoke-virtual {p0, v12}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->complete(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 191
    .end local v2    # "c":Z
    :catch_2
    move-exception v8

    .line 192
    .restart local v8    # "exc":Ljava/lang/Throwable;
    invoke-static {v8}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 193
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->cancelAndClear()V

    .line 194
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v12, v8}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 195
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v13, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v13}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 205
    .end local v8    # "exc":Ljava/lang/Throwable;
    .restart local v2    # "c":Z
    :cond_c
    const/4 v12, 0x0

    iput-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->v1:Ljava/lang/Object;

    .line 206
    const/4 v12, 0x0

    iput-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->v2:Ljava/lang/Object;

    .line 208
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->first:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-virtual {v12}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->request()V

    .line 209
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->second:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-virtual {v12}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->request()V

    goto/16 :goto_1

    .line 213
    .end local v0    # "a":Ljava/lang/Object;, "TT;"
    .end local v1    # "b":Ljava/lang/Object;, "TT;"
    .end local v2    # "c":Z
    .end local v3    # "d1":Z
    .end local v4    # "d2":Z
    .end local v5    # "e1":Z
    .end local v6    # "e2":Z
    .end local v7    # "ex":Ljava/lang/Throwable;
    :cond_d
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->isCancelled()Z

    move-result v12

    if-eqz v12, :cond_e

    .line 214
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->first:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-virtual {v12}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->clear()V

    .line 215
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->second:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-virtual {v12}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;->clear()V

    goto/16 :goto_0

    .line 219
    :cond_e
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v12}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Throwable;

    .line 220
    .restart local v7    # "ex":Ljava/lang/Throwable;
    if-eqz v7, :cond_a

    .line 221
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->cancelAndClear()V

    .line 223
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v13, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v13}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0
.end method

.method public innerError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 237
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 238
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->drain()V

    .line 242
    :goto_0
    return-void

    .line 240
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method subscribe(Lorg/reactivestreams/Publisher;Lorg/reactivestreams/Publisher;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator<TT;>;"
    .local p1, "source1":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    .local p2, "source2":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->first:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-interface {p1, v0}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 90
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualCoordinator;->second:Lio/reactivex/internal/operators/flowable/FlowableSequenceEqual$EqualSubscriber;

    invoke-interface {p2, v0}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 91
    return-void
.end method
