.class final Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;
.super Lio/reactivex/internal/util/LinkedArrayList;
.source "ObservableCache.java"

# interfaces
.implements Lio/reactivex/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "CacheState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/util/LinkedArrayList;",
        "Lio/reactivex/Observer",
        "<TT;>;"
    }
.end annotation


# static fields
.field static final EMPTY:[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

.field static final TERMINATED:[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;


# instance fields
.field final connection:Lio/reactivex/internal/disposables/SequentialDisposable;

.field volatile isConnected:Z

.field final observers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[",
            "Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final source:Lio/reactivex/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observable",
            "<+TT;>;"
        }
    .end annotation
.end field

.field sourceDone:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 126
    new-array v0, v1, [Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

    sput-object v0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->EMPTY:[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

    .line 129
    new-array v0, v1, [Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

    sput-object v0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

    return-void
.end method

.method constructor <init>(Lio/reactivex/Observable;I)V
    .locals 2
    .param p2, "capacityHint"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observable",
            "<+TT;>;I)V"
        }
    .end annotation

    .prologue
    .line 141
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;, "Lio/reactivex/internal/operators/observable/ObservableCache$CacheState<TT;>;"
    .local p1, "source":Lio/reactivex/Observable;, "Lio/reactivex/Observable<+TT;>;"
    invoke-direct {p0, p2}, Lio/reactivex/internal/util/LinkedArrayList;-><init>(I)V

    .line 142
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->source:Lio/reactivex/Observable;

    .line 143
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->EMPTY:[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 144
    new-instance v0, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->connection:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 145
    return-void
.end method


# virtual methods
.method public addChild(Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;, "Lio/reactivex/internal/operators/observable/ObservableCache$CacheState<TT;>;"
    .local p1, "p":Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<TT;>;"
    const/4 v3, 0x0

    .line 155
    :cond_0
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

    .line 156
    .local v0, "a":[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<TT;>;"
    sget-object v4, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

    if-ne v0, v4, :cond_1

    .line 166
    :goto_0
    return v3

    .line 159
    :cond_1
    array-length v2, v0

    .line 162
    .local v2, "n":I
    add-int/lit8 v4, v2, 0x1

    new-array v1, v4, [Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

    .line 163
    .local v1, "b":[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<TT;>;"
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 164
    aput-object p1, v1, v2

    .line 165
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 166
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public connect()V
    .locals 1

    .prologue
    .line 216
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;, "Lio/reactivex/internal/operators/observable/ObservableCache$CacheState<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->source:Lio/reactivex/Observable;

    invoke-virtual {v0, p0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    .line 217
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->isConnected:Z

    .line 218
    return-void
.end method

.method public onComplete()V
    .locals 7

    .prologue
    .line 245
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;, "Lio/reactivex/internal/operators/observable/ObservableCache$CacheState<TT;>;"
    iget-boolean v5, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->sourceDone:Z

    if-nez v5, :cond_0

    .line 246
    const/4 v5, 0x1

    iput-boolean v5, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->sourceDone:Z

    .line 247
    invoke-static {}, Lio/reactivex/internal/util/NotificationLite;->complete()Ljava/lang/Object;

    move-result-object v3

    .line 248
    .local v3, "o":Ljava/lang/Object;
    invoke-virtual {p0, v3}, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->add(Ljava/lang/Object;)V

    .line 249
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->connection:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v5}, Lio/reactivex/internal/disposables/SequentialDisposable;->dispose()V

    .line 250
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v6, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

    invoke-virtual {v5, v6}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

    .local v0, "arr$":[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .line 251
    .local v4, "rp":Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<*>;"
    invoke-virtual {v4}, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->replay()V

    .line 250
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 254
    .end local v0    # "arr$":[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "o":Ljava/lang/Object;
    .end local v4    # "rp":Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<*>;"
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 7
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 232
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;, "Lio/reactivex/internal/operators/observable/ObservableCache$CacheState<TT;>;"
    iget-boolean v5, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->sourceDone:Z

    if-nez v5, :cond_0

    .line 233
    const/4 v5, 0x1

    iput-boolean v5, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->sourceDone:Z

    .line 234
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v3

    .line 235
    .local v3, "o":Ljava/lang/Object;
    invoke-virtual {p0, v3}, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->add(Ljava/lang/Object;)V

    .line 236
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->connection:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v5}, Lio/reactivex/internal/disposables/SequentialDisposable;->dispose()V

    .line 237
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v6, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

    invoke-virtual {v5, v6}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

    .local v0, "arr$":[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .line 238
    .local v4, "rp":Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<*>;"
    invoke-virtual {v4}, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->replay()V

    .line 237
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 241
    .end local v0    # "arr$":[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "o":Ljava/lang/Object;
    .end local v4    # "rp":Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<*>;"
    :cond_0
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 221
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;, "Lio/reactivex/internal/operators/observable/ObservableCache$CacheState<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v5, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->sourceDone:Z

    if-nez v5, :cond_0

    .line 222
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 223
    .local v3, "o":Ljava/lang/Object;
    invoke-virtual {p0, v3}, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->add(Ljava/lang/Object;)V

    .line 224
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

    .local v0, "arr$":[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .line 225
    .local v4, "rp":Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<*>;"
    invoke-virtual {v4}, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->replay()V

    .line 224
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 228
    .end local v0    # "arr$":[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "o":Ljava/lang/Object;
    .end local v4    # "rp":Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<*>;"
    :cond_0
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 208
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;, "Lio/reactivex/internal/operators/observable/ObservableCache$CacheState<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->connection:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/disposables/SequentialDisposable;->update(Lio/reactivex/disposables/Disposable;)Z

    .line 209
    return-void
.end method

.method public removeChild(Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;, "Lio/reactivex/internal/operators/observable/ObservableCache$CacheState<TT;>;"
    .local p1, "p":Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<TT;>;"
    const/4 v7, 0x0

    .line 177
    :cond_0
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

    .line 178
    .local v0, "a":[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<TT;>;"
    array-length v4, v0

    .line 179
    .local v4, "n":I
    if-nez v4, :cond_2

    .line 201
    :cond_1
    :goto_0
    return-void

    .line 182
    :cond_2
    const/4 v3, -0x1

    .line 183
    .local v3, "j":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_3

    .line 184
    aget-object v5, v0, v2

    invoke-virtual {v5, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 185
    move v3, v2

    .line 189
    :cond_3
    if-ltz v3, :cond_1

    .line 193
    const/4 v5, 0x1

    if-ne v4, v5, :cond_5

    .line 194
    sget-object v1, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->EMPTY:[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

    .line 200
    .local v1, "b":[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<TT;>;"
    :goto_2
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 183
    .end local v1    # "b":[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<TT;>;"
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 196
    :cond_5
    add-int/lit8 v5, v4, -0x1

    new-array v1, v5, [Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;

    .line 197
    .restart local v1    # "b":[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "[Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<TT;>;"
    invoke-static {v0, v7, v1, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 198
    add-int/lit8 v5, v3, 0x1

    sub-int v6, v4, v3

    add-int/lit8 v6, v6, -0x1

    invoke-static {v0, v5, v1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method
