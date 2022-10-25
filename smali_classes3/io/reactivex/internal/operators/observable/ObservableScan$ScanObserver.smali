.class final Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;
.super Ljava/lang/Object;
.source "ObservableScan.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableScan;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ScanObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field final accumulator:Lio/reactivex/functions/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiFunction",
            "<TT;TT;TT;>;"
        }
    .end annotation
.end field

.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field done:Z

.field s:Lio/reactivex/disposables/Disposable;

.field value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/BiFunction;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;",
            "Lio/reactivex/functions/BiFunction",
            "<TT;TT;TT;>;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;, "Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    .local p2, "accumulator":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TT;TT;TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->actual:Lio/reactivex/Observer;

    .line 48
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->accumulator:Lio/reactivex/functions/BiFunction;

    .line 49
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 62
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;, "Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 63
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 67
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;, "Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 110
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;, "Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->done:Z

    if-eqz v0, :cond_0

    .line 115
    :goto_0
    return-void

    .line 113
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->done:Z

    .line 114
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 100
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;, "Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->done:Z

    if-eqz v0, :cond_0

    .line 101
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 106
    :goto_0
    return-void

    .line 104
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->done:Z

    .line 105
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 73
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;, "Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v4, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->done:Z

    if-eqz v4, :cond_0

    .line 96
    :goto_0
    return-void

    .line 76
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->actual:Lio/reactivex/Observer;

    .line 77
    .local v0, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->value:Ljava/lang/Object;

    .line 78
    .local v3, "v":Ljava/lang/Object;, "TT;"
    if-nez v3, :cond_1

    .line 79
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->value:Ljava/lang/Object;

    .line 80
    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 85
    :cond_1
    :try_start_0
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->accumulator:Lio/reactivex/functions/BiFunction;

    invoke-interface {v4, v3, p1}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    const-string/jumbo v5, "The value returned by the accumulator is null"

    invoke-static {v4, v5}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 93
    .local v2, "u":Ljava/lang/Object;, "TT;"
    iput-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->value:Ljava/lang/Object;

    .line 94
    invoke-interface {v0, v2}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 86
    .end local v2    # "u":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v1

    .line 87
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 88
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v4}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 89
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 53
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;, "Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 54
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 55
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableScan$ScanObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 57
    :cond_0
    return-void
.end method
