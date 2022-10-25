.class final Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "MaybeDoFinally.java"

# interfaces
.implements Lio/reactivex/MaybeObserver;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/maybe/MaybeDoFinally;
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
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/MaybeObserver",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x3907ba0b13897e3dL


# instance fields
.field final actual:Lio/reactivex/MaybeObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;"
        }
    .end annotation
.end field

.field d:Lio/reactivex/disposables/Disposable;

.field final onFinally:Lio/reactivex/functions/Action;


# direct methods
.method constructor <init>(Lio/reactivex/MaybeObserver;Lio/reactivex/functions/Action;)V
    .locals 0
    .param p2, "onFinally"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;",
            "Lio/reactivex/functions/Action;",
            ")V"
        }
    .end annotation

    .prologue
    .line 57
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 58
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;->actual:Lio/reactivex/MaybeObserver;

    .line 59
    iput-object p2, p0, Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;->onFinally:Lio/reactivex/functions/Action;

    .line 60
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 91
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 92
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;->runFinally()V

    .line 93
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 97
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 85
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0}, Lio/reactivex/MaybeObserver;->onComplete()V

    .line 86
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;->runFinally()V

    .line 87
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 79
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    .line 80
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;->runFinally()V

    .line 81
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 64
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 67
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p0}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 69
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 73
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p1}, Lio/reactivex/MaybeObserver;->onSuccess(Ljava/lang/Object;)V

    .line 74
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;->runFinally()V

    .line 75
    return-void
.end method

.method runFinally()V
    .locals 3

    .prologue
    .line 101
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;, "Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver<TT;>;"
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;->compareAndSet(II)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 103
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybeDoFinally$DoFinallyObserver;->onFinally:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    :cond_0
    :goto_0
    return-void

    .line 104
    :catch_0
    move-exception v0

    .line 105
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 106
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
