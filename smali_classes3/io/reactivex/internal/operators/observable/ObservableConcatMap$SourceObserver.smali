.class final Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableConcatMap.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableConcatMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SourceObserver"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver$InnerObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x7a85719c209ca572L


# instance fields
.field volatile active:Z

.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TU;>;"
        }
    .end annotation
.end field

.field final bufferSize:I

.field volatile disposed:Z

.field volatile done:Z

.field fusionMode:I

.field final inner:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<TU;>;"
        }
    .end annotation
.end field

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;>;"
        }
    .end annotation
.end field

.field queue:Lio/reactivex/internal/fuseable/SimpleQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<TT;>;"
        }
    .end annotation
.end field

.field s:Lio/reactivex/disposables/Disposable;

.field final sa:Lio/reactivex/internal/disposables/SequentialDisposable;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;I)V
    .locals 1
    .param p3, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TU;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;>;I)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver<TT;TU;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TU;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TU;>;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 81
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->actual:Lio/reactivex/Observer;

    .line 82
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->mapper:Lio/reactivex/functions/Function;

    .line 83
    iput p3, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->bufferSize:I

    .line 84
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver$InnerObserver;

    invoke-direct {v0, p1, p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver$InnerObserver;-><init>(Lio/reactivex/Observer;Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;)V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->inner:Lio/reactivex/Observer;

    .line 85
    new-instance v0, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->sa:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 86
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 163
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver<TT;TU;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->disposed:Z

    .line 164
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->sa:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;->dispose()V

    .line 165
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 167
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 168
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 170
    :cond_0
    return-void
.end method

.method drain()V
    .locals 8

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver<TT;TU;>;"
    const/4 v5, 0x1

    .line 177
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->getAndIncrement()I

    move-result v6

    if-eqz v6, :cond_0

    .line 231
    :goto_0
    return-void

    .line 182
    :cond_0
    iget-boolean v6, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->disposed:Z

    if-eqz v6, :cond_1

    .line 183
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    goto :goto_0

    .line 186
    :cond_1
    iget-boolean v6, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->active:Z

    if-nez v6, :cond_4

    .line 188
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->done:Z

    .line 193
    .local v0, "d":Z
    :try_start_0
    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v6}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 202
    .local v4, "t":Ljava/lang/Object;, "TT;"
    if-nez v4, :cond_2

    move v1, v5

    .line 204
    .local v1, "empty":Z
    :goto_1
    if-eqz v0, :cond_3

    if-eqz v1, :cond_3

    .line 205
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v5}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 194
    .end local v1    # "empty":Z
    .end local v4    # "t":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v2

    .line 195
    .local v2, "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 196
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->dispose()V

    .line 197
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 198
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v5, v2}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 202
    .end local v2    # "ex":Ljava/lang/Throwable;
    .restart local v4    # "t":Ljava/lang/Object;, "TT;"
    :cond_2
    const/4 v1, 0x0

    goto :goto_1

    .line 209
    .restart local v1    # "empty":Z
    :cond_3
    if-nez v1, :cond_4

    .line 213
    :try_start_1
    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v6, v4}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    const-string/jumbo v7, "The mapper returned a null ObservableSource"

    invoke-static {v6, v7}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/reactivex/ObservableSource;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 222
    .local v3, "o":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TU;>;"
    iput-boolean v5, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->active:Z

    .line 223
    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->inner:Lio/reactivex/Observer;

    invoke-interface {v3, v6}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 227
    .end local v0    # "d":Z
    .end local v1    # "empty":Z
    .end local v3    # "o":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TU;>;"
    .end local v4    # "t":Ljava/lang/Object;, "TT;"
    :cond_4
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->decrementAndGet()I

    move-result v6

    if-nez v6, :cond_0

    goto :goto_0

    .line 214
    .restart local v0    # "d":Z
    .restart local v1    # "empty":Z
    .restart local v4    # "t":Ljava/lang/Object;, "TT;"
    :catch_1
    move-exception v2

    .line 215
    .restart local v2    # "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 216
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->dispose()V

    .line 217
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 218
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v5, v2}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method innerComplete()V
    .locals 1

    .prologue
    .line 152
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver<TT;TU;>;"
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->active:Z

    .line 153
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->drain()V

    .line 154
    return-void
.end method

.method innerSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 173
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->sa:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/disposables/SequentialDisposable;->update(Lio/reactivex/disposables/Disposable;)Z

    .line 174
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 158
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver<TT;TU;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->disposed:Z

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 144
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver<TT;TU;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->done:Z

    if-eqz v0, :cond_0

    .line 149
    :goto_0
    return-void

    .line 147
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->done:Z

    .line 148
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->drain()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 134
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver<TT;TU;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->done:Z

    if-eqz v0, :cond_0

    .line 135
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 141
    :goto_0
    return-void

    .line 138
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->done:Z

    .line 139
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->dispose()V

    .line 140
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 124
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver<TT;TU;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->done:Z

    if-eqz v0, :cond_0

    .line 131
    :goto_0
    return-void

    .line 127
    :cond_0
    iget v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->fusionMode:I

    if-nez v0, :cond_1

    .line 128
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    .line 130
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->drain()V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 4
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver<TT;TU;>;"
    const/4 v3, 0x1

    .line 89
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v2, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 90
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 91
    instance-of v2, p1, Lio/reactivex/internal/fuseable/QueueDisposable;

    if-eqz v2, :cond_2

    move-object v1, p1

    .line 93
    check-cast v1, Lio/reactivex/internal/fuseable/QueueDisposable;

    .line 95
    .local v1, "qd":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    const/4 v2, 0x3

    invoke-interface {v1, v2}, Lio/reactivex/internal/fuseable/QueueDisposable;->requestFusion(I)I

    move-result v0

    .line 96
    .local v0, "m":I
    if-ne v0, v3, :cond_1

    .line 97
    iput v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->fusionMode:I

    .line 98
    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 99
    iput-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->done:Z

    .line 101
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 103
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->drain()V

    .line 121
    .end local v0    # "m":I
    .end local v1    # "qd":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    :cond_0
    :goto_0
    return-void

    .line 107
    .restart local v0    # "m":I
    .restart local v1    # "qd":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    :cond_1
    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    .line 108
    iput v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->fusionMode:I

    .line 109
    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 111
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    goto :goto_0

    .line 117
    .end local v0    # "m":I
    .end local v1    # "qd":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    :cond_2
    new-instance v2, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    iget v3, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->bufferSize:I

    invoke-direct {v2, v3}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 119
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    goto :goto_0
.end method
