.class final Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "MaybeSwitchIfEmpty.java"

# interfaces
.implements Lio/reactivex/MaybeObserver;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SwitchIfEmptyMaybeObserver"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver$OtherMaybeObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Lio/reactivex/disposables/Disposable;",
        ">;",
        "Lio/reactivex/MaybeObserver",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x1edb5084f2c5fb08L


# instance fields
.field final actual:Lio/reactivex/MaybeObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final other:Lio/reactivex/MaybeSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/MaybeSource",
            "<+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/MaybeObserver;Lio/reactivex/MaybeSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;",
            "Lio/reactivex/MaybeSource",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    .local p2, "other":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 52
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    .line 53
    iput-object p2, p0, Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;->other:Lio/reactivex/MaybeSource;

    .line 54
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 0

    .prologue
    .line 58
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver<TT;>;"
    invoke-static {p0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 59
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 63
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->isDisposed(Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 4

    .prologue
    .line 85
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    .line 86
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-eq v0, v1, :cond_0

    .line 87
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 88
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;->other:Lio/reactivex/MaybeSource;

    new-instance v2, Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver$OtherMaybeObserver;

    iget-object v3, p0, Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-direct {v2, v3, p0}, Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver$OtherMaybeObserver;-><init>(Lio/reactivex/MaybeObserver;Ljava/util/concurrent/atomic/AtomicReference;)V

    invoke-interface {v1, v2}, Lio/reactivex/MaybeSource;->subscribe(Lio/reactivex/MaybeObserver;)V

    .line 91
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 80
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    .line 81
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver<TT;>;"
    invoke-static {p0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p0}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 71
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
    .line 75
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeSwitchIfEmpty$SwitchIfEmptyMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p1}, Lio/reactivex/MaybeObserver;->onSuccess(Ljava/lang/Object;)V

    .line 76
    return-void
.end method
