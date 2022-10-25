.class public final Lio/reactivex/internal/observers/BlockingMultiObserver;
.super Ljava/util/concurrent/CountDownLatch;
.source "BlockingMultiObserver.java"

# interfaces
.implements Lio/reactivex/SingleObserver;
.implements Lio/reactivex/CompletableObserver;
.implements Lio/reactivex/MaybeObserver;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/CountDownLatch;",
        "Lio/reactivex/SingleObserver",
        "<TT;>;",
        "Lio/reactivex/CompletableObserver;",
        "Lio/reactivex/MaybeObserver",
        "<TT;>;"
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
    .line 38
    .local p0, "this":Lio/reactivex/internal/observers/BlockingMultiObserver;, "Lio/reactivex/internal/observers/BlockingMultiObserver<TT;>;"
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 39
    return-void
.end method


# virtual methods
.method public blockingAwait(JLjava/util/concurrent/TimeUnit;)Z
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 169
    .local p0, "this":Lio/reactivex/internal/observers/BlockingMultiObserver;, "Lio/reactivex/internal/observers/BlockingMultiObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->getCount()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 171
    :try_start_0
    invoke-static {}, Lio/reactivex/internal/util/BlockingHelper;->verifyNonBlocking()V

    .line 172
    invoke-virtual {p0, p1, p2, p3}, Lio/reactivex/internal/observers/BlockingMultiObserver;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 173
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->dispose()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 174
    const/4 v1, 0x0

    .line 185
    :goto_0
    return v1

    .line 176
    :catch_0
    move-exception v0

    .line 177
    .local v0, "ex":Ljava/lang/InterruptedException;
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->dispose()V

    .line 178
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 181
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/observers/BlockingMultiObserver;->error:Ljava/lang/Throwable;

    .line 182
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_1

    .line 183
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 185
    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public blockingGet()Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lio/reactivex/internal/observers/BlockingMultiObserver;, "Lio/reactivex/internal/observers/BlockingMultiObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->getCount()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 82
    :try_start_0
    invoke-static {}, Lio/reactivex/internal/util/BlockingHelper;->verifyNonBlocking()V

    .line 83
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/observers/BlockingMultiObserver;->error:Ljava/lang/Throwable;

    .line 90
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_1

    .line 91
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 84
    .end local v0    # "ex":Ljava/lang/Throwable;
    :catch_0
    move-exception v0

    .line 85
    .local v0, "ex":Ljava/lang/InterruptedException;
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->dispose()V

    .line 86
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 93
    .local v0, "ex":Ljava/lang/Throwable;
    :cond_1
    iget-object v1, p0, Lio/reactivex/internal/observers/BlockingMultiObserver;->value:Ljava/lang/Object;

    return-object v1
.end method

.method public blockingGet(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 103
    .local p0, "this":Lio/reactivex/internal/observers/BlockingMultiObserver;, "Lio/reactivex/internal/observers/BlockingMultiObserver<TT;>;"
    .local p1, "defaultValue":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->getCount()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 105
    :try_start_0
    invoke-static {}, Lio/reactivex/internal/util/BlockingHelper;->verifyNonBlocking()V

    .line 106
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/observers/BlockingMultiObserver;->error:Ljava/lang/Throwable;

    .line 113
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_1

    .line 114
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 107
    .end local v0    # "ex":Ljava/lang/Throwable;
    :catch_0
    move-exception v0

    .line 108
    .local v0, "ex":Ljava/lang/InterruptedException;
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->dispose()V

    .line 109
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 116
    .local v0, "ex":Ljava/lang/Throwable;
    :cond_1
    iget-object v1, p0, Lio/reactivex/internal/observers/BlockingMultiObserver;->value:Ljava/lang/Object;

    .line 117
    .local v1, "v":Ljava/lang/Object;, "TT;"
    if-eqz v1, :cond_2

    .end local v1    # "v":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object v1

    .restart local v1    # "v":Ljava/lang/Object;, "TT;"
    :cond_2
    move-object v1, p1

    goto :goto_0
.end method

.method public blockingGetError()Ljava/lang/Throwable;
    .locals 6

    .prologue
    .line 126
    .local p0, "this":Lio/reactivex/internal/observers/BlockingMultiObserver;, "Lio/reactivex/internal/observers/BlockingMultiObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->getCount()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 128
    :try_start_0
    invoke-static {}, Lio/reactivex/internal/util/BlockingHelper;->verifyNonBlocking()V

    .line 129
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/observers/BlockingMultiObserver;->error:Ljava/lang/Throwable;

    :goto_0
    return-object v0

    .line 130
    :catch_0
    move-exception v0

    .line 131
    .local v0, "ex":Ljava/lang/InterruptedException;
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->dispose()V

    goto :goto_0
.end method

.method public blockingGetError(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Throwable;
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 146
    .local p0, "this":Lio/reactivex/internal/observers/BlockingMultiObserver;, "Lio/reactivex/internal/observers/BlockingMultiObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->getCount()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 148
    :try_start_0
    invoke-static {}, Lio/reactivex/internal/util/BlockingHelper;->verifyNonBlocking()V

    .line 149
    invoke-virtual {p0, p1, p2, p3}, Lio/reactivex/internal/observers/BlockingMultiObserver;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 150
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->dispose()V

    .line 151
    new-instance v1, Ljava/util/concurrent/TimeoutException;

    invoke-direct {v1}, Ljava/util/concurrent/TimeoutException;-><init>()V

    invoke-static {v1}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    :catch_0
    move-exception v0

    .line 154
    .local v0, "ex":Ljava/lang/InterruptedException;
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->dispose()V

    .line 155
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 158
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/observers/BlockingMultiObserver;->error:Ljava/lang/Throwable;

    return-object v1
.end method

.method dispose()V
    .locals 2

    .prologue
    .line 42
    .local p0, "this":Lio/reactivex/internal/observers/BlockingMultiObserver;, "Lio/reactivex/internal/observers/BlockingMultiObserver<TT;>;"
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/observers/BlockingMultiObserver;->cancelled:Z

    .line 43
    iget-object v0, p0, Lio/reactivex/internal/observers/BlockingMultiObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 44
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    if-eqz v0, :cond_0

    .line 45
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 47
    :cond_0
    return-void
.end method

.method public onComplete()V
    .locals 0

    .prologue
    .line 71
    .local p0, "this":Lio/reactivex/internal/observers/BlockingMultiObserver;, "Lio/reactivex/internal/observers/BlockingMultiObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->countDown()V

    .line 72
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 65
    .local p0, "this":Lio/reactivex/internal/observers/BlockingMultiObserver;, "Lio/reactivex/internal/observers/BlockingMultiObserver<TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/observers/BlockingMultiObserver;->error:Ljava/lang/Throwable;

    .line 66
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->countDown()V

    .line 67
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 51
    .local p0, "this":Lio/reactivex/internal/observers/BlockingMultiObserver;, "Lio/reactivex/internal/observers/BlockingMultiObserver<TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/observers/BlockingMultiObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 52
    iget-boolean v0, p0, Lio/reactivex/internal/observers/BlockingMultiObserver;->cancelled:Z

    if-eqz v0, :cond_0

    .line 53
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 55
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lio/reactivex/internal/observers/BlockingMultiObserver;, "Lio/reactivex/internal/observers/BlockingMultiObserver<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iput-object p1, p0, Lio/reactivex/internal/observers/BlockingMultiObserver;->value:Ljava/lang/Object;

    .line 60
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BlockingMultiObserver;->countDown()V

    .line 61
    return-void
.end method
