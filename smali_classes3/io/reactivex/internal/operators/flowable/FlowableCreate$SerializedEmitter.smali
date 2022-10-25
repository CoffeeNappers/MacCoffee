.class final Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableCreate.java"

# interfaces
.implements Lio/reactivex/FlowableEmitter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableCreate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SerializedEmitter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/FlowableEmitter",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x43c4fdd95fbcd5c6L


# instance fields
.field volatile done:Z

.field final emitter:Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter",
            "<TT;>;"
        }
    .end annotation
.end field

.field final error:Lio/reactivex/internal/util/AtomicThrowable;

.field final queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/SimplePlainQueue",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 98
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter<TT;>;"
    .local p1, "emitter":Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 99
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->emitter:Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;

    .line 100
    new-instance v0, Lio/reactivex/internal/util/AtomicThrowable;

    invoke-direct {v0}, Lio/reactivex/internal/util/AtomicThrowable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->error:Lio/reactivex/internal/util/AtomicThrowable;

    .line 101
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 102
    return-void
.end method


# virtual methods
.method drain()V
    .locals 1

    .prologue
    .line 157
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 158
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->drainLoop()V

    .line 160
    :cond_0
    return-void
.end method

.method drainLoop()V
    .locals 8

    .prologue
    .line 163
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->emitter:Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;

    .line 164
    .local v1, "e":Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter<TT;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 165
    .local v5, "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->error:Lio/reactivex/internal/util/AtomicThrowable;

    .line 166
    .local v3, "error":Lio/reactivex/internal/util/AtomicThrowable;
    const/4 v4, 0x1

    .line 170
    .local v4, "missed":I
    :cond_0
    :goto_0
    invoke-virtual {v1}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->isCancelled()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 171
    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    .line 204
    :goto_1
    return-void

    .line 175
    :cond_1
    invoke-virtual {v3}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 176
    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    .line 177
    invoke-virtual {v3}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v7

    invoke-virtual {v1, v7}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 181
    :cond_2
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->done:Z

    .line 183
    .local v0, "d":Z
    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->poll()Ljava/lang/Object;

    move-result-object v6

    .line 185
    .local v6, "v":Ljava/lang/Object;, "TT;"
    if-nez v6, :cond_3

    const/4 v2, 0x1

    .line 187
    .local v2, "empty":Z
    :goto_2
    if-eqz v0, :cond_4

    if-eqz v2, :cond_4

    .line 188
    invoke-virtual {v1}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->onComplete()V

    goto :goto_1

    .line 185
    .end local v2    # "empty":Z
    :cond_3
    const/4 v2, 0x0

    goto :goto_2

    .line 192
    .restart local v2    # "empty":Z
    :cond_4
    if-eqz v2, :cond_5

    .line 199
    neg-int v7, v4

    invoke-virtual {p0, v7}, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->addAndGet(I)I

    move-result v4

    .line 200
    if-nez v4, :cond_0

    goto :goto_1

    .line 196
    :cond_5
    invoke-virtual {v1, v6}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->onNext(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 223
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->emitter:Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->isCancelled()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 149
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->emitter:Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->done:Z

    if-eqz v0, :cond_1

    .line 154
    :cond_0
    :goto_0
    return-void

    .line 152
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->done:Z

    .line 153
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->drain()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 132
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->emitter:Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->done:Z

    if-eqz v0, :cond_1

    .line 133
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 145
    :goto_0
    return-void

    .line 136
    :cond_1
    if-nez p1, :cond_2

    .line 137
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "t":Ljava/lang/Throwable;
    const-string/jumbo v0, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 139
    .restart local p1    # "t":Ljava/lang/Throwable;
    :cond_2
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 140
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->done:Z

    .line 141
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->drain()V

    goto :goto_0

    .line 143
    :cond_3
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
    .line 106
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->emitter:Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;

    invoke-virtual {v1}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->done:Z

    if-eqz v1, :cond_1

    .line 128
    :cond_0
    :goto_0
    return-void

    .line 109
    :cond_1
    if-nez p1, :cond_2

    .line 110
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 113
    :cond_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->get()I

    move-result v1

    if-nez v1, :cond_4

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->compareAndSet(II)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 114
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->emitter:Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;

    invoke-virtual {v1, p1}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->onNext(Ljava/lang/Object;)V

    .line 115
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->decrementAndGet()I

    move-result v1

    if-eqz v1, :cond_0

    .line 127
    :cond_3
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->drainLoop()V

    goto :goto_0

    .line 119
    :cond_4
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 120
    .local v0, "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TT;>;"
    monitor-enter v0

    .line 121
    :try_start_0
    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 122
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->getAndIncrement()I

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_0

    .line 122
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public requested()J
    .locals 2

    .prologue
    .line 218
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->emitter:Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->requested()J

    move-result-wide v0

    return-wide v0
.end method

.method public serialize()Lio/reactivex/FlowableEmitter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/FlowableEmitter",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 228
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter<TT;>;"
    return-object p0
.end method

.method public setCancellable(Lio/reactivex/functions/Cancellable;)V
    .locals 1
    .param p1, "c"    # Lio/reactivex/functions/Cancellable;

    .prologue
    .line 213
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->emitter:Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->setCancellable(Lio/reactivex/functions/Cancellable;)V

    .line 214
    return-void
.end method

.method public setDisposable(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 208
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$SerializedEmitter;->emitter:Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->setDisposable(Lio/reactivex/disposables/Disposable;)V

    .line 209
    return-void
.end method
