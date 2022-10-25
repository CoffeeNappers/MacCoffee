.class public final Lio/reactivex/internal/operators/observable/ObservableUsing;
.super Lio/reactivex/Observable;
.source "ObservableUsing.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableUsing$UsingObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "D:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Observable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final disposer:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-TD;>;"
        }
    .end annotation
.end field

.field final eager:Z

.field final resourceSupplier:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<+TD;>;"
        }
    .end annotation
.end field

.field final sourceSupplier:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TD;+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Callable;Lio/reactivex/functions/Function;Lio/reactivex/functions/Consumer;Z)V
    .locals 0
    .param p4, "eager"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<+TD;>;",
            "Lio/reactivex/functions/Function",
            "<-TD;+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;",
            "Lio/reactivex/functions/Consumer",
            "<-TD;>;Z)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableUsing;, "Lio/reactivex/internal/operators/observable/ObservableUsing<TT;TD;>;"
    .local p1, "resourceSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+TD;>;"
    .local p2, "sourceSupplier":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TD;+Lio/reactivex/ObservableSource<+TT;>;>;"
    .local p3, "disposer":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TD;>;"
    invoke-direct {p0}, Lio/reactivex/Observable;-><init>()V

    .line 36
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableUsing;->resourceSupplier:Ljava/util/concurrent/Callable;

    .line 37
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableUsing;->sourceSupplier:Lio/reactivex/functions/Function;

    .line 38
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableUsing;->disposer:Lio/reactivex/functions/Consumer;

    .line 39
    iput-boolean p4, p0, Lio/reactivex/internal/operators/observable/ObservableUsing;->eager:Z

    .line 40
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/Observer;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableUsing;, "Lio/reactivex/internal/operators/observable/ObservableUsing<TT;TD;>;"
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    :try_start_0
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableUsing;->resourceSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v5}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 56
    .local v2, "resource":Ljava/lang/Object;, "TD;"
    :try_start_1
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableUsing;->sourceSupplier:Lio/reactivex/functions/Function;

    invoke-interface {v5, v2}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/reactivex/ObservableSource;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 70
    .local v3, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    new-instance v4, Lio/reactivex/internal/operators/observable/ObservableUsing$UsingObserver;

    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableUsing;->disposer:Lio/reactivex/functions/Consumer;

    iget-boolean v6, p0, Lio/reactivex/internal/operators/observable/ObservableUsing;->eager:Z

    invoke-direct {v4, p1, v2, v5, v6}, Lio/reactivex/internal/operators/observable/ObservableUsing$UsingObserver;-><init>(Lio/reactivex/Observer;Ljava/lang/Object;Lio/reactivex/functions/Consumer;Z)V

    .line 72
    .local v4, "us":Lio/reactivex/internal/operators/observable/ObservableUsing$UsingObserver;, "Lio/reactivex/internal/operators/observable/ObservableUsing$UsingObserver<TT;TD;>;"
    invoke-interface {v3, v4}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 73
    .end local v2    # "resource":Ljava/lang/Object;, "TD;"
    .end local v3    # "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .end local v4    # "us":Lio/reactivex/internal/operators/observable/ObservableUsing$UsingObserver;, "Lio/reactivex/internal/operators/observable/ObservableUsing$UsingObserver<TT;TD;>;"
    :goto_0
    return-void

    .line 48
    :catch_0
    move-exception v0

    .line 49
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 50
    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/Observer;)V

    goto :goto_0

    .line 57
    .end local v0    # "e":Ljava/lang/Throwable;
    .restart local v2    # "resource":Ljava/lang/Object;, "TD;"
    :catch_1
    move-exception v0

    .line 58
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 60
    :try_start_2
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableUsing;->disposer:Lio/reactivex/functions/Consumer;

    invoke-interface {v5, v2}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 66
    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/Observer;)V

    goto :goto_0

    .line 61
    :catch_2
    move-exception v1

    .line 62
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 63
    new-instance v5, Lio/reactivex/exceptions/CompositeException;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Throwable;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    const/4 v7, 0x1

    aput-object v1, v6, v7

    invoke-direct {v5, v6}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v5, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/Observer;)V

    goto :goto_0
.end method
