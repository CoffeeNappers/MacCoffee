.class public final Lio/reactivex/internal/operators/observable/ObservableCollect;
.super Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream;
.source "ObservableCollect.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableCollect$CollectObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream",
        "<TT;TU;>;"
    }
.end annotation


# instance fields
.field final collector:Lio/reactivex/functions/BiConsumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiConsumer",
            "<-TU;-TT;>;"
        }
    .end annotation
.end field

.field final initialSupplier:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<+TU;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/ObservableSource;Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiConsumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;",
            "Ljava/util/concurrent/Callable",
            "<+TU;>;",
            "Lio/reactivex/functions/BiConsumer",
            "<-TU;-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCollect;, "Lio/reactivex/internal/operators/observable/ObservableCollect<TT;TU;>;"
    .local p1, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    .local p2, "initialSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+TU;>;"
    .local p3, "collector":Lio/reactivex/functions/BiConsumer;, "Lio/reactivex/functions/BiConsumer<-TU;-TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream;-><init>(Lio/reactivex/ObservableSource;)V

    .line 31
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableCollect;->initialSupplier:Ljava/util/concurrent/Callable;

    .line 32
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableCollect;->collector:Lio/reactivex/functions/BiConsumer;

    .line 33
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/Observer;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TU;>;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCollect;, "Lio/reactivex/internal/operators/observable/ObservableCollect<TT;TU;>;"
    .local p1, "t":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TU;>;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableCollect;->initialSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v2}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The initialSupplier returned a null value"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 45
    .local v1, "u":Ljava/lang/Object;, "TU;"
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableCollect;->source:Lio/reactivex/ObservableSource;

    new-instance v3, Lio/reactivex/internal/operators/observable/ObservableCollect$CollectObserver;

    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableCollect;->collector:Lio/reactivex/functions/BiConsumer;

    invoke-direct {v3, p1, v1, v4}, Lio/reactivex/internal/operators/observable/ObservableCollect$CollectObserver;-><init>(Lio/reactivex/Observer;Ljava/lang/Object;Lio/reactivex/functions/BiConsumer;)V

    invoke-interface {v2, v3}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 47
    .end local v1    # "u":Ljava/lang/Object;, "TU;"
    :goto_0
    return-void

    .line 40
    :catch_0
    move-exception v0

    .line 41
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/Observer;)V

    goto :goto_0
.end method
