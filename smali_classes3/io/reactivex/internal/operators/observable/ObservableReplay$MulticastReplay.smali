.class final Lio/reactivex/internal/operators/observable/ObservableReplay$MulticastReplay;
.super Lio/reactivex/Observable;
.source "ObservableReplay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableReplay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MulticastReplay"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Observable",
        "<TR;>;"
    }
.end annotation


# instance fields
.field private final connectableFactory:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TU;>;>;"
        }
    .end annotation
.end field

.field private final selector:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<TU;>;+",
            "Lio/reactivex/ObservableSource",
            "<TR;>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TU;>;>;",
            "Lio/reactivex/functions/Function",
            "<-",
            "Lio/reactivex/Observable",
            "<TU;>;+",
            "Lio/reactivex/ObservableSource",
            "<TR;>;>;)V"
        }
    .end annotation

    .prologue
    .line 1019
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$MulticastReplay;, "Lio/reactivex/internal/operators/observable/ObservableReplay$MulticastReplay<TR;TU;>;"
    .local p1, "connectableFactory":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lio/reactivex/observables/ConnectableObservable<TU;>;>;"
    .local p2, "selector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Lio/reactivex/Observable<TU;>;+Lio/reactivex/ObservableSource<TR;>;>;"
    invoke-direct {p0}, Lio/reactivex/Observable;-><init>()V

    .line 1020
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$MulticastReplay;->connectableFactory:Ljava/util/concurrent/Callable;

    .line 1021
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$MulticastReplay;->selector:Lio/reactivex/functions/Function;

    .line 1022
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/Observer;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .line 1029
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$MulticastReplay;, "Lio/reactivex/internal/operators/observable/ObservableReplay$MulticastReplay<TR;TU;>;"
    .local p1, "child":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    :try_start_0
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$MulticastReplay;->connectableFactory:Ljava/util/concurrent/Callable;

    invoke-interface {v4}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/observables/ConnectableObservable;

    .line 1030
    .local v0, "co":Lio/reactivex/observables/ConnectableObservable;, "Lio/reactivex/observables/ConnectableObservable<TU;>;"
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$MulticastReplay;->selector:Lio/reactivex/functions/Function;

    invoke-interface {v4, v0}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/ObservableSource;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 1037
    .local v2, "observable":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TR;>;"
    new-instance v3, Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;

    invoke-direct {v3, p1}, Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;-><init>(Lio/reactivex/Observer;)V

    .line 1039
    .local v3, "srw":Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;, "Lio/reactivex/internal/operators/observable/ObserverResourceWrapper<TR;>;"
    invoke-interface {v2, v3}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 1041
    new-instance v4, Lio/reactivex/internal/operators/observable/ObservableReplay$DisposeConsumer;

    invoke-direct {v4, v3}, Lio/reactivex/internal/operators/observable/ObservableReplay$DisposeConsumer;-><init>(Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;)V

    invoke-virtual {v0, v4}, Lio/reactivex/observables/ConnectableObservable;->connect(Lio/reactivex/functions/Consumer;)V

    .line 1042
    .end local v0    # "co":Lio/reactivex/observables/ConnectableObservable;, "Lio/reactivex/observables/ConnectableObservable<TU;>;"
    .end local v2    # "observable":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TR;>;"
    .end local v3    # "srw":Lio/reactivex/internal/operators/observable/ObserverResourceWrapper;, "Lio/reactivex/internal/operators/observable/ObserverResourceWrapper<TR;>;"
    :goto_0
    return-void

    .line 1031
    :catch_0
    move-exception v1

    .line 1032
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 1033
    invoke-static {v1, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/Observer;)V

    goto :goto_0
.end method
