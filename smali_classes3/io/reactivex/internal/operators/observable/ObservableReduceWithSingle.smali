.class public final Lio/reactivex/internal/operators/observable/ObservableReduceWithSingle;
.super Lio/reactivex/Single;
.source "ObservableReduceWithSingle.java"


# annotations
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
.field final reducer:Lio/reactivex/functions/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiFunction",
            "<TR;-TT;TR;>;"
        }
    .end annotation
.end field

.field final seedSupplier:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<TR;>;"
        }
    .end annotation
.end field

.field final source:Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableSource",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/ObservableSource;Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiFunction;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;",
            "Ljava/util/concurrent/Callable",
            "<TR;>;",
            "Lio/reactivex/functions/BiFunction",
            "<TR;-TT;TR;>;)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReduceWithSingle;, "Lio/reactivex/internal/operators/observable/ObservableReduceWithSingle<TT;TR;>;"
    .local p1, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    .local p2, "seedSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TR;>;"
    .local p3, "reducer":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TR;-TT;TR;>;"
    invoke-direct {p0}, Lio/reactivex/Single;-><init>()V

    .line 41
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableReduceWithSingle;->source:Lio/reactivex/ObservableSource;

    .line 42
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableReduceWithSingle;->seedSupplier:Ljava/util/concurrent/Callable;

    .line 43
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableReduceWithSingle;->reducer:Lio/reactivex/functions/BiFunction;

    .line 44
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/SingleObserver;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReduceWithSingle;, "Lio/reactivex/internal/operators/observable/ObservableReduceWithSingle<TT;TR;>;"
    .local p1, "observer":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TR;>;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableReduceWithSingle;->seedSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v2}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The seedSupplier returned a null value"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 57
    .local v1, "seed":Ljava/lang/Object;, "TR;"
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableReduceWithSingle;->source:Lio/reactivex/ObservableSource;

    new-instance v3, Lio/reactivex/internal/operators/observable/ObservableReduceSeedSingle$ReduceSeedObserver;

    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableReduceWithSingle;->reducer:Lio/reactivex/functions/BiFunction;

    invoke-direct {v3, p1, v4, v1}, Lio/reactivex/internal/operators/observable/ObservableReduceSeedSingle$ReduceSeedObserver;-><init>(Lio/reactivex/SingleObserver;Lio/reactivex/functions/BiFunction;Ljava/lang/Object;)V

    invoke-interface {v2, v3}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 58
    .end local v1    # "seed":Ljava/lang/Object;, "TR;"
    :goto_0
    return-void

    .line 52
    :catch_0
    move-exception v0

    .line 53
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 54
    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/SingleObserver;)V

    goto :goto_0
.end method
