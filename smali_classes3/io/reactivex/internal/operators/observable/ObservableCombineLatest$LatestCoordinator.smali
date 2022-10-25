.class final Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableCombineLatest.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableCombineLatest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "LatestCoordinator"
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
.field private static final serialVersionUID:J = 0x76e7117251786db1L


# instance fields
.field active:I

.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TR;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field final combiner:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;"
        }
    .end annotation
.end field

.field complete:I

.field final delayError:Z

.field volatile done:Z

.field final errors:Lio/reactivex/internal/util/AtomicThrowable;

.field final latest:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field final observers:[Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver",
            "<TT;TR;>;"
        }
    .end annotation
.end field

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


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;IIZ)V
    .locals 1
    .param p3, "count"    # I
    .param p4, "bufferSize"    # I
    .param p5, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;IIZ)V"
        }
    .end annotation

    .prologue
    .line 98
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator<TT;TR;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    .local p2, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 90
    new-instance v0, Lio/reactivex/internal/util/AtomicThrowable;

    invoke-direct {v0}, Lio/reactivex/internal/util/AtomicThrowable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    .line 99
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->actual:Lio/reactivex/Observer;

    .line 100
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->combiner:Lio/reactivex/functions/Function;

    .line 101
    iput-boolean p5, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->delayError:Z

    .line 102
    new-array v0, p3, [Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->latest:[Ljava/lang/Object;

    .line 103
    new-array v0, p3, [Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;

    .line 104
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-direct {v0, p4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 105
    return-void
.end method


# virtual methods
.method cancel(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 140
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator<TT;TR;>;"
    .local p1, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<*>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->clear(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 141
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelSources()V

    .line 142
    return-void
.end method

.method cancelSources()V
    .locals 4

    .prologue
    .line 145
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;

    .local v0, "arr$":[Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 146
    .local v3, "s":Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver<TT;TR;>;"
    invoke-virtual {v3}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;->dispose()V

    .line 145
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 148
    .end local v3    # "s":Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver<TT;TR;>;"
    :cond_0
    return-void
.end method

.method checkTerminated(ZZLio/reactivex/Observer;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;Z)Z
    .locals 3
    .param p1, "d"    # Z
    .param p2, "empty"    # Z
    .param p5, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lio/reactivex/Observer",
            "<*>;",
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<*>;Z)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator<TT;TR;>;"
    .local p3, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<*>;"
    .local p4, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<*>;"
    const/4 v1, 0x1

    .line 258
    iget-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelled:Z

    if-eqz v2, :cond_0

    .line 259
    invoke-virtual {p0, p4}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancel(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 288
    :goto_0
    return v1

    .line 262
    :cond_0
    if-eqz p1, :cond_4

    .line 263
    if-eqz p5, :cond_2

    .line 264
    if-eqz p2, :cond_4

    .line 265
    invoke-virtual {p0, p4}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancel(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 266
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v2}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v0

    .line 267
    .local v0, "e":Ljava/lang/Throwable;
    if-eqz v0, :cond_1

    .line 268
    invoke-interface {p3, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 270
    :cond_1
    invoke-interface {p3}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 275
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_2
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v2}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    .line 276
    .restart local v0    # "e":Ljava/lang/Throwable;
    if-eqz v0, :cond_3

    .line 277
    invoke-virtual {p0, p4}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancel(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 278
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v2}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v2

    invoke-interface {p3, v2}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 281
    :cond_3
    if-eqz p2, :cond_4

    .line 282
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->clear(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 283
    invoke-interface {p3}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 288
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_4
    const/4 v1, 0x0

    goto :goto_0
.end method

.method clear(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 151
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator<TT;TR;>;"
    .local p1, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<*>;"
    monitor-enter p0

    .line 152
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->latest:[Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 153
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    invoke-virtual {p1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 155
    return-void

    .line 153
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method combine(Ljava/lang/Object;I)V
    .locals 9
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator<TT;TR;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    const/4 v3, 0x0

    const/4 v7, 0x1

    .line 158
    iget-object v8, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;

    aget-object v2, v8, p2

    .line 165
    .local v2, "cs":Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver<TT;TR;>;"
    monitor-enter p0

    .line 166
    :try_start_0
    iget-boolean v8, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelled:Z

    if-eqz v8, :cond_1

    .line 167
    monitor-exit p0

    .line 200
    :cond_0
    :goto_0
    return-void

    .line 169
    :cond_1
    iget-object v8, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->latest:[Ljava/lang/Object;

    array-length v5, v8

    .line 170
    .local v5, "len":I
    iget-object v8, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->latest:[Ljava/lang/Object;

    aget-object v6, v8, p2

    .line 171
    .local v6, "o":Ljava/lang/Object;, "TT;"
    iget v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->active:I

    .line 172
    .local v0, "a":I
    if-nez v6, :cond_2

    .line 173
    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->active:I

    .line 175
    :cond_2
    iget v1, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->complete:I

    .line 176
    .local v1, "c":I
    if-nez p1, :cond_7

    .line 177
    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->complete:I

    .line 181
    :goto_1
    if-ne v0, v5, :cond_8

    move v4, v7

    .line 183
    .local v4, "f":Z
    :goto_2
    if-eq v1, v5, :cond_3

    if-nez p1, :cond_4

    if-nez v6, :cond_4

    :cond_3
    move v3, v7

    .line 185
    .local v3, "empty":Z
    :cond_4
    if-nez v3, :cond_a

    .line 186
    if-eqz p1, :cond_9

    if-eqz v4, :cond_9

    .line 187
    iget-object v7, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    iget-object v8, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->latest:[Ljava/lang/Object;

    invoke-virtual {v8}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v2, v8}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 195
    :cond_5
    :goto_3
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 196
    if-nez v4, :cond_6

    if-nez p1, :cond_0

    .line 199
    :cond_6
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->drain()V

    goto :goto_0

    .line 179
    .end local v3    # "empty":Z
    .end local v4    # "f":Z
    :cond_7
    :try_start_1
    iget-object v8, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->latest:[Ljava/lang/Object;

    aput-object p1, v8, p2

    goto :goto_1

    .line 195
    .end local v0    # "a":I
    .end local v1    # "c":I
    .end local v5    # "len":I
    .end local v6    # "o":Ljava/lang/Object;, "TT;"
    :catchall_0
    move-exception v7

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v7

    .restart local v0    # "a":I
    .restart local v1    # "c":I
    .restart local v5    # "len":I
    .restart local v6    # "o":Ljava/lang/Object;, "TT;"
    :cond_8
    move v4, v3

    .line 181
    goto :goto_2

    .line 189
    .restart local v3    # "empty":Z
    .restart local v4    # "f":Z
    :cond_9
    if-nez p1, :cond_5

    :try_start_2
    iget-object v7, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v7}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_5

    .line 190
    const/4 v7, 0x1

    iput-boolean v7, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->done:Z

    goto :goto_3

    .line 193
    :cond_a
    const/4 v7, 0x1

    iput-boolean v7, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->done:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 125
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelled:Z

    if-nez v0, :cond_0

    .line 126
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelled:Z

    .line 127
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelSources()V

    .line 128
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 129
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->clear(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 132
    :cond_0
    return-void
.end method

.method drain()V
    .locals 13

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator<TT;TR;>;"
    const/4 v11, 0x1

    .line 202
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_1

    .line 254
    :cond_0
    :goto_0
    return-void

    .line 206
    :cond_1
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 207
    .local v4, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<Ljava/lang/Object;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->actual:Lio/reactivex/Observer;

    .line 208
    .local v3, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    iget-boolean v5, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->delayError:Z

    .line 210
    .local v5, "delayError":Z
    const/4 v9, 0x1

    .line 213
    .local v9, "missed":I
    :cond_2
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->done:Z

    invoke-virtual {v4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v2

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->checkTerminated(ZZLio/reactivex/Observer;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 219
    :goto_1
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->done:Z

    .line 221
    .local v1, "d":Z
    invoke-virtual {v4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;

    .line 222
    .local v7, "cs":Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver<TT;TR;>;"
    if-nez v7, :cond_3

    move v2, v11

    .local v2, "empty":Z
    :goto_2
    move-object v0, p0

    .line 224
    invoke-virtual/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->checkTerminated(ZZLio/reactivex/Observer;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 228
    if-eqz v2, :cond_4

    .line 249
    neg-int v0, v9

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->addAndGet(I)I

    move-result v9

    .line 250
    if-nez v9, :cond_2

    goto :goto_0

    .line 222
    .end local v2    # "empty":Z
    :cond_3
    const/4 v2, 0x0

    goto :goto_2

    .line 233
    .restart local v2    # "empty":Z
    :cond_4
    invoke-virtual {v4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, [Ljava/lang/Object;

    .line 237
    .local v6, "array":[Ljava/lang/Object;, "[TT;"
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->combiner:Lio/reactivex/functions/Function;

    invoke-interface {v0, v6}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string/jumbo v12, "The combiner returned a null"

    invoke-static {v0, v12}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    .line 246
    .local v10, "v":Ljava/lang/Object;, "TR;"
    invoke-interface {v3, v10}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_1

    .line 238
    .end local v10    # "v":Ljava/lang/Object;, "TR;"
    :catch_0
    move-exception v8

    .line 239
    .local v8, "ex":Ljava/lang/Throwable;
    invoke-static {v8}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 240
    iput-boolean v11, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelled:Z

    .line 241
    invoke-virtual {p0, v4}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancel(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 242
    invoke-interface {v3, v8}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 136
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelled:Z

    return v0
.end method

.method onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 292
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 293
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 295
    :cond_0
    return-void
.end method

.method public subscribe([Lio/reactivex/ObservableSource;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 108
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator<TT;TR;>;"
    .local p1, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;

    .line 109
    .local v0, "as":[Lio/reactivex/Observer;, "[Lio/reactivex/Observer<TT;>;"
    array-length v2, v0

    .line 110
    .local v2, "len":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 111
    new-instance v3, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;

    invoke-direct {v3, p0, v1}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;I)V

    aput-object v3, v0, v1

    .line 110
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 113
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->lazySet(I)V

    .line 114
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 115
    const/4 v1, 0x0

    :goto_1
    if-ge v1, v2, :cond_1

    .line 116
    iget-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->done:Z

    if-nez v3, :cond_1

    iget-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelled:Z

    if-eqz v3, :cond_2

    .line 121
    :cond_1
    return-void

    .line 119
    :cond_2
    aget-object v3, p1, v1

    aget-object v4, v0, v1

    invoke-interface {v3, v4}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 115
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method
