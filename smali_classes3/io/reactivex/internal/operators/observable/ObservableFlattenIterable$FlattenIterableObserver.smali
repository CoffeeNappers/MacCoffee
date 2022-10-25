.class final Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;
.super Ljava/lang/Object;
.source "ObservableFlattenIterable.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableFlattenIterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FlattenIterableObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
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

.field d:Lio/reactivex/disposables/Disposable;

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
    .line 54
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver<TT;TR;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Ljava/lang/Iterable<+TR;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->actual:Lio/reactivex/Observer;

    .line 56
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->mapper:Lio/reactivex/functions/Function;

    .line 57
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 144
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 145
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 146
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 139
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 130
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-ne v0, v1, :cond_0

    .line 135
    :goto_0
    return-void

    .line 133
    :cond_0
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 134
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 120
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-ne v0, v1, :cond_0

    .line 121
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 126
    :goto_0
    return-void

    .line 124
    :cond_0
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 125
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver<TT;TR;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    sget-object v6, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-ne v5, v6, :cond_1

    .line 116
    :cond_0
    :goto_0
    return-void

    .line 77
    :cond_1
    :try_start_0
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v5, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Iterable;

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 85
    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->actual:Lio/reactivex/Observer;

    .line 91
    .local v0, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    :goto_1
    :try_start_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result v1

    .line 99
    .local v1, "b":Z
    if-eqz v1, :cond_0

    .line 103
    :try_start_2
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    const-string/jumbo v6, "The iterator returned a null value"

    invoke-static {v5, v6}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v4

    .line 111
    .local v4, "v":Ljava/lang/Object;, "TR;"
    invoke-interface {v0, v4}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_1

    .line 78
    .end local v0    # "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    .end local v1    # "b":Z
    .end local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    .end local v4    # "v":Ljava/lang/Object;, "TR;"
    :catch_0
    move-exception v2

    .line 79
    .local v2, "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 80
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v5}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 81
    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 92
    .end local v2    # "ex":Ljava/lang/Throwable;
    .restart local v0    # "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    .restart local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TR;>;"
    :catch_1
    move-exception v2

    .line 93
    .restart local v2    # "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 94
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v5}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 95
    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 104
    .end local v2    # "ex":Ljava/lang/Throwable;
    .restart local v1    # "b":Z
    :catch_2
    move-exception v2

    .line 105
    .restart local v2    # "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 106
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v5}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 107
    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 61
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 64
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlattenIterable$FlattenIterableObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 66
    :cond_0
    return-void
.end method
