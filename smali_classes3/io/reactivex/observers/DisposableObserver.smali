.class public abstract Lio/reactivex/observers/DisposableObserver;
.super Ljava/lang/Object;
.source "DisposableObserver.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
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
.field final s:Ljava/util/concurrent/atomic/AtomicReference;
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
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 65
    .local p0, "this":Lio/reactivex/observers/DisposableObserver;, "Lio/reactivex/observers/DisposableObserver<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/observers/DisposableObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method


# virtual methods
.method public final dispose()V
    .locals 1

    .prologue
    .line 88
    .local p0, "this":Lio/reactivex/observers/DisposableObserver;, "Lio/reactivex/observers/DisposableObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/observers/DisposableObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 89
    return-void
.end method

.method public final isDisposed()Z
    .locals 2

    .prologue
    .line 83
    .local p0, "this":Lio/reactivex/observers/DisposableObserver;, "Lio/reactivex/observers/DisposableObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/observers/DisposableObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

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

.method protected onStart()V
    .locals 0

    .prologue
    .line 79
    .local p0, "this":Lio/reactivex/observers/DisposableObserver;, "Lio/reactivex/observers/DisposableObserver<TT;>;"
    return-void
.end method

.method public final onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 70
    .local p0, "this":Lio/reactivex/observers/DisposableObserver;, "Lio/reactivex/observers/DisposableObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/observers/DisposableObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 71
    invoke-virtual {p0}, Lio/reactivex/observers/DisposableObserver;->onStart()V

    .line 73
    :cond_0
    return-void
.end method
