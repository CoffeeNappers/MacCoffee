.class final Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;
.super Ljava/lang/Object;
.source "ObservableDematerialize.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableDematerialize;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DematerializeObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/Observer",
        "<",
        "Lio/reactivex/Notification",
        "<TT;>;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field done:Z

.field s:Lio/reactivex/disposables/Disposable;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;, "Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->actual:Lio/reactivex/Observer;

    .line 41
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 55
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;, "Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 56
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 60
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;, "Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 96
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;, "Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->done:Z

    if-eqz v0, :cond_0

    .line 102
    :goto_0
    return-void

    .line 99
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->done:Z

    .line 101
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 86
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;, "Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->done:Z

    if-eqz v0, :cond_0

    .line 87
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 93
    :goto_0
    return-void

    .line 90
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->done:Z

    .line 92
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Lio/reactivex/Notification;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Notification",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;, "Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver<TT;>;"
    .local p1, "t":Lio/reactivex/Notification;, "Lio/reactivex/Notification<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->done:Z

    if-eqz v0, :cond_1

    .line 67
    invoke-virtual {p1}, Lio/reactivex/Notification;->isOnError()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p1}, Lio/reactivex/Notification;->getError()Ljava/lang/Throwable;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 82
    :cond_0
    :goto_0
    return-void

    .line 72
    :cond_1
    invoke-virtual {p1}, Lio/reactivex/Notification;->isOnError()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 73
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 74
    invoke-virtual {p1}, Lio/reactivex/Notification;->getError()Ljava/lang/Throwable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 76
    :cond_2
    invoke-virtual {p1}, Lio/reactivex/Notification;->isOnComplete()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 77
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 78
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->onComplete()V

    goto :goto_0

    .line 80
    :cond_3
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->actual:Lio/reactivex/Observer;

    invoke-virtual {p1}, Lio/reactivex/Notification;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 32
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;, "Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver<TT;>;"
    check-cast p1, Lio/reactivex/Notification;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->onNext(Lio/reactivex/Notification;)V

    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 45
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;, "Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 46
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 48
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 50
    :cond_0
    return-void
.end method
