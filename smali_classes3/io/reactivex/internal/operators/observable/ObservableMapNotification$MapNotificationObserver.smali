.class final Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;
.super Ljava/lang/Object;
.source "ObservableMapNotification.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableMapNotification;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MapNotificationObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;"
        }
    .end annotation
.end field

.field final onCompleteSupplier:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;"
        }
    .end annotation
.end field

.field final onErrorMapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/lang/Throwable;",
            "+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;"
        }
    .end annotation
.end field

.field final onNextMapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;"
        }
    .end annotation
.end field

.field s:Lio/reactivex/disposables/Disposable;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Ljava/util/concurrent/Callable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/lang/Throwable;",
            "+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lio/reactivex/ObservableSource",
            "<+TR;>;>;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;, "Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver<TT;TR;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/ObservableSource<+TR;>;>;"
    .local p2, "onNextMapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TR;>;>;"
    .local p3, "onErrorMapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/lang/Throwable;+Lio/reactivex/ObservableSource<+TR;>;>;"
    .local p4, "onCompleteSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lio/reactivex/ObservableSource<+TR;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->actual:Lio/reactivex/Observer;

    .line 61
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->onNextMapper:Lio/reactivex/functions/Function;

    .line 62
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->onErrorMapper:Lio/reactivex/functions/Function;

    .line 63
    iput-object p4, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->onCompleteSupplier:Ljava/util/concurrent/Callable;

    .line 64
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 77
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;, "Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 78
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 82
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;, "Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 4

    .prologue
    .line 122
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;, "Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver<TT;TR;>;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->onCompleteSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v2}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The onComplete publisher returned is null"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/ObservableSource;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    .local v1, "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TR;>;"
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, v1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 130
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2}, Lio/reactivex/Observer;->onComplete()V

    .line 131
    .end local v1    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TR;>;"
    :goto_0
    return-void

    .line 123
    :catch_0
    move-exception v0

    .line 124
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 125
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 106
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;, "Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver<TT;TR;>;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->onErrorMapper:Lio/reactivex/functions/Function;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The onError publisher returned is null"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/ObservableSource;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    .local v1, "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TR;>;"
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, v1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 114
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2}, Lio/reactivex/Observer;->onComplete()V

    .line 115
    .end local v1    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TR;>;"
    :goto_0
    return-void

    .line 107
    :catch_0
    move-exception v0

    .line 108
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 109
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 91
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;, "Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver<TT;TR;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->onNextMapper:Lio/reactivex/functions/Function;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The onNext publisher returned is null"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/ObservableSource;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    .local v1, "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TR;>;"
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, v1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 99
    .end local v1    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TR;>;"
    :goto_0
    return-void

    .line 92
    :catch_0
    move-exception v0

    .line 93
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 94
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;, "Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 70
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableMapNotification$MapNotificationObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 72
    :cond_0
    return-void
.end method
