.class final Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;
.super Lio/reactivex/internal/observers/QueueDrainObserver;
.source "ObservableWindowTimed.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableWindowTimed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "WindowSkipObserver"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$CompletionTask;,
        Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$SubjectWork;
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
        "Lio/reactivex/disposables/Disposable;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field final bufferSize:I

.field s:Lio/reactivex/disposables/Disposable;

.field volatile terminated:Z

.field final timeskip:J

.field final timespan:J

.field final unit:Ljava/util/concurrent/TimeUnit;

.field final windows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lio/reactivex/subjects/UnicastSubject",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final worker:Lio/reactivex/Scheduler$Worker;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler$Worker;I)V
    .locals 2
    .param p2, "timespan"    # J
    .param p4, "timeskip"    # J
    .param p6, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p7, "worker"    # Lio/reactivex/Scheduler$Worker;
    .param p8, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;>;JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler$Worker;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 538
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    new-instance v0, Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-direct {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;-><init>()V

    invoke-direct {p0, p1, v0}, Lio/reactivex/internal/observers/QueueDrainObserver;-><init>(Lio/reactivex/Observer;Lio/reactivex/internal/fuseable/SimplePlainQueue;)V

    .line 539
    iput-wide p2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->timespan:J

    .line 540
    iput-wide p4, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->timeskip:J

    .line 541
    iput-object p6, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->unit:Ljava/util/concurrent/TimeUnit;

    .line 542
    iput-object p7, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->worker:Lio/reactivex/Scheduler$Worker;

    .line 543
    iput p8, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->bufferSize:I

    .line 544
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->windows:Ljava/util/List;

    .line 545
    return-void
.end method


# virtual methods
.method complete(Lio/reactivex/subjects/UnicastSubject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/subjects/UnicastSubject",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 625
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver<TT;>;"
    .local p1, "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$SubjectWork;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$SubjectWork;-><init>(Lio/reactivex/subjects/UnicastSubject;Z)V

    invoke-interface {v0, v1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 626
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 627
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->drainLoop()V

    .line 629
    :cond_0
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 612
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->cancelled:Z

    .line 613
    return-void
.end method

.method disposeWorker()V
    .locals 1

    .prologue
    .line 621
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 622
    return-void
.end method

.method drainLoop()V
    .locals 19

    .prologue
    .line 633
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver<TT;>;"
    move-object/from16 v0, p0

    iget-object v8, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    check-cast v8, Lio/reactivex/internal/queue/MpscLinkedQueue;

    .line 634
    .local v8, "q":Lio/reactivex/internal/queue/MpscLinkedQueue;, "Lio/reactivex/internal/queue/MpscLinkedQueue<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->actual:Lio/reactivex/Observer;

    .line 635
    .local v2, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    move-object/from16 v0, p0

    iget-object v13, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->windows:Ljava/util/List;

    .line 637
    .local v13, "ws":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/subjects/UnicastSubject<TT;>;>;"
    const/4 v7, 0x1

    .line 642
    .local v7, "missed":I
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->terminated:Z

    if-eqz v14, :cond_1

    .line 643
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v14}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 644
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->disposeWorker()V

    .line 645
    invoke-virtual {v8}, Lio/reactivex/internal/queue/MpscLinkedQueue;->clear()V

    .line 646
    invoke-interface {v13}, Ljava/util/List;->clear()V

    .line 710
    :goto_1
    return-void

    .line 650
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->done:Z

    .line 652
    .local v3, "d":Z
    invoke-virtual {v8}, Lio/reactivex/internal/queue/MpscLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v10

    .line 654
    .local v10, "v":Ljava/lang/Object;
    if-nez v10, :cond_3

    const/4 v5, 0x1

    .line 655
    .local v5, "empty":Z
    :goto_2
    instance-of v9, v10, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$SubjectWork;

    .line 657
    .local v9, "sw":Z
    if-eqz v3, :cond_6

    if-nez v5, :cond_2

    if-eqz v9, :cond_6

    .line 658
    :cond_2
    invoke-virtual {v8}, Lio/reactivex/internal/queue/MpscLinkedQueue;->clear()V

    .line 659
    move-object/from16 v0, p0

    iget-object v4, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->error:Ljava/lang/Throwable;

    .line 660
    .local v4, "e":Ljava/lang/Throwable;
    if-eqz v4, :cond_4

    .line 661
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lio/reactivex/subjects/UnicastSubject;

    .line 662
    .local v11, "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    invoke-virtual {v11, v4}, Lio/reactivex/subjects/UnicastSubject;->onError(Ljava/lang/Throwable;)V

    goto :goto_3

    .line 654
    .end local v4    # "e":Ljava/lang/Throwable;
    .end local v5    # "empty":Z
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v9    # "sw":Z
    .end local v11    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    :cond_3
    const/4 v5, 0x0

    goto :goto_2

    .line 665
    .restart local v4    # "e":Ljava/lang/Throwable;
    .restart local v5    # "empty":Z
    .restart local v9    # "sw":Z
    :cond_4
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .restart local v6    # "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lio/reactivex/subjects/UnicastSubject;

    .line 666
    .restart local v11    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    invoke-virtual {v11}, Lio/reactivex/subjects/UnicastSubject;->onComplete()V

    goto :goto_4

    .line 669
    .end local v11    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->disposeWorker()V

    .line 670
    invoke-interface {v13}, Ljava/util/List;->clear()V

    goto :goto_1

    .line 674
    .end local v4    # "e":Ljava/lang/Throwable;
    .end local v6    # "i$":Ljava/util/Iterator;
    :cond_6
    if-eqz v5, :cond_7

    .line 705
    neg-int v14, v7

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->leave(I)I

    move-result v7

    .line 706
    if-nez v7, :cond_0

    goto :goto_1

    .line 678
    :cond_7
    if-eqz v9, :cond_9

    move-object v12, v10

    .line 679
    check-cast v12, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$SubjectWork;

    .line 681
    .local v12, "work":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$SubjectWork;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$SubjectWork<TT;>;"
    iget-boolean v14, v12, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$SubjectWork;->open:Z

    if-eqz v14, :cond_8

    .line 682
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->cancelled:Z

    if-nez v14, :cond_0

    .line 686
    move-object/from16 v0, p0

    iget v14, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->bufferSize:I

    invoke-static {v14}, Lio/reactivex/subjects/UnicastSubject;->create(I)Lio/reactivex/subjects/UnicastSubject;

    move-result-object v11

    .line 687
    .restart local v11    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    invoke-interface {v13, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 688
    invoke-interface {v2, v11}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 690
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->worker:Lio/reactivex/Scheduler$Worker;

    new-instance v15, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$CompletionTask;

    move-object/from16 v0, p0

    invoke-direct {v15, v0, v11}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$CompletionTask;-><init>(Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;Lio/reactivex/subjects/UnicastSubject;)V

    move-object/from16 v0, p0

    iget-wide v0, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->timespan:J

    move-wide/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->unit:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v18, v0

    invoke-virtual/range {v14 .. v18}, Lio/reactivex/Scheduler$Worker;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    goto/16 :goto_0

    .line 692
    .end local v11    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    :cond_8
    iget-object v14, v12, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$SubjectWork;->w:Lio/reactivex/subjects/UnicastSubject;

    invoke-interface {v13, v14}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 693
    iget-object v14, v12, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$SubjectWork;->w:Lio/reactivex/subjects/UnicastSubject;

    invoke-virtual {v14}, Lio/reactivex/subjects/UnicastSubject;->onComplete()V

    .line 694
    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    move-result v14

    if-eqz v14, :cond_0

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->cancelled:Z

    if-eqz v14, :cond_0

    .line 695
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->terminated:Z

    goto/16 :goto_0

    .line 699
    .end local v12    # "work":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$SubjectWork;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$SubjectWork<TT;>;"
    :cond_9
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .restart local v6    # "i$":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lio/reactivex/subjects/UnicastSubject;

    .line 700
    .restart local v11    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    invoke-virtual {v11, v10}, Lio/reactivex/subjects/UnicastSubject;->onNext(Ljava/lang/Object;)V

    goto :goto_5
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 617
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->cancelled:Z

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 601
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->done:Z

    .line 602
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 603
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->drainLoop()V

    .line 606
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 607
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->disposeWorker()V

    .line 608
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 589
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver<TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->error:Ljava/lang/Throwable;

    .line 590
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->done:Z

    .line 591
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 592
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->drainLoop()V

    .line 595
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 596
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->disposeWorker()V

    .line 597
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 571
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->fastEnter()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 572
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->windows:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/subjects/UnicastSubject;

    .line 573
    .local v1, "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    invoke-virtual {v1, p1}, Lio/reactivex/subjects/UnicastSubject;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 575
    .end local v1    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    :cond_0
    const/4 v2, -0x1

    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->leave(I)I

    move-result v2

    if-nez v2, :cond_3

    .line 585
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    return-void

    .line 579
    :cond_2
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-interface {v2, p1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 580
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->enter()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 584
    :cond_3
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->drainLoop()V

    goto :goto_1
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 8
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 549
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 550
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 552
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 554
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->cancelled:Z

    if-eqz v0, :cond_1

    .line 567
    :cond_0
    :goto_0
    return-void

    .line 558
    :cond_1
    iget v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->bufferSize:I

    invoke-static {v0}, Lio/reactivex/subjects/UnicastSubject;->create(I)Lio/reactivex/subjects/UnicastSubject;

    move-result-object v7

    .line 559
    .local v7, "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->windows:Ljava/util/List;

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 561
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, v7}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 562
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->worker:Lio/reactivex/Scheduler$Worker;

    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$CompletionTask;

    invoke-direct {v1, p0, v7}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$CompletionTask;-><init>(Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;Lio/reactivex/subjects/UnicastSubject;)V

    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->timespan:J

    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3, v4}, Lio/reactivex/Scheduler$Worker;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    .line 564
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->worker:Lio/reactivex/Scheduler$Worker;

    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->timeskip:J

    iget-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->timeskip:J

    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->unit:Ljava/util/concurrent/TimeUnit;

    move-object v1, p0

    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler$Worker;->schedulePeriodically(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    goto :goto_0
.end method

.method public run()V
    .locals 3

    .prologue
    .line 715
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver<TT;>;"
    iget v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->bufferSize:I

    invoke-static {v2}, Lio/reactivex/subjects/UnicastSubject;->create(I)Lio/reactivex/subjects/UnicastSubject;

    move-result-object v1

    .line 717
    .local v1, "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$SubjectWork;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$SubjectWork;-><init>(Lio/reactivex/subjects/UnicastSubject;Z)V

    .line 718
    .local v0, "sw":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$SubjectWork;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver$SubjectWork<TT;>;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->cancelled:Z

    if-nez v2, :cond_0

    .line 719
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-interface {v2, v0}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 721
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->enter()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 722
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;->drainLoop()V

    .line 724
    :cond_1
    return-void
.end method
