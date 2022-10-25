.class public final Lio/reactivex/subjects/UnicastSubject;
.super Lio/reactivex/subjects/Subject;
.source "UnicastSubject.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/subjects/UnicastSubject$UnicastQueueDisposable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/subjects/Subject",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final actual:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/Observer",
            "<-TT;>;>;"
        }
    .end annotation
.end field

.field final delayError:Z

.field volatile disposed:Z

.field volatile done:Z

.field enableOperatorFusion:Z

.field error:Ljava/lang/Throwable;

.field final onTerminate:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field final once:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<TT;>;"
        }
    .end annotation
.end field

.field final wip:Lio/reactivex/internal/observers/BasicIntQueueDisposable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/observers/BasicIntQueueDisposable",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(ILjava/lang/Runnable;)V
    .locals 1
    .param p1, "capacityHint"    # I
    .param p2, "onTerminate"    # Ljava/lang/Runnable;

    .prologue
    .line 179
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lio/reactivex/subjects/UnicastSubject;-><init>(ILjava/lang/Runnable;Z)V

    .line 180
    return-void
.end method

.method constructor <init>(ILjava/lang/Runnable;Z)V
    .locals 2
    .param p1, "capacityHint"    # I
    .param p2, "onTerminate"    # Ljava/lang/Runnable;
    .param p3, "delayError"    # Z

    .prologue
    .line 190
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    invoke-direct {p0}, Lio/reactivex/subjects/Subject;-><init>()V

    .line 191
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    const-string/jumbo v1, "capacityHint"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    move-result v1

    invoke-direct {v0, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 192
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const-string/jumbo v1, "onTerminate"

    invoke-static {p2, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->onTerminate:Ljava/util/concurrent/atomic/AtomicReference;

    .line 193
    iput-boolean p3, p0, Lio/reactivex/subjects/UnicastSubject;->delayError:Z

    .line 194
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    .line 195
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 196
    new-instance v0, Lio/reactivex/subjects/UnicastSubject$UnicastQueueDisposable;

    invoke-direct {v0, p0}, Lio/reactivex/subjects/UnicastSubject$UnicastQueueDisposable;-><init>(Lio/reactivex/subjects/UnicastSubject;)V

    iput-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->wip:Lio/reactivex/internal/observers/BasicIntQueueDisposable;

    .line 197
    return-void
.end method

.method constructor <init>(IZ)V
    .locals 2
    .param p1, "capacityHint"    # I
    .param p2, "delayError"    # Z

    .prologue
    .line 161
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    invoke-direct {p0}, Lio/reactivex/subjects/Subject;-><init>()V

    .line 162
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    const-string/jumbo v1, "capacityHint"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    move-result v1

    invoke-direct {v0, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 163
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->onTerminate:Ljava/util/concurrent/atomic/AtomicReference;

    .line 164
    iput-boolean p2, p0, Lio/reactivex/subjects/UnicastSubject;->delayError:Z

    .line 165
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    .line 166
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 167
    new-instance v0, Lio/reactivex/subjects/UnicastSubject$UnicastQueueDisposable;

    invoke-direct {v0, p0}, Lio/reactivex/subjects/UnicastSubject$UnicastQueueDisposable;-><init>(Lio/reactivex/subjects/UnicastSubject;)V

    iput-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->wip:Lio/reactivex/internal/observers/BasicIntQueueDisposable;

    .line 168
    return-void
.end method

.method public static create()Lio/reactivex/subjects/UnicastSubject;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/subjects/UnicastSubject",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 86
    new-instance v0, Lio/reactivex/subjects/UnicastSubject;

    invoke-static {}, Lio/reactivex/subjects/UnicastSubject;->bufferSize()I

    move-result v1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lio/reactivex/subjects/UnicastSubject;-><init>(IZ)V

    return-object v0
.end method

.method public static create(I)Lio/reactivex/subjects/UnicastSubject;
    .locals 2
    .param p0, "capacityHint"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)",
            "Lio/reactivex/subjects/UnicastSubject",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 97
    new-instance v0, Lio/reactivex/subjects/UnicastSubject;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lio/reactivex/subjects/UnicastSubject;-><init>(IZ)V

    return-object v0
.end method

.method public static create(ILjava/lang/Runnable;)Lio/reactivex/subjects/UnicastSubject;
    .locals 2
    .param p0, "capacityHint"    # I
    .param p1, "onTerminate"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Ljava/lang/Runnable;",
            ")",
            "Lio/reactivex/subjects/UnicastSubject",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 114
    new-instance v0, Lio/reactivex/subjects/UnicastSubject;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lio/reactivex/subjects/UnicastSubject;-><init>(ILjava/lang/Runnable;Z)V

    return-object v0
.end method

.method public static create(ILjava/lang/Runnable;Z)Lio/reactivex/subjects/UnicastSubject;
    .locals 1
    .param p0, "capacityHint"    # I
    .param p1, "onTerminate"    # Ljava/lang/Runnable;
    .param p2, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Ljava/lang/Runnable;",
            "Z)",
            "Lio/reactivex/subjects/UnicastSubject",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 134
    new-instance v0, Lio/reactivex/subjects/UnicastSubject;

    invoke-direct {v0, p0, p1, p2}, Lio/reactivex/subjects/UnicastSubject;-><init>(ILjava/lang/Runnable;Z)V

    return-object v0
.end method

.method public static create(Z)Lio/reactivex/subjects/UnicastSubject;
    .locals 2
    .param p0, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(Z)",
            "Lio/reactivex/subjects/UnicastSubject",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 151
    new-instance v0, Lio/reactivex/subjects/UnicastSubject;

    invoke-static {}, Lio/reactivex/subjects/UnicastSubject;->bufferSize()I

    move-result v1

    invoke-direct {v0, v1, p0}, Lio/reactivex/subjects/UnicastSubject;-><init>(IZ)V

    return-object v0
.end method


# virtual methods
.method doTerminate()V
    .locals 3

    .prologue
    .line 215
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    iget-object v1, p0, Lio/reactivex/subjects/UnicastSubject;->onTerminate:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    .line 216
    .local v0, "r":Ljava/lang/Runnable;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lio/reactivex/subjects/UnicastSubject;->onTerminate:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 217
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 219
    :cond_0
    return-void
.end method

.method drain()V
    .locals 4

    .prologue
    .line 375
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    iget-object v2, p0, Lio/reactivex/subjects/UnicastSubject;->wip:Lio/reactivex/internal/observers/BasicIntQueueDisposable;

    invoke-virtual {v2}, Lio/reactivex/internal/observers/BasicIntQueueDisposable;->getAndIncrement()I

    move-result v2

    if-eqz v2, :cond_1

    .line 400
    :cond_0
    :goto_0
    return-void

    .line 379
    :cond_1
    iget-object v2, p0, Lio/reactivex/subjects/UnicastSubject;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/Observer;

    .line 380
    .local v0, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    const/4 v1, 0x1

    .line 384
    .local v1, "missed":I
    :goto_1
    if-eqz v0, :cond_3

    .line 385
    iget-boolean v2, p0, Lio/reactivex/subjects/UnicastSubject;->enableOperatorFusion:Z

    if-eqz v2, :cond_2

    .line 386
    invoke-virtual {p0, v0}, Lio/reactivex/subjects/UnicastSubject;->drainFused(Lio/reactivex/Observer;)V

    goto :goto_0

    .line 388
    :cond_2
    invoke-virtual {p0, v0}, Lio/reactivex/subjects/UnicastSubject;->drainNormal(Lio/reactivex/Observer;)V

    goto :goto_0

    .line 393
    :cond_3
    iget-object v2, p0, Lio/reactivex/subjects/UnicastSubject;->wip:Lio/reactivex/internal/observers/BasicIntQueueDisposable;

    neg-int v3, v1

    invoke-virtual {v2, v3}, Lio/reactivex/internal/observers/BasicIntQueueDisposable;->addAndGet(I)I

    move-result v1

    .line 394
    if-eqz v1, :cond_0

    .line 398
    iget-object v2, p0, Lio/reactivex/subjects/UnicastSubject;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    check-cast v0, Lio/reactivex/Observer;

    .restart local v0    # "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    goto :goto_1
.end method

.method drainFused(Lio/reactivex/Observer;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    .local p1, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    const/4 v6, 0x0

    .line 318
    const/4 v2, 0x1

    .line 320
    .local v2, "missed":I
    iget-object v3, p0, Lio/reactivex/subjects/UnicastSubject;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 321
    .local v3, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TT;>;"
    iget-boolean v4, p0, Lio/reactivex/subjects/UnicastSubject;->delayError:Z

    if-nez v4, :cond_2

    const/4 v1, 0x1

    .line 325
    .local v1, "failFast":Z
    :cond_0
    :goto_0
    iget-boolean v4, p0, Lio/reactivex/subjects/UnicastSubject;->disposed:Z

    if-eqz v4, :cond_3

    .line 326
    iget-object v4, p0, Lio/reactivex/subjects/UnicastSubject;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v6}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 327
    invoke-virtual {v3}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 350
    :cond_1
    :goto_1
    return-void

    .line 321
    .end local v1    # "failFast":Z
    :cond_2
    const/4 v1, 0x0

    goto :goto_0

    .line 330
    .restart local v1    # "failFast":Z
    :cond_3
    iget-boolean v0, p0, Lio/reactivex/subjects/UnicastSubject;->done:Z

    .line 332
    .local v0, "d":Z
    if-eqz v1, :cond_4

    if-eqz v0, :cond_4

    .line 333
    invoke-virtual {p0, v3, p1}, Lio/reactivex/subjects/UnicastSubject;->failedFast(Lio/reactivex/internal/fuseable/SimpleQueue;Lio/reactivex/Observer;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 338
    :cond_4
    invoke-interface {p1, v6}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 340
    if-eqz v0, :cond_5

    .line 341
    invoke-virtual {p0, p1}, Lio/reactivex/subjects/UnicastSubject;->errorOrComplete(Lio/reactivex/Observer;)V

    goto :goto_1

    .line 345
    :cond_5
    iget-object v4, p0, Lio/reactivex/subjects/UnicastSubject;->wip:Lio/reactivex/internal/observers/BasicIntQueueDisposable;

    neg-int v5, v2

    invoke-virtual {v4, v5}, Lio/reactivex/internal/observers/BasicIntQueueDisposable;->addAndGet(I)I

    move-result v2

    .line 346
    if-nez v2, :cond_0

    goto :goto_1
.end method

.method drainNormal(Lio/reactivex/Observer;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    .local p1, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 271
    const/4 v4, 0x1

    .line 272
    .local v4, "missed":I
    iget-object v5, p0, Lio/reactivex/subjects/UnicastSubject;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 273
    .local v5, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    iget-boolean v9, p0, Lio/reactivex/subjects/UnicastSubject;->delayError:Z

    if-nez v9, :cond_2

    move v3, v7

    .line 274
    .local v3, "failFast":Z
    :goto_0
    const/4 v0, 0x1

    .line 278
    .local v0, "canBeError":Z
    :cond_0
    :goto_1
    iget-boolean v9, p0, Lio/reactivex/subjects/UnicastSubject;->disposed:Z

    if-eqz v9, :cond_3

    .line 279
    iget-object v7, p0, Lio/reactivex/subjects/UnicastSubject;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 280
    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 315
    :cond_1
    :goto_2
    return-void

    .end local v0    # "canBeError":Z
    .end local v3    # "failFast":Z
    :cond_2
    move v3, v8

    .line 273
    goto :goto_0

    .line 284
    .restart local v0    # "canBeError":Z
    .restart local v3    # "failFast":Z
    :cond_3
    iget-boolean v1, p0, Lio/reactivex/subjects/UnicastSubject;->done:Z

    .line 285
    .local v1, "d":Z
    iget-object v9, p0, Lio/reactivex/subjects/UnicastSubject;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v9}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v6

    .line 286
    .local v6, "v":Ljava/lang/Object;, "TT;"
    if-nez v6, :cond_5

    move v2, v7

    .line 288
    .local v2, "empty":Z
    :goto_3
    if-eqz v1, :cond_6

    .line 289
    if-eqz v3, :cond_4

    if-eqz v0, :cond_4

    .line 290
    invoke-virtual {p0, v5, p1}, Lio/reactivex/subjects/UnicastSubject;->failedFast(Lio/reactivex/internal/fuseable/SimpleQueue;Lio/reactivex/Observer;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 293
    const/4 v0, 0x0

    .line 297
    :cond_4
    if-eqz v2, :cond_6

    .line 298
    invoke-virtual {p0, p1}, Lio/reactivex/subjects/UnicastSubject;->errorOrComplete(Lio/reactivex/Observer;)V

    goto :goto_2

    .end local v2    # "empty":Z
    :cond_5
    move v2, v8

    .line 286
    goto :goto_3

    .line 303
    .restart local v2    # "empty":Z
    :cond_6
    if-eqz v2, :cond_7

    .line 310
    iget-object v9, p0, Lio/reactivex/subjects/UnicastSubject;->wip:Lio/reactivex/internal/observers/BasicIntQueueDisposable;

    neg-int v10, v4

    invoke-virtual {v9, v10}, Lio/reactivex/internal/observers/BasicIntQueueDisposable;->addAndGet(I)I

    move-result v4

    .line 311
    if-nez v4, :cond_0

    goto :goto_2

    .line 307
    :cond_7
    invoke-interface {p1, v6}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method errorOrComplete(Lio/reactivex/Observer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 353
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    .local p1, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    iget-object v1, p0, Lio/reactivex/subjects/UnicastSubject;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 354
    iget-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->error:Ljava/lang/Throwable;

    .line 355
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_0

    .line 356
    invoke-interface {p1, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 360
    :goto_0
    return-void

    .line 358
    :cond_0
    invoke-interface {p1}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0
.end method

.method failedFast(Lio/reactivex/internal/fuseable/SimpleQueue;Lio/reactivex/Observer;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<TT;>;",
            "Lio/reactivex/Observer",
            "<-TT;>;)Z"
        }
    .end annotation

    .prologue
    .line 363
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    .local p1, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    .local p2, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->error:Ljava/lang/Throwable;

    .line 364
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_0

    .line 365
    iget-object v1, p0, Lio/reactivex/subjects/UnicastSubject;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 366
    invoke-interface {p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 367
    invoke-interface {p2, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 368
    const/4 v1, 0x1

    .line 370
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 409
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/subjects/UnicastSubject;->done:Z

    if-eqz v0, :cond_0

    .line 410
    iget-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->error:Ljava/lang/Throwable;

    .line 412
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasComplete()Z
    .locals 1

    .prologue
    .line 422
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/subjects/UnicastSubject;->done:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->error:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasObservers()Z
    .locals 1

    .prologue
    .line 404
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasThrowable()Z
    .locals 1

    .prologue
    .line 417
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/subjects/UnicastSubject;->done:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->error:Ljava/lang/Throwable;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 260
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/subjects/UnicastSubject;->done:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/reactivex/subjects/UnicastSubject;->disposed:Z

    if-eqz v0, :cond_1

    .line 268
    :cond_0
    :goto_0
    return-void

    .line 263
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/subjects/UnicastSubject;->done:Z

    .line 265
    invoke-virtual {p0}, Lio/reactivex/subjects/UnicastSubject;->doTerminate()V

    .line 267
    invoke-virtual {p0}, Lio/reactivex/subjects/UnicastSubject;->drain()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 243
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/subjects/UnicastSubject;->done:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/reactivex/subjects/UnicastSubject;->disposed:Z

    if-eqz v0, :cond_1

    .line 244
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 256
    :goto_0
    return-void

    .line 247
    :cond_1
    if-nez p1, :cond_2

    .line 248
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "t":Ljava/lang/Throwable;
    const-string/jumbo v0, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 250
    .restart local p1    # "t":Ljava/lang/Throwable;
    :cond_2
    iput-object p1, p0, Lio/reactivex/subjects/UnicastSubject;->error:Ljava/lang/Throwable;

    .line 251
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/subjects/UnicastSubject;->done:Z

    .line 253
    invoke-virtual {p0}, Lio/reactivex/subjects/UnicastSubject;->doTerminate()V

    .line 255
    invoke-virtual {p0}, Lio/reactivex/subjects/UnicastSubject;->drain()V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 230
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/subjects/UnicastSubject;->done:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/reactivex/subjects/UnicastSubject;->disposed:Z

    if-eqz v0, :cond_1

    .line 239
    :cond_0
    :goto_0
    return-void

    .line 233
    :cond_1
    if-nez p1, :cond_2

    .line 234
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lio/reactivex/subjects/UnicastSubject;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 237
    :cond_2
    iget-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;)Z

    .line 238
    invoke-virtual {p0}, Lio/reactivex/subjects/UnicastSubject;->drain()V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 223
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/subjects/UnicastSubject;->done:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/reactivex/subjects/UnicastSubject;->disposed:Z

    if-eqz v0, :cond_1

    .line 224
    :cond_0
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 226
    :cond_1
    return-void
.end method

.method protected subscribeActual(Lio/reactivex/Observer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 201
    .local p0, "this":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    .local p1, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 202
    iget-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->wip:Lio/reactivex/internal/observers/BasicIntQueueDisposable;

    invoke-interface {p1, v0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 203
    iget-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 204
    iget-boolean v0, p0, Lio/reactivex/subjects/UnicastSubject;->disposed:Z

    if-eqz v0, :cond_0

    .line 205
    iget-object v0, p0, Lio/reactivex/subjects/UnicastSubject;->actual:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 212
    :goto_0
    return-void

    .line 208
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/subjects/UnicastSubject;->drain()V

    goto :goto_0

    .line 210
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Only a single observer allowed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/Observer;)V

    goto :goto_0
.end method
