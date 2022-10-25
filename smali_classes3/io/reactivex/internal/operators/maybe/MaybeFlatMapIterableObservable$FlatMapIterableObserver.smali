.class final Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;
.super Lio/reactivex/internal/observers/BasicQueueDisposable;
.source "MaybeFlatMapIterableObservable.java"

# interfaces
.implements Lio/reactivex/MaybeObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FlatMapIterableObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/observers/BasicQueueDisposable",
        "<TR;>;",
        "Lio/reactivex/MaybeObserver",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TR;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field d:Lio/reactivex/disposables/Disposable;

.field volatile it:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<+TR;>;"
        }
    .end annotation
.end field

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Ljava/lang/Iterable",
            "<+TR;>;>;"
        }
    .end annotation
.end field

.field outputFused:Z


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Ljava/lang/Iterable",
            "<+TR;>;>;)V"
        }
    .end annotation

    .prologue
    .line 67
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Ljava/lang/Iterable<+TR;>;>;"
    invoke-direct {p0}, Lio/reactivex/internal/observers/BasicQueueDisposable;-><init>()V

    .line 68
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->actual:Lio/reactivex/Observer;

    .line 69
    iput-object p2, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->mapper:Lio/reactivex/functions/Function;

    .line 70
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 183
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    const/4 v0, 0x0

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    .line 184
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 162
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->cancelled:Z

    .line 163
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 164
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 165
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 169
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->cancelled:Z

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 188
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 157
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 158
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 151
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 152
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 153
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 74
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 77
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 79
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->actual:Lio/reactivex/Observer;

    .line 88
    .local v0, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    :try_start_0
    iget-object v6, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v6, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Iterable;

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 90
    .local v4, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 97
    .local v3, "has":Z
    if-nez v3, :cond_1

    .line 98
    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 144
    .end local v3    # "has":Z
    .end local v4    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    :cond_0
    :goto_0
    return-void

    .line 91
    :catch_0
    move-exception v2

    .line 92
    .local v2, "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 93
    invoke-interface {v0, v2}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 102
    .end local v2    # "ex":Ljava/lang/Throwable;
    .restart local v3    # "has":Z
    .restart local v4    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    :cond_1
    iput-object v4, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    .line 104
    iget-boolean v6, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->outputFused:Z

    if-eqz v6, :cond_2

    .line 105
    const/4 v6, 0x0

    invoke-interface {v0, v6}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 106
    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 111
    :cond_2
    iget-boolean v6, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->cancelled:Z

    if-nez v6, :cond_0

    .line 118
    :try_start_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v5

    .line 125
    .local v5, "v":Ljava/lang/Object;, "TR;"
    invoke-interface {v0, v5}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 127
    iget-boolean v6, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->cancelled:Z

    if-nez v6, :cond_0

    .line 135
    :try_start_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    move-result v1

    .line 142
    .local v1, "b":Z
    if-nez v1, :cond_2

    .line 143
    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 119
    .end local v1    # "b":Z
    .end local v5    # "v":Ljava/lang/Object;, "TR;"
    :catch_1
    move-exception v2

    .line 120
    .restart local v2    # "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 121
    invoke-interface {v0, v2}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 136
    .end local v2    # "ex":Ljava/lang/Throwable;
    .restart local v5    # "v":Ljava/lang/Object;, "TR;"
    :catch_2
    move-exception v2

    .line 137
    .restart local v2    # "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 138
    invoke-interface {v0, v2}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public poll()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
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
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    const/4 v2, 0x0

    .line 194
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    .line 196
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    if-eqz v0, :cond_1

    .line 197
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "The iterator returned a null value"

    invoke-static {v3, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 198
    .local v1, "v":Ljava/lang/Object;, "TR;"
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 199
    iput-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    .line 203
    .end local v1    # "v":Ljava/lang/Object;, "TR;"
    :cond_0
    :goto_0
    return-object v1

    :cond_1
    move-object v1, v2

    goto :goto_0
.end method

.method public requestFusion(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 174
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    and-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_0

    .line 175
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFlatMapIterableObservable$FlatMapIterableObserver;->outputFused:Z

    .line 176
    const/4 v0, 0x2

    .line 178
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
