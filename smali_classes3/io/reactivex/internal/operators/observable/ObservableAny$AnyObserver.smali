.class final Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;
.super Ljava/lang/Object;
.source "ObservableAny.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableAny;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "AnyObserver"
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
            "<-",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field done:Z

.field final predicate:Lio/reactivex/functions/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;"
        }
    .end annotation
.end field

.field s:Lio/reactivex/disposables/Disposable;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Predicate;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-",
            "Ljava/lang/Boolean;",
            ">;",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;, "Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Ljava/lang/Boolean;>;"
    .local p2, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->actual:Lio/reactivex/Observer;

    .line 45
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->predicate:Lio/reactivex/functions/Predicate;

    .line 46
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 99
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;, "Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 100
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 104
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;, "Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 90
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;, "Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->done:Z

    if-nez v0, :cond_0

    .line 91
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->done:Z

    .line 92
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->actual:Lio/reactivex/Observer;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 93
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 95
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 79
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;, "Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->done:Z

    if-eqz v0, :cond_0

    .line 80
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 86
    :goto_0
    return-void

    .line 84
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->done:Z

    .line 85
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

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
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;, "Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v3, 0x1

    .line 57
    iget-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->done:Z

    if-eqz v2, :cond_1

    .line 75
    :cond_0
    :goto_0
    return-void

    .line 62
    :cond_1
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->predicate:Lio/reactivex/functions/Predicate;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 69
    .local v0, "b":Z
    if-eqz v0, :cond_0

    .line 70
    iput-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->done:Z

    .line 71
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v2}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 72
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->actual:Lio/reactivex/Observer;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v2, v3}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 73
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 63
    .end local v0    # "b":Z
    :catch_0
    move-exception v1

    .line 64
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 65
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v2}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 66
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 49
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;, "Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 50
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 51
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAny$AnyObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 53
    :cond_0
    return-void
.end method
