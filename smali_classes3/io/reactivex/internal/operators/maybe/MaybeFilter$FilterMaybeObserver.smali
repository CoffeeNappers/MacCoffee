.class final Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;
.super Ljava/lang/Object;
.source "MaybeFilter.java"

# interfaces
.implements Lio/reactivex/MaybeObserver;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/maybe/MaybeFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FilterMaybeObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/MaybeObserver",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field final actual:Lio/reactivex/MaybeObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;"
        }
    .end annotation
.end field

.field d:Lio/reactivex/disposables/Disposable;

.field final predicate:Lio/reactivex/functions/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/MaybeObserver;Lio/reactivex/functions/Predicate;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    .local p2, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    .line 52
    iput-object p2, p0, Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;->predicate:Lio/reactivex/functions/Predicate;

    .line 53
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .prologue
    .line 57
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 58
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 59
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 60
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 64
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 102
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0}, Lio/reactivex/MaybeObserver;->onComplete()V

    .line 103
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 97
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    .line 98
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 69
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 72
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p0}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 74
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;->predicate:Lio/reactivex/functions/Predicate;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 88
    .local v0, "b":Z
    if-eqz v0, :cond_0

    .line 89
    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v2, p1}, Lio/reactivex/MaybeObserver;->onSuccess(Ljava/lang/Object;)V

    .line 93
    .end local v0    # "b":Z
    :goto_0
    return-void

    .line 82
    :catch_0
    move-exception v1

    .line 83
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 84
    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v2, v1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 91
    .end local v1    # "ex":Ljava/lang/Throwable;
    .restart local v0    # "b":Z
    :cond_0
    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeFilter$FilterMaybeObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v2}, Lio/reactivex/MaybeObserver;->onComplete()V

    goto :goto_0
.end method
