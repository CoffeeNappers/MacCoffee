.class final Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;
.super Ljava/lang/Object;
.source "ObservableDetach.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableDetach;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DetachObserver"
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
.field actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field

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
    .line 44
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;, "Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;->actual:Lio/reactivex/Observer;

    .line 46
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .prologue
    .line 50
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;, "Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 51
    .local v0, "s":Lio/reactivex/disposables/Disposable;
    sget-object v1, Lio/reactivex/internal/util/EmptyComponent;->INSTANCE:Lio/reactivex/internal/util/EmptyComponent;

    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 52
    invoke-static {}, Lio/reactivex/internal/util/EmptyComponent;->asObserver()Lio/reactivex/Observer;

    move-result-object v1

    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;->actual:Lio/reactivex/Observer;

    .line 53
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 54
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 58
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;, "Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 85
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;, "Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;->actual:Lio/reactivex/Observer;

    .line 86
    .local v0, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    sget-object v1, Lio/reactivex/internal/util/EmptyComponent;->INSTANCE:Lio/reactivex/internal/util/EmptyComponent;

    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 87
    invoke-static {}, Lio/reactivex/internal/util/EmptyComponent;->asObserver()Lio/reactivex/Observer;

    move-result-object v1

    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;->actual:Lio/reactivex/Observer;

    .line 88
    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 89
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 77
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;, "Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;->actual:Lio/reactivex/Observer;

    .line 78
    .local v0, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    sget-object v1, Lio/reactivex/internal/util/EmptyComponent;->INSTANCE:Lio/reactivex/internal/util/EmptyComponent;

    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 79
    invoke-static {}, Lio/reactivex/internal/util/EmptyComponent;->asObserver()Lio/reactivex/Observer;

    move-result-object v1

    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;->actual:Lio/reactivex/Observer;

    .line 80
    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 81
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
    .line 72
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;, "Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 73
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 63
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;, "Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 64
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 66
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDetach$DetachObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 68
    :cond_0
    return-void
.end method
