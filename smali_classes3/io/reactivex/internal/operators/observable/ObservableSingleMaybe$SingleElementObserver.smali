.class final Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;
.super Ljava/lang/Object;
.source "ObservableSingleMaybe.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableSingleMaybe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SingleElementObserver"
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
.field final actual:Lio/reactivex/MaybeObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;"
        }
    .end annotation
.end field

.field done:Z

.field s:Lio/reactivex/disposables/Disposable;

.field value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/MaybeObserver;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;, "Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->actual:Lio/reactivex/MaybeObserver;

    .line 44
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 57
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;, "Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 58
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 62
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;, "Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 92
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;, "Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver<TT;>;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->done:Z

    if-eqz v1, :cond_0

    .line 103
    :goto_0
    return-void

    .line 95
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->done:Z

    .line 96
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->value:Ljava/lang/Object;

    .line 97
    .local v0, "v":Ljava/lang/Object;, "TT;"
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->value:Ljava/lang/Object;

    .line 98
    if-nez v0, :cond_1

    .line 99
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v1}, Lio/reactivex/MaybeObserver;->onComplete()V

    goto :goto_0

    .line 101
    :cond_1
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v1, v0}, Lio/reactivex/MaybeObserver;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 82
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;, "Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->done:Z

    if-eqz v0, :cond_0

    .line 83
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 88
    :goto_0
    return-void

    .line 86
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->done:Z

    .line 87
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;, "Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->done:Z

    if-eqz v0, :cond_0

    .line 78
    :goto_0
    return-void

    .line 71
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->value:Ljava/lang/Object;

    if-eqz v0, :cond_1

    .line 72
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->done:Z

    .line 73
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 74
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->actual:Lio/reactivex/MaybeObserver;

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Sequence contains more than one element!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 77
    :cond_1
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->value:Ljava/lang/Object;

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 48
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;, "Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 50
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v0, p0}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 52
    :cond_0
    return-void
.end method
