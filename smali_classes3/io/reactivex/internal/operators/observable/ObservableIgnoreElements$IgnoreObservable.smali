.class final Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable;
.super Ljava/lang/Object;
.source "ObservableIgnoreElements.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableIgnoreElements;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "IgnoreObservable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
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
            "<-TT;>;"
        }
    .end annotation
.end field

.field d:Lio/reactivex/disposables/Disposable;


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
    .line 35
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable;, "Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable<TT;>;"
    .local p1, "t":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable;->actual:Lio/reactivex/Observer;

    .line 37
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 62
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable;, "Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 63
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 67
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable;, "Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 57
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable;, "Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 58
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 52
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable;, "Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 53
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable;, "Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable<TT;>;"
    .local p1, "v":Ljava/lang/Object;, "TT;"
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 41
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable;, "Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable<TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable;->d:Lio/reactivex/disposables/Disposable;

    .line 42
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableIgnoreElements$IgnoreObservable;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 43
    return-void
.end method
