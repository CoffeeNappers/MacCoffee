.class final Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;
.super Ljava/lang/Object;
.source "ObservableAllSingle.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableAllSingle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "AllObserver"
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
.field final actual:Lio/reactivex/SingleObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleObserver",
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
.method constructor <init>(Lio/reactivex/SingleObserver;Lio/reactivex/functions/Predicate;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-",
            "Ljava/lang/Boolean;",
            ">;",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;, "Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-Ljava/lang/Boolean;>;"
    .local p2, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->actual:Lio/reactivex/SingleObserver;

    .line 52
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->predicate:Lio/reactivex/functions/Predicate;

    .line 53
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 104
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;, "Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 105
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 109
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;, "Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;, "Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver<TT;>;"
    const/4 v1, 0x1

    .line 95
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->done:Z

    if-eqz v0, :cond_0

    .line 100
    :goto_0
    return-void

    .line 98
    :cond_0
    iput-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->done:Z

    .line 99
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->actual:Lio/reactivex/SingleObserver;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 85
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;, "Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->done:Z

    if-eqz v0, :cond_0

    .line 86
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 91
    :goto_0
    return-void

    .line 89
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->done:Z

    .line 90
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p1}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

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
    .line 64
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;, "Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->done:Z

    if-eqz v2, :cond_1

    .line 81
    :cond_0
    :goto_0
    return-void

    .line 69
    :cond_1
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->predicate:Lio/reactivex/functions/Predicate;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 76
    .local v0, "b":Z
    if-nez v0, :cond_0

    .line 77
    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->done:Z

    .line 78
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v2}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 79
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->actual:Lio/reactivex/SingleObserver;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v2, v3}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0

    .line 70
    .end local v0    # "b":Z
    :catch_0
    move-exception v1

    .line 71
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 72
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v2}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 73
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 56
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;, "Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 57
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 58
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAllSingle$AllObserver;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p0}, Lio/reactivex/SingleObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 60
    :cond_0
    return-void
.end method
