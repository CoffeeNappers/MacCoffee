.class final Lio/reactivex/internal/operators/completable/CompletableResumeNext$ResumeNext;
.super Ljava/lang/Object;
.source "CompletableResumeNext.java"

# interfaces
.implements Lio/reactivex/CompletableObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/completable/CompletableResumeNext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ResumeNext"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/completable/CompletableResumeNext$ResumeNext$OnErrorObserver;
    }
.end annotation


# instance fields
.field final s:Lio/reactivex/CompletableObserver;

.field final sd:Lio/reactivex/internal/disposables/SequentialDisposable;

.field final synthetic this$0:Lio/reactivex/internal/operators/completable/CompletableResumeNext;


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/completable/CompletableResumeNext;Lio/reactivex/CompletableObserver;Lio/reactivex/internal/disposables/SequentialDisposable;)V
    .locals 0
    .param p2, "s"    # Lio/reactivex/CompletableObserver;
    .param p3, "sd"    # Lio/reactivex/internal/disposables/SequentialDisposable;

    .prologue
    .line 49
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableResumeNext$ResumeNext;->this$0:Lio/reactivex/internal/operators/completable/CompletableResumeNext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p2, p0, Lio/reactivex/internal/operators/completable/CompletableResumeNext$ResumeNext;->s:Lio/reactivex/CompletableObserver;

    .line 51
    iput-object p3, p0, Lio/reactivex/internal/operators/completable/CompletableResumeNext$ResumeNext;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 52
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableResumeNext$ResumeNext;->s:Lio/reactivex/CompletableObserver;

    invoke-interface {v0}, Lio/reactivex/CompletableObserver;->onComplete()V

    .line 57
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 7
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 64
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/completable/CompletableResumeNext$ResumeNext;->this$0:Lio/reactivex/internal/operators/completable/CompletableResumeNext;

    iget-object v3, v3, Lio/reactivex/internal/operators/completable/CompletableResumeNext;->errorMapper:Lio/reactivex/functions/Function;

    invoke-interface {v3, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/CompletableSource;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .local v0, "c":Lio/reactivex/CompletableSource;
    if-nez v0, :cond_0

    .line 72
    new-instance v2, Ljava/lang/NullPointerException;

    const-string/jumbo v3, "The CompletableConsumable returned is null"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 73
    .local v2, "npe":Ljava/lang/NullPointerException;
    invoke-virtual {v2, p1}, Ljava/lang/NullPointerException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 74
    iget-object v3, p0, Lio/reactivex/internal/operators/completable/CompletableResumeNext$ResumeNext;->s:Lio/reactivex/CompletableObserver;

    invoke-interface {v3, v2}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    .line 79
    .end local v0    # "c":Lio/reactivex/CompletableSource;
    .end local v2    # "npe":Ljava/lang/NullPointerException;
    :goto_0
    return-void

    .line 65
    :catch_0
    move-exception v1

    .line 66
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 67
    iget-object v3, p0, Lio/reactivex/internal/operators/completable/CompletableResumeNext$ResumeNext;->s:Lio/reactivex/CompletableObserver;

    new-instance v4, Lio/reactivex/exceptions/CompositeException;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Throwable;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    const/4 v6, 0x1

    aput-object p1, v5, v6

    invoke-direct {v4, v5}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-interface {v3, v4}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 78
    .end local v1    # "ex":Ljava/lang/Throwable;
    .restart local v0    # "c":Lio/reactivex/CompletableSource;
    :cond_0
    new-instance v3, Lio/reactivex/internal/operators/completable/CompletableResumeNext$ResumeNext$OnErrorObserver;

    invoke-direct {v3, p0}, Lio/reactivex/internal/operators/completable/CompletableResumeNext$ResumeNext$OnErrorObserver;-><init>(Lio/reactivex/internal/operators/completable/CompletableResumeNext$ResumeNext;)V

    invoke-interface {v0, v3}, Lio/reactivex/CompletableSource;->subscribe(Lio/reactivex/CompletableObserver;)V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 83
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableResumeNext$ResumeNext;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/disposables/SequentialDisposable;->update(Lio/reactivex/disposables/Disposable;)Z

    .line 84
    return-void
.end method
