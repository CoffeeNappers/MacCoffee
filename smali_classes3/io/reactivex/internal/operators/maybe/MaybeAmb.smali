.class public final Lio/reactivex/internal/operators/maybe/MaybeAmb;
.super Lio/reactivex/Maybe;
.source "MaybeAmb.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/maybe/MaybeAmb$AmbMaybeObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Maybe",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final sources:[Lio/reactivex/MaybeSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/MaybeSource",
            "<+TT;>;"
        }
    .end annotation
.end field

.field private final sourcesIterable:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/MaybeSource",
            "<+TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([Lio/reactivex/MaybeSource;Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lio/reactivex/MaybeSource",
            "<+TT;>;",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/MaybeSource",
            "<+TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeAmb;, "Lio/reactivex/internal/operators/maybe/MaybeAmb<TT;>;"
    .local p1, "sources":[Lio/reactivex/MaybeSource;, "[Lio/reactivex/MaybeSource<+TT;>;"
    .local p2, "sourcesIterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/MaybeSource<+TT;>;>;"
    invoke-direct {p0}, Lio/reactivex/Maybe;-><init>()V

    .line 34
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeAmb;->sources:[Lio/reactivex/MaybeSource;

    .line 35
    iput-object p2, p0, Lio/reactivex/internal/operators/maybe/MaybeAmb;->sourcesIterable:Ljava/lang/Iterable;

    .line 36
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/MaybeObserver;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeAmb;, "Lio/reactivex/internal/operators/maybe/MaybeAmb<TT;>;"
    .local p1, "observer":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    iget-object v9, p0, Lio/reactivex/internal/operators/maybe/MaybeAmb;->sources:[Lio/reactivex/MaybeSource;

    .line 42
    .local v9, "sources":[Lio/reactivex/MaybeSource;, "[Lio/reactivex/MaybeSource<+TT;>;"
    const/4 v1, 0x0

    .line 43
    .local v1, "count":I
    if-nez v9, :cond_4

    .line 44
    const/16 v10, 0x8

    new-array v9, v10, [Lio/reactivex/MaybeSource;

    .line 46
    :try_start_0
    iget-object v10, p0, Lio/reactivex/internal/operators/maybe/MaybeAmb;->sourcesIterable:Ljava/lang/Iterable;

    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    move v2, v1

    .end local v1    # "count":I
    .local v2, "count":I
    :goto_0
    :try_start_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/reactivex/MaybeSource;

    .line 47
    .local v4, "element":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    if-nez v4, :cond_1

    .line 48
    new-instance v10, Ljava/lang/NullPointerException;

    const-string/jumbo v11, "One of the sources is null"

    invoke-direct {v10, v11}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-static {v10, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/MaybeObserver;)V

    move v1, v2

    .line 88
    .end local v2    # "count":I
    .end local v4    # "element":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    .end local v6    # "i$":Ljava/util/Iterator;
    .restart local v1    # "count":I
    :cond_0
    :goto_1
    return-void

    .line 51
    .end local v1    # "count":I
    .restart local v2    # "count":I
    .restart local v4    # "element":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    .restart local v6    # "i$":Ljava/util/Iterator;
    :cond_1
    array-length v10, v9

    if-ne v2, v10, :cond_2

    .line 52
    shr-int/lit8 v10, v2, 0x2

    add-int/2addr v10, v2

    new-array v0, v10, [Lio/reactivex/MaybeSource;

    .line 53
    .local v0, "b":[Lio/reactivex/MaybeSource;, "[Lio/reactivex/MaybeSource<+TT;>;"
    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static {v9, v10, v0, v11, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 54
    move-object v9, v0

    .line 56
    .end local v0    # "b":[Lio/reactivex/MaybeSource;, "[Lio/reactivex/MaybeSource<+TT;>;"
    :cond_2
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "count":I
    .restart local v1    # "count":I
    :try_start_2
    aput-object v4, v9, v2
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move v2, v1

    .line 57
    .end local v1    # "count":I
    .restart local v2    # "count":I
    goto :goto_0

    .end local v4    # "element":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    :cond_3
    move v1, v2

    .line 67
    .end local v2    # "count":I
    .end local v6    # "i$":Ljava/util/Iterator;
    .restart local v1    # "count":I
    :goto_2
    new-instance v7, Lio/reactivex/internal/operators/maybe/MaybeAmb$AmbMaybeObserver;

    invoke-direct {v7, p1}, Lio/reactivex/internal/operators/maybe/MaybeAmb$AmbMaybeObserver;-><init>(Lio/reactivex/MaybeObserver;)V

    .line 68
    .local v7, "parent":Lio/reactivex/internal/operators/maybe/MaybeAmb$AmbMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeAmb$AmbMaybeObserver<TT;>;"
    invoke-interface {p1, v7}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 70
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_3
    if-ge v5, v1, :cond_6

    .line 71
    aget-object v8, v9, v5

    .line 72
    .local v8, "s":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    invoke-virtual {v7}, Lio/reactivex/internal/operators/maybe/MaybeAmb$AmbMaybeObserver;->isDisposed()Z

    move-result v10

    if-nez v10, :cond_0

    .line 76
    if-nez v8, :cond_5

    .line 77
    new-instance v10, Ljava/lang/NullPointerException;

    const-string/jumbo v11, "One of the MaybeSources is null"

    invoke-direct {v10, v11}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v10}, Lio/reactivex/internal/operators/maybe/MaybeAmb$AmbMaybeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 58
    .end local v5    # "i":I
    .end local v7    # "parent":Lio/reactivex/internal/operators/maybe/MaybeAmb$AmbMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeAmb$AmbMaybeObserver<TT;>;"
    .end local v8    # "s":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    :catch_0
    move-exception v3

    .line 59
    .local v3, "e":Ljava/lang/Throwable;
    :goto_4
    invoke-static {v3}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 60
    invoke-static {v3, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/MaybeObserver;)V

    goto :goto_1

    .line 64
    .end local v3    # "e":Ljava/lang/Throwable;
    :cond_4
    array-length v1, v9

    goto :goto_2

    .line 81
    .restart local v5    # "i":I
    .restart local v7    # "parent":Lio/reactivex/internal/operators/maybe/MaybeAmb$AmbMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeAmb$AmbMaybeObserver<TT;>;"
    .restart local v8    # "s":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    :cond_5
    invoke-interface {v8, v7}, Lio/reactivex/MaybeSource;->subscribe(Lio/reactivex/MaybeObserver;)V

    .line 70
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 84
    .end local v8    # "s":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    :cond_6
    if-nez v1, :cond_0

    .line 85
    invoke-interface {p1}, Lio/reactivex/MaybeObserver;->onComplete()V

    goto :goto_1

    .line 58
    .end local v1    # "count":I
    .end local v5    # "i":I
    .end local v7    # "parent":Lio/reactivex/internal/operators/maybe/MaybeAmb$AmbMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeAmb$AmbMaybeObserver<TT;>;"
    .restart local v2    # "count":I
    .restart local v6    # "i$":Ljava/util/Iterator;
    :catch_1
    move-exception v3

    move v1, v2

    .end local v2    # "count":I
    .restart local v1    # "count":I
    goto :goto_4
.end method
