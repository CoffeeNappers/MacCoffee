.class public final Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "ObserverResourceWrapper.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Lio/reactivex/disposables/Disposable;",
        ">;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x77840c661fe71fc2L


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final subscription:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/Observer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;, "Lio/reactivex/internal/operators/observable/ObserverResourceWrapper<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 28
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    .line 31
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;->actual:Lio/reactivex/Observer;

    .line 32
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 60
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;, "Lio/reactivex/internal/operators/observable/ObserverResourceWrapper<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 62
    invoke-static {p0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 63
    return-void
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 67
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;, "Lio/reactivex/internal/operators/observable/ObserverResourceWrapper<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-ne v0, v1, :cond_0

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
    .line 54
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;, "Lio/reactivex/internal/operators/observable/ObserverResourceWrapper<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;->dispose()V

    .line 55
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 56
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 48
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;, "Lio/reactivex/internal/operators/observable/ObserverResourceWrapper<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;->dispose()V

    .line 49
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 50
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
    .line 43
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;, "Lio/reactivex/internal/operators/observable/ObserverResourceWrapper<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 44
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 36
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;, "Lio/reactivex/internal/operators/observable/ObserverResourceWrapper<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 37
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 39
    :cond_0
    return-void
.end method

.method public setResource(Lio/reactivex/disposables/Disposable;)V
    .locals 0
    .param p1, "resource"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 71
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;, "Lio/reactivex/internal/operators/observable/ObserverResourceWrapper<TT;>;"
    invoke-static {p0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->set(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z

    .line 72
    return-void
.end method
