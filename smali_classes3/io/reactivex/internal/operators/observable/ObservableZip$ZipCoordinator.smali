.class final Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableZip.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableZip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ZipCoordinator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x296842a962149c03L


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TR;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field final delayError:Z

.field final observers:[Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver",
            "<TT;TR;>;"
        }
    .end annotation
.end field

.field final row:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field final zipper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;IZ)V
    .locals 1
    .param p3, "count"    # I
    .param p4, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;IZ)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator<TT;TR;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    .local p2, "zipper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 90
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->actual:Lio/reactivex/Observer;

    .line 91
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->zipper:Lio/reactivex/functions/Function;

    .line 92
    new-array v0, p3, [Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;

    .line 93
    new-array v0, p3, [Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->row:[Ljava/lang/Object;

    .line 94
    iput-boolean p4, p0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->delayError:Z

    .line 95
    return-void
.end method


# virtual methods
.method cancel()V
    .locals 0

    .prologue
    .line 131
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator<TT;TR;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->clear()V

    .line 132
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->cancelSources()V

    .line 133
    return-void
.end method

.method cancelSources()V
    .locals 4

    .prologue
    .line 136
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;

    .local v0, "arr$":[Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 137
    .local v3, "zs":Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver<**>;"
    invoke-virtual {v3}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;->dispose()V

    .line 136
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 139
    .end local v3    # "zs":Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver<**>;"
    :cond_0
    return-void
.end method

.method checkTerminated(ZZLio/reactivex/Observer;ZLio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;)Z
    .locals 3
    .param p1, "d"    # Z
    .param p2, "empty"    # Z
    .param p4, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lio/reactivex/Observer",
            "<-TR;>;Z",
            "Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver",
            "<**>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator<TT;TR;>;"
    .local p3, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    .local p5, "source":Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver<**>;"
    const/4 v1, 0x1

    .line 218
    iget-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->cancelled:Z

    if-eqz v2, :cond_0

    .line 219
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->cancel()V

    .line 250
    :goto_0
    return v1

    .line 223
    :cond_0
    if-eqz p1, :cond_4

    .line 224
    if-eqz p4, :cond_2

    .line 225
    if-eqz p2, :cond_4

    .line 226
    iget-object v0, p5, Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;->error:Ljava/lang/Throwable;

    .line 227
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->cancel()V

    .line 228
    if-eqz v0, :cond_1

    .line 229
    invoke-interface {p3, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 231
    :cond_1
    invoke-interface {p3}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 236
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_2
    iget-object v0, p5, Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;->error:Ljava/lang/Throwable;

    .line 237
    .restart local v0    # "e":Ljava/lang/Throwable;
    if-eqz v0, :cond_3

    .line 238
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->cancel()V

    .line 239
    invoke-interface {p3, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 242
    :cond_3
    if-eqz p2, :cond_4

    .line 243
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->cancel()V

    .line 244
    invoke-interface {p3}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 250
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_4
    const/4 v1, 0x0

    goto :goto_0
.end method

.method clear()V
    .locals 5

    .prologue
    .line 142
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;

    .local v0, "arr$":[Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 143
    .local v3, "zs":Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver<**>;"
    iget-object v4, v3, Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 142
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 145
    .end local v3    # "zs":Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver<**>;"
    :cond_0
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 116
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->cancelled:Z

    if-nez v0, :cond_0

    .line 117
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->cancelled:Z

    .line 118
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->cancelSources()V

    .line 119
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 120
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->clear()V

    .line 123
    :cond_0
    return-void
.end method

.method public drain()V
    .locals 19

    .prologue
    .line 148
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator<TT;TR;>;"
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->getAndIncrement()I

    move-result v1

    if-eqz v1, :cond_1

    .line 212
    :cond_0
    :goto_0
    return-void

    .line 152
    :cond_1
    const/4 v13, 0x1

    .line 154
    .local v13, "missing":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;

    move-object/from16 v17, v0

    .line 155
    .local v17, "zs":[Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;, "[Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver<TT;TR;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->actual:Lio/reactivex/Observer;

    .line 156
    .local v4, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->row:[Ljava/lang/Object;

    .line 157
    .local v14, "os":[Ljava/lang/Object;, "[TT;"
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->delayError:Z

    .line 162
    .local v5, "delayError":Z
    :cond_2
    :goto_1
    const/4 v10, 0x0

    .line 163
    .local v10, "i":I
    const/4 v8, 0x0

    .line 164
    .local v8, "emptyCount":I
    move-object/from16 v7, v17

    .local v7, "arr$":[Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;
    array-length v12, v7

    .local v12, "len$":I
    const/4 v11, 0x0

    .local v11, "i$":I
    :goto_2
    if-ge v11, v12, :cond_7

    aget-object v6, v7, v11

    .line 165
    .local v6, "z":Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver<TT;TR;>;"
    aget-object v1, v14, v10

    if-nez v1, :cond_6

    .line 166
    iget-boolean v2, v6, Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;->done:Z

    .line 167
    .local v2, "d":Z
    iget-object v1, v6, Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v16

    .line 168
    .local v16, "v":Ljava/lang/Object;, "TT;"
    if-nez v16, :cond_4

    const/4 v3, 0x1

    .local v3, "empty":Z
    :goto_3
    move-object/from16 v1, p0

    .line 170
    invoke-virtual/range {v1 .. v6}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->checkTerminated(ZZLio/reactivex/Observer;ZLio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 173
    if-nez v3, :cond_5

    .line 174
    aput-object v16, v14, v10

    .line 188
    .end local v2    # "d":Z
    .end local v3    # "empty":Z
    .end local v16    # "v":Ljava/lang/Object;, "TT;"
    :cond_3
    :goto_4
    add-int/lit8 v10, v10, 0x1

    .line 164
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 168
    .restart local v2    # "d":Z
    .restart local v16    # "v":Ljava/lang/Object;, "TT;"
    :cond_4
    const/4 v3, 0x0

    goto :goto_3

    .line 176
    .restart local v3    # "empty":Z
    :cond_5
    add-int/lit8 v8, v8, 0x1

    goto :goto_4

    .line 179
    .end local v2    # "d":Z
    .end local v3    # "empty":Z
    .end local v16    # "v":Ljava/lang/Object;, "TT;"
    :cond_6
    iget-boolean v1, v6, Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;->done:Z

    if-eqz v1, :cond_3

    if-nez v5, :cond_3

    .line 180
    iget-object v9, v6, Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;->error:Ljava/lang/Throwable;

    .line 181
    .local v9, "ex":Ljava/lang/Throwable;
    if-eqz v9, :cond_3

    .line 182
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->cancel()V

    .line 183
    invoke-interface {v4, v9}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 191
    .end local v6    # "z":Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver<TT;TR;>;"
    .end local v9    # "ex":Ljava/lang/Throwable;
    :cond_7
    if-eqz v8, :cond_8

    .line 210
    neg-int v1, v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->addAndGet(I)I

    move-result v13

    .line 211
    if-nez v13, :cond_2

    goto :goto_0

    .line 197
    :cond_8
    :try_start_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->zipper:Lio/reactivex/functions/Function;

    invoke-virtual {v14}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v1, v0}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string/jumbo v18, "The zipper returned a null value"

    move-object/from16 v0, v18

    invoke-static {v1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v15

    .line 205
    .local v15, "v":Ljava/lang/Object;, "TR;"
    invoke-interface {v4, v15}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 207
    const/4 v1, 0x0

    invoke-static {v14, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1

    .line 198
    .end local v15    # "v":Ljava/lang/Object;, "TR;"
    :catch_0
    move-exception v9

    .line 199
    .restart local v9    # "ex":Ljava/lang/Throwable;
    invoke-static {v9}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 200
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->cancel()V

    .line 201
    invoke-interface {v4, v9}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 127
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->cancelled:Z

    return v0
.end method

.method public subscribe([Lio/reactivex/ObservableSource;I)V
    .locals 5
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;I)V"
        }
    .end annotation

    .prologue
    .line 98
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator<TT;TR;>;"
    .local p1, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;

    .line 99
    .local v2, "s":[Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;, "[Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver<TT;TR;>;"
    array-length v1, v2

    .line 100
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 101
    new-instance v3, Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;

    invoke-direct {v3, p0, p2}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;I)V

    aput-object v3, v2, v0

    .line 100
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 104
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->lazySet(I)V

    .line 105
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 106
    const/4 v0, 0x0

    :goto_1
    if-ge v0, v1, :cond_1

    .line 107
    iget-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->cancelled:Z

    if-eqz v3, :cond_2

    .line 112
    :cond_1
    return-void

    .line 110
    :cond_2
    aget-object v3, p1, v0

    aget-object v4, v2, v0

    invoke-interface {v3, v4}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 106
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
