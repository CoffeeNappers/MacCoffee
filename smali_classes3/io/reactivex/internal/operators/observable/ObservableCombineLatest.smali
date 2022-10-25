.class public final Lio/reactivex/internal/operators/observable/ObservableCombineLatest;
.super Lio/reactivex/Observable;
.source "ObservableCombineLatest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;,
        Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Observable",
        "<TR;>;"
    }
.end annotation


# instance fields
.field final bufferSize:I

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

.field final delayError:Z

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
.method public constructor <init>([Lio/reactivex/ObservableSource;Ljava/lang/Iterable;Lio/reactivex/functions/Function;IZ)V
    .locals 0
    .param p4, "bufferSize"    # I
    .param p5, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;IZ)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCombineLatest;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest<TT;TR;>;"
    .local p1, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    .local p2, "sourcesIterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    .local p3, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-direct {p0}, Lio/reactivex/Observable;-><init>()V

    .line 40
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;->sources:[Lio/reactivex/ObservableSource;

    .line 41
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;->sourcesIterable:Ljava/lang/Iterable;

    .line 42
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;->combiner:Lio/reactivex/functions/Function;

    .line 43
    iput p4, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;->bufferSize:I

    .line 44
    iput-boolean p5, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;->delayError:Z

    .line 45
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/Observer;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCombineLatest;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest<TT;TR;>;"
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    const/4 v2, 0x0

    .line 51
    iget-object v10, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;->sources:[Lio/reactivex/ObservableSource;

    .line 52
    .local v10, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    const/4 v3, 0x0

    .line 53
    .local v3, "count":I
    if-nez v10, :cond_1

    .line 54
    const/16 v1, 0x8

    new-array v10, v1, [Lio/reactivex/Observable;

    .line 55
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;->sourcesIterable:Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lio/reactivex/ObservableSource;

    .line 56
    .local v9, "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    array-length v1, v10

    if-ne v3, v1, :cond_0

    .line 57
    shr-int/lit8 v1, v3, 0x2

    add-int/2addr v1, v3

    new-array v6, v1, [Lio/reactivex/ObservableSource;

    .line 58
    .local v6, "b":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    invoke-static {v10, v2, v6, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 59
    move-object v10, v6

    .line 61
    .end local v6    # "b":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    :cond_0
    add-int/lit8 v7, v3, 0x1

    .end local v3    # "count":I
    .local v7, "count":I
    aput-object v9, v10, v3

    move v3, v7

    .line 62
    .end local v7    # "count":I
    .restart local v3    # "count":I
    goto :goto_0

    .line 64
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v9    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    :cond_1
    array-length v3, v10

    .line 67
    :cond_2
    if-nez v3, :cond_3

    .line 68
    invoke-static {p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->complete(Lio/reactivex/Observer;)V

    .line 74
    :goto_1
    return-void

    .line 72
    :cond_3
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;

    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;->combiner:Lio/reactivex/functions/Function;

    iget v4, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;->bufferSize:I

    iget-boolean v5, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest;->delayError:Z

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;-><init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;IIZ)V

    .line 73
    .local v0, "lc":Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator<TT;TR;>;"
    invoke-virtual {v0, v10}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->subscribe([Lio/reactivex/ObservableSource;)V

    goto :goto_1
.end method
