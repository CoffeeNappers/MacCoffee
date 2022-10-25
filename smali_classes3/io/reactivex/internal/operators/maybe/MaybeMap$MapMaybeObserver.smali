.class final Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;
.super Ljava/lang/Object;
.source "MaybeMap.java"

# interfaces
.implements Lio/reactivex/MaybeObserver;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/maybe/MaybeMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MapMaybeObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
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
            "<-TR;>;"
        }
    .end annotation
.end field

.field d:Lio/reactivex/disposables/Disposable;

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+TR;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/MaybeObserver;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TR;>;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver<TT;TR;>;"
    .local p1, "actual":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TR;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    .line 53
    iput-object p2, p0, Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;->mapper:Lio/reactivex/functions/Function;

    .line 54
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .prologue
    .line 58
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 59
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 60
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 61
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 65
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 99
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0}, Lio/reactivex/MaybeObserver;->onComplete()V

    .line 100
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 94
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    .line 95
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 70
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 71
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 73
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p0}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 75
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver<TT;TR;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The mapper returned a null item"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 89
    .local v1, "v":Ljava/lang/Object;, "TR;"
    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v2, v1}, Lio/reactivex/MaybeObserver;->onSuccess(Ljava/lang/Object;)V

    .line 90
    .end local v1    # "v":Ljava/lang/Object;, "TR;"
    :goto_0
    return-void

    .line 83
    :catch_0
    move-exception v0

    .line 84
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 85
    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v2, v0}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
