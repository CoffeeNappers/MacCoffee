.class public abstract Lio/reactivex/internal/observers/DeferredScalarObserver;
.super Lio/reactivex/internal/observers/DeferredScalarDisposable;
.source "DeferredScalarObserver.java"

# interfaces
.implements Lio/reactivex/Observer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/observers/DeferredScalarDisposable",
        "<TR;>;",
        "Lio/reactivex/Observer",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3b1b71a072cf1ebL


# instance fields
.field protected s:Lio/reactivex/disposables/Disposable;


# direct methods
.method public constructor <init>(Lio/reactivex/Observer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lio/reactivex/internal/observers/DeferredScalarObserver;, "Lio/reactivex/internal/observers/DeferredScalarObserver<TT;TR;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/observers/DeferredScalarDisposable;-><init>(Lio/reactivex/Observer;)V

    .line 40
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 70
    .local p0, "this":Lio/reactivex/internal/observers/DeferredScalarObserver;, "Lio/reactivex/internal/observers/DeferredScalarObserver<TT;TR;>;"
    invoke-super {p0}, Lio/reactivex/internal/observers/DeferredScalarDisposable;->dispose()V

    .line 71
    iget-object v0, p0, Lio/reactivex/internal/observers/DeferredScalarObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 72
    return-void
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 59
    .local p0, "this":Lio/reactivex/internal/observers/DeferredScalarObserver;, "Lio/reactivex/internal/observers/DeferredScalarObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/observers/DeferredScalarObserver;->value:Ljava/lang/Object;

    .line 60
    .local v0, "v":Ljava/lang/Object;, "TR;"
    if-eqz v0, :cond_0

    .line 61
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/observers/DeferredScalarObserver;->value:Ljava/lang/Object;

    .line 62
    invoke-virtual {p0, v0}, Lio/reactivex/internal/observers/DeferredScalarObserver;->complete(Ljava/lang/Object;)V

    .line 66
    :goto_0
    return-void

    .line 64
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/observers/DeferredScalarObserver;->complete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 53
    .local p0, "this":Lio/reactivex/internal/observers/DeferredScalarObserver;, "Lio/reactivex/internal/observers/DeferredScalarObserver<TT;TR;>;"
    const/4 v0, 0x0

    iput-object v0, p0, Lio/reactivex/internal/observers/DeferredScalarObserver;->value:Ljava/lang/Object;

    .line 54
    invoke-virtual {p0, p1}, Lio/reactivex/internal/observers/DeferredScalarObserver;->error(Ljava/lang/Throwable;)V

    .line 55
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 44
    .local p0, "this":Lio/reactivex/internal/observers/DeferredScalarObserver;, "Lio/reactivex/internal/observers/DeferredScalarObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/observers/DeferredScalarObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    iput-object p1, p0, Lio/reactivex/internal/observers/DeferredScalarObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 47
    iget-object v0, p0, Lio/reactivex/internal/observers/DeferredScalarObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 49
    :cond_0
    return-void
.end method
