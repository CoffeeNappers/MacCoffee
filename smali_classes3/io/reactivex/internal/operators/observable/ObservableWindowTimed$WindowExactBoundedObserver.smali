.class final Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;
.super Lio/reactivex/internal/observers/QueueDrainObserver;
.source "ObservableWindowTimed.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableWindowTimed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "WindowExactBoundedObserver"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver$ConsumerIndexHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/observers/QueueDrainObserver",
        "<TT;",
        "Ljava/lang/Object;",
        "Lio/reactivex/Observable",
        "<TT;>;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field final bufferSize:I

.field count:J

.field final maxSize:J

.field producerIndex:J

.field final restartTimerOnMaxSize:Z

.field s:Lio/reactivex/disposables/Disposable;

.field final scheduler:Lio/reactivex/Scheduler;

.field volatile terminated:Z

.field final timer:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;"
        }
    .end annotation
.end field

.field final timespan:J

.field final unit:Ljava/util/concurrent/TimeUnit;

.field window:Lio/reactivex/subjects/UnicastSubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/subjects/UnicastSubject",
            "<TT;>;"
        }
    .end annotation
.end field

.field final worker:Lio/reactivex/Scheduler$Worker;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;IJZ)V
    .locals 1
    .param p2, "timespan"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lio/reactivex/Scheduler;
    .param p6, "bufferSize"    # I
    .param p7, "maxSize"    # J
    .param p9, "restartTimerOnMaxSize"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "IJZ)V"
        }
    .end annotation

    .prologue
    .line 276
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    new-instance v0, Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-direct {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;-><init>()V

    invoke-direct {p0, p1, v0}, Lio/reactivex/internal/observers/QueueDrainObserver;-><init>(Lio/reactivex/Observer;Lio/reactivex/internal/fuseable/SimplePlainQueue;)V

    .line 270
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    .line 277
    iput-wide p2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->timespan:J

    .line 278
    iput-object p4, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->unit:Ljava/util/concurrent/TimeUnit;

    .line 279
    iput-object p5, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->scheduler:Lio/reactivex/Scheduler;

    .line 280
    iput p6, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->bufferSize:I

    .line 281
    iput-wide p7, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->maxSize:J

    .line 282
    iput-boolean p9, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->restartTimerOnMaxSize:Z

    .line 283
    if-eqz p9, :cond_0

    .line 284
    invoke-virtual {p5}, Lio/reactivex/Scheduler;->createWorker()Lio/reactivex/Scheduler$Worker;

    move-result-object v0

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->worker:Lio/reactivex/Scheduler$Worker;

    .line 288
    :goto_0
    return-void

    .line 286
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->worker:Lio/reactivex/Scheduler$Worker;

    goto :goto_0
.end method

.method static synthetic access$000(Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;)Z
    .locals 1
    .param p0, "x0"    # Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;

    .prologue
    .line 247
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->cancelled:Z

    return v0
.end method

.method static synthetic access$100(Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;)Lio/reactivex/internal/fuseable/SimplePlainQueue;
    .locals 1
    .param p0, "x0"    # Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;

    .prologue
    .line 247
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    return-object v0
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 390
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->cancelled:Z

    .line 391
    return-void
.end method

.method disposeTimer()V
    .locals 2

    .prologue
    .line 399
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v1}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 400
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->worker:Lio/reactivex/Scheduler$Worker;

    .line 401
    .local v0, "w":Lio/reactivex/Scheduler$Worker;
    if-eqz v0, :cond_0

    .line 402
    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 404
    :cond_0
    return-void
.end method

.method drainLoop()V
    .locals 23

    .prologue
    .line 407
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver<TT;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    move-object/from16 v19, v0

    check-cast v19, Lio/reactivex/internal/queue/MpscLinkedQueue;

    .line 408
    .local v19, "q":Lio/reactivex/internal/queue/MpscLinkedQueue;, "Lio/reactivex/internal/queue/MpscLinkedQueue<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v9, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->actual:Lio/reactivex/Observer;

    .line 409
    .local v9, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    move-object/from16 v22, v0

    .line 411
    .local v22, "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    const/16 v17, 0x1

    .line 415
    .local v17, "missed":I
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->terminated:Z

    if-eqz v2, :cond_1

    .line 416
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v2}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 417
    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/queue/MpscLinkedQueue;->clear()V

    .line 418
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->disposeTimer()V

    .line 493
    :goto_1
    return-void

    .line 422
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->done:Z

    .line 424
    .local v13, "d":Z
    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/queue/MpscLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v18

    .line 426
    .local v18, "o":Ljava/lang/Object;
    if-nez v18, :cond_3

    const/4 v14, 0x1

    .line 427
    .local v14, "empty":Z
    :goto_2
    move-object/from16 v0, v18

    instance-of v0, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver$ConsumerIndexHolder;

    move/from16 v16, v0

    .line 429
    .local v16, "isHolder":Z
    if-eqz v13, :cond_5

    if-nez v14, :cond_2

    if-eqz v16, :cond_5

    .line 430
    :cond_2
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 431
    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/queue/MpscLinkedQueue;->clear()V

    .line 432
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->disposeTimer()V

    .line 433
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->error:Ljava/lang/Throwable;

    .line 434
    .local v15, "err":Ljava/lang/Throwable;
    if-eqz v15, :cond_4

    .line 435
    move-object/from16 v0, v22

    invoke-virtual {v0, v15}, Lio/reactivex/subjects/UnicastSubject;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 426
    .end local v14    # "empty":Z
    .end local v15    # "err":Ljava/lang/Throwable;
    .end local v16    # "isHolder":Z
    :cond_3
    const/4 v14, 0x0

    goto :goto_2

    .line 437
    .restart local v14    # "empty":Z
    .restart local v15    # "err":Ljava/lang/Throwable;
    .restart local v16    # "isHolder":Z
    :cond_4
    invoke-virtual/range {v22 .. v22}, Lio/reactivex/subjects/UnicastSubject;->onComplete()V

    goto :goto_1

    .line 442
    .end local v15    # "err":Ljava/lang/Throwable;
    :cond_5
    if-eqz v14, :cond_6

    .line 488
    move/from16 v0, v17

    neg-int v2, v0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->leave(I)I

    move-result v17

    .line 489
    if-nez v17, :cond_0

    goto :goto_1

    .line 446
    :cond_6
    if-eqz v16, :cond_8

    move-object/from16 v12, v18

    .line 447
    check-cast v12, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver$ConsumerIndexHolder;

    .line 448
    .local v12, "consumerIndexHolder":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver$ConsumerIndexHolder;
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->restartTimerOnMaxSize:Z

    if-nez v2, :cond_7

    move-object/from16 v0, p0

    iget-wide v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->producerIndex:J

    iget-wide v4, v12, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver$ConsumerIndexHolder;->index:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 449
    :cond_7
    invoke-virtual/range {v22 .. v22}, Lio/reactivex/subjects/UnicastSubject;->onComplete()V

    .line 450
    const-wide/16 v2, 0x0

    move-object/from16 v0, p0

    iput-wide v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->count:J

    .line 451
    move-object/from16 v0, p0

    iget v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->bufferSize:I

    invoke-static {v2}, Lio/reactivex/subjects/UnicastSubject;->create(I)Lio/reactivex/subjects/UnicastSubject;

    move-result-object v22

    .line 452
    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 454
    move-object/from16 v0, v22

    invoke-interface {v9, v0}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 459
    .end local v12    # "consumerIndexHolder":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver$ConsumerIndexHolder;
    :cond_8
    invoke-static/range {v18 .. v18}, Lio/reactivex/internal/util/NotificationLite;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lio/reactivex/subjects/UnicastSubject;->onNext(Ljava/lang/Object;)V

    .line 460
    move-object/from16 v0, p0

    iget-wide v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->count:J

    const-wide/16 v4, 0x1

    add-long v10, v2, v4

    .line 462
    .local v10, "c":J
    move-object/from16 v0, p0

    iget-wide v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->maxSize:J

    cmp-long v2, v10, v2

    if-ltz v2, :cond_9

    .line 463
    move-object/from16 v0, p0

    iget-wide v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->producerIndex:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    move-object/from16 v0, p0

    iput-wide v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->producerIndex:J

    .line 464
    const-wide/16 v2, 0x0

    move-object/from16 v0, p0

    iput-wide v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->count:J

    .line 466
    invoke-virtual/range {v22 .. v22}, Lio/reactivex/subjects/UnicastSubject;->onComplete()V

    .line 468
    move-object/from16 v0, p0

    iget v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->bufferSize:I

    invoke-static {v2}, Lio/reactivex/subjects/UnicastSubject;->create(I)Lio/reactivex/subjects/UnicastSubject;

    move-result-object v22

    .line 469
    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 470
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->actual:Lio/reactivex/Observer;

    move-object/from16 v0, v22

    invoke-interface {v2, v0}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 472
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->restartTimerOnMaxSize:Z

    if-eqz v2, :cond_0

    .line 473
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lio/reactivex/disposables/Disposable;

    .line 474
    .local v21, "tm":Lio/reactivex/disposables/Disposable;
    invoke-interface/range {v21 .. v21}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 476
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->worker:Lio/reactivex/Scheduler$Worker;

    new-instance v3, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver$ConsumerIndexHolder;

    move-object/from16 v0, p0

    iget-wide v4, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->producerIndex:J

    move-object/from16 v0, p0

    invoke-direct {v3, v4, v5, v0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver$ConsumerIndexHolder;-><init>(JLio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;)V

    move-object/from16 v0, p0

    iget-wide v4, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->timespan:J

    move-object/from16 v0, p0

    iget-wide v6, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->timespan:J

    move-object/from16 v0, p0

    iget-object v8, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v2 .. v8}, Lio/reactivex/Scheduler$Worker;->schedulePeriodically(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v20

    .line 478
    .local v20, "task":Lio/reactivex/disposables/Disposable;
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 479
    invoke-interface/range {v20 .. v20}, Lio/reactivex/disposables/Disposable;->dispose()V

    goto/16 :goto_0

    .line 484
    .end local v20    # "task":Lio/reactivex/disposables/Disposable;
    .end local v21    # "tm":Lio/reactivex/disposables/Disposable;
    :cond_9
    move-object/from16 v0, p0

    iput-wide v10, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->count:J

    goto/16 :goto_0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 395
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->cancelled:Z

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 379
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->done:Z

    .line 380
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 381
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->drainLoop()V

    .line 384
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 385
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->disposeTimer()V

    .line 386
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 367
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver<TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->error:Ljava/lang/Throwable;

    .line 368
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->done:Z

    .line 369
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 370
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->drainLoop()V

    .line 373
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 374
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->disposeTimer()V

    .line 375
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const-wide/16 v2, 0x1

    .line 322
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->terminated:Z

    if-eqz v0, :cond_1

    .line 363
    :cond_0
    :goto_0
    return-void

    .line 326
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->fastEnter()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 327
    iget-object v11, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 328
    .local v11, "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    invoke-virtual {v11, p1}, Lio/reactivex/subjects/UnicastSubject;->onNext(Ljava/lang/Object;)V

    .line 330
    iget-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->count:J

    add-long v8, v0, v2

    .line 332
    .local v8, "c":J
    iget-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->maxSize:J

    cmp-long v0, v8, v0

    if-ltz v0, :cond_4

    .line 333
    iget-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->producerIndex:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->producerIndex:J

    .line 334
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->count:J

    .line 336
    invoke-virtual {v11}, Lio/reactivex/subjects/UnicastSubject;->onComplete()V

    .line 338
    iget v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->bufferSize:I

    invoke-static {v0}, Lio/reactivex/subjects/UnicastSubject;->create(I)Lio/reactivex/subjects/UnicastSubject;

    move-result-object v11

    .line 339
    iput-object v11, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 340
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, v11}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 341
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->restartTimerOnMaxSize:Z

    if-eqz v0, :cond_2

    .line 342
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lio/reactivex/disposables/Disposable;

    .line 343
    .local v10, "tm":Lio/reactivex/disposables/Disposable;
    invoke-interface {v10}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 344
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->worker:Lio/reactivex/Scheduler$Worker;

    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver$ConsumerIndexHolder;

    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->producerIndex:J

    invoke-direct {v1, v2, v3, p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver$ConsumerIndexHolder;-><init>(JLio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;)V

    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->timespan:J

    iget-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->timespan:J

    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler$Worker;->schedulePeriodically(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v7

    .line 347
    .local v7, "task":Lio/reactivex/disposables/Disposable;
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, v7}, Lio/reactivex/internal/disposables/DisposableHelper;->replace(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z

    .line 353
    .end local v7    # "task":Lio/reactivex/disposables/Disposable;
    .end local v10    # "tm":Lio/reactivex/disposables/Disposable;
    :cond_2
    :goto_1
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->leave(I)I

    move-result v0

    if-eqz v0, :cond_0

    .line 362
    .end local v8    # "c":J
    .end local v11    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    :cond_3
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->drainLoop()V

    goto :goto_0

    .line 350
    .restart local v8    # "c":J
    .restart local v11    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    :cond_4
    iput-wide v8, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->count:J

    goto :goto_1

    .line 357
    .end local v8    # "c":J
    .end local v11    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    :cond_5
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 358
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->enter()Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 10
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 292
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 293
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 295
    iget-object v7, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->actual:Lio/reactivex/Observer;

    .line 297
    .local v7, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    invoke-interface {v7, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 299
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->cancelled:Z

    if-eqz v0, :cond_1

    .line 318
    .end local v7    # "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    :cond_0
    :goto_0
    return-void

    .line 303
    .restart local v7    # "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    :cond_1
    iget v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->bufferSize:I

    invoke-static {v0}, Lio/reactivex/subjects/UnicastSubject;->create(I)Lio/reactivex/subjects/UnicastSubject;

    move-result-object v9

    .line 304
    .local v9, "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    iput-object v9, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 306
    invoke-interface {v7, v9}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 309
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver$ConsumerIndexHolder;

    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->producerIndex:J

    invoke-direct {v1, v2, v3, p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver$ConsumerIndexHolder;-><init>(JLio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;)V

    .line 310
    .local v1, "consumerIndexHolder":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver$ConsumerIndexHolder;
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->restartTimerOnMaxSize:Z

    if-eqz v0, :cond_2

    .line 311
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->worker:Lio/reactivex/Scheduler$Worker;

    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->timespan:J

    iget-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->timespan:J

    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler$Worker;->schedulePeriodically(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v8

    .line 316
    .local v8, "d":Lio/reactivex/disposables/Disposable;
    :goto_1
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, v8}, Lio/reactivex/internal/disposables/DisposableHelper;->replace(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z

    goto :goto_0

    .line 313
    .end local v8    # "d":Lio/reactivex/disposables/Disposable;
    :cond_2
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->scheduler:Lio/reactivex/Scheduler;

    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->timespan:J

    iget-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->timespan:J

    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler;->schedulePeriodicallyDirect(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v8

    .restart local v8    # "d":Lio/reactivex/disposables/Disposable;
    goto :goto_1
.end method
