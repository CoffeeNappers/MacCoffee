.class public final Lio/reactivex/internal/operators/completable/CompletableAmb;
.super Lio/reactivex/Completable;
.source "CompletableAmb.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/completable/CompletableAmb$Amb;
    }
.end annotation


# instance fields
.field private final sources:[Lio/reactivex/CompletableSource;

.field private final sourcesIterable:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/CompletableSource;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([Lio/reactivex/CompletableSource;Ljava/lang/Iterable;)V
    .locals 0
    .param p1, "sources"    # [Lio/reactivex/CompletableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lio/reactivex/CompletableSource;",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/CompletableSource;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p2, "sourcesIterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/CompletableSource;>;"
    invoke-direct {p0}, Lio/reactivex/Completable;-><init>()V

    .line 29
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableAmb;->sources:[Lio/reactivex/CompletableSource;

    .line 30
    iput-object p2, p0, Lio/reactivex/internal/operators/completable/CompletableAmb;->sourcesIterable:Ljava/lang/Iterable;

    .line 31
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/CompletableObserver;)V
    .locals 16
    .param p1, "s"    # Lio/reactivex/CompletableObserver;

    .prologue
    .line 35
    move-object/from16 v0, p0

    iget-object v13, v0, Lio/reactivex/internal/operators/completable/CompletableAmb;->sources:[Lio/reactivex/CompletableSource;

    .line 36
    .local v13, "sources":[Lio/reactivex/CompletableSource;
    const/4 v3, 0x0

    .line 37
    .local v3, "count":I
    if-nez v13, :cond_4

    .line 38
    const/16 v14, 0x8

    new-array v13, v14, [Lio/reactivex/CompletableSource;

    .line 40
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/completable/CompletableAmb;->sourcesIterable:Ljava/lang/Iterable;

    invoke-interface {v14}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    move v4, v3

    .end local v3    # "count":I
    .local v4, "count":I
    :goto_0
    :try_start_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lio/reactivex/CompletableSource;

    .line 41
    .local v6, "element":Lio/reactivex/CompletableSource;
    if-nez v6, :cond_1

    .line 42
    new-instance v14, Ljava/lang/NullPointerException;

    const-string/jumbo v15, "One of the sources is null"

    invoke-direct {v14, v15}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-static {v14, v0}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/CompletableObserver;)V

    move v3, v4

    .line 91
    .end local v4    # "count":I
    .end local v6    # "element":Lio/reactivex/CompletableSource;
    .end local v8    # "i$":Ljava/util/Iterator;
    .restart local v3    # "count":I
    :cond_0
    :goto_1
    return-void

    .line 45
    .end local v3    # "count":I
    .restart local v4    # "count":I
    .restart local v6    # "element":Lio/reactivex/CompletableSource;
    .restart local v8    # "i$":Ljava/util/Iterator;
    :cond_1
    array-length v14, v13

    if-ne v4, v14, :cond_2

    .line 46
    shr-int/lit8 v14, v4, 0x2

    add-int/2addr v14, v4

    new-array v1, v14, [Lio/reactivex/CompletableSource;

    .line 47
    .local v1, "b":[Lio/reactivex/CompletableSource;
    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-static {v13, v14, v1, v15, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 48
    move-object v13, v1

    .line 50
    .end local v1    # "b":[Lio/reactivex/CompletableSource;
    :cond_2
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "count":I
    .restart local v3    # "count":I
    :try_start_2
    aput-object v6, v13, v4
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move v4, v3

    .line 51
    .end local v3    # "count":I
    .restart local v4    # "count":I
    goto :goto_0

    .end local v6    # "element":Lio/reactivex/CompletableSource;
    :cond_3
    move v3, v4

    .line 61
    .end local v4    # "count":I
    .end local v8    # "i$":Ljava/util/Iterator;
    .restart local v3    # "count":I
    :goto_2
    new-instance v12, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v12}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    .line 62
    .local v12, "set":Lio/reactivex/disposables/CompositeDisposable;
    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Lio/reactivex/CompletableObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 64
    new-instance v11, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v11}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 66
    .local v11, "once":Ljava/util/concurrent/atomic/AtomicBoolean;
    new-instance v9, Lio/reactivex/internal/operators/completable/CompletableAmb$Amb;

    move-object/from16 v0, p1

    invoke-direct {v9, v11, v12, v0}, Lio/reactivex/internal/operators/completable/CompletableAmb$Amb;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;Lio/reactivex/disposables/CompositeDisposable;Lio/reactivex/CompletableObserver;)V

    .line 68
    .local v9, "inner":Lio/reactivex/CompletableObserver;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_3
    if-ge v7, v3, :cond_7

    .line 69
    aget-object v2, v13, v7

    .line 70
    .local v2, "c":Lio/reactivex/CompletableSource;
    invoke-virtual {v12}, Lio/reactivex/disposables/CompositeDisposable;->isDisposed()Z

    move-result v14

    if-nez v14, :cond_0

    .line 73
    if-nez v2, :cond_6

    .line 74
    new-instance v10, Ljava/lang/NullPointerException;

    const-string/jumbo v14, "One of the sources is null"

    invoke-direct {v10, v14}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 75
    .local v10, "npe":Ljava/lang/NullPointerException;
    const/4 v14, 0x0

    const/4 v15, 0x1

    invoke-virtual {v11, v14, v15}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v14

    if-eqz v14, :cond_5

    .line 76
    invoke-virtual {v12}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 77
    move-object/from16 v0, p1

    invoke-interface {v0, v10}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 52
    .end local v2    # "c":Lio/reactivex/CompletableSource;
    .end local v7    # "i":I
    .end local v9    # "inner":Lio/reactivex/CompletableObserver;
    .end local v10    # "npe":Ljava/lang/NullPointerException;
    .end local v11    # "once":Ljava/util/concurrent/atomic/AtomicBoolean;
    .end local v12    # "set":Lio/reactivex/disposables/CompositeDisposable;
    :catch_0
    move-exception v5

    .line 53
    .local v5, "e":Ljava/lang/Throwable;
    :goto_4
    invoke-static {v5}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 54
    move-object/from16 v0, p1

    invoke-static {v5, v0}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/CompletableObserver;)V

    goto :goto_1

    .line 58
    .end local v5    # "e":Ljava/lang/Throwable;
    :cond_4
    array-length v3, v13

    goto :goto_2

    .line 79
    .restart local v2    # "c":Lio/reactivex/CompletableSource;
    .restart local v7    # "i":I
    .restart local v9    # "inner":Lio/reactivex/CompletableObserver;
    .restart local v10    # "npe":Ljava/lang/NullPointerException;
    .restart local v11    # "once":Ljava/util/concurrent/atomic/AtomicBoolean;
    .restart local v12    # "set":Lio/reactivex/disposables/CompositeDisposable;
    :cond_5
    invoke-static {v10}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 85
    .end local v10    # "npe":Ljava/lang/NullPointerException;
    :cond_6
    invoke-interface {v2, v9}, Lio/reactivex/CompletableSource;->subscribe(Lio/reactivex/CompletableObserver;)V

    .line 68
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 88
    .end local v2    # "c":Lio/reactivex/CompletableSource;
    :cond_7
    if-nez v3, :cond_0

    .line 89
    invoke-interface/range {p1 .. p1}, Lio/reactivex/CompletableObserver;->onComplete()V

    goto :goto_1

    .line 52
    .end local v3    # "count":I
    .end local v7    # "i":I
    .end local v9    # "inner":Lio/reactivex/CompletableObserver;
    .end local v11    # "once":Ljava/util/concurrent/atomic/AtomicBoolean;
    .end local v12    # "set":Lio/reactivex/disposables/CompositeDisposable;
    .restart local v4    # "count":I
    .restart local v8    # "i$":Ljava/util/Iterator;
    :catch_1
    move-exception v5

    move v3, v4

    .end local v4    # "count":I
    .restart local v3    # "count":I
    goto :goto_4
.end method
