.class final Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "MaybeOnErrorNext.java"

# interfaces
.implements Lio/reactivex/MaybeObserver;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "OnErrorNextMaybeObserver"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver$NextMaybeObserver;
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
.field private static final serialVersionUID:J = 0x1c20005a00f70a2cL


# instance fields
.field final actual:Lio/reactivex/MaybeObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final allowFatal:Z

.field final resumeFunction:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/lang/Throwable;",
            "+",
            "Lio/reactivex/MaybeSource",
            "<+TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/MaybeObserver;Lio/reactivex/functions/Function;Z)V
    .locals 0
    .param p3, "allowFatal"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/lang/Throwable;",
            "+",
            "Lio/reactivex/MaybeSource",
            "<+TT;>;>;Z)V"
        }
    .end annotation

    .prologue
    .line 64
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    .local p2, "resumeFunction":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/lang/Throwable;+Lio/reactivex/MaybeSource<+TT;>;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 65
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    .line 66
    iput-object p2, p0, Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;->resumeFunction:Lio/reactivex/functions/Function;

    .line 67
    iput-boolean p3, p0, Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;->allowFatal:Z

    .line 68
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 0

    .prologue
    .line 72
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver<TT;>;"
    invoke-static {p0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 73
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 77
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->isDisposed(Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 115
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0}, Lio/reactivex/MaybeObserver;->onComplete()V

    .line 116
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 6
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 94
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver<TT;>;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;->allowFatal:Z

    if-nez v2, :cond_0

    instance-of v2, p1, Ljava/lang/Exception;

    if-nez v2, :cond_0

    .line 95
    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v2, p1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    .line 111
    :goto_0
    return-void

    .line 101
    :cond_0
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;->resumeFunction:Lio/reactivex/functions/Function;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The resumeFunction returned a null MaybeSource"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/MaybeSource;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    .local v1, "m":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    const/4 v2, 0x0

    invoke-static {p0, v2}, Lio/reactivex/internal/disposables/DisposableHelper;->replace(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z

    .line 110
    new-instance v2, Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver$NextMaybeObserver;

    iget-object v3, p0, Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-direct {v2, v3, p0}, Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver$NextMaybeObserver;-><init>(Lio/reactivex/MaybeObserver;Ljava/util/concurrent/atomic/AtomicReference;)V

    invoke-interface {v1, v2}, Lio/reactivex/MaybeSource;->subscribe(Lio/reactivex/MaybeObserver;)V

    goto :goto_0

    .line 102
    .end local v1    # "m":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    :catch_0
    move-exception v0

    .line 103
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 104
    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Throwable;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x1

    aput-object v0, v4, v5

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-interface {v2, v3}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 82
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver<TT;>;"
    invoke-static {p0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p0}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 85
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
    .line 89
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeOnErrorNext$OnErrorNextMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p1}, Lio/reactivex/MaybeObserver;->onSuccess(Ljava/lang/Object;)V

    .line 90
    return-void
.end method
