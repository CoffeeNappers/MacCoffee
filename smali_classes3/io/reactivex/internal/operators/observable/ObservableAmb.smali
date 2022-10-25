.class public final Lio/reactivex/internal/operators/observable/ObservableAmb;
.super Lio/reactivex/Observable;
.source "ObservableAmb.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;,
        Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Observable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final sources:[Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;"
        }
    .end annotation
.end field

.field final sourcesIterable:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([Lio/reactivex/ObservableSource;Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAmb;, "Lio/reactivex/internal/operators/observable/ObservableAmb<TT;>;"
    .local p1, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    .local p2, "sourcesIterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    invoke-direct {p0}, Lio/reactivex/Observable;-><init>()V

    .line 29
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableAmb;->sources:[Lio/reactivex/ObservableSource;

    .line 30
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableAmb;->sourcesIterable:Ljava/lang/Iterable;

    .line 31
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/Observer;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAmb;, "Lio/reactivex/internal/operators/observable/ObservableAmb<TT;>;"
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    const/4 v10, 0x0

    .line 36
    iget-object v7, p0, Lio/reactivex/internal/operators/observable/ObservableAmb;->sources:[Lio/reactivex/ObservableSource;

    .line 37
    .local v7, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    const/4 v2, 0x0

    .line 38
    .local v2, "count":I
    if-nez v7, :cond_3

    .line 39
    const/16 v8, 0x8

    new-array v7, v8, [Lio/reactivex/Observable;

    .line 41
    :try_start_0
    iget-object v8, p0, Lio/reactivex/internal/operators/observable/ObservableAmb;->sourcesIterable:Ljava/lang/Iterable;

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    move v3, v2

    .end local v2    # "count":I
    .local v3, "count":I
    :goto_0
    :try_start_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lio/reactivex/ObservableSource;

    .line 42
    .local v6, "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    if-nez v6, :cond_0

    .line 43
    new-instance v8, Ljava/lang/NullPointerException;

    const-string/jumbo v9, "One of the sources is null"

    invoke-direct {v8, v9}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-static {v8, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/Observer;)V

    move v2, v3

    .line 73
    .end local v3    # "count":I
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .restart local v2    # "count":I
    :goto_1
    return-void

    .line 46
    .end local v2    # "count":I
    .restart local v3    # "count":I
    .restart local v5    # "i$":Ljava/util/Iterator;
    .restart local v6    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    :cond_0
    array-length v8, v7

    if-ne v3, v8, :cond_1

    .line 47
    shr-int/lit8 v8, v3, 0x2

    add-int/2addr v8, v3

    new-array v1, v8, [Lio/reactivex/ObservableSource;

    .line 48
    .local v1, "b":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v7, v8, v1, v9, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 49
    move-object v7, v1

    .line 51
    .end local v1    # "b":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    :cond_1
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "count":I
    .restart local v2    # "count":I
    :try_start_2
    aput-object v6, v7, v3
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move v3, v2

    .line 52
    .end local v2    # "count":I
    .restart local v3    # "count":I
    goto :goto_0

    .end local v6    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    :cond_2
    move v2, v3

    .line 62
    .end local v3    # "count":I
    .end local v5    # "i$":Ljava/util/Iterator;
    .restart local v2    # "count":I
    :goto_2
    if-nez v2, :cond_4

    .line 63
    invoke-static {p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->complete(Lio/reactivex/Observer;)V

    goto :goto_1

    .line 53
    :catch_0
    move-exception v4

    .line 54
    .local v4, "e":Ljava/lang/Throwable;
    :goto_3
    invoke-static {v4}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 55
    invoke-static {v4, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/Observer;)V

    goto :goto_1

    .line 59
    .end local v4    # "e":Ljava/lang/Throwable;
    :cond_3
    array-length v2, v7

    goto :goto_2

    .line 66
    :cond_4
    const/4 v8, 0x1

    if-ne v2, v8, :cond_5

    .line 67
    aget-object v8, v7, v10

    invoke-interface {v8, p1}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    goto :goto_1

    .line 71
    :cond_5
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;

    invoke-direct {v0, p1, v2}, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;-><init>(Lio/reactivex/Observer;I)V

    .line 72
    .local v0, "ac":Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator<TT;>;"
    invoke-virtual {v0, v7}, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;->subscribe([Lio/reactivex/ObservableSource;)V

    goto :goto_1

    .line 53
    .end local v0    # "ac":Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator<TT;>;"
    .end local v2    # "count":I
    .restart local v3    # "count":I
    .restart local v5    # "i$":Ljava/util/Iterator;
    :catch_1
    move-exception v4

    move v2, v3

    .end local v3    # "count":I
    .restart local v2    # "count":I
    goto :goto_3
.end method
