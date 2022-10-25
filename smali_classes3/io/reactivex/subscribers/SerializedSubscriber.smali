.class public final Lio/reactivex/subscribers/SerializedSubscriber;
.super Ljava/lang/Object;
.source "SerializedSubscriber.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
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


# static fields
.field static final QUEUE_LINK_SIZE:I = 0x4


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

.field volatile done:Z

.field emitting:Z

.field queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field subscription:Lorg/reactivestreams/Subscription;


# direct methods
.method public constructor <init>(Lorg/reactivestreams/Subscriber;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lio/reactivex/subscribers/SerializedSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Z)V

    .line 52
    return-void
.end method

.method public constructor <init>(Lorg/reactivestreams/Subscriber;Z)V
    .locals 0
    .param p2, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;Z)V"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 63
    iput-boolean p2, p0, Lio/reactivex/subscribers/SerializedSubscriber;->delayError:Z

    .line 64
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 197
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/subscribers/SerializedSubscriber;->subscription:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 198
    return-void
.end method

.method emitLoop()V
    .locals 2

    .prologue
    .line 175
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    :cond_0
    monitor-enter p0

    .line 176
    :try_start_0
    iget-object v0, p0, Lio/reactivex/subscribers/SerializedSubscriber;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 177
    .local v0, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v0, :cond_1

    .line 178
    const/4 v1, 0x0

    iput-boolean v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->emitting:Z

    .line 179
    monitor-exit p0

    .line 185
    :goto_0
    return-void

    .line 181
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 182
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 184
    iget-object v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-virtual {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->accept(Lorg/reactivestreams/Subscriber;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 182
    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 148
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    iget-boolean v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    if-eqz v1, :cond_0

    .line 170
    :goto_0
    return-void

    .line 151
    :cond_0
    monitor-enter p0

    .line 152
    :try_start_0
    iget-boolean v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    if-eqz v1, :cond_1

    .line 153
    monitor-exit p0

    goto :goto_0

    .line 166
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 155
    :cond_1
    :try_start_1
    iget-boolean v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->emitting:Z

    if-eqz v1, :cond_3

    .line 156
    iget-object v0, p0, Lio/reactivex/subscribers/SerializedSubscriber;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 157
    .local v0, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v0, :cond_2

    .line 158
    new-instance v0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 159
    .restart local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/subscribers/SerializedSubscriber;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 161
    :cond_2
    invoke-static {}, Lio/reactivex/internal/util/NotificationLite;->complete()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->add(Ljava/lang/Object;)V

    .line 162
    monitor-exit p0

    goto :goto_0

    .line 164
    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :cond_3
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    .line 165
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->emitting:Z

    .line 166
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 168
    iget-object v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 107
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    iget-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    if-eqz v3, :cond_0

    .line 108
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 144
    :goto_0
    return-void

    .line 112
    :cond_0
    monitor-enter p0

    .line 113
    :try_start_0
    iget-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    if-eqz v3, :cond_1

    .line 114
    const/4 v2, 0x1

    .line 135
    .local v2, "reportError":Z
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 137
    if-eqz v2, :cond_5

    .line 138
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 116
    .end local v2    # "reportError":Z
    :cond_1
    :try_start_1
    iget-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->emitting:Z

    if-eqz v3, :cond_4

    .line 117
    const/4 v3, 0x1

    iput-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    .line 118
    iget-object v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 119
    .local v1, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v1, :cond_2

    .line 120
    new-instance v1, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v1    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v3, 0x4

    invoke-direct {v1, v3}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 121
    .restart local v1    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 123
    :cond_2
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    .line 124
    .local v0, "err":Ljava/lang/Object;
    iget-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->delayError:Z

    if-eqz v3, :cond_3

    .line 125
    invoke-virtual {v1, v0}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->add(Ljava/lang/Object;)V

    .line 129
    :goto_2
    monitor-exit p0

    goto :goto_0

    .line 135
    .end local v0    # "err":Ljava/lang/Object;
    .end local v1    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 127
    .restart local v0    # "err":Ljava/lang/Object;
    .restart local v1    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :cond_3
    :try_start_2
    invoke-virtual {v1, v0}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->setFirst(Ljava/lang/Object;)V

    goto :goto_2

    .line 131
    .end local v0    # "err":Ljava/lang/Object;
    .end local v1    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :cond_4
    const/4 v3, 0x1

    iput-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    .line 132
    const/4 v3, 0x1

    iput-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->emitting:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 133
    const/4 v2, 0x0

    .restart local v2    # "reportError":Z
    goto :goto_1

    .line 142
    :cond_5
    iget-object v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

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
    .line 76
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    if-eqz v1, :cond_0

    .line 103
    :goto_0
    return-void

    .line 79
    :cond_0
    if-nez p1, :cond_1

    .line 80
    iget-object v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->subscription:Lorg/reactivestreams/Subscription;

    invoke-interface {v1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 81
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lio/reactivex/subscribers/SerializedSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 84
    :cond_1
    monitor-enter p0

    .line 85
    :try_start_0
    iget-boolean v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    if-eqz v1, :cond_2

    .line 86
    monitor-exit p0

    goto :goto_0

    .line 98
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 88
    :cond_2
    :try_start_1
    iget-boolean v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->emitting:Z

    if-eqz v1, :cond_4

    .line 89
    iget-object v0, p0, Lio/reactivex/subscribers/SerializedSubscriber;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 90
    .local v0, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v0, :cond_3

    .line 91
    new-instance v0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 92
    .restart local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/subscribers/SerializedSubscriber;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 94
    :cond_3
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->add(Ljava/lang/Object;)V

    .line 95
    monitor-exit p0

    goto :goto_0

    .line 97
    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :cond_4
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->emitting:Z

    .line 98
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    iget-object v1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 102
    invoke-virtual {p0}, Lio/reactivex/subscribers/SerializedSubscriber;->emitLoop()V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/subscribers/SerializedSubscriber;->subscription:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    iput-object p1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->subscription:Lorg/reactivestreams/Subscription;

    .line 70
    iget-object v0, p0, Lio/reactivex/subscribers/SerializedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 72
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 192
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/subscribers/SerializedSubscriber;->subscription:Lorg/reactivestreams/Subscription;

    invoke-interface {v0, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 193
    return-void
.end method
