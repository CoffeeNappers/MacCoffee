.class public final Lio/reactivex/internal/operators/single/SingleAmb;
.super Lio/reactivex/Single;
.source "SingleAmb.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/single/SingleAmb$AmbSingleObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Single",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final sources:[Lio/reactivex/SingleSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/SingleSource",
            "<+TT;>;"
        }
    .end annotation
.end field

.field private final sourcesIterable:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/SingleSource",
            "<+TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([Lio/reactivex/SingleSource;Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lio/reactivex/SingleSource",
            "<+TT;>;",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/SingleSource",
            "<+TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleAmb;, "Lio/reactivex/internal/operators/single/SingleAmb<TT;>;"
    .local p1, "sources":[Lio/reactivex/SingleSource;, "[Lio/reactivex/SingleSource<+TT;>;"
    .local p2, "sourcesIterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/SingleSource<+TT;>;>;"
    invoke-direct {p0}, Lio/reactivex/Single;-><init>()V

    .line 29
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleAmb;->sources:[Lio/reactivex/SingleSource;

    .line 30
    iput-object p2, p0, Lio/reactivex/internal/operators/single/SingleAmb;->sourcesIterable:Ljava/lang/Iterable;

    .line 31
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/SingleObserver;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleAmb;, "Lio/reactivex/internal/operators/single/SingleAmb<TT;>;"
    .local p1, "s":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TT;>;"
    const/4 v13, 0x0

    .line 36
    iget-object v10, p0, Lio/reactivex/internal/operators/single/SingleAmb;->sources:[Lio/reactivex/SingleSource;

    .line 37
    .local v10, "sources":[Lio/reactivex/SingleSource;, "[Lio/reactivex/SingleSource<+TT;>;"
    const/4 v1, 0x0

    .line 38
    .local v1, "count":I
    if-nez v10, :cond_4

    .line 39
    const/16 v11, 0x8

    new-array v10, v11, [Lio/reactivex/SingleSource;

    .line 41
    :try_start_0
    iget-object v11, p0, Lio/reactivex/internal/operators/single/SingleAmb;->sourcesIterable:Ljava/lang/Iterable;

    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
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

    move-result v11

    if-eqz v11, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/reactivex/SingleSource;

    .line 42
    .local v4, "element":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<+TT;>;"
    if-nez v4, :cond_1

    .line 43
    new-instance v11, Ljava/lang/NullPointerException;

    const-string/jumbo v12, "One of the sources is null"

    invoke-direct {v11, v12}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-static {v11, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/SingleObserver;)V

    move v1, v2

    .line 86
    .end local v2    # "count":I
    .end local v4    # "element":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<+TT;>;"
    .end local v6    # "i$":Ljava/util/Iterator;
    .restart local v1    # "count":I
    :cond_0
    :goto_1
    return-void

    .line 46
    .end local v1    # "count":I
    .restart local v2    # "count":I
    .restart local v4    # "element":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<+TT;>;"
    .restart local v6    # "i$":Ljava/util/Iterator;
    :cond_1
    array-length v11, v10

    if-ne v2, v11, :cond_2

    .line 47
    shr-int/lit8 v11, v2, 0x2

    add-int/2addr v11, v2

    new-array v0, v11, [Lio/reactivex/SingleSource;

    .line 48
    .local v0, "b":[Lio/reactivex/SingleSource;, "[Lio/reactivex/SingleSource<+TT;>;"
    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static {v10, v11, v0, v12, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 49
    move-object v10, v0

    .line 51
    .end local v0    # "b":[Lio/reactivex/SingleSource;, "[Lio/reactivex/SingleSource<+TT;>;"
    :cond_2
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "count":I
    .restart local v1    # "count":I
    :try_start_2
    aput-object v4, v10, v2
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move v2, v1

    .line 52
    .end local v1    # "count":I
    .restart local v2    # "count":I
    goto :goto_0

    .end local v4    # "element":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<+TT;>;"
    :cond_3
    move v1, v2

    .line 62
    .end local v2    # "count":I
    .end local v6    # "i$":Ljava/util/Iterator;
    .restart local v1    # "count":I
    :goto_2
    new-instance v8, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v8}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    .line 64
    .local v8, "set":Lio/reactivex/disposables/CompositeDisposable;
    new-instance v9, Lio/reactivex/internal/operators/single/SingleAmb$AmbSingleObserver;

    invoke-direct {v9, p1, v8}, Lio/reactivex/internal/operators/single/SingleAmb$AmbSingleObserver;-><init>(Lio/reactivex/SingleObserver;Lio/reactivex/disposables/CompositeDisposable;)V

    .line 65
    .local v9, "shared":Lio/reactivex/internal/operators/single/SingleAmb$AmbSingleObserver;, "Lio/reactivex/internal/operators/single/SingleAmb$AmbSingleObserver<TT;>;"
    invoke-interface {p1, v8}, Lio/reactivex/SingleObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 67
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_3
    if-ge v5, v1, :cond_0

    .line 68
    aget-object v7, v10, v5

    .line 69
    .local v7, "s1":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<+TT;>;"
    invoke-virtual {v9}, Lio/reactivex/internal/operators/single/SingleAmb$AmbSingleObserver;->get()Z

    move-result v11

    if-nez v11, :cond_0

    .line 73
    if-nez v7, :cond_6

    .line 74
    invoke-virtual {v8}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 75
    new-instance v3, Ljava/lang/NullPointerException;

    const-string/jumbo v11, "One of the sources is null"

    invoke-direct {v3, v11}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 76
    .local v3, "e":Ljava/lang/Throwable;
    const/4 v11, 0x1

    invoke-virtual {v9, v13, v11}, Lio/reactivex/internal/operators/single/SingleAmb$AmbSingleObserver;->compareAndSet(ZZ)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 77
    invoke-interface {p1, v3}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 53
    .end local v3    # "e":Ljava/lang/Throwable;
    .end local v5    # "i":I
    .end local v7    # "s1":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<+TT;>;"
    .end local v8    # "set":Lio/reactivex/disposables/CompositeDisposable;
    .end local v9    # "shared":Lio/reactivex/internal/operators/single/SingleAmb$AmbSingleObserver;, "Lio/reactivex/internal/operators/single/SingleAmb$AmbSingleObserver<TT;>;"
    :catch_0
    move-exception v3

    .line 54
    .restart local v3    # "e":Ljava/lang/Throwable;
    :goto_4
    invoke-static {v3}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 55
    invoke-static {v3, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/SingleObserver;)V

    goto :goto_1

    .line 59
    .end local v3    # "e":Ljava/lang/Throwable;
    :cond_4
    array-length v1, v10

    goto :goto_2

    .line 79
    .restart local v3    # "e":Ljava/lang/Throwable;
    .restart local v5    # "i":I
    .restart local v7    # "s1":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<+TT;>;"
    .restart local v8    # "set":Lio/reactivex/disposables/CompositeDisposable;
    .restart local v9    # "shared":Lio/reactivex/internal/operators/single/SingleAmb$AmbSingleObserver;, "Lio/reactivex/internal/operators/single/SingleAmb$AmbSingleObserver<TT;>;"
    :cond_5
    invoke-static {v3}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 84
    .end local v3    # "e":Ljava/lang/Throwable;
    :cond_6
    invoke-interface {v7, v9}, Lio/reactivex/SingleSource;->subscribe(Lio/reactivex/SingleObserver;)V

    .line 67
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 53
    .end local v1    # "count":I
    .end local v5    # "i":I
    .end local v7    # "s1":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<+TT;>;"
    .end local v8    # "set":Lio/reactivex/disposables/CompositeDisposable;
    .end local v9    # "shared":Lio/reactivex/internal/operators/single/SingleAmb$AmbSingleObserver;, "Lio/reactivex/internal/operators/single/SingleAmb$AmbSingleObserver<TT;>;"
    .restart local v2    # "count":I
    .restart local v6    # "i$":Ljava/util/Iterator;
    :catch_1
    move-exception v3

    move v1, v2

    .end local v2    # "count":I
    .restart local v1    # "count":I
    goto :goto_4
.end method
