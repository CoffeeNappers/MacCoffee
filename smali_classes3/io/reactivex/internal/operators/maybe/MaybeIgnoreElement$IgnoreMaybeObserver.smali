.class final Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;
.super Ljava/lang/Object;
.source "MaybeIgnoreElement.java"

# interfaces
.implements Lio/reactivex/MaybeObserver;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "IgnoreMaybeObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/MaybeObserver",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


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


# direct methods
.method constructor <init>(Lio/reactivex/MaybeObserver;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    .line 44
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 80
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 81
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 82
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 75
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 69
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver<TT;>;"
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 70
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0}, Lio/reactivex/MaybeObserver;->onComplete()V

    .line 71
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 63
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver<TT;>;"
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 64
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    .line 65
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 48
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 51
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p0}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 53
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
    .line 57
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 58
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeIgnoreElement$IgnoreMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0}, Lio/reactivex/MaybeObserver;->onComplete()V

    .line 59
    return-void
.end method
