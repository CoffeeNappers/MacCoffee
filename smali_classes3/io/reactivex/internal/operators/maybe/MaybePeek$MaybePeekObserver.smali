.class final Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;
.super Ljava/lang/Object;
.source "MaybePeek.java"

# interfaces
.implements Lio/reactivex/MaybeObserver;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/maybe/MaybePeek;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MaybePeekObserver"
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

.field final parent:Lio/reactivex/internal/operators/maybe/MaybePeek;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/operators/maybe/MaybePeek",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/MaybeObserver;Lio/reactivex/internal/operators/maybe/MaybePeek;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;",
            "Lio/reactivex/internal/operators/maybe/MaybePeek",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;, "Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    .local p2, "parent":Lio/reactivex/internal/operators/maybe/MaybePeek;, "Lio/reactivex/internal/operators/maybe/MaybePeek<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->actual:Lio/reactivex/MaybeObserver;

    .line 68
    iput-object p2, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->parent:Lio/reactivex/internal/operators/maybe/MaybePeek;

    .line 69
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .prologue
    .line 74
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;, "Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver<TT;>;"
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->parent:Lio/reactivex/internal/operators/maybe/MaybePeek;

    iget-object v1, v1, Lio/reactivex/internal/operators/maybe/MaybePeek;->onDisposeCall:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    :goto_0
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 81
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 82
    return-void

    .line 75
    :catch_0
    move-exception v0

    .line 76
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 77
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 86
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;, "Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method onAfterTerminate()V
    .locals 2

    .prologue
    .line 174
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;, "Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver<TT;>;"
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->parent:Lio/reactivex/internal/operators/maybe/MaybePeek;

    iget-object v1, v1, Lio/reactivex/internal/operators/maybe/MaybePeek;->onAfterTerminate:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    :goto_0
    return-void

    .line 175
    :catch_0
    move-exception v0

    .line 176
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 177
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onComplete()V
    .locals 3

    .prologue
    .line 154
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;, "Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->d:Lio/reactivex/disposables/Disposable;

    sget-object v2, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-ne v1, v2, :cond_0

    .line 170
    :goto_0
    return-void

    .line 159
    :cond_0
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->parent:Lio/reactivex/internal/operators/maybe/MaybePeek;

    iget-object v1, v1, Lio/reactivex/internal/operators/maybe/MaybePeek;->onCompleteCall:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 167
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v1}, Lio/reactivex/MaybeObserver;->onComplete()V

    .line 169
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->onAfterTerminate()V

    goto :goto_0

    .line 160
    :catch_0
    move-exception v0

    .line 161
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 162
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->onErrorInner(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 129
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;, "Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->d:Lio/reactivex/disposables/Disposable;

    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-ne v0, v1, :cond_0

    .line 130
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 135
    :goto_0
    return-void

    .line 134
    :cond_0
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->onErrorInner(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method onErrorInner(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 139
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;, "Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver<TT;>;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->parent:Lio/reactivex/internal/operators/maybe/MaybePeek;

    iget-object v2, v2, Lio/reactivex/internal/operators/maybe/MaybePeek;->onErrorCall:Lio/reactivex/functions/Consumer;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    :goto_0
    sget-object v2, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 147
    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v2, p1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    .line 149
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->onAfterTerminate()V

    .line 150
    return-void

    .line 140
    :catch_0
    move-exception v1

    .line 141
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 142
    new-instance v0, Lio/reactivex/exceptions/CompositeException;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Throwable;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object v1, v2, v3

    invoke-direct {v0, v2}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    .end local p1    # "e":Ljava/lang/Throwable;
    .local v0, "e":Ljava/lang/Throwable;
    move-object p1, v0

    .end local v0    # "e":Ljava/lang/Throwable;
    .restart local p1    # "e":Ljava/lang/Throwable;
    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 2
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 91
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;, "Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v1, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 93
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->parent:Lio/reactivex/internal/operators/maybe/MaybePeek;

    iget-object v1, v1, Lio/reactivex/internal/operators/maybe/MaybePeek;->onSubscribeCall:Lio/reactivex/functions/Consumer;

    invoke-interface {v1, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 104
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v1, p0}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 106
    :cond_0
    :goto_0
    return-void

    .line 94
    :catch_0
    move-exception v0

    .line 95
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 96
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 97
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 98
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-static {v0, v1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/MaybeObserver;)V

    goto :goto_0
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 110
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;, "Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->d:Lio/reactivex/disposables/Disposable;

    sget-object v2, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-ne v1, v2, :cond_0

    .line 125
    :goto_0
    return-void

    .line 114
    :cond_0
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->parent:Lio/reactivex/internal/operators/maybe/MaybePeek;

    iget-object v1, v1, Lio/reactivex/internal/operators/maybe/MaybePeek;->onSuccessCall:Lio/reactivex/functions/Consumer;

    invoke-interface {v1, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 122
    iget-object v1, p0, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v1, p1}, Lio/reactivex/MaybeObserver;->onSuccess(Ljava/lang/Object;)V

    .line 124
    invoke-virtual {p0}, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->onAfterTerminate()V

    goto :goto_0

    .line 115
    :catch_0
    move-exception v0

    .line 116
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 117
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/maybe/MaybePeek$MaybePeekObserver;->onErrorInner(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
