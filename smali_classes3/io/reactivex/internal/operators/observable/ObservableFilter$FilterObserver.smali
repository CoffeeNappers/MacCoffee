.class final Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver;
.super Lio/reactivex/internal/observers/BasicFuseableObserver;
.source "ObservableFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FilterObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/observers/BasicFuseableObserver",
        "<TT;TT;>;"
    }
.end annotation


# instance fields
.field final filter:Lio/reactivex/functions/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Predicate;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 37
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver;, "Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    .local p2, "filter":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/observers/BasicFuseableObserver;-><init>(Lio/reactivex/Observer;)V

    .line 38
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver;->filter:Lio/reactivex/functions/Predicate;

    .line 39
    return-void
.end method


# virtual methods
.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver;, "Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget v2, p0, Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver;->sourceMode:I

    if-nez v2, :cond_1

    .line 46
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver;->filter:Lio/reactivex/functions/Predicate;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 51
    .local v0, "b":Z
    if-eqz v0, :cond_0

    .line 52
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 57
    .end local v0    # "b":Z
    :cond_0
    :goto_0
    return-void

    .line 47
    :catch_0
    move-exception v1

    .line 48
    .local v1, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver;->fail(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 55
    .end local v1    # "e":Ljava/lang/Throwable;
    :cond_1
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver;->actual:Lio/reactivex/Observer;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public poll()Ljava/lang/Object;
    .locals 2
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
    .line 68
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver;, "Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver<TT;>;"
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver;->qs:Lio/reactivex/internal/fuseable/QueueDisposable;

    invoke-interface {v1}, Lio/reactivex/internal/fuseable/QueueDisposable;->poll()Ljava/lang/Object;

    move-result-object v0

    .line 69
    .local v0, "v":Ljava/lang/Object;, "TT;"
    if-eqz v0, :cond_1

    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver;->filter:Lio/reactivex/functions/Predicate;

    invoke-interface {v1, v0}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 70
    :cond_1
    return-object v0
.end method

.method public requestFusion(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 61
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver;, "Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver<TT;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/observable/ObservableFilter$FilterObserver;->transitiveBoundaryFusion(I)I

    move-result v0

    return v0
.end method
