.class public abstract Lio/reactivex/internal/observers/BlockingBaseObserver;
.super Ljava/util/concurrent/CountDownLatch;
.source "BlockingBaseObserver.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/CountDownLatch;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field volatile cancelled:Z

.field d:Lio/reactivex/disposables/Disposable;

.field error:Ljava/lang/Throwable;

.field value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    .local p0, "this":Lio/reactivex/internal/observers/BlockingBaseObserver;, "Lio/reactivex/internal/observers/BlockingBaseObserver<TT;>;"
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 33
    return-void
.end method


# virtual methods
.method public final blockingGet()Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/internal/observers/BlockingBaseObserver;, "Lio/reactivex/internal/observers/BlockingBaseObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingBaseObserver;->getCount()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 70
    :try_start_0
    invoke-static {}, Lio/reactivex/internal/util/BlockingHelper;->verifyNonBlocking()V

    .line 71
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingBaseObserver;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/observers/BlockingBaseObserver;->error:Ljava/lang/Throwable;

    .line 79
    .local v0, "e":Ljava/lang/Throwable;
    if-eqz v0, :cond_1

    .line 80
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 72
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_0
    move-exception v1

    .line 73
    .local v1, "ex":Ljava/lang/InterruptedException;
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingBaseObserver;->dispose()V

    .line 74
    invoke-static {v1}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 82
    .end local v1    # "ex":Ljava/lang/InterruptedException;
    .restart local v0    # "e":Ljava/lang/Throwable;
    :cond_1
    iget-object v2, p0, Lio/reactivex/internal/observers/BlockingBaseObserver;->value:Ljava/lang/Object;

    return-object v2
.end method

.method public final dispose()V
    .locals 2

    .prologue
    .line 50
    .local p0, "this":Lio/reactivex/internal/observers/BlockingBaseObserver;, "Lio/reactivex/internal/observers/BlockingBaseObserver<TT;>;"
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/observers/BlockingBaseObserver;->cancelled:Z

    .line 51
    iget-object v0, p0, Lio/reactivex/internal/observers/BlockingBaseObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 52
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    if-eqz v0, :cond_0

    .line 53
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 55
    :cond_0
    return-void
.end method

.method public final isDisposed()Z
    .locals 1

    .prologue
    .line 59
    .local p0, "this":Lio/reactivex/internal/observers/BlockingBaseObserver;, "Lio/reactivex/internal/observers/BlockingBaseObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/observers/BlockingBaseObserver;->cancelled:Z

    return v0
.end method

.method public final onComplete()V
    .locals 0

    .prologue
    .line 45
    .local p0, "this":Lio/reactivex/internal/observers/BlockingBaseObserver;, "Lio/reactivex/internal/observers/BlockingBaseObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingBaseObserver;->countDown()V

    .line 46
    return-void
.end method

.method public final onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 37
    .local p0, "this":Lio/reactivex/internal/observers/BlockingBaseObserver;, "Lio/reactivex/internal/observers/BlockingBaseObserver<TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/observers/BlockingBaseObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 38
    iget-boolean v0, p0, Lio/reactivex/internal/observers/BlockingBaseObserver;->cancelled:Z

    if-eqz v0, :cond_0

    .line 39
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 41
    :cond_0
    return-void
.end method
