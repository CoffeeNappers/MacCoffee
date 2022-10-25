.class public final Lio/reactivex/observers/SafeObserver;
.super Ljava/lang/Object;
.source "SafeObserver.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
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

.field done:Z

.field s:Lio/reactivex/disposables/Disposable;


# direct methods
.method public constructor <init>(Lio/reactivex/Observer;)V
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
    .local p0, "this":Lio/reactivex/observers/SafeObserver;, "Lio/reactivex/observers/SafeObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lio/reactivex/observers/SafeObserver;->actual:Lio/reactivex/Observer;

    .line 41
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/observers/SafeObserver;, "Lio/reactivex/observers/SafeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/observers/SafeObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 69
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 73
    .local p0, "this":Lio/reactivex/observers/SafeObserver;, "Lio/reactivex/observers/SafeObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/observers/SafeObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 180
    .local p0, "this":Lio/reactivex/observers/SafeObserver;, "Lio/reactivex/observers/SafeObserver<TT;>;"
    iget-boolean v1, p0, Lio/reactivex/observers/SafeObserver;->done:Z

    if-eqz v1, :cond_0

    .line 197
    :goto_0
    return-void

    .line 184
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/observers/SafeObserver;->done:Z

    .line 186
    iget-object v1, p0, Lio/reactivex/observers/SafeObserver;->s:Lio/reactivex/disposables/Disposable;

    if-nez v1, :cond_1

    .line 187
    invoke-virtual {p0}, Lio/reactivex/observers/SafeObserver;->onCompleteNoSubscription()V

    goto :goto_0

    .line 192
    :cond_1
    :try_start_0
    iget-object v1, p0, Lio/reactivex/observers/SafeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v1}, Lio/reactivex/Observer;->onComplete()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 193
    :catch_0
    move-exception v0

    .line 194
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 195
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method onCompleteNoSubscription()V
    .locals 7

    .prologue
    .local p0, "this":Lio/reactivex/observers/SafeObserver;, "Lio/reactivex/observers/SafeObserver<TT;>;"
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 201
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "Subscription not set!"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 204
    .local v1, "ex":Ljava/lang/Throwable;
    :try_start_0
    iget-object v2, p0, Lio/reactivex/observers/SafeObserver;->actual:Lio/reactivex/Observer;

    sget-object v3, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    invoke-interface {v2, v3}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 212
    :try_start_1
    iget-object v2, p0, Lio/reactivex/observers/SafeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, v1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 218
    :goto_0
    return-void

    .line 205
    :catch_0
    move-exception v0

    .line 206
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 208
    new-instance v2, Lio/reactivex/exceptions/CompositeException;

    new-array v3, v6, [Ljava/lang/Throwable;

    aput-object v1, v3, v4

    aput-object v0, v3, v5

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 213
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 214
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 216
    new-instance v2, Lio/reactivex/exceptions/CompositeException;

    new-array v3, v6, [Ljava/lang/Throwable;

    aput-object v1, v3, v4

    aput-object v0, v3, v5

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 11
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .local p0, "this":Lio/reactivex/observers/SafeObserver;, "Lio/reactivex/observers/SafeObserver<TT;>;"
    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 138
    iget-boolean v3, p0, Lio/reactivex/observers/SafeObserver;->done:Z

    if-eqz v3, :cond_0

    .line 139
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 176
    :goto_0
    return-void

    .line 142
    :cond_0
    iput-boolean v7, p0, Lio/reactivex/observers/SafeObserver;->done:Z

    .line 144
    iget-object v3, p0, Lio/reactivex/observers/SafeObserver;->s:Lio/reactivex/disposables/Disposable;

    if-nez v3, :cond_1

    .line 145
    new-instance v2, Ljava/lang/NullPointerException;

    const-string/jumbo v3, "Subscription not set!"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 148
    .local v2, "npe":Ljava/lang/Throwable;
    :try_start_0
    iget-object v3, p0, Lio/reactivex/observers/SafeObserver;->actual:Lio/reactivex/Observer;

    sget-object v4, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    invoke-interface {v3, v4}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 156
    :try_start_1
    iget-object v3, p0, Lio/reactivex/observers/SafeObserver;->actual:Lio/reactivex/Observer;

    new-instance v4, Lio/reactivex/exceptions/CompositeException;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Throwable;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object v2, v5, v6

    invoke-direct {v4, v5}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-interface {v3, v4}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 157
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 160
    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    new-array v4, v10, [Ljava/lang/Throwable;

    aput-object p1, v4, v8

    aput-object v2, v4, v7

    aput-object v0, v4, v9

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v3}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 149
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 150
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 152
    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    new-array v4, v10, [Ljava/lang/Throwable;

    aput-object p1, v4, v8

    aput-object v2, v4, v7

    aput-object v0, v4, v9

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v3}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 165
    .end local v0    # "e":Ljava/lang/Throwable;
    .end local v2    # "npe":Ljava/lang/Throwable;
    :cond_1
    if-nez p1, :cond_2

    .line 166
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "t":Ljava/lang/Throwable;
    const-string/jumbo v3, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {p1, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 170
    .restart local p1    # "t":Ljava/lang/Throwable;
    :cond_2
    :try_start_2
    iget-object v3, p0, Lio/reactivex/observers/SafeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 171
    :catch_2
    move-exception v1

    .line 172
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 174
    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    new-array v4, v9, [Ljava/lang/Throwable;

    aput-object p1, v4, v8

    aput-object v1, v4, v7

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v3}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/observers/SafeObserver;, "Lio/reactivex/observers/SafeObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v4, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 78
    iget-boolean v3, p0, Lio/reactivex/observers/SafeObserver;->done:Z

    if-eqz v3, :cond_0

    .line 112
    :goto_0
    return-void

    .line 81
    :cond_0
    iget-object v3, p0, Lio/reactivex/observers/SafeObserver;->s:Lio/reactivex/disposables/Disposable;

    if-nez v3, :cond_1

    .line 82
    invoke-virtual {p0}, Lio/reactivex/observers/SafeObserver;->onNextNoSubscription()V

    goto :goto_0

    .line 86
    :cond_1
    if-nez p1, :cond_2

    .line 87
    new-instance v2, Ljava/lang/NullPointerException;

    const-string/jumbo v3, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 89
    .local v2, "ex":Ljava/lang/Throwable;
    :try_start_0
    iget-object v3, p0, Lio/reactivex/observers/SafeObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v3}, Lio/reactivex/disposables/Disposable;->dispose()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    invoke-virtual {p0, v2}, Lio/reactivex/observers/SafeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 90
    :catch_0
    move-exception v1

    .line 91
    .local v1, "e1":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 92
    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    new-array v4, v4, [Ljava/lang/Throwable;

    aput-object v2, v4, v5

    aput-object v1, v4, v6

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-virtual {p0, v3}, Lio/reactivex/observers/SafeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 100
    .end local v1    # "e1":Ljava/lang/Throwable;
    .end local v2    # "ex":Ljava/lang/Throwable;
    :cond_2
    :try_start_1
    iget-object v3, p0, Lio/reactivex/observers/SafeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 101
    :catch_1
    move-exception v0

    .line 102
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 104
    :try_start_2
    iget-object v3, p0, Lio/reactivex/observers/SafeObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v3}, Lio/reactivex/disposables/Disposable;->dispose()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 110
    invoke-virtual {p0, v0}, Lio/reactivex/observers/SafeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 105
    :catch_2
    move-exception v1

    .line 106
    .restart local v1    # "e1":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 107
    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    new-array v4, v4, [Ljava/lang/Throwable;

    aput-object v0, v4, v5

    aput-object v1, v4, v6

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-virtual {p0, v3}, Lio/reactivex/observers/SafeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method onNextNoSubscription()V
    .locals 7

    .prologue
    .local p0, "this":Lio/reactivex/observers/SafeObserver;, "Lio/reactivex/observers/SafeObserver<TT;>;"
    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 115
    iput-boolean v4, p0, Lio/reactivex/observers/SafeObserver;->done:Z

    .line 117
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "Subscription not set!"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 120
    .local v1, "ex":Ljava/lang/Throwable;
    :try_start_0
    iget-object v2, p0, Lio/reactivex/observers/SafeObserver;->actual:Lio/reactivex/Observer;

    sget-object v3, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    invoke-interface {v2, v3}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    :try_start_1
    iget-object v2, p0, Lio/reactivex/observers/SafeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, v1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 134
    :goto_0
    return-void

    .line 121
    :catch_0
    move-exception v0

    .line 122
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 124
    new-instance v2, Lio/reactivex/exceptions/CompositeException;

    new-array v3, v6, [Ljava/lang/Throwable;

    aput-object v1, v3, v5

    aput-object v0, v3, v4

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 129
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 130
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 132
    new-instance v2, Lio/reactivex/exceptions/CompositeException;

    new-array v3, v6, [Ljava/lang/Throwable;

    aput-object v1, v3, v5

    aput-object v0, v3, v4

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 6
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .local p0, "this":Lio/reactivex/observers/SafeObserver;, "Lio/reactivex/observers/SafeObserver<TT;>;"
    const/4 v5, 0x1

    .line 45
    iget-object v2, p0, Lio/reactivex/observers/SafeObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v2, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 46
    iput-object p1, p0, Lio/reactivex/observers/SafeObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 48
    :try_start_0
    iget-object v2, p0, Lio/reactivex/observers/SafeObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    :cond_0
    :goto_0
    return-void

    .line 49
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 51
    iput-boolean v5, p0, Lio/reactivex/observers/SafeObserver;->done:Z

    .line 54
    :try_start_1
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 60
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 55
    :catch_1
    move-exception v1

    .line 56
    .local v1, "e1":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 57
    new-instance v2, Lio/reactivex/exceptions/CompositeException;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Throwable;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    aput-object v1, v3, v5

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
