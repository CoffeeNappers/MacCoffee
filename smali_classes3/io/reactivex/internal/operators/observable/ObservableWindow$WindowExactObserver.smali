.class final Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableWindow.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "WindowExactObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x67d4a190b6f57310L


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field final capacityHint:I

.field final count:J

.field s:Lio/reactivex/disposables/Disposable;

.field size:J

.field window:Lio/reactivex/subjects/UnicastSubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/subjects/UnicastSubject",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/Observer;JI)V
    .locals 0
    .param p2, "count"    # J
    .param p4, "capacityHint"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;>;JI)V"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 63
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->actual:Lio/reactivex/Observer;

    .line 64
    iput-wide p2, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->count:J

    .line 65
    iput p4, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->capacityHint:I

    .line 66
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 121
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->cancelled:Z

    .line 122
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 126
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->cancelled:Z

    return v0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 111
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 112
    .local v0, "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    if-eqz v0, :cond_0

    .line 113
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 114
    invoke-virtual {v0}, Lio/reactivex/subjects/UnicastSubject;->onComplete()V

    .line 116
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v1}, Lio/reactivex/Observer;->onComplete()V

    .line 117
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 101
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 102
    .local v0, "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    if-eqz v0, :cond_0

    .line 103
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 104
    invoke-virtual {v0, p1}, Lio/reactivex/subjects/UnicastSubject;->onError(Ljava/lang/Throwable;)V

    .line 106
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v1, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 107
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 79
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 80
    .local v0, "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    if-nez v0, :cond_0

    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->cancelled:Z

    if-nez v1, :cond_0

    .line 81
    iget v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->capacityHint:I

    invoke-static {v1, p0}, Lio/reactivex/subjects/UnicastSubject;->create(ILjava/lang/Runnable;)Lio/reactivex/subjects/UnicastSubject;

    move-result-object v0

    .line 82
    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 83
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v1, v0}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 86
    :cond_0
    if-eqz v0, :cond_1

    .line 87
    invoke-virtual {v0, p1}, Lio/reactivex/subjects/UnicastSubject;->onNext(Ljava/lang/Object;)V

    .line 88
    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->size:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->size:J

    iget-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->count:J

    cmp-long v1, v2, v4

    if-ltz v1, :cond_1

    .line 89
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->size:J

    .line 90
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 91
    invoke-virtual {v0}, Lio/reactivex/subjects/UnicastSubject;->onComplete()V

    .line 92
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->cancelled:Z

    if-eqz v1, :cond_1

    .line 93
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 97
    :cond_1
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 70
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 71
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 73
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 75
    :cond_0
    return-void
.end method

.method public run()V
    .locals 1

    .prologue
    .line 131
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->cancelled:Z

    if-eqz v0, :cond_0

    .line 132
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowExactObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 134
    :cond_0
    return-void
.end method
