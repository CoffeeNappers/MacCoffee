.class final Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;
.super Lio/reactivex/internal/observers/BasicFuseableObserver;
.source "ObservableDistinctUntilChanged.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DistinctUntilChangedObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "K:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/observers/BasicFuseableObserver",
        "<TT;TT;>;"
    }
.end annotation


# instance fields
.field final comparer:Lio/reactivex/functions/BiPredicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiPredicate",
            "<-TK;-TK;>;"
        }
    .end annotation
.end field

.field hasValue:Z

.field final keySelector:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;TK;>;"
        }
    .end annotation
.end field

.field last:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;Lio/reactivex/functions/BiPredicate;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;TK;>;",
            "Lio/reactivex/functions/BiPredicate",
            "<-TK;-TK;>;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;, "Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver<TT;TK;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    .local p2, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;TK;>;"
    .local p3, "comparer":Lio/reactivex/functions/BiPredicate;, "Lio/reactivex/functions/BiPredicate<-TK;-TK;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/observers/BasicFuseableObserver;-><init>(Lio/reactivex/Observer;)V

    .line 52
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->keySelector:Lio/reactivex/functions/Function;

    .line 53
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->comparer:Lio/reactivex/functions/BiPredicate;

    .line 54
    return-void
.end method


# virtual methods
.method public onNext(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;, "Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver<TT;TK;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->done:Z

    if-eqz v3, :cond_1

    .line 86
    :cond_0
    :goto_0
    return-void

    .line 61
    :cond_1
    iget v3, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->sourceMode:I

    if-eqz v3, :cond_2

    .line 62
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 69
    :cond_2
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->keySelector:Lio/reactivex/functions/Function;

    invoke-interface {v3, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 70
    .local v2, "key":Ljava/lang/Object;, "TK;"
    iget-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->hasValue:Z

    if-eqz v3, :cond_3

    .line 71
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->comparer:Lio/reactivex/functions/BiPredicate;

    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->last:Ljava/lang/Object;

    invoke-interface {v3, v4, v2}, Lio/reactivex/functions/BiPredicate;->test(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    .line 72
    .local v0, "equal":Z
    iput-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->last:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    if-nez v0, :cond_0

    .line 85
    .end local v0    # "equal":Z
    :goto_1
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 77
    :cond_3
    const/4 v3, 0x1

    :try_start_1
    iput-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->hasValue:Z

    .line 78
    iput-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->last:Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 80
    .end local v2    # "key":Ljava/lang/Object;, "TK;"
    :catch_0
    move-exception v1

    .line 81
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->fail(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public poll()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 97
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;, "Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver<TT;TK;>;"
    :goto_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->qs:Lio/reactivex/internal/fuseable/QueueDisposable;

    invoke-interface {v2}, Lio/reactivex/internal/fuseable/QueueDisposable;->poll()Ljava/lang/Object;

    move-result-object v1

    .line 98
    .local v1, "v":Ljava/lang/Object;, "TT;"
    if-nez v1, :cond_0

    .line 99
    const/4 v1, 0x0

    .line 110
    .end local v1    # "v":Ljava/lang/Object;, "TT;"
    :goto_1
    return-object v1

    .line 101
    .restart local v1    # "v":Ljava/lang/Object;, "TT;"
    :cond_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->keySelector:Lio/reactivex/functions/Function;

    invoke-interface {v2, v1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 102
    .local v0, "key":Ljava/lang/Object;, "TK;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->hasValue:Z

    if-nez v2, :cond_1

    .line 103
    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->hasValue:Z

    .line 104
    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->last:Ljava/lang/Object;

    goto :goto_1

    .line 108
    :cond_1
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->comparer:Lio/reactivex/functions/BiPredicate;

    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->last:Ljava/lang/Object;

    invoke-interface {v2, v3, v0}, Lio/reactivex/functions/BiPredicate;->test(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 109
    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->last:Ljava/lang/Object;

    goto :goto_1

    .line 112
    :cond_2
    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->last:Ljava/lang/Object;

    goto :goto_0
.end method

.method public requestFusion(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 90
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;, "Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver<TT;TK;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/observable/ObservableDistinctUntilChanged$DistinctUntilChangedObserver;->transitiveBoundaryFusion(I)I

    move-result v0

    return v0
.end method
