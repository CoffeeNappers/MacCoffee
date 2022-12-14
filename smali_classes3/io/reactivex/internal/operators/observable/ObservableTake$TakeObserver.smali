.class final Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;
.super Ljava/lang/Object;
.source "ObservableTake.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableTake;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "TakeObserver"
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
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field done:Z

.field remaining:J

.field subscription:Lio/reactivex/disposables/Disposable;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;J)V
    .locals 0
    .param p2, "limit"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;J)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;, "Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->actual:Lio/reactivex/Observer;

    .line 43
    iput-wide p2, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->remaining:J

    .line 44
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 90
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;, "Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->subscription:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 91
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 95
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;, "Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->subscription:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 81
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;, "Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->done:Z

    if-nez v0, :cond_0

    .line 82
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->done:Z

    .line 83
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->subscription:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 84
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 86
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 70
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;, "Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->done:Z

    if-eqz v0, :cond_0

    .line 71
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 78
    :goto_0
    return-void

    .line 75
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->done:Z

    .line 76
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->subscription:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 77
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;, "Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const-wide/16 v6, 0x0

    .line 60
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->done:Z

    if-nez v1, :cond_0

    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->remaining:J

    const-wide/16 v4, 0x1

    sub-long v4, v2, v4

    iput-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->remaining:J

    cmp-long v1, v2, v6

    if-lez v1, :cond_0

    .line 61
    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->remaining:J

    cmp-long v1, v2, v6

    if-nez v1, :cond_1

    const/4 v0, 0x1

    .line 62
    .local v0, "stop":Z
    :goto_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v1, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 63
    if-eqz v0, :cond_0

    .line 64
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->onComplete()V

    .line 67
    .end local v0    # "stop":Z
    :cond_0
    return-void

    .line 61
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 4
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 47
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;, "Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->subscription:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->subscription:Lio/reactivex/disposables/Disposable;

    .line 49
    iget-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->remaining:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 50
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->done:Z

    .line 51
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 52
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->actual:Lio/reactivex/Observer;

    invoke-static {v0}, Lio/reactivex/internal/disposables/EmptyDisposable;->complete(Lio/reactivex/Observer;)V

    .line 57
    :cond_0
    :goto_0
    return-void

    .line 54
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTake$TakeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    goto :goto_0
.end method
