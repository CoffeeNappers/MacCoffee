.class final Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;
.super Lio/reactivex/internal/observers/BasicIntQueueDisposable;
.source "ObservableObserveOn.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableObserveOn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ObserveOnObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/observers/BasicIntQueueDisposable",
        "<TT;>;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x5b45d4a143741ca0L


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final bufferSize:I

.field volatile cancelled:Z

.field final delayError:Z

.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field outputFused:Z

.field queue:Lio/reactivex/internal/fuseable/SimpleQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<TT;>;"
        }
    .end annotation
.end field

.field s:Lio/reactivex/disposables/Disposable;

.field sourceMode:I

.field final worker:Lio/reactivex/Scheduler$Worker;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/Scheduler$Worker;ZI)V
    .locals 0
    .param p2, "worker"    # Lio/reactivex/Scheduler$Worker;
    .param p3, "delayError"    # Z
    .param p4, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;",
            "Lio/reactivex/Scheduler$Worker;",
            "ZI)V"
        }
    .end annotation

    .prologue
    .line 71
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;, "Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    invoke-direct {p0}, Lio/reactivex/internal/observers/BasicIntQueueDisposable;-><init>()V

    .line 72
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    .line 73
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    .line 74
    iput-boolean p3, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->delayError:Z

    .line 75
    iput p4, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->bufferSize:I

    .line 76
    return-void
.end method


# virtual methods
.method checkTerminated(ZZLio/reactivex/Observer;)Z
    .locals 3
    .param p1, "d"    # Z
    .param p2, "empty"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lio/reactivex/Observer",
            "<-TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;, "Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver<TT;>;"
    .local p3, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    const/4 v1, 0x1

    .line 257
    iget-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->cancelled:Z

    if-eqz v2, :cond_0

    .line 258
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v2}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 287
    :goto_0
    return v1

    .line 261
    :cond_0
    if-eqz p1, :cond_4

    .line 262
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->error:Ljava/lang/Throwable;

    .line 263
    .local v0, "e":Ljava/lang/Throwable;
    iget-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->delayError:Z

    if-eqz v2, :cond_2

    .line 264
    if-eqz p2, :cond_4

    .line 265
    if-eqz v0, :cond_1

    .line 266
    invoke-interface {p3, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 270
    :goto_1
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v2}, Lio/reactivex/Scheduler$Worker;->dispose()V

    goto :goto_0

    .line 268
    :cond_1
    invoke-interface {p3}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_1

    .line 274
    :cond_2
    if-eqz v0, :cond_3

    .line 275
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v2}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 276
    invoke-interface {p3, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 277
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v2}, Lio/reactivex/Scheduler$Worker;->dispose()V

    goto :goto_0

    .line 280
    :cond_3
    if-eqz p2, :cond_4

    .line 281
    invoke-interface {p3}, Lio/reactivex/Observer;->onComplete()V

    .line 282
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v2}, Lio/reactivex/Scheduler$Worker;->dispose()V

    goto :goto_0

    .line 287
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_4
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 307
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;, "Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 308
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 144
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;, "Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->cancelled:Z

    if-nez v0, :cond_0

    .line 145
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->cancelled:Z

    .line 146
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 147
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 148
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 149
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 152
    :cond_0
    return-void
.end method

.method drainFused()V
    .locals 5

    .prologue
    .line 211
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;, "Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver<TT;>;"
    const/4 v2, 0x1

    .line 214
    .local v2, "missed":I
    :cond_0
    iget-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->cancelled:Z

    if-eqz v3, :cond_1

    .line 245
    :goto_0
    return-void

    .line 218
    :cond_1
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    .line 219
    .local v0, "d":Z
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->error:Ljava/lang/Throwable;

    .line 221
    .local v1, "ex":Ljava/lang/Throwable;
    iget-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->delayError:Z

    if-nez v3, :cond_2

    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    .line 222
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->error:Ljava/lang/Throwable;

    invoke-interface {v3, v4}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 223
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v3}, Lio/reactivex/Scheduler$Worker;->dispose()V

    goto :goto_0

    .line 227
    :cond_2
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 229
    if-eqz v0, :cond_4

    .line 230
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->error:Ljava/lang/Throwable;

    .line 231
    if-eqz v1, :cond_3

    .line 232
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, v1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 236
    :goto_1
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v3}, Lio/reactivex/Scheduler$Worker;->dispose()V

    goto :goto_0

    .line 234
    :cond_3
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v3}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_1

    .line 240
    :cond_4
    neg-int v3, v2

    invoke-virtual {p0, v3}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->addAndGet(I)I

    move-result v2

    .line 241
    if-nez v2, :cond_0

    goto :goto_0
.end method

.method drainNormal()V
    .locals 9

    .prologue
    .line 166
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;, "Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver<TT;>;"
    const/4 v4, 0x1

    .line 168
    .local v4, "missed":I
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 169
    .local v5, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    .line 172
    .local v0, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    :cond_0
    iget-boolean v7, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v8

    invoke-virtual {p0, v7, v8, v0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->checkTerminated(ZZLio/reactivex/Observer;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 208
    :cond_1
    :goto_0
    return-void

    .line 200
    .local v1, "d":Z
    .local v2, "empty":Z
    .local v6, "v":Ljava/lang/Object;, "TT;"
    :cond_2
    invoke-interface {v0, v6}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 177
    .end local v1    # "d":Z
    .end local v2    # "empty":Z
    .end local v6    # "v":Ljava/lang/Object;, "TT;"
    :cond_3
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    .line 181
    .restart local v1    # "d":Z
    :try_start_0
    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 190
    .restart local v6    # "v":Ljava/lang/Object;, "TT;"
    if-nez v6, :cond_4

    const/4 v2, 0x1

    .line 192
    .restart local v2    # "empty":Z
    :goto_1
    invoke-virtual {p0, v1, v2, v0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->checkTerminated(ZZLio/reactivex/Observer;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 196
    if-eqz v2, :cond_2

    .line 203
    neg-int v7, v4

    invoke-virtual {p0, v7}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->addAndGet(I)I

    move-result v4

    .line 204
    if-nez v4, :cond_0

    goto :goto_0

    .line 182
    .end local v2    # "empty":Z
    .end local v6    # "v":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v3

    .line 183
    .local v3, "ex":Ljava/lang/Throwable;
    invoke-static {v3}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 184
    iget-object v7, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v7}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 185
    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 186
    invoke-interface {v0, v3}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 187
    iget-object v7, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v7}, Lio/reactivex/Scheduler$Worker;->dispose()V

    goto :goto_0

    .line 190
    .end local v3    # "ex":Ljava/lang/Throwable;
    .restart local v6    # "v":Ljava/lang/Object;, "TT;"
    :cond_4
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 156
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;, "Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->cancelled:Z

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 312
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;, "Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 135
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;, "Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    if-eqz v0, :cond_0

    .line 140
    :goto_0
    return-void

    .line 138
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    .line 139
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->schedule()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 124
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;, "Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    if-eqz v0, :cond_0

    .line 125
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 131
    :goto_0
    return-void

    .line 128
    :cond_0
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->error:Ljava/lang/Throwable;

    .line 129
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    .line 130
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->schedule()V

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
    .line 112
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;, "Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    if-eqz v0, :cond_0

    .line 120
    :goto_0
    return-void

    .line 116
    :cond_0
    iget v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->sourceMode:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    .line 117
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    .line 119
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->schedule()V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 4
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;, "Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver<TT;>;"
    const/4 v3, 0x1

    .line 80
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v2, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 81
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 82
    instance-of v2, p1, Lio/reactivex/internal/fuseable/QueueDisposable;

    if-eqz v2, :cond_2

    move-object v1, p1

    .line 84
    check-cast v1, Lio/reactivex/internal/fuseable/QueueDisposable;

    .line 86
    .local v1, "qd":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    const/4 v2, 0x7

    invoke-interface {v1, v2}, Lio/reactivex/internal/fuseable/QueueDisposable;->requestFusion(I)I

    move-result v0

    .line 88
    .local v0, "m":I
    if-ne v0, v3, :cond_1

    .line 89
    iput v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->sourceMode:I

    .line 90
    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 91
    iput-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    .line 92
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 93
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->schedule()V

    .line 108
    .end local v0    # "m":I
    .end local v1    # "qd":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    :cond_0
    :goto_0
    return-void

    .line 96
    .restart local v0    # "m":I
    .restart local v1    # "qd":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    :cond_1
    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    .line 97
    iput v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->sourceMode:I

    .line 98
    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 99
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    goto :goto_0

    .line 104
    .end local v0    # "m":I
    .end local v1    # "qd":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    :cond_2
    new-instance v2, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    iget v3, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->bufferSize:I

    invoke-direct {v2, v3}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 106
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    goto :goto_0
.end method

.method public poll()Ljava/lang/Object;
    .locals 1
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
    .line 302
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;, "Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public requestFusion(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 292
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;, "Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver<TT;>;"
    and-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_0

    .line 293
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->outputFused:Z

    .line 294
    const/4 v0, 0x2

    .line 296
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public run()V
    .locals 1

    .prologue
    .line 249
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;, "Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->outputFused:Z

    if-eqz v0, :cond_0

    .line 250
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->drainFused()V

    .line 254
    :goto_0
    return-void

    .line 252
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->drainNormal()V

    goto :goto_0
.end method

.method schedule()V
    .locals 1

    .prologue
    .line 160
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;, "Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 161
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0, p0}, Lio/reactivex/Scheduler$Worker;->schedule(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;

    .line 163
    :cond_0
    return-void
.end method
