.class public final Lio/reactivex/internal/disposables/ObserverFullArbiter;
.super Lio/reactivex/internal/disposables/FullArbiterPad1;
.source "ObserverFullArbiter.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/disposables/FullArbiterPad1;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field final queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field resource:Lio/reactivex/disposables/Disposable;

.field volatile s:Lio/reactivex/disposables/Disposable;


# direct methods
.method public constructor <init>(Lio/reactivex/Observer;Lio/reactivex/disposables/Disposable;I)V
    .locals 1
    .param p2, "resource"    # Lio/reactivex/disposables/Disposable;
    .param p3, "capacity"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;",
            "Lio/reactivex/disposables/Disposable;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lio/reactivex/internal/disposables/ObserverFullArbiter;, "Lio/reactivex/internal/disposables/ObserverFullArbiter<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    invoke-direct {p0}, Lio/reactivex/internal/disposables/FullArbiterPad1;-><init>()V

    .line 41
    iput-object p1, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->actual:Lio/reactivex/Observer;

    .line 42
    iput-object p2, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->resource:Lio/reactivex/disposables/Disposable;

    .line 43
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-direct {v0, p3}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 44
    sget-object v0, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    iput-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->s:Lio/reactivex/disposables/Disposable;

    .line 45
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 49
    .local p0, "this":Lio/reactivex/internal/disposables/ObserverFullArbiter;, "Lio/reactivex/internal/disposables/ObserverFullArbiter<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    if-nez v0, :cond_0

    .line 50
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    .line 51
    invoke-virtual {p0}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->disposeResource()V

    .line 53
    :cond_0
    return-void
.end method

.method disposeResource()V
    .locals 2

    .prologue
    .line 62
    .local p0, "this":Lio/reactivex/internal/disposables/ObserverFullArbiter;, "Lio/reactivex/internal/disposables/ObserverFullArbiter<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->resource:Lio/reactivex/disposables/Disposable;

    .line 63
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->resource:Lio/reactivex/disposables/Disposable;

    .line 64
    if-eqz v0, :cond_0

    .line 65
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 67
    :cond_0
    return-void
.end method

.method drain()V
    .locals 10

    .prologue
    .local p0, "this":Lio/reactivex/internal/disposables/ObserverFullArbiter;, "Lio/reactivex/internal/disposables/ObserverFullArbiter<TT;>;"
    const/4 v9, 0x1

    .line 104
    iget-object v7, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v7

    if-eqz v7, :cond_0

    .line 162
    :goto_0
    return-void

    .line 108
    :cond_0
    const/4 v2, 0x1

    .line 110
    .local v2, "missed":I
    iget-object v5, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 111
    .local v5, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<Ljava/lang/Object;>;"
    iget-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->actual:Lio/reactivex/Observer;

    .line 116
    .local v0, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    :cond_1
    :goto_1
    invoke-virtual {v5}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v4

    .line 117
    .local v4, "o":Ljava/lang/Object;
    if-nez v4, :cond_2

    .line 157
    iget-object v7, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    neg-int v8, v2

    invoke-virtual {v7, v8}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move-result v2

    .line 158
    if-nez v2, :cond_1

    goto :goto_0

    .line 121
    :cond_2
    invoke-virtual {v5}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v6

    .line 123
    .local v6, "v":Ljava/lang/Object;
    iget-object v7, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->s:Lio/reactivex/disposables/Disposable;

    if-ne v4, v7, :cond_1

    .line 124
    invoke-static {v6}, Lio/reactivex/internal/util/NotificationLite;->isDisposable(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 125
    invoke-static {v6}, Lio/reactivex/internal/util/NotificationLite;->getDisposable(Ljava/lang/Object;)Lio/reactivex/disposables/Disposable;

    move-result-object v3

    .line 126
    .local v3, "next":Lio/reactivex/disposables/Disposable;
    iget-object v7, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v7}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 127
    iget-boolean v7, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    if-nez v7, :cond_3

    .line 128
    iput-object v3, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->s:Lio/reactivex/disposables/Disposable;

    goto :goto_1

    .line 130
    :cond_3
    invoke-interface {v3}, Lio/reactivex/disposables/Disposable;->dispose()V

    goto :goto_1

    .line 132
    .end local v3    # "next":Lio/reactivex/disposables/Disposable;
    :cond_4
    invoke-static {v6}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 133
    invoke-virtual {v5}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 134
    invoke-virtual {p0}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->disposeResource()V

    .line 136
    invoke-static {v6}, Lio/reactivex/internal/util/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    .line 137
    .local v1, "ex":Ljava/lang/Throwable;
    iget-boolean v7, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    if-nez v7, :cond_5

    .line 138
    iput-boolean v9, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    .line 139
    invoke-interface {v0, v1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 141
    :cond_5
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 143
    .end local v1    # "ex":Ljava/lang/Throwable;
    :cond_6
    invoke-static {v6}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 144
    invoke-virtual {v5}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 145
    invoke-virtual {p0}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->disposeResource()V

    .line 147
    iget-boolean v7, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    if-nez v7, :cond_1

    .line 148
    iput-boolean v9, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    .line 149
    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_1

    .line 152
    :cond_7
    invoke-static {v6}, Lio/reactivex/internal/util/NotificationLite;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v0, v7}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 57
    .local p0, "this":Lio/reactivex/internal/disposables/ObserverFullArbiter;, "Lio/reactivex/internal/disposables/ObserverFullArbiter<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->resource:Lio/reactivex/disposables/Disposable;

    .line 58
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v1

    :goto_0
    return v1

    :cond_0
    iget-boolean v1, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    goto :goto_0
.end method

.method public onComplete(Lio/reactivex/disposables/Disposable;)V
    .locals 2
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 99
    .local p0, "this":Lio/reactivex/internal/disposables/ObserverFullArbiter;, "Lio/reactivex/internal/disposables/ObserverFullArbiter<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-static {}, Lio/reactivex/internal/util/NotificationLite;->complete()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 100
    invoke-virtual {p0}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->drain()V

    .line 101
    return-void
.end method

.method public onError(Ljava/lang/Throwable;Lio/reactivex/disposables/Disposable;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/Throwable;
    .param p2, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 90
    .local p0, "this":Lio/reactivex/internal/disposables/ObserverFullArbiter;, "Lio/reactivex/internal/disposables/ObserverFullArbiter<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    if-eqz v0, :cond_0

    .line 91
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 96
    :goto_0
    return-void

    .line 94
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 95
    invoke-virtual {p0}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->drain()V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;Lio/reactivex/disposables/Disposable;)Z
    .locals 2
    .param p2, "s"    # Lio/reactivex/disposables/Disposable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lio/reactivex/disposables/Disposable;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lio/reactivex/internal/disposables/ObserverFullArbiter;, "Lio/reactivex/internal/disposables/ObserverFullArbiter<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    if-eqz v0, :cond_0

    .line 81
    const/4 v0, 0x0

    .line 86
    :goto_0
    return v0

    .line 84
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 85
    invoke-virtual {p0}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->drain()V

    .line 86
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public setDisposable(Lio/reactivex/disposables/Disposable;)Z
    .locals 3
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 70
    .local p0, "this":Lio/reactivex/internal/disposables/ObserverFullArbiter;, "Lio/reactivex/internal/disposables/ObserverFullArbiter<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    if-eqz v0, :cond_0

    .line 71
    const/4 v0, 0x0

    .line 76
    :goto_0
    return v0

    .line 74
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    iget-object v1, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->disposable(Lio/reactivex/disposables/Disposable;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 75
    invoke-virtual {p0}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->drain()V

    .line 76
    const/4 v0, 0x1

    goto :goto_0
.end method
