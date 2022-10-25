.class final Lio/reactivex/processors/SerializedProcessor;
.super Lio/reactivex/processors/FlowableProcessor;
.source "SerializedProcessor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/processors/FlowableProcessor",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final actual:Lio/reactivex/processors/FlowableProcessor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/processors/FlowableProcessor",
            "<TT;>;"
        }
    .end annotation
.end field

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


# direct methods
.method constructor <init>(Lio/reactivex/processors/FlowableProcessor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/processors/FlowableProcessor",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lio/reactivex/processors/SerializedProcessor;, "Lio/reactivex/processors/SerializedProcessor<TT;>;"
    .local p1, "actual":Lio/reactivex/processors/FlowableProcessor;, "Lio/reactivex/processors/FlowableProcessor<TT;>;"
    invoke-direct {p0}, Lio/reactivex/processors/FlowableProcessor;-><init>()V

    .line 42
    iput-object p1, p0, Lio/reactivex/processors/SerializedProcessor;->actual:Lio/reactivex/processors/FlowableProcessor;

    .line 43
    return-void
.end method


# virtual methods
.method emitLoop()V
    .locals 2

    .prologue
    .line 166
    .local p0, "this":Lio/reactivex/processors/SerializedProcessor;, "Lio/reactivex/processors/SerializedProcessor<TT;>;"
    :goto_0
    monitor-enter p0

    .line 167
    :try_start_0
    iget-object v0, p0, Lio/reactivex/processors/SerializedProcessor;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 168
    .local v0, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v0, :cond_0

    .line 169
    const/4 v1, 0x0

    iput-boolean v1, p0, Lio/reactivex/processors/SerializedProcessor;->emitting:Z

    .line 170
    monitor-exit p0

    return-void

    .line 172
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/processors/SerializedProcessor;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 173
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 175
    iget-object v1, p0, Lio/reactivex/processors/SerializedProcessor;->actual:Lio/reactivex/processors/FlowableProcessor;

    invoke-virtual {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->accept(Lorg/reactivestreams/Subscriber;)Z

    goto :goto_0

    .line 173
    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 191
    .local p0, "this":Lio/reactivex/processors/SerializedProcessor;, "Lio/reactivex/processors/SerializedProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/SerializedProcessor;->actual:Lio/reactivex/processors/FlowableProcessor;

    invoke-virtual {v0}, Lio/reactivex/processors/FlowableProcessor;->getThrowable()Ljava/lang/Throwable;

    move-result-object v0

    return-object v0
.end method

.method public hasComplete()Z
    .locals 1

    .prologue
    .line 196
    .local p0, "this":Lio/reactivex/processors/SerializedProcessor;, "Lio/reactivex/processors/SerializedProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/SerializedProcessor;->actual:Lio/reactivex/processors/FlowableProcessor;

    invoke-virtual {v0}, Lio/reactivex/processors/FlowableProcessor;->hasComplete()Z

    move-result v0

    return v0
.end method

.method public hasSubscribers()Z
    .locals 1

    .prologue
    .line 181
    .local p0, "this":Lio/reactivex/processors/SerializedProcessor;, "Lio/reactivex/processors/SerializedProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/SerializedProcessor;->actual:Lio/reactivex/processors/FlowableProcessor;

    invoke-virtual {v0}, Lio/reactivex/processors/FlowableProcessor;->hasSubscribers()Z

    move-result v0

    return v0
.end method

.method public hasThrowable()Z
    .locals 1

    .prologue
    .line 186
    .local p0, "this":Lio/reactivex/processors/SerializedProcessor;, "Lio/reactivex/processors/SerializedProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/SerializedProcessor;->actual:Lio/reactivex/processors/FlowableProcessor;

    invoke-virtual {v0}, Lio/reactivex/processors/FlowableProcessor;->hasThrowable()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 140
    .local p0, "this":Lio/reactivex/processors/SerializedProcessor;, "Lio/reactivex/processors/SerializedProcessor<TT;>;"
    iget-boolean v1, p0, Lio/reactivex/processors/SerializedProcessor;->done:Z

    if-eqz v1, :cond_0

    .line 160
    :goto_0
    return-void

    .line 143
    :cond_0
    monitor-enter p0

    .line 144
    :try_start_0
    iget-boolean v1, p0, Lio/reactivex/processors/SerializedProcessor;->done:Z

    if-eqz v1, :cond_1

    .line 145
    monitor-exit p0

    goto :goto_0

    .line 158
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 147
    :cond_1
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lio/reactivex/processors/SerializedProcessor;->done:Z

    .line 148
    iget-boolean v1, p0, Lio/reactivex/processors/SerializedProcessor;->emitting:Z

    if-eqz v1, :cond_3

    .line 149
    iget-object v0, p0, Lio/reactivex/processors/SerializedProcessor;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 150
    .local v0, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v0, :cond_2

    .line 151
    new-instance v0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 152
    .restart local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/processors/SerializedProcessor;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 154
    :cond_2
    invoke-static {}, Lio/reactivex/internal/util/NotificationLite;->complete()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->add(Ljava/lang/Object;)V

    .line 155
    monitor-exit p0

    goto :goto_0

    .line 157
    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :cond_3
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/processors/SerializedProcessor;->emitting:Z

    .line 158
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 159
    iget-object v1, p0, Lio/reactivex/processors/SerializedProcessor;->actual:Lio/reactivex/processors/FlowableProcessor;

    invoke-virtual {v1}, Lio/reactivex/processors/FlowableProcessor;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 108
    .local p0, "this":Lio/reactivex/processors/SerializedProcessor;, "Lio/reactivex/processors/SerializedProcessor<TT;>;"
    iget-boolean v2, p0, Lio/reactivex/processors/SerializedProcessor;->done:Z

    if-eqz v2, :cond_0

    .line 109
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 136
    :goto_0
    return-void

    .line 113
    :cond_0
    monitor-enter p0

    .line 114
    :try_start_0
    iget-boolean v2, p0, Lio/reactivex/processors/SerializedProcessor;->done:Z

    if-eqz v2, :cond_1

    .line 115
    const/4 v1, 0x1

    .line 130
    .local v1, "reportError":Z
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    if-eqz v1, :cond_4

    .line 132
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 117
    .end local v1    # "reportError":Z
    :cond_1
    const/4 v2, 0x1

    :try_start_1
    iput-boolean v2, p0, Lio/reactivex/processors/SerializedProcessor;->done:Z

    .line 118
    iget-boolean v2, p0, Lio/reactivex/processors/SerializedProcessor;->emitting:Z

    if-eqz v2, :cond_3

    .line 119
    iget-object v0, p0, Lio/reactivex/processors/SerializedProcessor;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 120
    .local v0, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v0, :cond_2

    .line 121
    new-instance v0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v2, 0x4

    invoke-direct {v0, v2}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 122
    .restart local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/processors/SerializedProcessor;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 124
    :cond_2
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->setFirst(Ljava/lang/Object;)V

    .line 125
    monitor-exit p0

    goto :goto_0

    .line 130
    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 127
    :cond_3
    const/4 v1, 0x0

    .line 128
    .restart local v1    # "reportError":Z
    const/4 v2, 0x1

    :try_start_2
    iput-boolean v2, p0, Lio/reactivex/processors/SerializedProcessor;->emitting:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 135
    :cond_4
    iget-object v2, p0, Lio/reactivex/processors/SerializedProcessor;->actual:Lio/reactivex/processors/FlowableProcessor;

    invoke-virtual {v2, p1}, Lio/reactivex/processors/FlowableProcessor;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 84
    .local p0, "this":Lio/reactivex/processors/SerializedProcessor;, "Lio/reactivex/processors/SerializedProcessor<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v1, p0, Lio/reactivex/processors/SerializedProcessor;->done:Z

    if-eqz v1, :cond_0

    .line 104
    :goto_0
    return-void

    .line 87
    :cond_0
    monitor-enter p0

    .line 88
    :try_start_0
    iget-boolean v1, p0, Lio/reactivex/processors/SerializedProcessor;->done:Z

    if-eqz v1, :cond_1

    .line 89
    monitor-exit p0

    goto :goto_0

    .line 101
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 91
    :cond_1
    :try_start_1
    iget-boolean v1, p0, Lio/reactivex/processors/SerializedProcessor;->emitting:Z

    if-eqz v1, :cond_3

    .line 92
    iget-object v0, p0, Lio/reactivex/processors/SerializedProcessor;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 93
    .local v0, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v0, :cond_2

    .line 94
    new-instance v0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 95
    .restart local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/processors/SerializedProcessor;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 97
    :cond_2
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->add(Ljava/lang/Object;)V

    .line 98
    monitor-exit p0

    goto :goto_0

    .line 100
    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :cond_3
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/processors/SerializedProcessor;->emitting:Z

    .line 101
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 102
    iget-object v1, p0, Lio/reactivex/processors/SerializedProcessor;->actual:Lio/reactivex/processors/FlowableProcessor;

    invoke-virtual {v1, p1}, Lio/reactivex/processors/FlowableProcessor;->onNext(Ljava/lang/Object;)V

    .line 103
    invoke-virtual {p0}, Lio/reactivex/processors/SerializedProcessor;->emitLoop()V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 3
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 53
    .local p0, "this":Lio/reactivex/processors/SerializedProcessor;, "Lio/reactivex/processors/SerializedProcessor<TT;>;"
    iget-boolean v2, p0, Lio/reactivex/processors/SerializedProcessor;->done:Z

    if-nez v2, :cond_3

    .line 54
    monitor-enter p0

    .line 55
    :try_start_0
    iget-boolean v2, p0, Lio/reactivex/processors/SerializedProcessor;->done:Z

    if-eqz v2, :cond_0

    .line 56
    const/4 v0, 0x1

    .line 70
    .local v0, "cancel":Z
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    :goto_1
    if-eqz v0, :cond_4

    .line 75
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 80
    .end local v0    # "cancel":Z
    :goto_2
    return-void

    .line 58
    :cond_0
    :try_start_1
    iget-boolean v2, p0, Lio/reactivex/processors/SerializedProcessor;->emitting:Z

    if-eqz v2, :cond_2

    .line 59
    iget-object v1, p0, Lio/reactivex/processors/SerializedProcessor;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 60
    .local v1, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v1, :cond_1

    .line 61
    new-instance v1, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v1    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 62
    .restart local v1    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v1, p0, Lio/reactivex/processors/SerializedProcessor;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 64
    :cond_1
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->subscription(Lorg/reactivestreams/Subscription;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->add(Ljava/lang/Object;)V

    .line 65
    monitor-exit p0

    goto :goto_2

    .line 70
    .end local v1    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 67
    :cond_2
    const/4 v2, 0x1

    :try_start_2
    iput-boolean v2, p0, Lio/reactivex/processors/SerializedProcessor;->emitting:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 68
    const/4 v0, 0x0

    .restart local v0    # "cancel":Z
    goto :goto_0

    .line 72
    .end local v0    # "cancel":Z
    :cond_3
    const/4 v0, 0x1

    .restart local v0    # "cancel":Z
    goto :goto_1

    .line 77
    :cond_4
    iget-object v2, p0, Lio/reactivex/processors/SerializedProcessor;->actual:Lio/reactivex/processors/FlowableProcessor;

    invoke-virtual {v2, p1}, Lio/reactivex/processors/FlowableProcessor;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 78
    invoke-virtual {p0}, Lio/reactivex/processors/SerializedProcessor;->emitLoop()V

    goto :goto_2
.end method

.method protected subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lio/reactivex/processors/SerializedProcessor;, "Lio/reactivex/processors/SerializedProcessor<TT;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/SerializedProcessor;->actual:Lio/reactivex/processors/FlowableProcessor;

    invoke-virtual {v0, p1}, Lio/reactivex/processors/FlowableProcessor;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 48
    return-void
.end method
