.class final Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;
.super Lio/reactivex/internal/observers/QueueDrainObserver;
.source "ObservableWindowTimed.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableWindowTimed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "WindowExactUnboundedObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/observers/QueueDrainObserver",
        "<TT;",
        "Ljava/lang/Object;",
        "Lio/reactivex/Observable",
        "<TT;>;>;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field static final NEXT:Ljava/lang/Object;


# instance fields
.field final bufferSize:I

.field s:Lio/reactivex/disposables/Disposable;

.field final scheduler:Lio/reactivex/Scheduler;

.field volatile terminated:Z

.field final timer:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;"
        }
    .end annotation
.end field

.field final timespan:J

.field final unit:Ljava/util/concurrent/TimeUnit;

.field window:Lio/reactivex/subjects/UnicastSubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/subjects/UnicastSubject",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 90
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->NEXT:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Lio/reactivex/Observer;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;I)V
    .locals 2
    .param p2, "timespan"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lio/reactivex/Scheduler;
    .param p6, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 96
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    new-instance v0, Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-direct {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;-><init>()V

    invoke-direct {p0, p1, v0}, Lio/reactivex/internal/observers/QueueDrainObserver;-><init>(Lio/reactivex/Observer;Lio/reactivex/internal/fuseable/SimplePlainQueue;)V

    .line 88
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    .line 97
    iput-wide p2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->timespan:J

    .line 98
    iput-object p4, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->unit:Ljava/util/concurrent/TimeUnit;

    .line 99
    iput-object p5, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->scheduler:Lio/reactivex/Scheduler;

    .line 100
    iput p6, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->bufferSize:I

    .line 101
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 166
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->cancelled:Z

    .line 167
    return-void
.end method

.method disposeTimer()V
    .locals 1

    .prologue
    .line 175
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 176
    return-void
.end method

.method drainLoop()V
    .locals 9

    .prologue
    .line 192
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver<TT;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    check-cast v5, Lio/reactivex/internal/queue/MpscLinkedQueue;

    .line 193
    .local v5, "q":Lio/reactivex/internal/queue/MpscLinkedQueue;, "Lio/reactivex/internal/queue/MpscLinkedQueue<Ljava/lang/Object;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->actual:Lio/reactivex/Observer;

    .line 194
    .local v0, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    iget-object v7, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 196
    .local v7, "w":Lio/reactivex/subjects/UnicastSubject;, "Lio/reactivex/subjects/UnicastSubject<TT;>;"
    const/4 v3, 0x1

    .line 200
    .local v3, "missed":I
    :cond_0
    :goto_0
    iget-boolean v6, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->terminated:Z

    .line 202
    .local v6, "term":Z
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->done:Z

    .line 204
    .local v1, "d":Z
    invoke-virtual {v5}, Lio/reactivex/internal/queue/MpscLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v4

    .line 206
    .local v4, "o":Ljava/lang/Object;
    if-eqz v1, :cond_3

    if-eqz v4, :cond_1

    sget-object v8, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->NEXT:Ljava/lang/Object;

    if-ne v4, v8, :cond_3

    .line 207
    :cond_1
    const/4 v8, 0x0

    iput-object v8, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 208
    invoke-virtual {v5}, Lio/reactivex/internal/queue/MpscLinkedQueue;->clear()V

    .line 209
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->disposeTimer()V

    .line 210
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->error:Ljava/lang/Throwable;

    .line 211
    .local v2, "err":Ljava/lang/Throwable;
    if-eqz v2, :cond_2

    .line 212
    invoke-virtual {v7, v2}, Lio/reactivex/subjects/UnicastSubject;->onError(Ljava/lang/Throwable;)V

    .line 244
    .end local v2    # "err":Ljava/lang/Throwable;
    :goto_1
    return-void

    .line 214
    .restart local v2    # "err":Ljava/lang/Throwable;
    :cond_2
    invoke-virtual {v7}, Lio/reactivex/subjects/UnicastSubject;->onComplete()V

    goto :goto_1

    .line 219
    .end local v2    # "err":Ljava/lang/Throwable;
    :cond_3
    if-nez v4, :cond_4

    .line 239
    neg-int v8, v3

    invoke-virtual {p0, v8}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->leave(I)I

    move-result v3

    .line 240
    if-nez v3, :cond_0

    goto :goto_1

    .line 223
    :cond_4
    sget-object v8, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->NEXT:Ljava/lang/Object;

    if-ne v4, v8, :cond_6

    .line 224
    invoke-virtual {v7}, Lio/reactivex/subjects/UnicastSubject;->onComplete()V

    .line 225
    if-nez v6, :cond_5

    .line 226
    iget v8, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->bufferSize:I

    invoke-static {v8}, Lio/reactivex/subjects/UnicastSubject;->create(I)Lio/reactivex/subjects/UnicastSubject;

    move-result-object v7

    .line 227
    iput-object v7, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 229
    invoke-interface {v0, v7}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 231
    :cond_5
    iget-object v8, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v8}, Lio/reactivex/disposables/Disposable;->dispose()V

    goto :goto_0

    .line 236
    :cond_6
    invoke-static {v4}, Lio/reactivex/internal/util/NotificationLite;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Lio/reactivex/subjects/UnicastSubject;->onNext(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 171
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->cancelled:Z

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 155
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->done:Z

    .line 156
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 157
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->drainLoop()V

    .line 160
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->disposeTimer()V

    .line 161
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 162
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 143
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver<TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->error:Ljava/lang/Throwable;

    .line 144
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->done:Z

    .line 145
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->drainLoop()V

    .line 149
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->disposeTimer()V

    .line 150
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 151
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 124
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->terminated:Z

    if-eqz v0, :cond_1

    .line 139
    :cond_0
    :goto_0
    return-void

    .line 127
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->fastEnter()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 128
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    invoke-virtual {v0, p1}, Lio/reactivex/subjects/UnicastSubject;->onNext(Ljava/lang/Object;)V

    .line 129
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->leave(I)I

    move-result v0

    if-eqz v0, :cond_0

    .line 138
    :cond_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->drainLoop()V

    goto :goto_0

    .line 133
    :cond_3
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 134
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->enter()Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 9
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 105
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 106
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 108
    iget v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->bufferSize:I

    invoke-static {v0}, Lio/reactivex/subjects/UnicastSubject;->create(I)Lio/reactivex/subjects/UnicastSubject;

    move-result-object v0

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    .line 110
    iget-object v7, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->actual:Lio/reactivex/Observer;

    .line 111
    .local v7, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    invoke-interface {v7, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 113
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->window:Lio/reactivex/subjects/UnicastSubject;

    invoke-interface {v7, v0}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 115
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->cancelled:Z

    if-nez v0, :cond_0

    .line 116
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->scheduler:Lio/reactivex/Scheduler;

    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->timespan:J

    iget-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->timespan:J

    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->unit:Ljava/util/concurrent/TimeUnit;

    move-object v1, p0

    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler;->schedulePeriodicallyDirect(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v8

    .line 117
    .local v8, "d":Lio/reactivex/disposables/Disposable;
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->timer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, v8}, Lio/reactivex/internal/disposables/DisposableHelper;->replace(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z

    .line 120
    .end local v7    # "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    .end local v8    # "d":Lio/reactivex/disposables/Disposable;
    :cond_0
    return-void
.end method

.method public run()V
    .locals 2

    .prologue
    .line 180
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;, "Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->cancelled:Z

    if-eqz v0, :cond_0

    .line 181
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->terminated:Z

    .line 182
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->disposeTimer()V

    .line 184
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    sget-object v1, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->NEXT:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    .line 185
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->enter()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 186
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;->drainLoop()V

    .line 188
    :cond_1
    return-void
.end method
