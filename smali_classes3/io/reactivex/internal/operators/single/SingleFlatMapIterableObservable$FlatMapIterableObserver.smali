.class final Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;
.super Lio/reactivex/internal/observers/BasicIntQueueDisposable;
.source "SingleFlatMapIterableObservable.java"

# interfaces
.implements Lio/reactivex/SingleObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable;
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
        "Lio/reactivex/internal/observers/BasicIntQueueDisposable",
        "<TR;>;",
        "Lio/reactivex/SingleObserver",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x7c0d039055ea7eaeL


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
    .line 69
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Ljava/lang/Iterable<+TR;>;>;"
    invoke-direct {p0}, Lio/reactivex/internal/observers/BasicIntQueueDisposable;-><init>()V

    .line 70
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->actual:Lio/reactivex/Observer;

    .line 71
    iput-object p2, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->mapper:Lio/reactivex/functions/Function;

    .line 72
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 177
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    const/4 v0, 0x0

    iput-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    .line 178
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 156
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->cancelled:Z

    .line 157
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 158
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 159
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 163
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->cancelled:Z

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 182
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 150
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 151
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 152
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 76
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 77
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 79
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 81
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
    .line 85
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->actual:Lio/reactivex/Observer;

    .line 89
    .local v0, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    :try_start_0
    iget-object v6, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v6, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Iterable;

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 91
    .local v4, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 98
    .local v3, "has":Z
    if-nez v3, :cond_1

    .line 99
    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 146
    .end local v3    # "has":Z
    .end local v4    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    :cond_0
    :goto_0
    return-void

    .line 92
    :catch_0
    move-exception v2

    .line 93
    .local v2, "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 94
    iget-object v6, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v6, v2}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 103
    .end local v2    # "ex":Ljava/lang/Throwable;
    .restart local v3    # "has":Z
    .restart local v4    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    :cond_1
    iget-boolean v6, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->outputFused:Z

    if-eqz v6, :cond_2

    .line 104
    iput-object v4, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    .line 105
    const/4 v6, 0x0

    invoke-interface {v0, v6}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 106
    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 109
    :cond_2
    iget-boolean v6, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->cancelled:Z

    if-nez v6, :cond_0

    .line 116
    :try_start_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v5

    .line 123
    .local v5, "v":Ljava/lang/Object;, "TR;"
    invoke-interface {v0, v5}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 125
    iget-boolean v6, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->cancelled:Z

    if-nez v6, :cond_0

    .line 133
    :try_start_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    move-result v1

    .line 140
    .local v1, "b":Z
    if-nez v1, :cond_2

    .line 141
    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 117
    .end local v1    # "b":Z
    .end local v5    # "v":Ljava/lang/Object;, "TR;"
    :catch_1
    move-exception v2

    .line 118
    .restart local v2    # "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 119
    invoke-interface {v0, v2}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 134
    .end local v2    # "ex":Ljava/lang/Throwable;
    .restart local v5    # "v":Ljava/lang/Object;, "TR;"
    :catch_2
    move-exception v2

    .line 135
    .restart local v2    # "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 136
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
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    const/4 v2, 0x0

    .line 188
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    .line 190
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    if-eqz v0, :cond_1

    .line 191
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "The iterator returned a null value"

    invoke-static {v3, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 192
    .local v1, "v":Ljava/lang/Object;, "TR;"
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 193
    iput-object v2, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->it:Ljava/util/Iterator;

    .line 197
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
    .line 168
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;, "Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver<TT;TR;>;"
    and-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_0

    .line 169
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/single/SingleFlatMapIterableObservable$FlatMapIterableObserver;->outputFused:Z

    .line 170
    const/4 v0, 0x2

    .line 172
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
