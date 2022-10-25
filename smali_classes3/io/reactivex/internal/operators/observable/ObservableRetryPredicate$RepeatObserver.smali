.class final Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableRetryPredicate.java"

# interfaces
.implements Lio/reactivex/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableRetryPredicate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RepeatObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/Observer",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x628271a96862fff0L


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final predicate:Lio/reactivex/functions/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Predicate",
            "<-",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field remaining:J

.field final sa:Lio/reactivex/internal/disposables/SequentialDisposable;

.field final source:Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableSource",
            "<+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/Observer;JLio/reactivex/functions/Predicate;Lio/reactivex/internal/disposables/SequentialDisposable;Lio/reactivex/ObservableSource;)V
    .locals 0
    .param p2, "count"    # J
    .param p5, "sa"    # Lio/reactivex/internal/disposables/SequentialDisposable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;J",
            "Lio/reactivex/functions/Predicate",
            "<-",
            "Ljava/lang/Throwable;",
            ">;",
            "Lio/reactivex/internal/disposables/SequentialDisposable;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;, "Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    .local p4, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-Ljava/lang/Throwable;>;"
    .local p6, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 55
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->actual:Lio/reactivex/Observer;

    .line 56
    iput-object p5, p0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->sa:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 57
    iput-object p6, p0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->source:Lio/reactivex/ObservableSource;

    .line 58
    iput-object p4, p0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->predicate:Lio/reactivex/functions/Predicate;

    .line 59
    iput-wide p2, p0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->remaining:J

    .line 60
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 1

    .prologue
    .line 98
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;, "Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 99
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 8
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 73
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;, "Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver<TT;>;"
    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->remaining:J

    .line 74
    .local v2, "r":J
    const-wide v4, 0x7fffffffffffffffL

    cmp-long v4, v2, v4

    if-eqz v4, :cond_0

    .line 75
    const-wide/16 v4, 0x1

    sub-long v4, v2, v4

    iput-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->remaining:J

    .line 77
    :cond_0
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-nez v4, :cond_1

    .line 78
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v4, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 94
    :goto_0
    return-void

    .line 82
    :cond_1
    :try_start_0
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->predicate:Lio/reactivex/functions/Predicate;

    invoke-interface {v4, p1}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 88
    .local v0, "b":Z
    if-nez v0, :cond_2

    .line 89
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v4, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 83
    .end local v0    # "b":Z
    :catch_0
    move-exception v1

    .line 84
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 85
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->actual:Lio/reactivex/Observer;

    new-instance v5, Lio/reactivex/exceptions/CompositeException;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Throwable;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    const/4 v7, 0x1

    aput-object v1, v6, v7

    invoke-direct {v5, v6}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-interface {v4, v5}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 92
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v0    # "b":Z
    :cond_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->subscribeNext()V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;, "Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 70
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 64
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;, "Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->sa:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/disposables/SequentialDisposable;->update(Lio/reactivex/disposables/Disposable;)Z

    .line 65
    return-void
.end method

.method subscribeNext()V
    .locals 2

    .prologue
    .line 105
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;, "Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->getAndIncrement()I

    move-result v1

    if-nez v1, :cond_1

    .line 106
    const/4 v0, 0x1

    .line 108
    .local v0, "missed":I
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->sa:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v1}, Lio/reactivex/internal/disposables/SequentialDisposable;->isDisposed()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 119
    .end local v0    # "missed":I
    :cond_1
    :goto_0
    return-void

    .line 111
    .restart local v0    # "missed":I
    :cond_2
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->source:Lio/reactivex/ObservableSource;

    invoke-interface {v1, p0}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 113
    neg-int v1, v0

    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/observable/ObservableRetryPredicate$RepeatObserver;->addAndGet(I)I

    move-result v0

    .line 114
    if-nez v0, :cond_0

    goto :goto_0
.end method
