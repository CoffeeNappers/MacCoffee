.class public final Lio/reactivex/internal/operators/maybe/MaybeCache;
.super Lio/reactivex/Maybe;
.source "MaybeCache.java"

# interfaces
.implements Lio/reactivex/MaybeObserver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Maybe",
        "<TT;>;",
        "Lio/reactivex/MaybeObserver",
        "<TT;>;"
    }
.end annotation


# static fields
.field static final EMPTY:[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

.field static final TERMINATED:[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;


# instance fields
.field error:Ljava/lang/Throwable;

.field final observers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[",
            "Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final source:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/MaybeSource",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 29
    new-array v0, v1, [Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    sput-object v0, Lio/reactivex/internal/operators/maybe/MaybeCache;->EMPTY:[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    .line 32
    new-array v0, v1, [Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    sput-object v0, Lio/reactivex/internal/operators/maybe/MaybeCache;->TERMINATED:[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    return-void
.end method

.method public constructor <init>(Lio/reactivex/MaybeSource;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeSource",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeCache;, "Lio/reactivex/internal/operators/maybe/MaybeCache<TT;>;"
    .local p1, "source":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<TT;>;"
    invoke-direct {p0}, Lio/reactivex/Maybe;-><init>()V

    .line 44
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeCache;->source:Ljava/util/concurrent/atomic/AtomicReference;

    .line 45
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/operators/maybe/MaybeCache;->EMPTY:[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeCache;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 46
    return-void
.end method


# virtual methods
.method add(Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeCache;, "Lio/reactivex/internal/operators/maybe/MaybeCache<TT;>;"
    .local p1, "inner":Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;, "Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable<TT;>;"
    const/4 v3, 0x0

    .line 120
    :cond_0
    iget-object v4, p0, Lio/reactivex/internal/operators/maybe/MaybeCache;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    .line 121
    .local v0, "a":[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;, "[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable<TT;>;"
    sget-object v4, Lio/reactivex/internal/operators/maybe/MaybeCache;->TERMINATED:[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    if-ne v0, v4, :cond_1

    .line 131
    :goto_0
    return v3

    .line 124
    :cond_1
    array-length v2, v0

    .line 127
    .local v2, "n":I
    add-int/lit8 v4, v2, 0x1

    new-array v1, v4, [Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    .line 128
    .local v1, "b":[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;, "[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable<TT;>;"
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 129
    aput-object p1, v1, v2

    .line 130
    iget-object v4, p0, Lio/reactivex/internal/operators/maybe/MaybeCache;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 131
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public onComplete()V
    .locals 6

    .prologue
    .line 111
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeCache;, "Lio/reactivex/internal/operators/maybe/MaybeCache<TT;>;"
    iget-object v4, p0, Lio/reactivex/internal/operators/maybe/MaybeCache;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/internal/operators/maybe/MaybeCache;->TERMINATED:[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    .local v0, "arr$":[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v2, v0, v1

    .line 112
    .local v2, "inner":Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;, "Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable<TT;>;"
    invoke-virtual {v2}, Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;->isDisposed()Z

    move-result v4

    if-nez v4, :cond_0

    .line 113
    iget-object v4, v2, Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v4}, Lio/reactivex/MaybeObserver;->onComplete()V

    .line 111
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 116
    .end local v2    # "inner":Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;, "Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable<TT;>;"
    :cond_1
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 6
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 100
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeCache;, "Lio/reactivex/internal/operators/maybe/MaybeCache<TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeCache;->error:Ljava/lang/Throwable;

    .line 101
    iget-object v4, p0, Lio/reactivex/internal/operators/maybe/MaybeCache;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/internal/operators/maybe/MaybeCache;->TERMINATED:[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    .local v0, "arr$":[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v2, v0, v1

    .line 102
    .local v2, "inner":Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;, "Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable<TT;>;"
    invoke-virtual {v2}, Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;->isDisposed()Z

    move-result v4

    if-nez v4, :cond_0

    .line 103
    iget-object v4, v2, Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v4, p1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    .line 101
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 106
    .end local v2    # "inner":Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;, "Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable<TT;>;"
    :cond_1
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 0
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 84
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeCache;, "Lio/reactivex/internal/operators/maybe/MaybeCache<TT;>;"
    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeCache;, "Lio/reactivex/internal/operators/maybe/MaybeCache<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeCache;->value:Ljava/lang/Object;

    .line 90
    iget-object v4, p0, Lio/reactivex/internal/operators/maybe/MaybeCache;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/internal/operators/maybe/MaybeCache;->TERMINATED:[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    .local v0, "arr$":[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v2, v0, v1

    .line 91
    .local v2, "inner":Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;, "Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable<TT;>;"
    invoke-virtual {v2}, Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;->isDisposed()Z

    move-result v4

    if-nez v4, :cond_0

    .line 92
    iget-object v4, v2, Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v4, p1}, Lio/reactivex/MaybeObserver;->onSuccess(Ljava/lang/Object;)V

    .line 90
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 95
    .end local v2    # "inner":Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;, "Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable<TT;>;"
    :cond_1
    return-void
.end method

.method remove(Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeCache;, "Lio/reactivex/internal/operators/maybe/MaybeCache<TT;>;"
    .local p1, "inner":Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;, "Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable<TT;>;"
    const/4 v7, 0x0

    .line 139
    :cond_0
    iget-object v5, p0, Lio/reactivex/internal/operators/maybe/MaybeCache;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    .line 140
    .local v0, "a":[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;, "[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable<TT;>;"
    array-length v4, v0

    .line 141
    .local v4, "n":I
    if-nez v4, :cond_2

    .line 167
    :cond_1
    :goto_0
    return-void

    .line 145
    :cond_2
    const/4 v3, -0x1

    .line 147
    .local v3, "j":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_3

    .line 148
    aget-object v5, v0, v2

    if-ne v5, p1, :cond_4

    .line 149
    move v3, v2

    .line 154
    :cond_3
    if-ltz v3, :cond_1

    .line 159
    const/4 v5, 0x1

    if-ne v4, v5, :cond_5

    .line 160
    sget-object v1, Lio/reactivex/internal/operators/maybe/MaybeCache;->EMPTY:[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    .line 166
    .local v1, "b":[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;, "[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable<TT;>;"
    :goto_2
    iget-object v5, p0, Lio/reactivex/internal/operators/maybe/MaybeCache;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 147
    .end local v1    # "b":[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;, "[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable<TT;>;"
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 162
    :cond_5
    add-int/lit8 v5, v4, -0x1

    new-array v1, v5, [Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    .line 163
    .restart local v1    # "b":[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;, "[Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable<TT;>;"
    invoke-static {v0, v7, v1, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 164
    add-int/lit8 v5, v3, 0x1

    sub-int v6, v4, v3

    add-int/lit8 v6, v6, -0x1

    invoke-static {v0, v5, v1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method

.method protected subscribeActual(Lio/reactivex/MaybeObserver;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeCache;, "Lio/reactivex/internal/operators/maybe/MaybeCache<TT;>;"
    .local p1, "observer":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    new-instance v1, Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;

    invoke-direct {v1, p1, p0}, Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;-><init>(Lio/reactivex/MaybeObserver;Lio/reactivex/internal/operators/maybe/MaybeCache;)V

    .line 51
    .local v1, "parent":Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;, "Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable<TT;>;"
    invoke-interface {p1, v1}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 53
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/maybe/MaybeCache;->add(Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 54
    invoke-virtual {v1}, Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;->isDisposed()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 55
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/maybe/MaybeCache;->remove(Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;)V

    .line 79
    :cond_0
    :goto_0
    return-void

    .line 59
    :cond_1
    invoke-virtual {v1}, Lio/reactivex/internal/operators/maybe/MaybeCache$CacheDisposable;->isDisposed()Z

    move-result v4

    if-nez v4, :cond_0

    .line 60
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeCache;->error:Ljava/lang/Throwable;

    .line 61
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_2

    .line 62
    invoke-interface {p1, v0}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 64
    :cond_2
    iget-object v3, p0, Lio/reactivex/internal/operators/maybe/MaybeCache;->value:Ljava/lang/Object;

    .line 65
    .local v3, "v":Ljava/lang/Object;, "TT;"
    if-eqz v3, :cond_3

    .line 66
    invoke-interface {p1, v3}, Lio/reactivex/MaybeObserver;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0

    .line 68
    :cond_3
    invoke-interface {p1}, Lio/reactivex/MaybeObserver;->onComplete()V

    goto :goto_0

    .line 75
    .end local v0    # "ex":Ljava/lang/Throwable;
    .end local v3    # "v":Ljava/lang/Object;, "TT;"
    :cond_4
    iget-object v4, p0, Lio/reactivex/internal/operators/maybe/MaybeCache;->source:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/MaybeSource;

    .line 76
    .local v2, "src":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<TT;>;"
    if-eqz v2, :cond_0

    .line 77
    invoke-interface {v2, p0}, Lio/reactivex/MaybeSource;->subscribe(Lio/reactivex/MaybeObserver;)V

    goto :goto_0
.end method
