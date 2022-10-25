.class final Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;
.super Lio/reactivex/internal/observers/BasicIntQueueDisposable;
.source "ObservableDoFinally.java"

# interfaces
.implements Lio/reactivex/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableDoFinally;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DoFinallyObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/observers/BasicIntQueueDisposable",
        "<TT;>;",
        "Lio/reactivex/Observer",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x3907ba0b13897e3dL


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field d:Lio/reactivex/disposables/Disposable;

.field final onFinally:Lio/reactivex/functions/Action;

.field qd:Lio/reactivex/internal/fuseable/QueueDisposable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/QueueDisposable",
            "<TT;>;"
        }
    .end annotation
.end field

.field syncFused:Z


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Action;)V
    .locals 0
    .param p2, "onFinally"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;",
            "Lio/reactivex/functions/Action;",
            ")V"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    invoke-direct {p0}, Lio/reactivex/internal/observers/BasicIntQueueDisposable;-><init>()V

    .line 63
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->actual:Lio/reactivex/Observer;

    .line 64
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->onFinally:Lio/reactivex/functions/Action;

    .line 65
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 123
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->qd:Lio/reactivex/internal/fuseable/QueueDisposable;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/QueueDisposable;->clear()V

    .line 124
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 99
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 100
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->runFinally()V

    .line 101
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 105
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 128
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->qd:Lio/reactivex/internal/fuseable/QueueDisposable;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/QueueDisposable;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 93
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 94
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->runFinally()V

    .line 95
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 87
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 88
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->runFinally()V

    .line 89
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 83
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 70
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 71
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 72
    instance-of v0, p1, Lio/reactivex/internal/fuseable/QueueDisposable;

    if-eqz v0, :cond_0

    .line 73
    check-cast p1, Lio/reactivex/internal/fuseable/QueueDisposable;

    .end local p1    # "d":Lio/reactivex/disposables/Disposable;
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->qd:Lio/reactivex/internal/fuseable/QueueDisposable;

    .line 76
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 78
    :cond_1
    return-void
.end method

.method public poll()Ljava/lang/Object;
    .locals 2
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
    .line 134
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->qd:Lio/reactivex/internal/fuseable/QueueDisposable;

    invoke-interface {v1}, Lio/reactivex/internal/fuseable/QueueDisposable;->poll()Ljava/lang/Object;

    move-result-object v0

    .line 135
    .local v0, "v":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_0

    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->syncFused:Z

    if-eqz v1, :cond_0

    .line 136
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->runFinally()V

    .line 138
    :cond_0
    return-object v0
.end method

.method public requestFusion(I)I
    .locals 5
    .param p1, "mode"    # I

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver<TT;>;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 110
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->qd:Lio/reactivex/internal/fuseable/QueueDisposable;

    .line 111
    .local v1, "qd":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    if-eqz v1, :cond_2

    and-int/lit8 v4, p1, 0x4

    if-nez v4, :cond_2

    .line 112
    invoke-interface {v1, p1}, Lio/reactivex/internal/fuseable/QueueDisposable;->requestFusion(I)I

    move-result v0

    .line 113
    .local v0, "m":I
    if-eqz v0, :cond_0

    .line 114
    if-ne v0, v2, :cond_1

    :goto_0
    iput-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->syncFused:Z

    .line 118
    .end local v0    # "m":I
    :cond_0
    :goto_1
    return v0

    .restart local v0    # "m":I
    :cond_1
    move v2, v3

    .line 114
    goto :goto_0

    .end local v0    # "m":I
    :cond_2
    move v0, v3

    .line 118
    goto :goto_1
.end method

.method runFinally()V
    .locals 3

    .prologue
    .line 142
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver<TT;>;"
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->compareAndSet(II)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 144
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableDoFinally$DoFinallyObserver;->onFinally:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    :cond_0
    :goto_0
    return-void

    .line 145
    :catch_0
    move-exception v0

    .line 146
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 147
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
