.class final Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarXMapObservable;
.super Lio/reactivex/Observable;
.source "ObservableScalarXMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableScalarXMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ScalarXMapObservable"
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
.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;"
        }
    .end annotation
.end field

.field final value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Object;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;)V"
        }
    .end annotation

    .prologue
    .line 132
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarXMapObservable;, "Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarXMapObservable<TT;TR;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    invoke-direct {p0}, Lio/reactivex/Observable;-><init>()V

    .line 133
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarXMapObservable;->value:Ljava/lang/Object;

    .line 134
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarXMapObservable;->mapper:Lio/reactivex/functions/Function;

    .line 135
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/Observer;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .line 142
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarXMapObservable;, "Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarXMapObservable<TT;TR;>;"
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    :try_start_0
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarXMapObservable;->mapper:Lio/reactivex/functions/Function;

    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarXMapObservable;->value:Ljava/lang/Object;

    invoke-interface {v5, v6}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string/jumbo v6, "The mapper returned a null ObservableSource"

    invoke-static {v5, v6}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/ObservableSource;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 147
    .local v2, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TR;>;"
    instance-of v5, v2, Ljava/util/concurrent/Callable;

    if-eqz v5, :cond_1

    .line 151
    :try_start_1
    check-cast v2, Ljava/util/concurrent/Callable;

    .end local v2    # "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TR;>;"
    invoke-interface {v2}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 158
    .local v4, "u":Ljava/lang/Object;, "TR;"
    if-nez v4, :cond_0

    .line 159
    invoke-static {p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->complete(Lio/reactivex/Observer;)V

    .line 168
    .end local v4    # "u":Ljava/lang/Object;, "TR;"
    :goto_0
    return-void

    .line 143
    :catch_0
    move-exception v0

    .line 144
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/Observer;)V

    goto :goto_0

    .line 152
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_1
    move-exception v1

    .line 153
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 154
    invoke-static {v1, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/Observer;)V

    goto :goto_0

    .line 162
    .end local v1    # "ex":Ljava/lang/Throwable;
    .restart local v4    # "u":Ljava/lang/Object;, "TR;"
    :cond_0
    new-instance v3, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;

    invoke-direct {v3, p1, v4}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;-><init>(Lio/reactivex/Observer;Ljava/lang/Object;)V

    .line 163
    .local v3, "sd":Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;, "Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable<TR;>;"
    invoke-interface {p1, v3}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 164
    invoke-virtual {v3}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->run()V

    goto :goto_0

    .line 166
    .end local v3    # "sd":Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;, "Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable<TR;>;"
    .end local v4    # "u":Ljava/lang/Object;, "TR;"
    .restart local v2    # "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TR;>;"
    :cond_1
    invoke-interface {v2, p1}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    goto :goto_0
.end method
