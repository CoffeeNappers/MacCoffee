.class public final Lio/reactivex/internal/operators/single/SingleZipIterable;
.super Lio/reactivex/Single;
.source "SingleZipIterable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/single/SingleZipIterable$SingletonArrayFunc;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Single",
        "<TR;>;"
    }
.end annotation


# instance fields
.field final sources:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/SingleSource",
            "<+TT;>;>;"
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
.method public constructor <init>(Ljava/lang/Iterable;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/SingleSource",
            "<+TT;>;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleZipIterable;, "Lio/reactivex/internal/operators/single/SingleZipIterable<TT;TR;>;"
    .local p1, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/SingleSource<+TT;>;>;"
    .local p2, "zipper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-direct {p0}, Lio/reactivex/Single;-><init>()V

    .line 31
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleZipIterable;->sources:Ljava/lang/Iterable;

    .line 32
    iput-object p2, p0, Lio/reactivex/internal/operators/single/SingleZipIterable;->zipper:Lio/reactivex/functions/Function;

    .line 33
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/SingleObserver;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleZipIterable;, "Lio/reactivex/internal/operators/single/SingleZipIterable<TT;TR;>;"
    .local p1, "observer":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TR;>;"
    const/16 v9, 0x8

    new-array v1, v9, [Lio/reactivex/SingleSource;

    .line 39
    .local v1, "a":[Lio/reactivex/SingleSource;, "[Lio/reactivex/SingleSource<+TT;>;"
    const/4 v5, 0x0

    .line 42
    .local v5, "n":I
    :try_start_0
    iget-object v9, p0, Lio/reactivex/internal/operators/single/SingleZipIterable;->sources:Ljava/lang/Iterable;

    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    move v6, v5

    .end local v5    # "n":I
    .local v6, "n":I
    :goto_0
    :try_start_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lio/reactivex/SingleSource;

    .line 43
    .local v8, "source":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<+TT;>;"
    if-nez v8, :cond_0

    .line 44
    new-instance v9, Ljava/lang/NullPointerException;

    const-string/jumbo v10, "One of the sources is null"

    invoke-direct {v9, v10}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-static {v9, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/SingleObserver;)V

    move v5, v6

    .line 79
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v6    # "n":I
    .end local v8    # "source":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<+TT;>;"
    .restart local v5    # "n":I
    :goto_1
    return-void

    .line 47
    .end local v5    # "n":I
    .restart local v4    # "i$":Ljava/util/Iterator;
    .restart local v6    # "n":I
    .restart local v8    # "source":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<+TT;>;"
    :cond_0
    array-length v9, v1

    if-ne v6, v9, :cond_1

    .line 48
    shr-int/lit8 v9, v6, 0x2

    add-int/2addr v9, v6

    invoke-static {v1, v9}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v9

    move-object v0, v9

    check-cast v0, [Lio/reactivex/SingleSource;

    move-object v1, v0
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 50
    :cond_1
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "n":I
    .restart local v5    # "n":I
    :try_start_2
    aput-object v8, v1, v6
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move v6, v5

    .line 51
    .end local v5    # "n":I
    .restart local v6    # "n":I
    goto :goto_0

    .line 52
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v6    # "n":I
    .end local v8    # "source":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<+TT;>;"
    .restart local v5    # "n":I
    :catch_0
    move-exception v2

    .line 53
    .local v2, "ex":Ljava/lang/Throwable;
    :goto_2
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 54
    invoke-static {v2, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/SingleObserver;)V

    goto :goto_1

    .line 58
    .end local v2    # "ex":Ljava/lang/Throwable;
    .end local v5    # "n":I
    .restart local v4    # "i$":Ljava/util/Iterator;
    .restart local v6    # "n":I
    :cond_2
    if-nez v6, :cond_3

    .line 59
    new-instance v9, Ljava/util/NoSuchElementException;

    invoke-direct {v9}, Ljava/util/NoSuchElementException;-><init>()V

    invoke-static {v9, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/SingleObserver;)V

    move v5, v6

    .line 60
    .end local v6    # "n":I
    .restart local v5    # "n":I
    goto :goto_1

    .line 63
    .end local v5    # "n":I
    .restart local v6    # "n":I
    :cond_3
    const/4 v9, 0x1

    if-ne v6, v9, :cond_4

    .line 64
    const/4 v9, 0x0

    aget-object v9, v1, v9

    new-instance v10, Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver;

    new-instance v11, Lio/reactivex/internal/operators/single/SingleZipIterable$SingletonArrayFunc;

    invoke-direct {v11, p0}, Lio/reactivex/internal/operators/single/SingleZipIterable$SingletonArrayFunc;-><init>(Lio/reactivex/internal/operators/single/SingleZipIterable;)V

    invoke-direct {v10, p1, v11}, Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver;-><init>(Lio/reactivex/SingleObserver;Lio/reactivex/functions/Function;)V

    invoke-interface {v9, v10}, Lio/reactivex/SingleSource;->subscribe(Lio/reactivex/SingleObserver;)V

    move v5, v6

    .line 65
    .end local v6    # "n":I
    .restart local v5    # "n":I
    goto :goto_1

    .line 68
    .end local v5    # "n":I
    .restart local v6    # "n":I
    :cond_4
    new-instance v7, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;

    iget-object v9, p0, Lio/reactivex/internal/operators/single/SingleZipIterable;->zipper:Lio/reactivex/functions/Function;

    invoke-direct {v7, p1, v6, v9}, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;-><init>(Lio/reactivex/SingleObserver;ILio/reactivex/functions/Function;)V

    .line 70
    .local v7, "parent":Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;, "Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator<TT;TR;>;"
    invoke-interface {p1, v7}, Lio/reactivex/SingleObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 72
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_3
    if-ge v3, v6, :cond_6

    .line 73
    invoke-virtual {v7}, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->isDisposed()Z

    move-result v9

    if-eqz v9, :cond_5

    move v5, v6

    .line 74
    .end local v6    # "n":I
    .restart local v5    # "n":I
    goto :goto_1

    .line 77
    .end local v5    # "n":I
    .restart local v6    # "n":I
    :cond_5
    aget-object v9, v1, v3

    iget-object v10, v7, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->observers:[Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver;

    aget-object v10, v10, v3

    invoke-interface {v9, v10}, Lio/reactivex/SingleSource;->subscribe(Lio/reactivex/SingleObserver;)V

    .line 72
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_6
    move v5, v6

    .line 79
    .end local v6    # "n":I
    .restart local v5    # "n":I
    goto :goto_1

    .line 52
    .end local v3    # "i":I
    .end local v5    # "n":I
    .end local v7    # "parent":Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;, "Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator<TT;TR;>;"
    .restart local v6    # "n":I
    :catch_1
    move-exception v2

    move v5, v6

    .end local v6    # "n":I
    .restart local v5    # "n":I
    goto :goto_2
.end method
