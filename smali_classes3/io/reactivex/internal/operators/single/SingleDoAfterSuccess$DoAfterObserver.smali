.class final Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;
.super Ljava/lang/Object;
.source "SingleDoAfterSuccess.java"

# interfaces
.implements Lio/reactivex/SingleObserver;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/single/SingleDoAfterSuccess;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DoAfterObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/SingleObserver",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field final actual:Lio/reactivex/SingleObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleObserver",
            "<-TT;>;"
        }
    .end annotation
.end field

.field d:Lio/reactivex/disposables/Disposable;

.field final onAfterSuccess:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/SingleObserver;Lio/reactivex/functions/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;, "Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TT;>;"
    .local p2, "onAfterSuccess":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;->actual:Lio/reactivex/SingleObserver;

    .line 56
    iput-object p2, p0, Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;->onAfterSuccess:Lio/reactivex/functions/Consumer;

    .line 57
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 88
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;, "Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 89
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 93
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;, "Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 83
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;, "Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p1}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    .line 84
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 61
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;, "Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 64
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p0}, Lio/reactivex/SingleObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 66
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;, "Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v1, p1}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    .line 73
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/single/SingleDoAfterSuccess$DoAfterObserver;->onAfterSuccess:Lio/reactivex/functions/Consumer;

    invoke-interface {v1, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    :goto_0
    return-void

    .line 74
    :catch_0
    move-exception v0

    .line 75
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 77
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
