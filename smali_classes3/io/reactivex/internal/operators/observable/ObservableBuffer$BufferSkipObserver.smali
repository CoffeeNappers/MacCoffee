.class final Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;
.super Ljava/util/concurrent/atomic/AtomicBoolean;
.source "ObservableBuffer.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BufferSkipObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U::",
        "Ljava/util/Collection",
        "<-TT;>;>",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x721f5e3cd252a212L


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TU;>;"
        }
    .end annotation
.end field

.field final bufferSupplier:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<TU;>;"
        }
    .end annotation
.end field

.field final buffers:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque",
            "<TU;>;"
        }
    .end annotation
.end field

.field final count:I

.field index:J

.field s:Lio/reactivex/disposables/Disposable;

.field final skip:I


# direct methods
.method constructor <init>(Lio/reactivex/Observer;IILjava/util/concurrent/Callable;)V
    .locals 1
    .param p2, "count"    # I
    .param p3, "skip"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TU;>;II",
            "Ljava/util/concurrent/Callable",
            "<TU;>;)V"
        }
    .end annotation

    .prologue
    .line 153
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver<TT;TU;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TU;>;"
    .local p4, "bufferSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TU;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 154
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->actual:Lio/reactivex/Observer;

    .line 155
    iput p2, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->count:I

    .line 156
    iput p3, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->skip:I

    .line 157
    iput-object p4, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->bufferSupplier:Ljava/util/concurrent/Callable;

    .line 158
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->buffers:Ljava/util/ArrayDeque;

    .line 159
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 172
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 173
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 177
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 217
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver<TT;TU;>;"
    :goto_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->buffers:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 218
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->actual:Lio/reactivex/Observer;

    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->buffers:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 220
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 221
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 211
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->buffers:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    .line 212
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 213
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 182
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver<TT;TU;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->index:J

    const-wide/16 v6, 0x1

    add-long/2addr v6, v4

    iput-wide v6, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->index:J

    iget v3, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->skip:I

    int-to-long v6, v3

    rem-long/2addr v4, v6

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-nez v3, :cond_0

    .line 186
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->bufferSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v3}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "The bufferSupplier returned a null collection. Null values are generally not allowed in 2.x operators and sources."

    invoke-static {v3, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 194
    .local v0, "b":Ljava/util/Collection;, "TU;"
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->buffers:Ljava/util/ArrayDeque;

    invoke-virtual {v3, v0}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    .line 197
    .end local v0    # "b":Ljava/util/Collection;, "TU;"
    :cond_0
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->buffers:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 198
    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TU;>;"
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 199
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    .line 200
    .restart local v0    # "b":Ljava/util/Collection;, "TU;"
    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 201
    iget v3, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->count:I

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v4

    if-gt v3, v4, :cond_1

    .line 202
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 204
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, v0}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 187
    .end local v0    # "b":Ljava/util/Collection;, "TU;"
    .end local v2    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TU;>;"
    :catch_0
    move-exception v1

    .line 188
    .local v1, "e":Ljava/lang/Throwable;
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->buffers:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->clear()V

    .line 189
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v3}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 190
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, v1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 207
    .end local v1    # "e":Ljava/lang/Throwable;
    :cond_2
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 163
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;, "Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 164
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 165
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBuffer$BufferSkipObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 167
    :cond_0
    return-void
.end method
