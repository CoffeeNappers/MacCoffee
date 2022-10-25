.class public final Lio/reactivex/internal/operators/observable/ObservableFromIterable;
.super Lio/reactivex/Observable;
.source "ObservableFromIterable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Observable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final source:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromIterable;, "Lio/reactivex/internal/operators/observable/ObservableFromIterable<TT;>;"
    .local p1, "source":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+TT;>;"
    invoke-direct {p0}, Lio/reactivex/Observable;-><init>()V

    .line 28
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable;->source:Ljava/lang/Iterable;

    .line 29
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/Observer;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromIterable;, "Lio/reactivex/internal/operators/observable/ObservableFromIterable<TT;>;"
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    :try_start_0
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable;->source:Ljava/lang/Iterable;

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 43
    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TT;>;"
    :try_start_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result v2

    .line 49
    .local v2, "hasNext":Z
    if-nez v2, :cond_1

    .line 50
    invoke-static {p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->complete(Lio/reactivex/Observer;)V

    .line 60
    .end local v2    # "hasNext":Z
    .end local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TT;>;"
    :cond_0
    :goto_0
    return-void

    .line 36
    :catch_0
    move-exception v1

    .line 37
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 38
    invoke-static {v1, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/Observer;)V

    goto :goto_0

    .line 44
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TT;>;"
    :catch_1
    move-exception v1

    .line 45
    .restart local v1    # "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 46
    invoke-static {v1, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/Observer;)V

    goto :goto_0

    .line 54
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v2    # "hasNext":Z
    :cond_1
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;

    invoke-direct {v0, p1, v3}, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;-><init>(Lio/reactivex/Observer;Ljava/util/Iterator;)V

    .line 55
    .local v0, "d":Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable<TT;>;"
    invoke-interface {p1, v0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 57
    iget-boolean v4, v0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->fusionMode:Z

    if-nez v4, :cond_0

    .line 58
    invoke-virtual {v0}, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->run()V

    goto :goto_0
.end method
