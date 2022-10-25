.class final Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableConcatMapEager.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;
.implements Lio/reactivex/internal/observers/InnerQueuedObserverSupport;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableConcatMapEager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ConcatMapEagerMainObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;",
        "Lio/reactivex/internal/observers/InnerQueuedObserverSupport",
        "<TR;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x7023f1bcc236905eL


# instance fields
.field activeCount:I

.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TR;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field current:Lio/reactivex/internal/observers/InnerQueuedObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/observers/InnerQueuedObserver",
            "<TR;>;"
        }
    .end annotation
.end field

.field d:Lio/reactivex/disposables/Disposable;

.field volatile done:Z

.field final error:Lio/reactivex/internal/util/AtomicThrowable;

.field final errorMode:Lio/reactivex/internal/util/ErrorMode;

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;"
        }
    .end annotation
.end field

.field final maxConcurrency:I

.field final observers:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque",
            "<",
            "Lio/reactivex/internal/observers/InnerQueuedObserver",
            "<TR;>;>;"
        }
    .end annotation
.end field

.field final prefetch:I

.field queue:Lio/reactivex/internal/fuseable/SimpleQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<TT;>;"
        }
    .end annotation
.end field

.field sourceMode:I


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;IILio/reactivex/internal/util/ErrorMode;)V
    .locals 1
    .param p3, "maxConcurrency"    # I
    .param p4, "prefetch"    # I
    .param p5, "errorMode"    # Lio/reactivex/internal/util/ErrorMode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;II",
            "Lio/reactivex/internal/util/ErrorMode;",
            ")V"
        }
    .end annotation

    .prologue
    .line 92
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver<TT;TR;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 93
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->actual:Lio/reactivex/Observer;

    .line 94
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->mapper:Lio/reactivex/functions/Function;

    .line 95
    iput p3, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->maxConcurrency:I

    .line 96
    iput p4, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->prefetch:I

    .line 97
    iput-object p5, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->errorMode:Lio/reactivex/internal/util/ErrorMode;

    .line 98
    new-instance v0, Lio/reactivex/internal/util/AtomicThrowable;

    invoke-direct {v0}, Lio/reactivex/internal/util/AtomicThrowable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    .line 99
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->observers:Ljava/util/ArrayDeque;

    .line 100
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 164
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver<TT;TR;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->cancelled:Z

    .line 165
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 166
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 167
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->disposeAll()V

    .line 169
    :cond_0
    return-void
.end method

.method disposeAll()V
    .locals 2

    .prologue
    .line 177
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->current:Lio/reactivex/internal/observers/InnerQueuedObserver;

    .line 179
    .local v0, "inner":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TR;>;"
    if-eqz v0, :cond_0

    .line 180
    invoke-virtual {v0}, Lio/reactivex/internal/observers/InnerQueuedObserver;->dispose()V

    .line 185
    :cond_0
    :goto_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->observers:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "inner":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TR;>;"
    check-cast v0, Lio/reactivex/internal/observers/InnerQueuedObserver;

    .line 187
    .restart local v0    # "inner":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TR;>;"
    if-nez v0, :cond_1

    .line 188
    return-void

    .line 191
    :cond_1
    invoke-virtual {v0}, Lio/reactivex/internal/observers/InnerQueuedObserver;->dispose()V

    goto :goto_0
.end method

.method public drain()V
    .locals 19

    .prologue
    .line 222
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver<TT;TR;>;"
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->getAndIncrement()I

    move-result v17

    if-eqz v17, :cond_0

    .line 400
    :goto_0
    return-void

    .line 226
    :cond_0
    const/4 v11, 0x1

    .line 228
    .local v11, "missed":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 229
    .local v13, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    move-object/from16 v0, p0

    iget-object v12, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->observers:Ljava/util/ArrayDeque;

    .line 230
    .local v12, "observers":Ljava/util/ArrayDeque;, "Ljava/util/ArrayDeque<Lio/reactivex/internal/observers/InnerQueuedObserver<TR;>;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->actual:Lio/reactivex/Observer;

    .line 231
    .local v2, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    move-object/from16 v0, p0

    iget-object v8, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->errorMode:Lio/reactivex/internal/util/ErrorMode;

    .line 236
    .local v8, "errorMode":Lio/reactivex/internal/util/ErrorMode;
    :cond_1
    :goto_1
    move-object/from16 v0, p0

    iget v3, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->activeCount:I

    .line 238
    .local v3, "ac":I
    :goto_2
    move-object/from16 v0, p0

    iget v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->maxConcurrency:I

    move/from16 v17, v0

    move/from16 v0, v17

    if-eq v3, v0, :cond_4

    .line 239
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->cancelled:Z

    move/from16 v17, v0

    if-eqz v17, :cond_2

    .line 240
    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 241
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->disposeAll()V

    goto :goto_0

    .line 245
    :cond_2
    sget-object v17, Lio/reactivex/internal/util/ErrorMode;->IMMEDIATE:Lio/reactivex/internal/util/ErrorMode;

    move-object/from16 v0, v17

    if-ne v8, v0, :cond_3

    .line 246
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Throwable;

    .line 247
    .local v9, "ex":Ljava/lang/Throwable;
    if-eqz v9, :cond_3

    .line 248
    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 249
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->disposeAll()V

    .line 251
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v2, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 260
    .end local v9    # "ex":Ljava/lang/Throwable;
    :cond_3
    :try_start_0
    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v15

    .line 262
    .local v15, "v":Ljava/lang/Object;, "TT;"
    if-nez v15, :cond_5

    .line 286
    .end local v15    # "v":Ljava/lang/Object;, "TT;"
    :cond_4
    move-object/from16 v0, p0

    iput v3, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->activeCount:I

    .line 288
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->cancelled:Z

    move/from16 v17, v0

    if-eqz v17, :cond_6

    .line 289
    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 290
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->disposeAll()V

    goto :goto_0

    .line 266
    .restart local v15    # "v":Ljava/lang/Object;, "TT;"
    :cond_5
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->mapper:Lio/reactivex/functions/Function;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v15}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    const-string/jumbo v18, "The mapper returned a null ObservableSource"

    invoke-static/range {v17 .. v18}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lio/reactivex/ObservableSource;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 277
    .local v14, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TR;>;"
    new-instance v10, Lio/reactivex/internal/observers/InnerQueuedObserver;

    move-object/from16 v0, p0

    iget v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->prefetch:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v10, v0, v1}, Lio/reactivex/internal/observers/InnerQueuedObserver;-><init>(Lio/reactivex/internal/observers/InnerQueuedObserverSupport;I)V

    .line 279
    .local v10, "inner":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TR;>;"
    invoke-virtual {v12, v10}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    .line 281
    invoke-interface {v14, v10}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 283
    add-int/lit8 v3, v3, 0x1

    .line 284
    goto/16 :goto_2

    .line 267
    .end local v10    # "inner":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TR;>;"
    .end local v14    # "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TR;>;"
    .end local v15    # "v":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v9

    .line 268
    .restart local v9    # "ex":Ljava/lang/Throwable;
    invoke-static {v9}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 269
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->d:Lio/reactivex/disposables/Disposable;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 270
    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 271
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->disposeAll()V

    .line 272
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 273
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v2, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 294
    .end local v9    # "ex":Ljava/lang/Throwable;
    :cond_6
    sget-object v17, Lio/reactivex/internal/util/ErrorMode;->IMMEDIATE:Lio/reactivex/internal/util/ErrorMode;

    move-object/from16 v0, v17

    if-ne v8, v0, :cond_7

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Throwable;

    .line 296
    .restart local v9    # "ex":Ljava/lang/Throwable;
    if-eqz v9, :cond_7

    .line 297
    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 298
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->disposeAll()V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v2, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 305
    .end local v9    # "ex":Ljava/lang/Throwable;
    :cond_7
    move-object/from16 v0, p0

    iget-object v4, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->current:Lio/reactivex/internal/observers/InnerQueuedObserver;

    .line 307
    .local v4, "active":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TR;>;"
    if-nez v4, :cond_c

    .line 308
    sget-object v17, Lio/reactivex/internal/util/ErrorMode;->BOUNDARY:Lio/reactivex/internal/util/ErrorMode;

    move-object/from16 v0, v17

    if-ne v8, v0, :cond_8

    .line 309
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Throwable;

    .line 310
    .restart local v9    # "ex":Ljava/lang/Throwable;
    if-eqz v9, :cond_8

    .line 311
    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 312
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->disposeAll()V

    .line 314
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v2, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 318
    .end local v9    # "ex":Ljava/lang/Throwable;
    :cond_8
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->done:Z

    .line 320
    .local v6, "d":Z
    invoke-virtual {v12}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "active":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TR;>;"
    check-cast v4, Lio/reactivex/internal/observers/InnerQueuedObserver;

    .line 322
    .restart local v4    # "active":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TR;>;"
    if-nez v4, :cond_9

    const/4 v7, 0x1

    .line 324
    .local v7, "empty":Z
    :goto_3
    if-eqz v6, :cond_b

    if-eqz v7, :cond_b

    .line 325
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Throwable;

    .line 326
    .restart local v9    # "ex":Ljava/lang/Throwable;
    if-eqz v9, :cond_a

    .line 327
    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 328
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->disposeAll()V

    .line 330
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v2, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 322
    .end local v7    # "empty":Z
    .end local v9    # "ex":Ljava/lang/Throwable;
    :cond_9
    const/4 v7, 0x0

    goto :goto_3

    .line 332
    .restart local v7    # "empty":Z
    .restart local v9    # "ex":Ljava/lang/Throwable;
    :cond_a
    invoke-interface {v2}, Lio/reactivex/Observer;->onComplete()V

    goto/16 :goto_0

    .line 337
    .end local v9    # "ex":Ljava/lang/Throwable;
    :cond_b
    if-nez v7, :cond_c

    .line 338
    move-object/from16 v0, p0

    iput-object v4, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->current:Lio/reactivex/internal/observers/InnerQueuedObserver;

    .line 343
    .end local v6    # "d":Z
    .end local v7    # "empty":Z
    :cond_c
    if-eqz v4, :cond_11

    .line 344
    invoke-virtual {v4}, Lio/reactivex/internal/observers/InnerQueuedObserver;->queue()Lio/reactivex/internal/fuseable/SimpleQueue;

    move-result-object v5

    .line 347
    .local v5, "aq":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TR;>;"
    :goto_4
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->cancelled:Z

    move/from16 v17, v0

    if-eqz v17, :cond_d

    .line 348
    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 349
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->disposeAll()V

    goto/16 :goto_0

    .line 353
    :cond_d
    invoke-virtual {v4}, Lio/reactivex/internal/observers/InnerQueuedObserver;->isDone()Z

    move-result v6

    .line 355
    .restart local v6    # "d":Z
    sget-object v17, Lio/reactivex/internal/util/ErrorMode;->IMMEDIATE:Lio/reactivex/internal/util/ErrorMode;

    move-object/from16 v0, v17

    if-ne v8, v0, :cond_e

    .line 356
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Throwable;

    .line 357
    .restart local v9    # "ex":Ljava/lang/Throwable;
    if-eqz v9, :cond_e

    .line 358
    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 359
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->disposeAll()V

    .line 361
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v2, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 369
    .end local v9    # "ex":Ljava/lang/Throwable;
    :cond_e
    :try_start_2
    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v16

    .line 379
    .local v16, "w":Ljava/lang/Object;, "TR;"
    if-nez v16, :cond_f

    const/4 v7, 0x1

    .line 381
    .restart local v7    # "empty":Z
    :goto_5
    if-eqz v6, :cond_10

    if-eqz v7, :cond_10

    .line 382
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->current:Lio/reactivex/internal/observers/InnerQueuedObserver;

    .line 383
    move-object/from16 v0, p0

    iget v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->activeCount:I

    move/from16 v17, v0

    add-int/lit8 v17, v17, -0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->activeCount:I

    goto/16 :goto_1

    .line 370
    .end local v7    # "empty":Z
    .end local v16    # "w":Ljava/lang/Object;, "TR;"
    :catch_1
    move-exception v9

    .line 371
    .restart local v9    # "ex":Ljava/lang/Throwable;
    invoke-static {v9}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 372
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 374
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->current:Lio/reactivex/internal/observers/InnerQueuedObserver;

    .line 375
    move-object/from16 v0, p0

    iget v0, v0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->activeCount:I

    move/from16 v17, v0

    add-int/lit8 v17, v17, -0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->activeCount:I

    goto/16 :goto_1

    .line 379
    .end local v9    # "ex":Ljava/lang/Throwable;
    .restart local v16    # "w":Ljava/lang/Object;, "TR;"
    :cond_f
    const/4 v7, 0x0

    goto :goto_5

    .line 387
    .restart local v7    # "empty":Z
    :cond_10
    if-eqz v7, :cond_12

    .line 395
    .end local v5    # "aq":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TR;>;"
    .end local v6    # "d":Z
    .end local v7    # "empty":Z
    .end local v16    # "w":Ljava/lang/Object;, "TR;"
    :cond_11
    neg-int v0, v11

    move/from16 v17, v0

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->addAndGet(I)I

    move-result v11

    .line 396
    if-nez v11, :cond_1

    goto/16 :goto_0

    .line 391
    .restart local v5    # "aq":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TR;>;"
    .restart local v6    # "d":Z
    .restart local v7    # "empty":Z
    .restart local v16    # "w":Ljava/lang/Object;, "TR;"
    :cond_12
    move-object/from16 v0, v16

    invoke-interface {v2, v0}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto/16 :goto_4
.end method

.method public innerComplete(Lio/reactivex/internal/observers/InnerQueuedObserver;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/observers/InnerQueuedObserver",
            "<TR;>;)V"
        }
    .end annotation

    .prologue
    .line 216
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver<TT;TR;>;"
    .local p1, "inner":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TR;>;"
    invoke-virtual {p1}, Lio/reactivex/internal/observers/InnerQueuedObserver;->setDone()V

    .line 217
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->drain()V

    .line 218
    return-void
.end method

.method public innerError(Lio/reactivex/internal/observers/InnerQueuedObserver;Ljava/lang/Throwable;)V
    .locals 2
    .param p2, "e"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/observers/InnerQueuedObserver",
            "<TR;>;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 203
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver<TT;TR;>;"
    .local p1, "inner":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p2}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 204
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->errorMode:Lio/reactivex/internal/util/ErrorMode;

    sget-object v1, Lio/reactivex/internal/util/ErrorMode;->IMMEDIATE:Lio/reactivex/internal/util/ErrorMode;

    if-ne v0, v1, :cond_0

    .line 205
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 207
    :cond_0
    invoke-virtual {p1}, Lio/reactivex/internal/observers/InnerQueuedObserver;->setDone()V

    .line 208
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->drain()V

    .line 212
    :goto_0
    return-void

    .line 210
    :cond_1
    invoke-static {p2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public innerNext(Lio/reactivex/internal/observers/InnerQueuedObserver;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/observers/InnerQueuedObserver",
            "<TR;>;TR;)V"
        }
    .end annotation

    .prologue
    .line 197
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver<TT;TR;>;"
    .local p1, "inner":Lio/reactivex/internal/observers/InnerQueuedObserver;, "Lio/reactivex/internal/observers/InnerQueuedObserver<TR;>;"
    .local p2, "value":Ljava/lang/Object;, "TR;"
    invoke-virtual {p1}, Lio/reactivex/internal/observers/InnerQueuedObserver;->queue()Lio/reactivex/internal/fuseable/SimpleQueue;

    move-result-object v0

    invoke-interface {v0, p2}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    .line 198
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->drain()V

    .line 199
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 173
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->cancelled:Z

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 158
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver<TT;TR;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->done:Z

    .line 159
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->drain()V

    .line 160
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 148
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 149
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->done:Z

    .line 150
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->drain()V

    .line 154
    :goto_0
    return-void

    .line 152
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 140
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver<TT;TR;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->sourceMode:I

    if-nez v0, :cond_0

    .line 141
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    .line 143
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->drain()V

    .line 144
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 4
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;, "Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver<TT;TR;>;"
    const/4 v3, 0x1

    .line 105
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v2, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 106
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 108
    instance-of v2, p1, Lio/reactivex/internal/fuseable/QueueDisposable;

    if-eqz v2, :cond_2

    move-object v1, p1

    .line 109
    check-cast v1, Lio/reactivex/internal/fuseable/QueueDisposable;

    .line 111
    .local v1, "qd":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    const/4 v2, 0x3

    invoke-interface {v1, v2}, Lio/reactivex/internal/fuseable/QueueDisposable;->requestFusion(I)I

    move-result v0

    .line 112
    .local v0, "m":I
    if-ne v0, v3, :cond_1

    .line 113
    iput v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->sourceMode:I

    .line 114
    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 115
    iput-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->done:Z

    .line 117
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 119
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->drain()V

    .line 136
    .end local v0    # "m":I
    .end local v1    # "qd":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    :cond_0
    :goto_0
    return-void

    .line 122
    .restart local v0    # "m":I
    .restart local v1    # "qd":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    :cond_1
    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    .line 123
    iput v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->sourceMode:I

    .line 124
    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 126
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    goto :goto_0

    .line 132
    .end local v0    # "m":I
    .end local v1    # "qd":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    :cond_2
    iget v2, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->prefetch:I

    invoke-static {v2}, Lio/reactivex/internal/util/QueueDrainHelper;->createQueue(I)Lio/reactivex/internal/fuseable/SimpleQueue;

    move-result-object v2

    iput-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 134
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMapEager$ConcatMapEagerMainObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    goto :goto_0
.end method
