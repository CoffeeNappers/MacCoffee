.class final Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;
.super Lio/reactivex/internal/observers/QueueDrainObserver;
.source "ObservableWindowBoundarySelector.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "WindowBoundaryMainObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "B:",
        "Ljava/lang/Object;",
        "V:",
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
.field final boundary:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;"
        }
    .end annotation
.end field

.field final bufferSize:I

.field final close:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TB;+",
            "Lio/reactivex/ObservableSource",
            "<TV;>;>;"
        }
    .end annotation
.end field

.field final open:Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableSource",
            "<TB;>;"
        }
    .end annotation
.end field

.field final resources:Lio/reactivex/disposables/CompositeDisposable;

.field s:Lio/reactivex/disposables/Disposable;

.field final windows:Ljava/util/concurrent/atomic/AtomicLong;

.field final ws:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lio/reactivex/subjects/UnicastSubject",
            "<TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;I)V
    .locals 4
    .param p4, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;>;",
            "Lio/reactivex/ObservableSource",
            "<TB;>;",
            "Lio/reactivex/functions/Function",
            "<-TB;+",
            "Lio/reactivex/ObservableSource",
            "<TV;>;>;I)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver<TT;TB;TV;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    .local p2, "open":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TB;>;"
    .local p3, "close":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TB;+Lio/reactivex/ObservableSource<TV;>;>;"
    new-instance v0, Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-direct {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;-><init>()V

    invoke-direct {p0, p1, v0}, Lio/reactivex/internal/observers/QueueDrainObserver;-><init>(Lio/reactivex/Observer;Lio/reactivex/internal/fuseable/SimplePlainQueue;)V

    .line 66
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->boundary:Ljava/util/concurrent/atomic/AtomicReference;

    .line 70
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->windows:Ljava/util/concurrent/atomic/AtomicLong;

    .line 75
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->open:Lio/reactivex/ObservableSource;

    .line 76
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->close:Lio/reactivex/functions/Function;

    .line 77
    iput p4, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->bufferSize:I

    .line 78
    new-instance v0, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v0}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->resources:Lio/reactivex/disposables/CompositeDisposable;

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->ws:Ljava/util/List;

    .line 80
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->windows:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->lazySet(J)V

    .line 81
    return-void
.end method


# virtual methods
.method public accept(Lio/reactivex/Observer;Ljava/lang/Object;)V
    .locals 0
    .param p2, "v"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 278
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver<TT;TB;TV;>;"
    .local p1, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    return-void
.end method

.method close(Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryCloseObserver;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryCloseObserver",
            "<TT;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 288
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver<TT;TB;TV;>;"
    .local p1, "w":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryCloseObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryCloseObserver<TT;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->resources:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/disposables/CompositeDisposable;->delete(Lio/reactivex/disposables/Disposable;)Z

    .line 289
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowOperation;

    iget-object v2, p1, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryCloseObserver;->w:Lio/reactivex/subjects/UnicastSubject;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowOperation;-><init>(Lio/reactivex/subjects/UnicastSubject;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 290
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 291
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->drainLoop()V

    .line 293
    :cond_0
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 167
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver<TT;TB;TV;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->cancelled:Z

    .line 168
    return-void
.end method

.method disposeBoundary()V
    .locals 1

    .prologue
    .line 176
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver<TT;TB;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->resources:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 177
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->boundary:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 178
    return-void
.end method

.method drainLoop()V
    .locals 20

    .prologue
    .line 181
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver<TT;TB;TV;>;"
    move-object/from16 v0, p0

    iget-object v11, v0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    check-cast v11, Lio/reactivex/internal/queue/MpscLinkedQueue;

    .line 182
    .local v11, "q":Lio/reactivex/internal/queue/MpscLinkedQueue;, "Lio/reactivex/internal/queue/MpscLinkedQueue<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->actual:Lio/reactivex/Observer;

    .line 183
    .local v2, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->ws:Ljava/util/List;

    .line 184
    .local v14, "ws":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/subjects/UnicastSubject<TT;>;>;"
    const/4 v8, 0x1

    .line 189
    .local v8, "missed":I
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->done:Z

    .line 191
    .local v4, "d":Z
    invoke-virtual {v11}, Lio/reactivex/internal/queue/MpscLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v9

    .line 193
    .local v9, "o":Ljava/lang/Object;
    if-nez v9, :cond_1

    const/4 v6, 0x1

    .line 195
    .local v6, "empty":Z
    :goto_1
    if-eqz v4, :cond_4

    if-eqz v6, :cond_4

    .line 196
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->disposeBoundary()V

    .line 197
    move-object/from16 v0, p0

    iget-object v5, v0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->error:Ljava/lang/Throwable;

    .line 198
    .local v5, "e":Ljava/lang/Throwable;
    if-eqz v5, :cond_2

    .line 199
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lio/reactivex/subjects/UnicastSubject;

    .line 200
    .local v12, "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    invoke-virtual {v12, v5}, Lio/reactivex/subjects/UnicastSubject;->onError(Ljava/lang/Throwable;)V

    goto :goto_2

    .line 193
    .end local v5    # "e":Ljava/lang/Throwable;
    .end local v6    # "empty":Z
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v12    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    :cond_1
    const/4 v6, 0x0

    goto :goto_1

    .line 203
    .restart local v5    # "e":Ljava/lang/Throwable;
    .restart local v6    # "empty":Z
    :cond_2
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .restart local v7    # "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lio/reactivex/subjects/UnicastSubject;

    .line 204
    .restart local v12    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    invoke-virtual {v12}, Lio/reactivex/subjects/UnicastSubject;->onComplete()V

    goto :goto_3

    .line 207
    .end local v12    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    :cond_3
    invoke-interface {v14}, Ljava/util/List;->clear()V

    .line 274
    .end local v5    # "e":Ljava/lang/Throwable;
    .end local v7    # "i$":Ljava/util/Iterator;
    :goto_4
    return-void

    .line 211
    :cond_4
    if-eqz v6, :cond_5

    .line 269
    neg-int v15, v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->leave(I)I

    move-result v8

    .line 270
    if-nez v8, :cond_0

    goto :goto_4

    .line 215
    :cond_5
    instance-of v15, v9, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowOperation;

    if-eqz v15, :cond_7

    move-object v13, v9

    .line 217
    check-cast v13, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowOperation;

    .line 219
    .local v13, "wo":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowOperation;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowOperation<TT;TB;>;"
    iget-object v12, v13, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowOperation;->w:Lio/reactivex/subjects/UnicastSubject;

    .line 220
    .restart local v12    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    if-eqz v12, :cond_6

    .line 221
    iget-object v15, v13, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowOperation;->w:Lio/reactivex/subjects/UnicastSubject;

    invoke-interface {v14, v15}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_0

    .line 222
    iget-object v15, v13, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowOperation;->w:Lio/reactivex/subjects/UnicastSubject;

    invoke-virtual {v15}, Lio/reactivex/subjects/UnicastSubject;->onComplete()V

    .line 224
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->windows:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v15}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    move-result-wide v16

    const-wide/16 v18, 0x0

    cmp-long v15, v16, v18

    if-nez v15, :cond_0

    .line 225
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->disposeBoundary()V

    goto :goto_4

    .line 232
    :cond_6
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->cancelled:Z

    if-nez v15, :cond_0

    .line 237
    move-object/from16 v0, p0

    iget v15, v0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->bufferSize:I

    invoke-static {v15}, Lio/reactivex/subjects/UnicastSubject;->create(I)Lio/reactivex/subjects/UnicastSubject;

    move-result-object v12

    .line 239
    invoke-interface {v14, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 240
    invoke-interface {v2, v12}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 245
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->close:Lio/reactivex/functions/Function;

    iget-object v0, v13, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowOperation;->open:Ljava/lang/Object;

    move-object/from16 v16, v0

    invoke-interface/range {v15 .. v16}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    const-string/jumbo v16, "The ObservableSource supplied is null"

    invoke-static/range {v15 .. v16}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lio/reactivex/ObservableSource;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    .local v10, "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TV;>;"
    new-instance v3, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryCloseObserver;

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v12}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryCloseObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;Lio/reactivex/subjects/UnicastSubject;)V

    .line 255
    .local v3, "cl":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryCloseObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryCloseObserver<TT;TV;>;"
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->resources:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v15, v3}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    move-result v15

    if-eqz v15, :cond_0

    .line 256
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->windows:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v15}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    .line 258
    invoke-interface {v10, v3}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    goto/16 :goto_0

    .line 246
    .end local v3    # "cl":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryCloseObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryCloseObserver<TT;TV;>;"
    .end local v10    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TV;>;"
    :catch_0
    move-exception v5

    .line 247
    .restart local v5    # "e":Ljava/lang/Throwable;
    invoke-static {v5}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 248
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->cancelled:Z

    .line 249
    invoke-interface {v2, v5}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 264
    .end local v5    # "e":Ljava/lang/Throwable;
    .end local v12    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    .end local v13    # "wo":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowOperation;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowOperation<TT;TB;>;"
    :cond_7
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .restart local v7    # "i$":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lio/reactivex/subjects/UnicastSubject;

    .line 265
    .restart local v12    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    invoke-static {v9}, Lio/reactivex/internal/util/NotificationLite;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v12, v15}, Lio/reactivex/subjects/UnicastSubject;->onNext(Ljava/lang/Object;)V

    goto :goto_5
.end method

.method error(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 160
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver<TT;TB;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 161
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->resources:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 162
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->onError(Ljava/lang/Throwable;)V

    .line 163
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 172
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver<TT;TB;TV;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->cancelled:Z

    return v0
.end method

.method public onComplete()V
    .locals 4

    .prologue
    .line 143
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver<TT;TB;TV;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->done:Z

    if-eqz v0, :cond_0

    .line 157
    :goto_0
    return-void

    .line 146
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->done:Z

    .line 148
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->enter()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 149
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->drainLoop()V

    .line 152
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->windows:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    .line 153
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->resources:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 156
    :cond_2
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 123
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver<TT;TB;TV;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->done:Z

    if-eqz v0, :cond_0

    .line 124
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 139
    :goto_0
    return-void

    .line 127
    :cond_0
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->error:Ljava/lang/Throwable;

    .line 128
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->done:Z

    .line 130
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->enter()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 131
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->drainLoop()V

    .line 134
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->windows:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    .line 135
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->resources:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 138
    :cond_2
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 105
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver<TT;TB;TV;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->fastEnter()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 106
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->ws:Ljava/util/List;

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

    .line 107
    .local v1, "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    invoke-virtual {v1, p1}, Lio/reactivex/subjects/UnicastSubject;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 109
    .end local v1    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    :cond_0
    const/4 v2, -0x1

    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->leave(I)I

    move-result v2

    if-nez v2, :cond_3

    .line 119
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    return-void

    .line 113
    :cond_2
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 114
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->enter()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 118
    :cond_3
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->drainLoop()V

    goto :goto_1
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 3
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 85
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver<TT;TB;TV;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v1, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 86
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 88
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v1, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 90
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->cancelled:Z

    if-eqz v1, :cond_1

    .line 101
    :cond_0
    :goto_0
    return-void

    .line 94
    :cond_1
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryOpenObserver;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryOpenObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;)V

    .line 96
    .local v0, "os":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryOpenObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryOpenObserver<TT;TB;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->boundary:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 97
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->windows:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    .line 98
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->open:Lio/reactivex/ObservableSource;

    invoke-interface {v1, v0}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    goto :goto_0
.end method

.method open(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TB;)V"
        }
    .end annotation

    .prologue
    .line 281
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver<TT;TB;TV;>;"
    .local p1, "b":Ljava/lang/Object;, "TB;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowOperation;

    const/4 v2, 0x0

    invoke-direct {v1, v2, p1}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowOperation;-><init>(Lio/reactivex/subjects/UnicastSubject;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 282
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 283
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;->drainLoop()V

    .line 285
    :cond_0
    return-void
.end method
