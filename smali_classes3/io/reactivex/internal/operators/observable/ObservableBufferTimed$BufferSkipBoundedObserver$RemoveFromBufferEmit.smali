.class final Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver$RemoveFromBufferEmit;
.super Ljava/lang/Object;
.source "ObservableBufferTimed.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "RemoveFromBufferEmit"
.end annotation


# instance fields
.field private final buffer:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TU;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver;


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver;Ljava/util/Collection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TU;)V"
        }
    .end annotation

    .prologue
    .line 374
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver$RemoveFromBufferEmit;, "Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver<TT;TU;>.RemoveFromBufferEmit;"
    .local p2, "buffer":Ljava/util/Collection;, "TU;"
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver$RemoveFromBufferEmit;->this$0:Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 375
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver$RemoveFromBufferEmit;->buffer:Ljava/util/Collection;

    .line 376
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 380
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver$RemoveFromBufferEmit;, "Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver<TT;TU;>.RemoveFromBufferEmit;"
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver$RemoveFromBufferEmit;->this$0:Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver;

    monitor-enter v1

    .line 381
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver$RemoveFromBufferEmit;->this$0:Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver;

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver;->buffers:Ljava/util/List;

    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver$RemoveFromBufferEmit;->buffer:Ljava/util/Collection;

    invoke-interface {v0, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 382
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 384
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver$RemoveFromBufferEmit;->this$0:Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver;

    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver$RemoveFromBufferEmit;->buffer:Ljava/util/Collection;

    const/4 v2, 0x0

    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver$RemoveFromBufferEmit;->this$0:Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver;

    iget-object v3, v3, Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver;->w:Lio/reactivex/Scheduler$Worker;

    invoke-static {v0, v1, v2, v3}, Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver;->access$100(Lio/reactivex/internal/operators/observable/ObservableBufferTimed$BufferSkipBoundedObserver;Ljava/lang/Object;ZLio/reactivex/disposables/Disposable;)V

    .line 385
    return-void

    .line 382
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
