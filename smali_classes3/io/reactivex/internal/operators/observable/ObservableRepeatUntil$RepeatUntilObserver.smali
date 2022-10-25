.class final Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableRepeatUntil.java"

# interfaces
.implements Lio/reactivex/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableRepeatUntil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RepeatUntilObserver"
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

.field final sd:Lio/reactivex/internal/disposables/SequentialDisposable;

.field final source:Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableSource",
            "<+TT;>;"
        }
    .end annotation
.end field

.field final stop:Lio/reactivex/functions/BooleanSupplier;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/BooleanSupplier;Lio/reactivex/internal/disposables/SequentialDisposable;Lio/reactivex/ObservableSource;)V
    .locals 0
    .param p2, "until"    # Lio/reactivex/functions/BooleanSupplier;
    .param p3, "sd"    # Lio/reactivex/internal/disposables/SequentialDisposable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;",
            "Lio/reactivex/functions/BooleanSupplier;",
            "Lio/reactivex/internal/disposables/SequentialDisposable;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;, "Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    .local p4, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 49
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;->actual:Lio/reactivex/Observer;

    .line 50
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 51
    iput-object p4, p0, Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;->source:Lio/reactivex/ObservableSource;

    .line 52
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;->stop:Lio/reactivex/functions/BooleanSupplier;

    .line 53
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 3

    .prologue
    .line 73
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;, "Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver<TT;>;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;->stop:Lio/reactivex/functions/BooleanSupplier;

    invoke-interface {v2}, Lio/reactivex/functions/BooleanSupplier;->getAsBoolean()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 79
    .local v0, "b":Z
    if-eqz v0, :cond_0

    .line 80
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2}, Lio/reactivex/Observer;->onComplete()V

    .line 84
    .end local v0    # "b":Z
    :goto_0
    return-void

    .line 74
    :catch_0
    move-exception v1

    .line 75
    .local v1, "e":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 76
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, v1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 82
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v0    # "b":Z
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;->subscribeNext()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 66
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;, "Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 67
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;, "Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 63
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 57
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;, "Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/disposables/SequentialDisposable;->replace(Lio/reactivex/disposables/Disposable;)Z

    .line 58
    return-void
.end method

.method subscribeNext()V
    .locals 2

    .prologue
    .line 90
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;, "Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;->getAndIncrement()I

    move-result v1

    if-nez v1, :cond_1

    .line 91
    const/4 v0, 0x1

    .line 93
    .local v0, "missed":I
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;->source:Lio/reactivex/ObservableSource;

    invoke-interface {v1, p0}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 95
    neg-int v1, v0

    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/observable/ObservableRepeatUntil$RepeatUntilObserver;->addAndGet(I)I

    move-result v0

    .line 96
    if-nez v0, :cond_0

    .line 101
    .end local v0    # "missed":I
    :cond_1
    return-void
.end method
