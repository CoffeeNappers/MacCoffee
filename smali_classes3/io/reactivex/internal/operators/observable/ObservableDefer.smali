.class public final Lio/reactivex/internal/operators/observable/ObservableDefer;
.super Lio/reactivex/Observable;
.source "ObservableDefer.java"


# annotations
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
.field final supplier:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Callable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDefer;, "Lio/reactivex/internal/operators/observable/ObservableDefer<TT;>;"
    .local p1, "supplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lio/reactivex/ObservableSource<+TT;>;>;"
    invoke-direct {p0}, Lio/reactivex/Observable;-><init>()V

    .line 26
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableDefer;->supplier:Ljava/util/concurrent/Callable;

    .line 27
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/Observer;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDefer;, "Lio/reactivex/internal/operators/observable/ObservableDefer<TT;>;"
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableDefer;->supplier:Ljava/util/concurrent/Callable;

    invoke-interface {v2}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "null publisher supplied"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/ObservableSource;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .local v0, "pub":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    invoke-interface {v0, p1}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 40
    .end local v0    # "pub":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    :goto_0
    return-void

    .line 33
    :catch_0
    move-exception v1

    .line 34
    .local v1, "t":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 35
    invoke-static {v1, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/Observer;)V

    goto :goto_0
.end method
