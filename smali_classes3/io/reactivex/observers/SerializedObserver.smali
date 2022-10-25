.class public final Lio/reactivex/observers/SerializedObserver;
.super Ljava/lang/Object;
.source "SerializedObserver.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field static final QUEUE_LINK_SIZE:I = 0x4


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final delayError:Z

.field volatile done:Z

.field emitting:Z

.field queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field s:Lio/reactivex/disposables/Disposable;


# direct methods
.method public constructor <init>(Lio/reactivex/Observer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, "this":Lio/reactivex/observers/SerializedObserver;, "Lio/reactivex/observers/SerializedObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lio/reactivex/observers/SerializedObserver;-><init>(Lio/reactivex/Observer;Z)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lio/reactivex/Observer;Z)V
    .locals 0
    .param p2, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;Z)V"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, "this":Lio/reactivex/observers/SerializedObserver;, "Lio/reactivex/observers/SerializedObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lio/reactivex/observers/SerializedObserver;->actual:Lio/reactivex/Observer;

    .line 62
    iput-boolean p2, p0, Lio/reactivex/observers/SerializedObserver;->delayError:Z

    .line 63
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 77
    .local p0, "this":Lio/reactivex/observers/SerializedObserver;, "Lio/reactivex/observers/SerializedObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/observers/SerializedObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 78
    return-void
.end method

.method emitLoop()V
    .locals 2

    .prologue
    .line 187
    .local p0, "this":Lio/reactivex/observers/SerializedObserver;, "Lio/reactivex/observers/SerializedObserver<TT;>;"
    :cond_0
    monitor-enter p0

    .line 188
    :try_start_0
    iget-object v0, p0, Lio/reactivex/observers/SerializedObserver;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 189
    .local v0, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v0, :cond_1

    .line 190
    const/4 v1, 0x0

    iput-boolean v1, p0, Lio/reactivex/observers/SerializedObserver;->emitting:Z

    .line 191
    monitor-exit p0

    .line 197
    :goto_0
    return-void

    .line 193
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/observers/SerializedObserver;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 194
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 196
    iget-object v1, p0, Lio/reactivex/observers/SerializedObserver;->actual:Lio/reactivex/Observer;

    invoke-virtual {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->accept(Lio/reactivex/Observer;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 194
    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 82
    .local p0, "this":Lio/reactivex/observers/SerializedObserver;, "Lio/reactivex/observers/SerializedObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/observers/SerializedObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 160
    .local p0, "this":Lio/reactivex/observers/SerializedObserver;, "Lio/reactivex/observers/SerializedObserver<TT;>;"
    iget-boolean v1, p0, Lio/reactivex/observers/SerializedObserver;->done:Z

    if-eqz v1, :cond_0

    .line 182
    :goto_0
    return-void

    .line 163
    :cond_0
    monitor-enter p0

    .line 164
    :try_start_0
    iget-boolean v1, p0, Lio/reactivex/observers/SerializedObserver;->done:Z

    if-eqz v1, :cond_1

    .line 165
    monitor-exit p0

    goto :goto_0

    .line 178
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 167
    :cond_1
    :try_start_1
    iget-boolean v1, p0, Lio/reactivex/observers/SerializedObserver;->emitting:Z

    if-eqz v1, :cond_3

    .line 168
    iget-object v0, p0, Lio/reactivex/observers/SerializedObserver;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 169
    .local v0, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v0, :cond_2

    .line 170
    new-instance v0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 171
    .restart local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/observers/SerializedObserver;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 173
    :cond_2
    invoke-static {}, Lio/reactivex/internal/util/NotificationLite;->complete()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->add(Ljava/lang/Object;)V

    .line 174
    monitor-exit p0

    goto :goto_0

    .line 176
    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :cond_3
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/observers/SerializedObserver;->done:Z

    .line 177
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/observers/SerializedObserver;->emitting:Z

    .line 178
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 180
    iget-object v1, p0, Lio/reactivex/observers/SerializedObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v1}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 119
    .local p0, "this":Lio/reactivex/observers/SerializedObserver;, "Lio/reactivex/observers/SerializedObserver<TT;>;"
    iget-boolean v3, p0, Lio/reactivex/observers/SerializedObserver;->done:Z

    if-eqz v3, :cond_0

    .line 120
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 156
    :goto_0
    return-void

    .line 124
    :cond_0
    monitor-enter p0

    .line 125
    :try_start_0
    iget-boolean v3, p0, Lio/reactivex/observers/SerializedObserver;->done:Z

    if-eqz v3, :cond_1

    .line 126
    const/4 v2, 0x1

    .line 147
    .local v2, "reportError":Z
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    if-eqz v2, :cond_5

    .line 150
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 128
    .end local v2    # "reportError":Z
    :cond_1
    :try_start_1
    iget-boolean v3, p0, Lio/reactivex/observers/SerializedObserver;->emitting:Z

    if-eqz v3, :cond_4

    .line 129
    const/4 v3, 0x1

    iput-boolean v3, p0, Lio/reactivex/observers/SerializedObserver;->done:Z

    .line 130
    iget-object v1, p0, Lio/reactivex/observers/SerializedObserver;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 131
    .local v1, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v1, :cond_2

    .line 132
    new-instance v1, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v1    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v3, 0x4

    invoke-direct {v1, v3}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 133
    .restart local v1    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v1, p0, Lio/reactivex/observers/SerializedObserver;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 135
    :cond_2
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    .line 136
    .local v0, "err":Ljava/lang/Object;
    iget-boolean v3, p0, Lio/reactivex/observers/SerializedObserver;->delayError:Z

    if-eqz v3, :cond_3

    .line 137
    invoke-virtual {v1, v0}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->add(Ljava/lang/Object;)V

    .line 141
    :goto_2
    monitor-exit p0

    goto :goto_0

    .line 147
    .end local v0    # "err":Ljava/lang/Object;
    .end local v1    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 139
    .restart local v0    # "err":Ljava/lang/Object;
    .restart local v1    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :cond_3
    :try_start_2
    invoke-virtual {v1, v0}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->setFirst(Ljava/lang/Object;)V

    goto :goto_2

    .line 143
    .end local v0    # "err":Ljava/lang/Object;
    .end local v1    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :cond_4
    const/4 v3, 0x1

    iput-boolean v3, p0, Lio/reactivex/observers/SerializedObserver;->done:Z

    .line 144
    const/4 v3, 0x1

    iput-boolean v3, p0, Lio/reactivex/observers/SerializedObserver;->emitting:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 145
    const/4 v2, 0x0

    .restart local v2    # "reportError":Z
    goto :goto_1

    .line 154
    :cond_5
    iget-object v3, p0, Lio/reactivex/observers/SerializedObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 88
    .local p0, "this":Lio/reactivex/observers/SerializedObserver;, "Lio/reactivex/observers/SerializedObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v1, p0, Lio/reactivex/observers/SerializedObserver;->done:Z

    if-eqz v1, :cond_0

    .line 115
    :goto_0
    return-void

    .line 91
    :cond_0
    if-nez p1, :cond_1

    .line 92
    iget-object v1, p0, Lio/reactivex/observers/SerializedObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 93
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lio/reactivex/observers/SerializedObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 96
    :cond_1
    monitor-enter p0

    .line 97
    :try_start_0
    iget-boolean v1, p0, Lio/reactivex/observers/SerializedObserver;->done:Z

    if-eqz v1, :cond_2

    .line 98
    monitor-exit p0

    goto :goto_0

    .line 110
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 100
    :cond_2
    :try_start_1
    iget-boolean v1, p0, Lio/reactivex/observers/SerializedObserver;->emitting:Z

    if-eqz v1, :cond_4

    .line 101
    iget-object v0, p0, Lio/reactivex/observers/SerializedObserver;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 102
    .local v0, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v0, :cond_3

    .line 103
    new-instance v0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 104
    .restart local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/observers/SerializedObserver;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 106
    :cond_3
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->add(Ljava/lang/Object;)V

    .line 107
    monitor-exit p0

    goto :goto_0

    .line 109
    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :cond_4
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/observers/SerializedObserver;->emitting:Z

    .line 110
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 112
    iget-object v1, p0, Lio/reactivex/observers/SerializedObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v1, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 114
    invoke-virtual {p0}, Lio/reactivex/observers/SerializedObserver;->emitLoop()V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 67
    .local p0, "this":Lio/reactivex/observers/SerializedObserver;, "Lio/reactivex/observers/SerializedObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/observers/SerializedObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 68
    iput-object p1, p0, Lio/reactivex/observers/SerializedObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 70
    iget-object v0, p0, Lio/reactivex/observers/SerializedObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 72
    :cond_0
    return-void
.end method
