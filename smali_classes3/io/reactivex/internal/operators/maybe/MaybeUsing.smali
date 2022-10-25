.class public final Lio/reactivex/internal/operators/maybe/MaybeUsing;
.super Lio/reactivex/Maybe;
.source "MaybeUsing.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/maybe/MaybeUsing$UsingObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "D:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Maybe",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final eager:Z

.field final resourceDisposer:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-TD;>;"
        }
    .end annotation
.end field

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
            "Lio/reactivex/MaybeSource",
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
            "Lio/reactivex/MaybeSource",
            "<+TT;>;>;",
            "Lio/reactivex/functions/Consumer",
            "<-TD;>;Z)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeUsing;, "Lio/reactivex/internal/operators/maybe/MaybeUsing<TT;TD;>;"
    .local p1, "resourceSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+TD;>;"
    .local p2, "sourceSupplier":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TD;+Lio/reactivex/MaybeSource<+TT;>;>;"
    .local p3, "resourceDisposer":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TD;>;"
    invoke-direct {p0}, Lio/reactivex/Maybe;-><init>()V

    .line 48
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeUsing;->resourceSupplier:Ljava/util/concurrent/Callable;

    .line 49
    iput-object p2, p0, Lio/reactivex/internal/operators/maybe/MaybeUsing;->sourceSupplier:Lio/reactivex/functions/Function;

    .line 50
    iput-object p3, p0, Lio/reactivex/internal/operators/maybe/MaybeUsing;->resourceDisposer:Lio/reactivex/functions/Consumer;

    .line 51
    iput-boolean p4, p0, Lio/reactivex/internal/operators/maybe/MaybeUsing;->eager:Z

    .line 52
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/MaybeObserver;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeUsing;, "Lio/reactivex/internal/operators/maybe/MaybeUsing<TT;TD;>;"
    .local p1, "observer":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    :try_start_0
    iget-object v4, p0, Lio/reactivex/internal/operators/maybe/MaybeUsing;->resourceSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v4}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 69
    .local v2, "resource":Ljava/lang/Object;, "TD;"
    :try_start_1
    iget-object v4, p0, Lio/reactivex/internal/operators/maybe/MaybeUsing;->sourceSupplier:Lio/reactivex/functions/Function;

    invoke-interface {v4, v2}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    const-string/jumbo v5, "The sourceSupplier returned a null MaybeSource"

    invoke-static {v4, v5}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/reactivex/MaybeSource;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 95
    .local v3, "source":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    new-instance v4, Lio/reactivex/internal/operators/maybe/MaybeUsing$UsingObserver;

    iget-object v5, p0, Lio/reactivex/internal/operators/maybe/MaybeUsing;->resourceDisposer:Lio/reactivex/functions/Consumer;

    iget-boolean v6, p0, Lio/reactivex/internal/operators/maybe/MaybeUsing;->eager:Z

    invoke-direct {v4, p1, v2, v5, v6}, Lio/reactivex/internal/operators/maybe/MaybeUsing$UsingObserver;-><init>(Lio/reactivex/MaybeObserver;Ljava/lang/Object;Lio/reactivex/functions/Consumer;Z)V

    invoke-interface {v3, v4}, Lio/reactivex/MaybeSource;->subscribe(Lio/reactivex/MaybeObserver;)V

    .line 96
    .end local v2    # "resource":Ljava/lang/Object;, "TD;"
    .end local v3    # "source":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    :cond_0
    :goto_0
    return-void

    .line 60
    :catch_0
    move-exception v0

    .line 61
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 62
    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/MaybeObserver;)V

    goto :goto_0

    .line 70
    .end local v0    # "ex":Ljava/lang/Throwable;
    .restart local v2    # "resource":Ljava/lang/Object;, "TD;"
    :catch_1
    move-exception v0

    .line 71
    .restart local v0    # "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 72
    iget-boolean v4, p0, Lio/reactivex/internal/operators/maybe/MaybeUsing;->eager:Z

    if-eqz v4, :cond_1

    .line 74
    :try_start_2
    iget-object v4, p0, Lio/reactivex/internal/operators/maybe/MaybeUsing;->resourceDisposer:Lio/reactivex/functions/Consumer;

    invoke-interface {v4, v2}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_3

    .line 82
    :cond_1
    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/MaybeObserver;)V

    .line 84
    iget-boolean v4, p0, Lio/reactivex/internal/operators/maybe/MaybeUsing;->eager:Z

    if-nez v4, :cond_0

    .line 86
    :try_start_3
    iget-object v4, p0, Lio/reactivex/internal/operators/maybe/MaybeUsing;->resourceDisposer:Lio/reactivex/functions/Consumer;

    invoke-interface {v4, v2}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 87
    :catch_2
    move-exception v1

    .line 88
    .local v1, "exc":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 89
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 75
    .end local v1    # "exc":Ljava/lang/Throwable;
    :catch_3
    move-exception v1

    .line 76
    .restart local v1    # "exc":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 77
    new-instance v4, Lio/reactivex/exceptions/CompositeException;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Throwable;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v6, 0x1

    aput-object v1, v5, v6

    invoke-direct {v4, v5}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v4, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/MaybeObserver;)V

    goto :goto_0
.end method
