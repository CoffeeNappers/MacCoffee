.class final Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;
.super Ljava/lang/Object;
.source "MaybeToSingle.java"

# interfaces
.implements Lio/reactivex/MaybeObserver;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/maybe/MaybeToSingle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ToSingleMaybeSubscriber"
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
.field final actual:Lio/reactivex/SingleObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleObserver",
            "<-TT;>;"
        }
    .end annotation
.end field

.field d:Lio/reactivex/disposables/Disposable;

.field final defaultValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/SingleObserver;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TT;>;TT;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;, "Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber<TT;>;"
    .local p1, "actual":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TT;>;"
    .local p2, "defaultValue":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->actual:Lio/reactivex/SingleObserver;

    .line 57
    iput-object p2, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->defaultValue:Ljava/lang/Object;

    .line 58
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 62
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;, "Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 63
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->d:Lio/reactivex/disposables/Disposable;

    .line 64
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;, "Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 3

    .prologue
    .line 94
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;, "Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber<TT;>;"
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->d:Lio/reactivex/disposables/Disposable;

    .line 95
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->defaultValue:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 96
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->actual:Lio/reactivex/SingleObserver;

    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->defaultValue:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    .line 100
    :goto_0
    return-void

    .line 98
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->actual:Lio/reactivex/SingleObserver;

    new-instance v1, Ljava/util/NoSuchElementException;

    const-string/jumbo v2, "The MaybeSource is empty"

    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 88
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;, "Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber<TT;>;"
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->d:Lio/reactivex/disposables/Disposable;

    .line 89
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p1}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    .line 90
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 73
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;, "Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 74
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->d:Lio/reactivex/disposables/Disposable;

    .line 76
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p0}, Lio/reactivex/SingleObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 78
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
    .line 82
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;, "Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->d:Lio/reactivex/disposables/Disposable;

    .line 83
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p1}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    .line 84
    return-void
.end method
