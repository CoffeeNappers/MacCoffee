.class final Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;
.super Ljava/util/concurrent/atomic/AtomicBoolean;
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
    name = "WindowSkipObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x2eb9e739d805fc76L


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

.field firstEmission:J

.field index:J

.field s:Lio/reactivex/disposables/Disposable;

.field final skip:J

.field final windows:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque",
            "<",
            "Lio/reactivex/subjects/UnicastSubject",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final wip:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;JJI)V
    .locals 2
    .param p2, "count"    # J
    .param p4, "skip"    # J
    .param p6, "capacityHint"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;>;JJI)V"
        }
    .end annotation

    .prologue
    .line 158
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 156
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 159
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->actual:Lio/reactivex/Observer;

    .line 160
    iput-wide p2, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->count:J

    .line 161
    iput-wide p4, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->skip:J

    .line 162
    iput p6, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->capacityHint:I

    .line 163
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->windows:Ljava/util/ArrayDeque;

    .line 164
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 230
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->cancelled:Z

    .line 231
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 235
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->cancelled:Z

    return v0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 221
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->windows:Ljava/util/ArrayDeque;

    .line 222
    .local v0, "ws":Ljava/util/ArrayDeque;, "Ljava/util/ArrayDeque<Lio/reactivex/subjects/UnicastSubject<TT;>;>;"
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 223
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/subjects/UnicastSubject;

    invoke-virtual {v1}, Lio/reactivex/subjects/UnicastSubject;->onComplete()V

    goto :goto_0

    .line 225
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v1}, Lio/reactivex/Observer;->onComplete()V

    .line 226
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 212
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->windows:Ljava/util/ArrayDeque;

    .line 213
    .local v0, "ws":Ljava/util/ArrayDeque;, "Ljava/util/ArrayDeque<Lio/reactivex/subjects/UnicastSubject<TT;>;>;"
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 214
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/subjects/UnicastSubject;

    invoke-virtual {v1, p1}, Lio/reactivex/subjects/UnicastSubject;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 216
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v1, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 217
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 177
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v8, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->windows:Ljava/util/ArrayDeque;

    .line 179
    .local v8, "ws":Ljava/util/ArrayDeque;, "Ljava/util/ArrayDeque<Lio/reactivex/subjects/UnicastSubject<TT;>;>;"
    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->index:J

    .line 181
    .local v2, "i":J
    iget-wide v6, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->skip:J

    .line 183
    .local v6, "s":J
    rem-long v10, v2, v6

    const-wide/16 v12, 0x0

    cmp-long v9, v10, v12

    if-nez v9, :cond_0

    iget-boolean v9, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->cancelled:Z

    if-nez v9, :cond_0

    .line 184
    iget-object v9, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 185
    iget v9, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->capacityHint:I

    invoke-static {v9, p0}, Lio/reactivex/subjects/UnicastSubject;->create(ILjava/lang/Runnable;)Lio/reactivex/subjects/UnicastSubject;

    move-result-object v5

    .line 186
    .local v5, "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    invoke-virtual {v8, v5}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    .line 187
    iget-object v9, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v9, v5}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 190
    .end local v5    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    :cond_0
    iget-wide v10, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->firstEmission:J

    const-wide/16 v12, 0x1

    add-long v0, v10, v12

    .line 192
    .local v0, "c":J
    invoke-virtual {v8}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/reactivex/subjects/UnicastSubject;

    .line 193
    .restart local v5    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    invoke-virtual {v5, p1}, Lio/reactivex/subjects/UnicastSubject;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 196
    .end local v5    # "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    :cond_1
    iget-wide v10, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->count:J

    cmp-long v9, v0, v10

    if-ltz v9, :cond_3

    .line 197
    invoke-virtual {v8}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lio/reactivex/subjects/UnicastSubject;

    invoke-virtual {v9}, Lio/reactivex/subjects/UnicastSubject;->onComplete()V

    .line 198
    invoke-virtual {v8}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_2

    iget-boolean v9, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->cancelled:Z

    if-eqz v9, :cond_2

    .line 199
    iget-object v9, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v9}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 208
    :goto_1
    return-void

    .line 202
    :cond_2
    sub-long v10, v0, v6

    iput-wide v10, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->firstEmission:J

    .line 207
    :goto_2
    const-wide/16 v10, 0x1

    add-long/2addr v10, v2

    iput-wide v10, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->index:J

    goto :goto_1

    .line 204
    :cond_3
    iput-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->firstEmission:J

    goto :goto_2
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 168
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 169
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 171
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 173
    :cond_0
    return-void
.end method

.method public run()V
    .locals 1

    .prologue
    .line 240
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_0

    .line 241
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->cancelled:Z

    if-eqz v0, :cond_0

    .line 242
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindow$WindowSkipObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 245
    :cond_0
    return-void
.end method
