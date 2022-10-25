.class final Lio/reactivex/internal/operators/completable/CompletableOnErrorComplete$OnError;
.super Ljava/lang/Object;
.source "CompletableOnErrorComplete.java"

# interfaces
.implements Lio/reactivex/CompletableObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/completable/CompletableOnErrorComplete;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "OnError"
.end annotation


# instance fields
.field private final s:Lio/reactivex/CompletableObserver;

.field final synthetic this$0:Lio/reactivex/internal/operators/completable/CompletableOnErrorComplete;


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/completable/CompletableOnErrorComplete;Lio/reactivex/CompletableObserver;)V
    .locals 0
    .param p2, "s"    # Lio/reactivex/CompletableObserver;

    .prologue
    .line 42
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableOnErrorComplete$OnError;->this$0:Lio/reactivex/internal/operators/completable/CompletableOnErrorComplete;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p2, p0, Lio/reactivex/internal/operators/completable/CompletableOnErrorComplete$OnError;->s:Lio/reactivex/CompletableObserver;

    .line 44
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableOnErrorComplete$OnError;->s:Lio/reactivex/CompletableObserver;

    invoke-interface {v0}, Lio/reactivex/CompletableObserver;->onComplete()V

    .line 49
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 6
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 56
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableOnErrorComplete$OnError;->this$0:Lio/reactivex/internal/operators/completable/CompletableOnErrorComplete;

    iget-object v2, v2, Lio/reactivex/internal/operators/completable/CompletableOnErrorComplete;->predicate:Lio/reactivex/functions/Predicate;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 63
    .local v0, "b":Z
    if-eqz v0, :cond_0

    .line 64
    iget-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableOnErrorComplete$OnError;->s:Lio/reactivex/CompletableObserver;

    invoke-interface {v2}, Lio/reactivex/CompletableObserver;->onComplete()V

    .line 68
    .end local v0    # "b":Z
    :goto_0
    return-void

    .line 57
    :catch_0
    move-exception v1

    .line 58
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 59
    iget-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableOnErrorComplete$OnError;->s:Lio/reactivex/CompletableObserver;

    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Throwable;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x1

    aput-object v1, v4, v5

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-interface {v2, v3}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 66
    .end local v1    # "ex":Ljava/lang/Throwable;
    .restart local v0    # "b":Z
    :cond_0
    iget-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableOnErrorComplete$OnError;->s:Lio/reactivex/CompletableObserver;

    invoke-interface {v2, p1}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 72
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableOnErrorComplete$OnError;->s:Lio/reactivex/CompletableObserver;

    invoke-interface {v0, p1}, Lio/reactivex/CompletableObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 73
    return-void
.end method
