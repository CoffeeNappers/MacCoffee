.class final Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "CompletableUsing.java"

# interfaces
.implements Lio/reactivex/CompletableObserver;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/completable/CompletableUsing;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "UsingObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Ljava/lang/Object;",
        ">;",
        "Lio/reactivex/CompletableObserver;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x95bf75d78cfb0efL


# instance fields
.field final actual:Lio/reactivex/CompletableObserver;

.field d:Lio/reactivex/disposables/Disposable;

.field final disposer:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-TR;>;"
        }
    .end annotation
.end field

.field final eager:Z


# direct methods
.method constructor <init>(Lio/reactivex/CompletableObserver;Ljava/lang/Object;Lio/reactivex/functions/Consumer;Z)V
    .locals 0
    .param p1, "actual"    # Lio/reactivex/CompletableObserver;
    .param p4, "eager"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/CompletableObserver;",
            "TR;",
            "Lio/reactivex/functions/Consumer",
            "<-TR;>;Z)V"
        }
    .end annotation

    .prologue
    .line 104
    .local p0, "this":Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;, "Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver<TR;>;"
    .local p2, "resource":Ljava/lang/Object;, "TR;"
    .local p3, "disposer":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TR;>;"
    invoke-direct {p0, p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 105
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->actual:Lio/reactivex/CompletableObserver;

    .line 106
    iput-object p3, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->disposer:Lio/reactivex/functions/Consumer;

    .line 107
    iput-boolean p4, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->eager:Z

    .line 108
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 112
    .local p0, "this":Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;, "Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver<TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 113
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 114
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->disposeResourceAfter()V

    .line 115
    return-void
.end method

.method disposeResourceAfter()V
    .locals 3

    .prologue
    .line 119
    .local p0, "this":Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;, "Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver<TR;>;"
    invoke-virtual {p0, p0}, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 120
    .local v1, "resource":Ljava/lang/Object;
    if-eq v1, p0, :cond_0

    .line 122
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->disposer:Lio/reactivex/functions/Consumer;

    invoke-interface {v2, v1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    :cond_0
    :goto_0
    return-void

    .line 123
    :catch_0
    move-exception v0

    .line 124
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 125
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 132
    .local p0, "this":Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;, "Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver<TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 3

    .prologue
    .line 172
    .local p0, "this":Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;, "Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver<TR;>;"
    sget-object v2, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 173
    iget-boolean v2, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->eager:Z

    if-eqz v2, :cond_0

    .line 174
    invoke-virtual {p0, p0}, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 175
    .local v1, "resource":Ljava/lang/Object;
    if-eq v1, p0, :cond_1

    .line 177
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->disposer:Lio/reactivex/functions/Consumer;

    invoke-interface {v2, v1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 188
    .end local v1    # "resource":Ljava/lang/Object;
    :cond_0
    iget-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v2}, Lio/reactivex/CompletableObserver;->onComplete()V

    .line 190
    iget-boolean v2, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->eager:Z

    if-nez v2, :cond_1

    .line 191
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->disposeResourceAfter()V

    .line 193
    :cond_1
    :goto_0
    return-void

    .line 178
    .restart local v1    # "resource":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 179
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 180
    iget-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v2, v0}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 5
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 147
    .local p0, "this":Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;, "Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver<TR;>;"
    sget-object v3, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v3, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 148
    iget-boolean v3, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->eager:Z

    if-eqz v3, :cond_0

    .line 149
    invoke-virtual {p0, p0}, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 150
    .local v2, "resource":Ljava/lang/Object;
    if-eq v2, p0, :cond_1

    .line 152
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->disposer:Lio/reactivex/functions/Consumer;

    invoke-interface {v3, v2}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    .end local v2    # "resource":Ljava/lang/Object;
    :cond_0
    :goto_0
    iget-object v3, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v3, p1}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    .line 164
    iget-boolean v3, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->eager:Z

    if-nez v3, :cond_1

    .line 165
    invoke-virtual {p0}, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->disposeResourceAfter()V

    .line 167
    :cond_1
    return-void

    .line 153
    .restart local v2    # "resource":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 154
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 155
    new-instance v0, Lio/reactivex/exceptions/CompositeException;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Throwable;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object v1, v3, v4

    invoke-direct {v0, v3}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    .end local p1    # "e":Ljava/lang/Throwable;
    .local v0, "e":Ljava/lang/Throwable;
    move-object p1, v0

    .line 156
    .end local v0    # "e":Ljava/lang/Throwable;
    .restart local p1    # "e":Ljava/lang/Throwable;
    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 137
    .local p0, "this":Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;, "Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver<TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 138
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 140
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableUsing$UsingObserver;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v0, p0}, Lio/reactivex/CompletableObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 142
    :cond_0
    return-void
.end method
