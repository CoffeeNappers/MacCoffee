.class final Lio/reactivex/internal/operators/observable/ObservableRefCount$DisposeTask;
.super Ljava/lang/Object;
.source "ObservableRefCount.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableRefCount;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "DisposeTask"
.end annotation


# instance fields
.field private final current:Lio/reactivex/disposables/CompositeDisposable;

.field final synthetic this$0:Lio/reactivex/internal/operators/observable/ObservableRefCount;


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/observable/ObservableRefCount;Lio/reactivex/disposables/CompositeDisposable;)V
    .locals 0
    .param p2, "current"    # Lio/reactivex/disposables/CompositeDisposable;

    .prologue
    .line 205
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableRefCount$DisposeTask;, "Lio/reactivex/internal/operators/observable/ObservableRefCount<TT;>.DisposeTask;"
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableRefCount$DisposeTask;->this$0:Lio/reactivex/internal/operators/observable/ObservableRefCount;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 206
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableRefCount$DisposeTask;->current:Lio/reactivex/disposables/CompositeDisposable;

    .line 207
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 211
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableRefCount$DisposeTask;, "Lio/reactivex/internal/operators/observable/ObservableRefCount<TT;>.DisposeTask;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableRefCount$DisposeTask;->this$0:Lio/reactivex/internal/operators/observable/ObservableRefCount;

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableRefCount;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 213
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableRefCount$DisposeTask;->this$0:Lio/reactivex/internal/operators/observable/ObservableRefCount;

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableRefCount;->baseDisposable:Lio/reactivex/disposables/CompositeDisposable;

    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableRefCount$DisposeTask;->current:Lio/reactivex/disposables/CompositeDisposable;

    if-ne v0, v1, :cond_1

    .line 214
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableRefCount$DisposeTask;->this$0:Lio/reactivex/internal/operators/observable/ObservableRefCount;

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableRefCount;->subscriptionCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_1

    .line 215
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableRefCount$DisposeTask;->this$0:Lio/reactivex/internal/operators/observable/ObservableRefCount;

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableRefCount;->source:Lio/reactivex/observables/ConnectableObservable;

    instance-of v0, v0, Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    .line 216
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableRefCount$DisposeTask;->this$0:Lio/reactivex/internal/operators/observable/ObservableRefCount;

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableRefCount;->source:Lio/reactivex/observables/ConnectableObservable;

    check-cast v0, Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 219
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableRefCount$DisposeTask;->this$0:Lio/reactivex/internal/operators/observable/ObservableRefCount;

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableRefCount;->baseDisposable:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 222
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableRefCount$DisposeTask;->this$0:Lio/reactivex/internal/operators/observable/ObservableRefCount;

    new-instance v1, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v1}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v1, v0, Lio/reactivex/internal/operators/observable/ObservableRefCount;->baseDisposable:Lio/reactivex/disposables/CompositeDisposable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 226
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableRefCount$DisposeTask;->this$0:Lio/reactivex/internal/operators/observable/ObservableRefCount;

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableRefCount;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 228
    return-void

    .line 226
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableRefCount$DisposeTask;->this$0:Lio/reactivex/internal/operators/observable/ObservableRefCount;

    iget-object v1, v1, Lio/reactivex/internal/operators/observable/ObservableRefCount;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method
