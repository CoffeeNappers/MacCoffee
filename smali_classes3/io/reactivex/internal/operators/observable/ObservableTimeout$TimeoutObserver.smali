.class final Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "ObservableTimeout.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;
.implements Lio/reactivex/internal/operators/observable/ObservableTimeout$OnTimeout;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableTimeout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "TimeoutObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Lio/reactivex/disposables/Disposable;",
        ">;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;",
        "Lio/reactivex/internal/operators/observable/ObservableTimeout$OnTimeout;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x25177a41a9ed6d0cL


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final firstTimeoutIndicator:Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableSource",
            "<TU;>;"
        }
    .end annotation
.end field

.field volatile index:J

.field final itemTimeoutIndicator:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<TV;>;>;"
        }
    .end annotation
.end field

.field s:Lio/reactivex/disposables/Disposable;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;",
            "Lio/reactivex/ObservableSource",
            "<TU;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<TV;>;>;)V"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;, "Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver<TT;TU;TV;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    .local p2, "firstTimeoutIndicator":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    .local p3, "itemTimeoutIndicator":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<TV;>;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 73
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->actual:Lio/reactivex/Observer;

    .line 74
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->firstTimeoutIndicator:Lio/reactivex/ObservableSource;

    .line 75
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->itemTimeoutIndicator:Lio/reactivex/functions/Function;

    .line 76
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 144
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;, "Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver<TT;TU;TV;>;"
    invoke-static {p0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 147
    :cond_0
    return-void
.end method

.method public innerError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 164
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;, "Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver<TT;TU;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 165
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 166
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 151
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;, "Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver<TT;TU;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 138
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;, "Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver<TT;TU;TV;>;"
    invoke-static {p0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 139
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 140
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 132
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;, "Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver<TT;TU;TV;>;"
    invoke-static {p0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 133
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 134
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
    .line 102
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;, "Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver<TT;TU;TV;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-wide v6, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->index:J

    const-wide/16 v8, 0x1

    add-long v2, v6, v8

    .line 103
    .local v2, "idx":J
    iput-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->index:J

    .line 105
    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v6, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 107
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    .line 108
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    if-eqz v0, :cond_0

    .line 109
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 115
    :cond_0
    :try_start_0
    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->itemTimeoutIndicator:Lio/reactivex/functions/Function;

    invoke-interface {v6, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    const-string/jumbo v7, "The ObservableSource returned is null"

    invoke-static {v6, v7}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/reactivex/ObservableSource;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 123
    .local v4, "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TV;>;"
    new-instance v5, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;

    invoke-direct {v5, p0, v2, v3}, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableTimeout$OnTimeout;J)V

    .line 125
    .local v5, "tis":Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver<TT;TU;TV;>;"
    invoke-virtual {p0, v0, v5}, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 126
    invoke-interface {v4, v5}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 128
    .end local v4    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TV;>;"
    .end local v5    # "tis":Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver<TT;TU;TV;>;"
    :cond_1
    :goto_0
    return-void

    .line 116
    :catch_0
    move-exception v1

    .line 117
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 118
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->dispose()V

    .line 119
    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v6, v1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 6
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 80
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;, "Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver<TT;TU;TV;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v3, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 81
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 83
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->actual:Lio/reactivex/Observer;

    .line 85
    .local v0, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->firstTimeoutIndicator:Lio/reactivex/ObservableSource;

    .line 87
    .local v1, "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    if-eqz v1, :cond_1

    .line 88
    new-instance v2, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;

    const-wide/16 v4, 0x0

    invoke-direct {v2, p0, v4, v5}, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableTimeout$OnTimeout;J)V

    .line 90
    .local v2, "tis":Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver<TT;TU;TV;>;"
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v2}, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 91
    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 92
    invoke-interface {v1, v2}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 98
    .end local v0    # "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    .end local v1    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    .end local v2    # "tis":Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver<TT;TU;TV;>;"
    :cond_0
    :goto_0
    return-void

    .line 95
    .restart local v0    # "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    .restart local v1    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    :cond_1
    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    goto :goto_0
.end method

.method public timeout(J)V
    .locals 3
    .param p1, "idx"    # J

    .prologue
    .line 156
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;, "Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver<TT;TU;TV;>;"
    iget-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->index:J

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 157
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->dispose()V

    .line 158
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutObserver;->actual:Lio/reactivex/Observer;

    new-instance v1, Ljava/util/concurrent/TimeoutException;

    invoke-direct {v1}, Ljava/util/concurrent/TimeoutException;-><init>()V

    invoke-interface {v0, v1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 160
    :cond_0
    return-void
.end method
