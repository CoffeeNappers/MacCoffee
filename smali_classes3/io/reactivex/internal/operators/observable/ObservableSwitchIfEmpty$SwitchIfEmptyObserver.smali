.class final Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;
.super Ljava/lang/Object;
.source "ObservableSwitchIfEmpty.java"

# interfaces
.implements Lio/reactivex/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SwitchIfEmptyObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/Observer",
        "<TT;>;"
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

.field final arbiter:Lio/reactivex/internal/disposables/SequentialDisposable;

.field empty:Z

.field final other:Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableSource",
            "<+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/ObservableSource;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;, "Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    .local p2, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;->actual:Lio/reactivex/Observer;

    .line 43
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;->other:Lio/reactivex/ObservableSource;

    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;->empty:Z

    .line 45
    new-instance v0, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;->arbiter:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 46
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 1

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;, "Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;->empty:Z

    if-eqz v0, :cond_0

    .line 69
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;->empty:Z

    .line 70
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;->other:Lio/reactivex/ObservableSource;

    invoke-interface {v0, p0}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 74
    :goto_0
    return-void

    .line 72
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 63
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;, "Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 64
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;, "Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;->empty:Z

    if-eqz v0, :cond_0

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;->empty:Z

    .line 58
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 59
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 50
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;, "Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSwitchIfEmpty$SwitchIfEmptyObserver;->arbiter:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/disposables/SequentialDisposable;->update(Lio/reactivex/disposables/Disposable;)Z

    .line 51
    return-void
.end method
