.class final Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;
.super Ljava/lang/Object;
.source "MaybeDoOnEvent.java"

# interfaces
.implements Lio/reactivex/MaybeObserver;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DoOnEventMaybeObserver"
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

.field final onEvent:Lio/reactivex/functions/BiConsumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiConsumer",
            "<-TT;-",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/MaybeObserver;Lio/reactivex/functions/BiConsumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;",
            "Lio/reactivex/functions/BiConsumer",
            "<-TT;-",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    .local p2, "onEvent":Lio/reactivex/functions/BiConsumer;, "Lio/reactivex/functions/BiConsumer<-TT;-Ljava/lang/Throwable;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    .line 51
    iput-object p2, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->onEvent:Lio/reactivex/functions/BiConsumer;

    .line 52
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 56
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 57
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 58
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 62
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 4

    .prologue
    .line 105
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver<TT;>;"
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 108
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->onEvent:Lio/reactivex/functions/BiConsumer;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Lio/reactivex/functions/BiConsumer;->accept(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v1}, Lio/reactivex/MaybeObserver;->onComplete()V

    .line 116
    :goto_0
    return-void

    .line 109
    :catch_0
    move-exception v0

    .line 110
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 111
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v1, v0}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 91
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver<TT;>;"
    sget-object v2, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 94
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->onEvent:Lio/reactivex/functions/BiConsumer;

    const/4 v3, 0x0

    invoke-interface {v2, v3, p1}, Lio/reactivex/functions/BiConsumer;->accept(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    :goto_0
    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v2, p1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    .line 101
    return-void

    .line 95
    :catch_0
    move-exception v1

    .line 96
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 97
    new-instance v0, Lio/reactivex/exceptions/CompositeException;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Throwable;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object v1, v2, v3

    invoke-direct {v0, v2}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    .end local p1    # "e":Ljava/lang/Throwable;
    .local v0, "e":Ljava/lang/Throwable;
    move-object p1, v0

    .end local v0    # "e":Ljava/lang/Throwable;
    .restart local p1    # "e":Ljava/lang/Throwable;
    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 67
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 68
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 70
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p0}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 72
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 79
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->onEvent:Lio/reactivex/functions/BiConsumer;

    const/4 v2, 0x0

    invoke-interface {v1, p1, v2}, Lio/reactivex/functions/BiConsumer;->accept(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v1, p1}, Lio/reactivex/MaybeObserver;->onSuccess(Ljava/lang/Object;)V

    .line 87
    :goto_0
    return-void

    .line 80
    :catch_0
    move-exception v0

    .line 81
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 82
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybeDoOnEvent$DoOnEventMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v1, v0}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
