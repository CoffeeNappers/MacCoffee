.class public final Lio/reactivex/internal/disposables/CancellableDisposable;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "CancellableDisposable.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Lio/reactivex/functions/Cancellable;",
        ">;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x4f5c453163a88dc2L


# direct methods
.method public constructor <init>(Lio/reactivex/functions/Cancellable;)V
    .locals 0
    .param p1, "cancellable"    # Lio/reactivex/functions/Cancellable;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 36
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 3

    .prologue
    .line 45
    invoke-virtual {p0}, Lio/reactivex/internal/disposables/CancellableDisposable;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 46
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lio/reactivex/internal/disposables/CancellableDisposable;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/functions/Cancellable;

    .line 47
    .local v0, "c":Lio/reactivex/functions/Cancellable;
    if-eqz v0, :cond_0

    .line 49
    :try_start_0
    invoke-interface {v0}, Lio/reactivex/functions/Cancellable;->cancel()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .end local v0    # "c":Lio/reactivex/functions/Cancellable;
    :cond_0
    :goto_0
    return-void

    .line 50
    .restart local v0    # "c":Lio/reactivex/functions/Cancellable;
    :catch_0
    move-exception v1

    .line 51
    .local v1, "ex":Ljava/lang/Exception;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 52
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 40
    invoke-virtual {p0}, Lio/reactivex/internal/disposables/CancellableDisposable;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
