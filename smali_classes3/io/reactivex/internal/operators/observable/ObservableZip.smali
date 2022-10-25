.class public final Lio/reactivex/internal/operators/observable/ObservableZip;
.super Lio/reactivex/Observable;
.source "ObservableZip.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableZip$ZipObserver;,
        Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;
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
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableZip;, "Lio/reactivex/internal/operators/observable/ObservableZip<TT;TR;>;"
    .local p1, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    .local p2, "sourcesIterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    .local p3, "zipper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-direct {p0}, Lio/reactivex/Observable;-><init>()V

    .line 40
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableZip;->sources:[Lio/reactivex/ObservableSource;

    .line 41
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableZip;->sourcesIterable:Ljava/lang/Iterable;

    .line 42
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableZip;->zipper:Lio/reactivex/functions/Function;

    .line 43
    iput p4, p0, Lio/reactivex/internal/operators/observable/ObservableZip;->bufferSize:I

    .line 44
    iput-boolean p5, p0, Lio/reactivex/internal/operators/observable/ObservableZip;->delayError:Z

    .line 45
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/Observer;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableZip;, "Lio/reactivex/internal/operators/observable/ObservableZip<TT;TR;>;"
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    const/4 v8, 0x0

    .line 50
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableZip;->sources:[Lio/reactivex/ObservableSource;

    .line 51
    .local v5, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    const/4 v1, 0x0

    .line 52
    .local v1, "count":I
    if-nez v5, :cond_1

    .line 53
    const/16 v7, 0x8

    new-array v5, v7, [Lio/reactivex/Observable;

    .line 54
    iget-object v7, p0, Lio/reactivex/internal/operators/observable/ObservableZip;->sourcesIterable:Ljava/lang/Iterable;

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/reactivex/ObservableSource;

    .line 55
    .local v4, "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    array-length v7, v5

    if-ne v1, v7, :cond_0

    .line 56
    shr-int/lit8 v7, v1, 0x2

    add-int/2addr v7, v1

    new-array v0, v7, [Lio/reactivex/ObservableSource;

    .line 57
    .local v0, "b":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    invoke-static {v5, v8, v0, v8, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 58
    move-object v5, v0

    .line 60
    .end local v0    # "b":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    :cond_0
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "count":I
    .local v2, "count":I
    aput-object v4, v5, v1

    move v1, v2

    .line 61
    .end local v2    # "count":I
    .restart local v1    # "count":I
    goto :goto_0

    .line 63
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    :cond_1
    array-length v1, v5

    .line 66
    :cond_2
    if-nez v1, :cond_3

    .line 67
    invoke-static {p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->complete(Lio/reactivex/Observer;)V

    .line 73
    :goto_1
    return-void

    .line 71
    :cond_3
    new-instance v6, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;

    iget-object v7, p0, Lio/reactivex/internal/operators/observable/ObservableZip;->zipper:Lio/reactivex/functions/Function;

    iget-boolean v8, p0, Lio/reactivex/internal/operators/observable/ObservableZip;->delayError:Z

    invoke-direct {v6, p1, v7, v1, v8}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;-><init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;IZ)V

    .line 72
    .local v6, "zc":Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator<TT;TR;>;"
    iget v7, p0, Lio/reactivex/internal/operators/observable/ObservableZip;->bufferSize:I

    invoke-virtual {v6, v5, v7}, Lio/reactivex/internal/operators/observable/ObservableZip$ZipCoordinator;->subscribe([Lio/reactivex/ObservableSource;I)V

    goto :goto_1
.end method
