.class public final Lio/reactivex/internal/operators/observable/ObservablePublish;
.super Lio/reactivex/observables/ConnectableObservable;
.source "ObservablePublish.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/HasUpstreamObservableSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservablePublish$PublishSource;,
        Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;,
        Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/observables/ConnectableObservable",
        "<TT;>;",
        "Lio/reactivex/internal/fuseable/HasUpstreamObservableSource",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final current:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final onSubscribe:Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableSource",
            "<TT;>;"
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
.method private constructor <init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;",
            "Lio/reactivex/ObservableSource",
            "<TT;>;",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver",
            "<TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservablePublish;, "Lio/reactivex/internal/operators/observable/ObservablePublish<TT;>;"
    .local p1, "onSubscribe":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    .local p2, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    .local p3, "current":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver<TT;>;>;"
    invoke-direct {p0}, Lio/reactivex/observables/ConnectableObservable;-><init>()V

    .line 56
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservablePublish;->onSubscribe:Lio/reactivex/ObservableSource;

    .line 57
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservablePublish;->source:Lio/reactivex/ObservableSource;

    .line 58
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservablePublish;->current:Ljava/util/concurrent/atomic/AtomicReference;

    .line 59
    return-void
.end method

.method public static create(Lio/reactivex/ObservableSource;)Lio/reactivex/observables/ConnectableObservable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;)",
            "Lio/reactivex/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 50
    .local v0, "curr":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver<TT;>;>;"
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishSource;

    invoke-direct {v1, v0}, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishSource;-><init>(Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 51
    .local v1, "onSubscribe":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    new-instance v2, Lio/reactivex/internal/operators/observable/ObservablePublish;

    invoke-direct {v2, v1, p0, v0}, Lio/reactivex/internal/operators/observable/ObservablePublish;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Ljava/util/concurrent/atomic/AtomicReference;)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/observables/ConnectableObservable;)Lio/reactivex/observables/ConnectableObservable;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public connect(Lio/reactivex/functions/Consumer;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Lio/reactivex/disposables/Disposable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservablePublish;, "Lio/reactivex/internal/operators/observable/ObservablePublish<TT;>;"
    .local p1, "connection":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Lio/reactivex/disposables/Disposable;>;"
    const/4 v0, 0x1

    const/4 v4, 0x0

    .line 78
    :cond_0
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservablePublish;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;

    .line 80
    .local v2, "ps":Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;, "Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver<TT;>;"
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->isDisposed()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 82
    :cond_1
    new-instance v3, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;

    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservablePublish;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v3, v5}, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;-><init>(Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 84
    .local v3, "u":Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;, "Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver<TT;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservablePublish;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 89
    move-object v2, v3

    .line 93
    .end local v3    # "u":Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;, "Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver<TT;>;"
    :cond_2
    iget-object v5, v2, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v5

    if-nez v5, :cond_4

    iget-object v5, v2, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5, v4, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 110
    .local v0, "doConnect":Z
    :goto_0
    :try_start_0
    invoke-interface {p1, v2}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    if-eqz v0, :cond_3

    .line 116
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservablePublish;->source:Lio/reactivex/ObservableSource;

    invoke-interface {v4, v2}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 118
    :cond_3
    return-void

    .end local v0    # "doConnect":Z
    :cond_4
    move v0, v4

    .line 93
    goto :goto_0

    .line 111
    .restart local v0    # "doConnect":Z
    :catch_0
    move-exception v1

    .line 112
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 113
    invoke-static {v1}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4
.end method

.method public source()Lio/reactivex/ObservableSource;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/ObservableSource",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 63
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservablePublish;, "Lio/reactivex/internal/operators/observable/ObservablePublish<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservablePublish;->source:Lio/reactivex/ObservableSource;

    return-object v0
.end method

.method protected subscribeActual(Lio/reactivex/Observer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservablePublish;, "Lio/reactivex/internal/operators/observable/ObservablePublish<TT;>;"
    .local p1, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservablePublish;->onSubscribe:Lio/reactivex/ObservableSource;

    invoke-interface {v0, p1}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 69
    return-void
.end method
