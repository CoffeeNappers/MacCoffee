.class final Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableFlatMap.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;
.implements Lio/reactivex/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableFlatMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MergeObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/disposables/Disposable;",
        "Lio/reactivex/Observer",
        "<TT;>;"
    }
.end annotation


# static fields
.field static final CANCELLED:[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver",
            "<**>;"
        }
    .end annotation
.end field

.field static final EMPTY:[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver",
            "<**>;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = -0x1d634c9cafb5cc5aL


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TU;>;"
        }
    .end annotation
.end field

.field final bufferSize:I

.field volatile cancelled:Z

.field final delayErrors:Z

.field volatile done:Z

.field final errors:Lio/reactivex/internal/util/AtomicThrowable;

.field lastId:J

.field lastIndex:I

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;>;"
        }
    .end annotation
.end field

.field final maxConcurrency:I

.field final observers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[",
            "Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver",
            "<**>;>;"
        }
    .end annotation
.end field

.field volatile queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/SimplePlainQueue",
            "<TU;>;"
        }
    .end annotation
.end field

.field s:Lio/reactivex/disposables/Disposable;

.field sources:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;>;"
        }
    .end annotation
.end field

.field uniqueId:J

.field wip:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 78
    new-array v0, v1, [Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    sput-object v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->EMPTY:[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    .line 80
    new-array v0, v1, [Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    sput-object v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->CANCELLED:[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    return-void
.end method

.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;ZII)V
    .locals 2
    .param p3, "delayErrors"    # Z
    .param p4, "maxConcurrency"    # I
    .param p5, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TU;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;>;ZII)V"
        }
    .end annotation

    .prologue
    .line 93
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver<TT;TU;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TU;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TU;>;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 72
    new-instance v0, Lio/reactivex/internal/util/AtomicThrowable;

    invoke-direct {v0}, Lio/reactivex/internal/util/AtomicThrowable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    .line 94
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->actual:Lio/reactivex/Observer;

    .line 95
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->mapper:Lio/reactivex/functions/Function;

    .line 96
    iput-boolean p3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->delayErrors:Z

    .line 97
    iput p4, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->maxConcurrency:I

    .line 98
    iput p5, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->bufferSize:I

    .line 99
    const v0, 0x7fffffff

    if-eq p4, v0, :cond_0

    .line 100
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0, p4}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->sources:Ljava/util/Queue;

    .line 102
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->EMPTY:[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 103
    return-void
.end method


# virtual methods
.method addInner(Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver",
            "<TT;TU;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver<TT;TU;>;"
    .local p1, "inner":Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<TT;TU;>;"
    const/4 v3, 0x0

    .line 171
    :cond_0
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    .line 172
    .local v0, "a":[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<**>;"
    sget-object v4, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->CANCELLED:[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    if-ne v0, v4, :cond_1

    .line 173
    invoke-virtual {p1}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;->dispose()V

    .line 181
    :goto_0
    return v3

    .line 176
    :cond_1
    array-length v2, v0

    .line 177
    .local v2, "n":I
    add-int/lit8 v4, v2, 0x1

    new-array v1, v4, [Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    .line 178
    .local v1, "b":[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<**>;"
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 179
    aput-object p1, v1, v2

    .line 180
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 181
    const/4 v3, 0x1

    goto :goto_0
.end method

.method checkTerminate()Z
    .locals 3

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver<TT;TU;>;"
    const/4 v1, 0x1

    .line 487
    iget-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->cancelled:Z

    if-eqz v2, :cond_1

    .line 499
    :cond_0
    :goto_0
    return v1

    .line 490
    :cond_1
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v2}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    .line 491
    .local v0, "e":Ljava/lang/Throwable;
    iget-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->delayErrors:Z

    if-nez v2, :cond_2

    if-eqz v0, :cond_2

    .line 492
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->disposeAll()Z

    .line 493
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v2}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v0

    .line 494
    sget-object v2, Lio/reactivex/internal/util/ExceptionHelper;->TERMINATED:Ljava/lang/Throwable;

    if-eq v0, v2, :cond_0

    .line 495
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 499
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public dispose()V
    .locals 2

    .prologue
    .line 305
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver<TT;TU;>;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->cancelled:Z

    if-nez v1, :cond_0

    .line 306
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->cancelled:Z

    .line 307
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->disposeAll()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 308
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v1}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v0

    .line 309
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_0

    sget-object v1, Lio/reactivex/internal/util/ExceptionHelper;->TERMINATED:Ljava/lang/Throwable;

    if-eq v0, v1, :cond_0

    .line 310
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 314
    .end local v0    # "ex":Ljava/lang/Throwable;
    :cond_0
    return-void
.end method

.method disposeAll()Z
    .locals 7

    .prologue
    .line 503
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver<TT;TU;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v5}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 504
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    .line 505
    .local v0, "a":[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<**>;"
    sget-object v5, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->CANCELLED:[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    if-eq v0, v5, :cond_1

    .line 506
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v6, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->CANCELLED:[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    invoke-virtual {v5, v6}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "a":[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<**>;"
    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    .line 507
    .restart local v0    # "a":[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<**>;"
    sget-object v5, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->CANCELLED:[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    if-eq v0, v5, :cond_1

    .line 508
    move-object v1, v0

    .local v1, "arr$":[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;
    array-length v4, v1

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v4, :cond_0

    aget-object v3, v1, v2

    .line 509
    .local v3, "inner":Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<**>;"
    invoke-virtual {v3}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;->dispose()V

    .line 508
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 511
    .end local v3    # "inner":Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<**>;"
    :cond_0
    const/4 v5, 0x1

    .line 514
    .end local v1    # "arr$":[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;
    .end local v2    # "i$":I
    .end local v4    # "len$":I
    :goto_1
    return v5

    :cond_1
    const/4 v5, 0x0

    goto :goto_1
.end method

.method drain()V
    .locals 1

    .prologue
    .line 322
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver<TT;TU;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 323
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->drainLoop()V

    .line 325
    :cond_0
    return-void
.end method

.method drainLoop()V
    .locals 26

    .prologue
    .line 328
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver<TT;TU;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->actual:Lio/reactivex/Observer;

    .line 329
    .local v4, "child":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TU;>;"
    const/4 v15, 0x1

    .line 331
    .local v15, "missed":I
    :cond_0
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->checkTerminate()Z

    move-result v23

    if-eqz v23, :cond_2

    .line 484
    :cond_1
    :goto_1
    return-void

    .line 334
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    move-object/from16 v22, v0

    .line 336
    .local v22, "svq":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TU;>;"
    if-eqz v22, :cond_4

    .line 340
    :cond_3
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->checkTerminate()Z

    move-result v23

    if-nez v23, :cond_1

    .line 344
    invoke-interface/range {v22 .. v22}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->poll()Ljava/lang/Object;

    move-result-object v17

    .line 346
    .local v17, "o":Ljava/lang/Object;, "TU;"
    if-nez v17, :cond_6

    .line 352
    if-nez v17, :cond_3

    .line 358
    .end local v17    # "o":Ljava/lang/Object;, "TU;"
    :cond_4
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->done:Z

    .line 359
    .local v5, "d":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    move-object/from16 v22, v0

    .line 360
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    .line 361
    .local v9, "inner":[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<**>;"
    array-length v0, v9

    move/from16 v16, v0

    .line 363
    .local v16, "n":I
    if-eqz v5, :cond_8

    if-eqz v22, :cond_5

    invoke-interface/range {v22 .. v22}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->isEmpty()Z

    move-result v23

    if-eqz v23, :cond_8

    :cond_5
    if-nez v16, :cond_8

    .line 364
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v6

    .line 365
    .local v6, "ex":Ljava/lang/Throwable;
    sget-object v23, Lio/reactivex/internal/util/ExceptionHelper;->TERMINATED:Ljava/lang/Throwable;

    move-object/from16 v0, v23

    if-eq v6, v0, :cond_1

    .line 366
    if-nez v6, :cond_7

    .line 367
    invoke-interface {v4}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_1

    .line 350
    .end local v5    # "d":Z
    .end local v6    # "ex":Ljava/lang/Throwable;
    .end local v9    # "inner":[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<**>;"
    .end local v16    # "n":I
    .restart local v17    # "o":Ljava/lang/Object;, "TU;"
    :cond_6
    move-object/from16 v0, v17

    invoke-interface {v4, v0}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_2

    .line 369
    .end local v17    # "o":Ljava/lang/Object;, "TU;"
    .restart local v5    # "d":Z
    .restart local v6    # "ex":Ljava/lang/Throwable;
    .restart local v9    # "inner":[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<**>;"
    .restart local v16    # "n":I
    :cond_7
    invoke-interface {v4, v6}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 375
    .end local v6    # "ex":Ljava/lang/Throwable;
    :cond_8
    const/4 v10, 0x0

    .line 376
    .local v10, "innerCompleted":Z
    if-eqz v16, :cond_16

    .line 377
    move-object/from16 v0, p0

    iget-wide v0, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->lastId:J

    move-wide/from16 v20, v0

    .line 378
    .local v20, "startId":J
    move-object/from16 v0, p0

    iget v8, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->lastIndex:I

    .line 380
    .local v8, "index":I
    move/from16 v0, v16

    if-le v0, v8, :cond_9

    aget-object v23, v9, v8

    move-object/from16 v0, v23

    iget-wide v0, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;->id:J

    move-wide/from16 v24, v0

    cmp-long v23, v24, v20

    if-eqz v23, :cond_c

    .line 381
    :cond_9
    move/from16 v0, v16

    if-gt v0, v8, :cond_a

    .line 382
    const/4 v8, 0x0

    .line 384
    :cond_a
    move v14, v8

    .line 385
    .local v14, "j":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_3
    move/from16 v0, v16

    if-ge v7, v0, :cond_b

    .line 386
    aget-object v23, v9, v14

    move-object/from16 v0, v23

    iget-wide v0, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;->id:J

    move-wide/from16 v24, v0

    cmp-long v23, v24, v20

    if-nez v23, :cond_11

    .line 394
    :cond_b
    move v8, v14

    .line 395
    move-object/from16 v0, p0

    iput v14, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->lastIndex:I

    .line 396
    aget-object v23, v9, v14

    move-object/from16 v0, v23

    iget-wide v0, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;->id:J

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    move-object/from16 v2, p0

    iput-wide v0, v2, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->lastId:J

    .line 399
    .end local v7    # "i":I
    .end local v14    # "j":I
    :cond_c
    move v14, v8

    .line 401
    .restart local v14    # "j":I
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_4
    move/from16 v0, v16

    if-ge v7, v0, :cond_15

    .line 402
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->checkTerminate()Z

    move-result v23

    if-nez v23, :cond_1

    .line 406
    aget-object v13, v9, v14

    .line 409
    .local v13, "is":Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<TT;TU;>;"
    :cond_d
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->checkTerminate()Z

    move-result v23

    if-nez v23, :cond_1

    .line 412
    iget-object v0, v13, Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    move-object/from16 v19, v0

    .line 413
    .local v19, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    if-nez v19, :cond_13

    .line 446
    :goto_5
    iget-boolean v11, v13, Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;->done:Z

    .line 447
    .local v11, "innerDone":Z
    iget-object v12, v13, Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 448
    .local v12, "innerQueue":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    if-eqz v11, :cond_f

    if-eqz v12, :cond_e

    invoke-interface {v12}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v23

    if-eqz v23, :cond_f

    .line 449
    :cond_e
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->removeInner(Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;)V

    .line 450
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->checkTerminate()Z

    move-result v23

    if-nez v23, :cond_1

    .line 453
    const/4 v10, 0x1

    .line 456
    :cond_f
    add-int/lit8 v14, v14, 0x1

    .line 457
    move/from16 v0, v16

    if-ne v14, v0, :cond_10

    .line 458
    const/4 v14, 0x0

    .line 401
    .end local v11    # "innerDone":Z
    .end local v12    # "innerQueue":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    :cond_10
    :goto_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 389
    .end local v13    # "is":Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<TT;TU;>;"
    .end local v19    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    :cond_11
    add-int/lit8 v14, v14, 0x1

    .line 390
    move/from16 v0, v16

    if-ne v14, v0, :cond_12

    .line 391
    const/4 v14, 0x0

    .line 385
    :cond_12
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 419
    .restart local v13    # "is":Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<TT;TU;>;"
    .restart local v19    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    :cond_13
    :try_start_0
    invoke-interface/range {v19 .. v19}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v17

    .line 432
    .restart local v17    # "o":Ljava/lang/Object;, "TU;"
    if-nez v17, :cond_14

    .line 442
    if-nez v17, :cond_d

    goto :goto_5

    .line 420
    .end local v17    # "o":Ljava/lang/Object;, "TU;"
    :catch_0
    move-exception v6

    .line 421
    .restart local v6    # "ex":Ljava/lang/Throwable;
    invoke-static {v6}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 422
    invoke-virtual {v13}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;->dispose()V

    .line 423
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 424
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->checkTerminate()Z

    move-result v23

    if-nez v23, :cond_1

    .line 427
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->removeInner(Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;)V

    .line 428
    const/4 v10, 0x1

    .line 429
    add-int/lit8 v7, v7, 0x1

    .line 430
    goto :goto_6

    .line 436
    .end local v6    # "ex":Ljava/lang/Throwable;
    .restart local v17    # "o":Ljava/lang/Object;, "TU;"
    :cond_14
    move-object/from16 v0, v17

    invoke-interface {v4, v0}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 438
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->checkTerminate()Z

    move-result v23

    if-eqz v23, :cond_13

    goto/16 :goto_1

    .line 461
    .end local v13    # "is":Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<TT;TU;>;"
    .end local v17    # "o":Ljava/lang/Object;, "TU;"
    .end local v19    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    :cond_15
    move-object/from16 v0, p0

    iput v14, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->lastIndex:I

    .line 462
    aget-object v23, v9, v14

    move-object/from16 v0, v23

    iget-wide v0, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;->id:J

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    move-object/from16 v2, p0

    iput-wide v0, v2, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->lastId:J

    .line 465
    .end local v7    # "i":I
    .end local v8    # "index":I
    .end local v14    # "j":I
    .end local v20    # "startId":J
    :cond_16
    if-eqz v10, :cond_18

    .line 466
    move-object/from16 v0, p0

    iget v0, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->maxConcurrency:I

    move/from16 v23, v0

    const v24, 0x7fffffff

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_0

    .line 468
    monitor-enter p0

    .line 469
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->sources:Ljava/util/Queue;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lio/reactivex/ObservableSource;

    .line 470
    .local v18, "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TU;>;"
    if-nez v18, :cond_17

    .line 471
    move-object/from16 v0, p0

    iget v0, v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->wip:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->wip:I

    .line 472
    monitor-exit p0

    goto/16 :goto_0

    .line 474
    .end local v18    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TU;>;"
    :catchall_0
    move-exception v23

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v23

    .restart local v18    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TU;>;"
    :cond_17
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 475
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->subscribeInner(Lio/reactivex/ObservableSource;)V

    goto/16 :goto_0

    .line 479
    .end local v18    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TU;>;"
    :cond_18
    neg-int v0, v15

    move/from16 v23, v0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->addAndGet(I)I

    move-result v15

    .line 480
    if-nez v15, :cond_0

    goto/16 :goto_1
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 318
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver<TT;TU;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->cancelled:Z

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 296
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver<TT;TU;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->done:Z

    if-eqz v0, :cond_0

    .line 301
    :goto_0
    return-void

    .line 299
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->done:Z

    .line 300
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->drain()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 282
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver<TT;TU;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->done:Z

    if-eqz v0, :cond_0

    .line 283
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 292
    :goto_0
    return-void

    .line 286
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 287
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->done:Z

    .line 288
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->drain()V

    goto :goto_0

    .line 290
    :cond_1
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

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
    .line 116
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver<TT;TU;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->done:Z

    if-eqz v2, :cond_0

    .line 140
    :goto_0
    return-void

    .line 121
    :cond_0
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The mapper returned a null ObservableSource"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/ObservableSource;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    .local v1, "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TU;>;"
    iget v2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->maxConcurrency:I

    const v3, 0x7fffffff

    if-eq v2, v3, :cond_2

    .line 130
    monitor-enter p0

    .line 131
    :try_start_1
    iget v2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->wip:I

    iget v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->maxConcurrency:I

    if-ne v2, v3, :cond_1

    .line 132
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->sources:Ljava/util/Queue;

    invoke-interface {v2, v1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 133
    monitor-exit p0

    goto :goto_0

    .line 136
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 122
    .end local v1    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TU;>;"
    :catch_0
    move-exception v0

    .line 123
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 124
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v2}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 125
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 135
    .end local v0    # "e":Ljava/lang/Throwable;
    .restart local v1    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TU;>;"
    :cond_1
    :try_start_2
    iget v2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->wip:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->wip:I

    .line 136
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 139
    :cond_2
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->subscribeInner(Lio/reactivex/ObservableSource;)V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 107
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 109
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 111
    :cond_0
    return-void
.end method

.method removeInner(Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver",
            "<TT;TU;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver<TT;TU;>;"
    .local p1, "inner":Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<TT;TU;>;"
    const/4 v7, 0x0

    .line 188
    :cond_0
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    .line 189
    .local v0, "a":[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<**>;"
    array-length v4, v0

    .line 190
    .local v4, "n":I
    if-nez v4, :cond_2

    .line 212
    :cond_1
    :goto_0
    return-void

    .line 193
    :cond_2
    const/4 v3, -0x1

    .line 194
    .local v3, "j":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_3

    .line 195
    aget-object v5, v0, v2

    if-ne v5, p1, :cond_4

    .line 196
    move v3, v2

    .line 200
    :cond_3
    if-ltz v3, :cond_1

    .line 204
    const/4 v5, 0x1

    if-ne v4, v5, :cond_5

    .line 205
    sget-object v1, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->EMPTY:[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    .line 211
    .local v1, "b":[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<**>;"
    :goto_2
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 194
    .end local v1    # "b":[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<**>;"
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 207
    :cond_5
    add-int/lit8 v5, v4, -0x1

    new-array v1, v5, [Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    .line 208
    .restart local v1    # "b":[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "[Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<**>;"
    invoke-static {v0, v7, v1, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 209
    add-int/lit8 v5, v3, 0x1

    sub-int v6, v4, v3

    add-int/lit8 v6, v6, -0x1

    invoke-static {v0, v5, v1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method

.method subscribeInner(Lio/reactivex/ObservableSource;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;)V"
        }
    .end annotation

    .prologue
    .line 145
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver<TT;TU;>;"
    .local p1, "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TU;>;"
    :goto_0
    instance-of v3, p1, Ljava/util/concurrent/Callable;

    if-eqz v3, :cond_2

    move-object v3, p1

    .line 146
    check-cast v3, Ljava/util/concurrent/Callable;

    invoke-virtual {p0, v3}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->tryEmitScalar(Ljava/util/concurrent/Callable;)V

    .line 148
    iget v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->maxConcurrency:I

    const v4, 0x7fffffff

    if-eq v3, v4, :cond_0

    .line 149
    monitor-enter p0

    .line 150
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->sources:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lio/reactivex/ObservableSource;

    move-object p1, v0

    .line 151
    if-nez p1, :cond_1

    .line 152
    iget v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->wip:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->wip:I

    .line 153
    monitor-exit p0

    .line 167
    :cond_0
    :goto_1
    return-void

    .line 155
    :cond_1
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 160
    :cond_2
    new-instance v2, Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;

    iget-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->uniqueId:J

    const-wide/16 v6, 0x1

    add-long/2addr v6, v4

    iput-wide v6, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->uniqueId:J

    invoke-direct {v2, p0, v4, v5}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;J)V

    .line 161
    .local v2, "inner":Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<TT;TU;>;"
    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->addInner(Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 162
    invoke-interface {p1, v2}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    goto :goto_1
.end method

.method tryEmit(Ljava/lang/Object;Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TU;",
            "Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver",
            "<TT;TU;>;)V"
        }
    .end annotation

    .prologue
    .line 261
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver<TT;TU;>;"
    .local p1, "value":Ljava/lang/Object;, "TU;"
    .local p2, "inner":Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver<TT;TU;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->get()I

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->compareAndSet(II)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 262
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v1, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 263
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->decrementAndGet()I

    move-result v1

    if-nez v1, :cond_3

    .line 278
    :cond_0
    :goto_0
    return-void

    .line 267
    :cond_1
    iget-object v0, p2, Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 268
    .local v0, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    if-nez v0, :cond_2

    .line 269
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .end local v0    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    iget v1, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->bufferSize:I

    invoke-direct {v0, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    .line 270
    .restart local v0    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    iput-object v0, p2, Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 272
    :cond_2
    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    .line 273
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->getAndIncrement()I

    move-result v1

    if-nez v1, :cond_0

    .line 277
    .end local v0    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TU;>;"
    :cond_3
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->drainLoop()V

    goto :goto_0
.end method

.method tryEmitScalar(Ljava/util/concurrent/Callable;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<+TU;>;)V"
        }
    .end annotation

    .prologue
    .line 220
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver<TT;TU;>;"
    .local p1, "value":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+TU;>;"
    :try_start_0
    invoke-interface {p1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 228
    .local v2, "u":Ljava/lang/Object;, "TU;"
    if-nez v2, :cond_1

    .line 258
    .end local v2    # "u":Ljava/lang/Object;, "TU;"
    :cond_0
    :goto_0
    return-void

    .line 221
    :catch_0
    move-exception v0

    .line 222
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 223
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v3, v0}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 224
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->drain()V

    goto :goto_0

    .line 233
    .end local v0    # "ex":Ljava/lang/Throwable;
    .restart local v2    # "u":Ljava/lang/Object;, "TU;"
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->get()I

    move-result v3

    if-nez v3, :cond_3

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v4}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->compareAndSet(II)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 234
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, v2}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 235
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->decrementAndGet()I

    move-result v3

    if-eqz v3, :cond_0

    .line 257
    :cond_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->drainLoop()V

    goto :goto_0

    .line 239
    :cond_3
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 240
    .local v1, "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TU;>;"
    if-nez v1, :cond_4

    .line 241
    iget v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->maxConcurrency:I

    const v4, 0x7fffffff

    if-ne v3, v4, :cond_5

    .line 242
    new-instance v1, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .end local v1    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TU;>;"
    iget v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->bufferSize:I

    invoke-direct {v1, v3}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    .line 246
    .restart local v1    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TU;>;"
    :goto_1
    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    .line 249
    :cond_4
    invoke-interface {v1, v2}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 250
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "Scalar queue full?!"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 244
    :cond_5
    new-instance v1, Lio/reactivex/internal/queue/SpscArrayQueue;

    .end local v1    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TU;>;"
    iget v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->maxConcurrency:I

    invoke-direct {v1, v3}, Lio/reactivex/internal/queue/SpscArrayQueue;-><init>(I)V

    .restart local v1    # "q":Lio/reactivex/internal/fuseable/SimplePlainQueue;, "Lio/reactivex/internal/fuseable/SimplePlainQueue<TU;>;"
    goto :goto_1

    .line 253
    :cond_6
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;->getAndIncrement()I

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0
.end method
