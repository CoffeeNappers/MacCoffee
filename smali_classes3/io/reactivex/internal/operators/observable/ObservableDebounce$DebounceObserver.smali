.class final Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;
.super Ljava/lang/Object;
.source "ObservableDebounce.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableDebounce;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DebounceObserver"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver$DebounceInnerObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
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
            "<-TT;>;"
        }
    .end annotation
.end field

.field final debounceSelector:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<TU;>;>;"
        }
    .end annotation
.end field

.field final debouncer:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;"
        }
    .end annotation
.end field

.field done:Z

.field volatile index:J

.field s:Lio/reactivex/disposables/Disposable;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<TU;>;>;)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;, "Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver<TT;TU;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    .local p2, "debounceSelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<TU;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->debouncer:Ljava/util/concurrent/atomic/AtomicReference;

    .line 55
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->actual:Lio/reactivex/Observer;

    .line 56
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->debounceSelector:Lio/reactivex/functions/Function;

    .line 57
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 123
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;, "Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 124
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->debouncer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 125
    return-void
.end method

.method emit(JLjava/lang/Object;)V
    .locals 3
    .param p1, "idx"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTT;)V"
        }
    .end annotation

    .prologue
    .line 133
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;, "Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver<TT;TU;>;"
    .local p3, "value":Ljava/lang/Object;, "TT;"
    iget-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->index:J

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 134
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p3}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 136
    :cond_0
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 129
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;, "Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 3

    .prologue
    .line 107
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;, "Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver<TT;TU;>;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->done:Z

    if-eqz v2, :cond_1

    .line 119
    :cond_0
    :goto_0
    return-void

    .line 110
    :cond_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->done:Z

    .line 111
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->debouncer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    .line 112
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    sget-object v2, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-eq v0, v2, :cond_0

    move-object v1, v0

    .line 114
    check-cast v1, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver$DebounceInnerObserver;

    .line 115
    .local v1, "dis":Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver$DebounceInnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver$DebounceInnerObserver<TT;TU;>;"
    invoke-virtual {v1}, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver$DebounceInnerObserver;->emit()V

    .line 116
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->debouncer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v2}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 117
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 101
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;, "Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->debouncer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 102
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 103
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;, "Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver<TT;TU;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v6, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->done:Z

    if-eqz v6, :cond_1

    .line 97
    :cond_0
    :goto_0
    return-void

    .line 73
    :cond_1
    iget-wide v6, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->index:J

    const-wide/16 v8, 0x1

    add-long v4, v6, v8

    .line 74
    .local v4, "idx":J
    iput-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->index:J

    .line 76
    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->debouncer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    .line 77
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    if-eqz v0, :cond_2

    .line 78
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 84
    :cond_2
    :try_start_0
    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->debounceSelector:Lio/reactivex/functions/Function;

    invoke-interface {v6, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    const-string/jumbo v7, "The publisher supplied is null"

    invoke-static {v6, v7}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/reactivex/ObservableSource;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .local v3, "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver$DebounceInnerObserver;

    invoke-direct {v1, p0, v4, v5, p1}, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver$DebounceInnerObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;JLjava/lang/Object;)V

    .line 94
    .local v1, "dis":Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver$DebounceInnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver$DebounceInnerObserver<TT;TU;>;"
    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->debouncer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 95
    invoke-interface {v3, v1}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    goto :goto_0

    .line 85
    .end local v1    # "dis":Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver$DebounceInnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver$DebounceInnerObserver<TT;TU;>;"
    .end local v3    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    :catch_0
    move-exception v2

    .line 86
    .local v2, "e":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 87
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->dispose()V

    .line 88
    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v6, v2}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 61
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;, "Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 63
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDebounce$DebounceObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 65
    :cond_0
    return-void
.end method
