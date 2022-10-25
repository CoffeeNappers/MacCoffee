.class final Lio/reactivex/subjects/SerializedSubject;
.super Lio/reactivex/subjects/Subject;
.source "SerializedSubject.java"

# interfaces
.implements Lio/reactivex/internal/util/AppendOnlyLinkedArrayList$NonThrowingPredicate;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/subjects/Subject",
        "<TT;>;",
        "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList$NonThrowingPredicate",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final actual:Lio/reactivex/subjects/Subject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/subjects/Subject",
            "<TT;>;"
        }
    .end annotation
.end field

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


# direct methods
.method constructor <init>(Lio/reactivex/subjects/Subject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/subjects/Subject",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lio/reactivex/subjects/SerializedSubject;, "Lio/reactivex/subjects/SerializedSubject<TT;>;"
    .local p1, "actual":Lio/reactivex/subjects/Subject;, "Lio/reactivex/subjects/Subject<TT;>;"
    invoke-direct {p0}, Lio/reactivex/subjects/Subject;-><init>()V

    .line 43
    iput-object p1, p0, Lio/reactivex/subjects/SerializedSubject;->actual:Lio/reactivex/subjects/Subject;

    .line 44
    return-void
.end method


# virtual methods
.method emitLoop()V
    .locals 2

    .prologue
    .line 168
    .local p0, "this":Lio/reactivex/subjects/SerializedSubject;, "Lio/reactivex/subjects/SerializedSubject<TT;>;"
    :goto_0
    monitor-enter p0

    .line 169
    :try_start_0
    iget-object v0, p0, Lio/reactivex/subjects/SerializedSubject;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 170
    .local v0, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v0, :cond_0

    .line 171
    const/4 v1, 0x0

    iput-boolean v1, p0, Lio/reactivex/subjects/SerializedSubject;->emitting:Z

    .line 172
    monitor-exit p0

    return-void

    .line 174
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/subjects/SerializedSubject;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 175
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 176
    invoke-virtual {v0, p0}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->forEachWhile(Lio/reactivex/internal/util/AppendOnlyLinkedArrayList$NonThrowingPredicate;)V

    goto :goto_0

    .line 175
    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 197
    .local p0, "this":Lio/reactivex/subjects/SerializedSubject;, "Lio/reactivex/subjects/SerializedSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/SerializedSubject;->actual:Lio/reactivex/subjects/Subject;

    invoke-virtual {v0}, Lio/reactivex/subjects/Subject;->getThrowable()Ljava/lang/Throwable;

    move-result-object v0

    return-object v0
.end method

.method public hasComplete()Z
    .locals 1

    .prologue
    .line 202
    .local p0, "this":Lio/reactivex/subjects/SerializedSubject;, "Lio/reactivex/subjects/SerializedSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/SerializedSubject;->actual:Lio/reactivex/subjects/Subject;

    invoke-virtual {v0}, Lio/reactivex/subjects/Subject;->hasComplete()Z

    move-result v0

    return v0
.end method

.method public hasObservers()Z
    .locals 1

    .prologue
    .line 187
    .local p0, "this":Lio/reactivex/subjects/SerializedSubject;, "Lio/reactivex/subjects/SerializedSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/SerializedSubject;->actual:Lio/reactivex/subjects/Subject;

    invoke-virtual {v0}, Lio/reactivex/subjects/Subject;->hasObservers()Z

    move-result v0

    return v0
.end method

.method public hasThrowable()Z
    .locals 1

    .prologue
    .line 192
    .local p0, "this":Lio/reactivex/subjects/SerializedSubject;, "Lio/reactivex/subjects/SerializedSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/SerializedSubject;->actual:Lio/reactivex/subjects/Subject;

    invoke-virtual {v0}, Lio/reactivex/subjects/Subject;->hasThrowable()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 142
    .local p0, "this":Lio/reactivex/subjects/SerializedSubject;, "Lio/reactivex/subjects/SerializedSubject<TT;>;"
    iget-boolean v1, p0, Lio/reactivex/subjects/SerializedSubject;->done:Z

    if-eqz v1, :cond_0

    .line 162
    :goto_0
    return-void

    .line 145
    :cond_0
    monitor-enter p0

    .line 146
    :try_start_0
    iget-boolean v1, p0, Lio/reactivex/subjects/SerializedSubject;->done:Z

    if-eqz v1, :cond_1

    .line 147
    monitor-exit p0

    goto :goto_0

    .line 160
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 149
    :cond_1
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lio/reactivex/subjects/SerializedSubject;->done:Z

    .line 150
    iget-boolean v1, p0, Lio/reactivex/subjects/SerializedSubject;->emitting:Z

    if-eqz v1, :cond_3

    .line 151
    iget-object v0, p0, Lio/reactivex/subjects/SerializedSubject;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 152
    .local v0, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v0, :cond_2

    .line 153
    new-instance v0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 154
    .restart local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/subjects/SerializedSubject;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 156
    :cond_2
    invoke-static {}, Lio/reactivex/internal/util/NotificationLite;->complete()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->add(Ljava/lang/Object;)V

    .line 157
    monitor-exit p0

    goto :goto_0

    .line 159
    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :cond_3
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/subjects/SerializedSubject;->emitting:Z

    .line 160
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 161
    iget-object v1, p0, Lio/reactivex/subjects/SerializedSubject;->actual:Lio/reactivex/subjects/Subject;

    invoke-virtual {v1}, Lio/reactivex/subjects/Subject;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 110
    .local p0, "this":Lio/reactivex/subjects/SerializedSubject;, "Lio/reactivex/subjects/SerializedSubject<TT;>;"
    iget-boolean v2, p0, Lio/reactivex/subjects/SerializedSubject;->done:Z

    if-eqz v2, :cond_0

    .line 111
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 138
    :goto_0
    return-void

    .line 115
    :cond_0
    monitor-enter p0

    .line 116
    :try_start_0
    iget-boolean v2, p0, Lio/reactivex/subjects/SerializedSubject;->done:Z

    if-eqz v2, :cond_1

    .line 117
    const/4 v1, 0x1

    .line 132
    .local v1, "reportError":Z
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 133
    if-eqz v1, :cond_4

    .line 134
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 119
    .end local v1    # "reportError":Z
    :cond_1
    const/4 v2, 0x1

    :try_start_1
    iput-boolean v2, p0, Lio/reactivex/subjects/SerializedSubject;->done:Z

    .line 120
    iget-boolean v2, p0, Lio/reactivex/subjects/SerializedSubject;->emitting:Z

    if-eqz v2, :cond_3

    .line 121
    iget-object v0, p0, Lio/reactivex/subjects/SerializedSubject;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 122
    .local v0, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v0, :cond_2

    .line 123
    new-instance v0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v2, 0x4

    invoke-direct {v0, v2}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 124
    .restart local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/subjects/SerializedSubject;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 126
    :cond_2
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->setFirst(Ljava/lang/Object;)V

    .line 127
    monitor-exit p0

    goto :goto_0

    .line 132
    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 129
    :cond_3
    const/4 v1, 0x0

    .line 130
    .restart local v1    # "reportError":Z
    const/4 v2, 0x1

    :try_start_2
    iput-boolean v2, p0, Lio/reactivex/subjects/SerializedSubject;->emitting:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 137
    :cond_4
    iget-object v2, p0, Lio/reactivex/subjects/SerializedSubject;->actual:Lio/reactivex/subjects/Subject;

    invoke-virtual {v2, p1}, Lio/reactivex/subjects/Subject;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 86
    .local p0, "this":Lio/reactivex/subjects/SerializedSubject;, "Lio/reactivex/subjects/SerializedSubject<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v1, p0, Lio/reactivex/subjects/SerializedSubject;->done:Z

    if-eqz v1, :cond_0

    .line 106
    :goto_0
    return-void

    .line 89
    :cond_0
    monitor-enter p0

    .line 90
    :try_start_0
    iget-boolean v1, p0, Lio/reactivex/subjects/SerializedSubject;->done:Z

    if-eqz v1, :cond_1

    .line 91
    monitor-exit p0

    goto :goto_0

    .line 103
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 93
    :cond_1
    :try_start_1
    iget-boolean v1, p0, Lio/reactivex/subjects/SerializedSubject;->emitting:Z

    if-eqz v1, :cond_3

    .line 94
    iget-object v0, p0, Lio/reactivex/subjects/SerializedSubject;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 95
    .local v0, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v0, :cond_2

    .line 96
    new-instance v0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 97
    .restart local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/subjects/SerializedSubject;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 99
    :cond_2
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->add(Ljava/lang/Object;)V

    .line 100
    monitor-exit p0

    goto :goto_0

    .line 102
    .end local v0    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :cond_3
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/subjects/SerializedSubject;->emitting:Z

    .line 103
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 104
    iget-object v1, p0, Lio/reactivex/subjects/SerializedSubject;->actual:Lio/reactivex/subjects/Subject;

    invoke-virtual {v1, p1}, Lio/reactivex/subjects/Subject;->onNext(Ljava/lang/Object;)V

    .line 105
    invoke-virtual {p0}, Lio/reactivex/subjects/SerializedSubject;->emitLoop()V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 3
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 55
    .local p0, "this":Lio/reactivex/subjects/SerializedSubject;, "Lio/reactivex/subjects/SerializedSubject<TT;>;"
    iget-boolean v2, p0, Lio/reactivex/subjects/SerializedSubject;->done:Z

    if-nez v2, :cond_3

    .line 56
    monitor-enter p0

    .line 57
    :try_start_0
    iget-boolean v2, p0, Lio/reactivex/subjects/SerializedSubject;->done:Z

    if-eqz v2, :cond_0

    .line 58
    const/4 v0, 0x1

    .line 72
    .local v0, "cancel":Z
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    :goto_1
    if-eqz v0, :cond_4

    .line 77
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 82
    .end local v0    # "cancel":Z
    :goto_2
    return-void

    .line 60
    :cond_0
    :try_start_1
    iget-boolean v2, p0, Lio/reactivex/subjects/SerializedSubject;->emitting:Z

    if-eqz v2, :cond_2

    .line 61
    iget-object v1, p0, Lio/reactivex/subjects/SerializedSubject;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 62
    .local v1, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-nez v1, :cond_1

    .line 63
    new-instance v1, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v1    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 64
    .restart local v1    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v1, p0, Lio/reactivex/subjects/SerializedSubject;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 66
    :cond_1
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->disposable(Lio/reactivex/disposables/Disposable;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->add(Ljava/lang/Object;)V

    .line 67
    monitor-exit p0

    goto :goto_2

    .line 72
    .end local v1    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 69
    :cond_2
    const/4 v2, 0x1

    :try_start_2
    iput-boolean v2, p0, Lio/reactivex/subjects/SerializedSubject;->emitting:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 70
    const/4 v0, 0x0

    .restart local v0    # "cancel":Z
    goto :goto_0

    .line 74
    .end local v0    # "cancel":Z
    :cond_3
    const/4 v0, 0x1

    .restart local v0    # "cancel":Z
    goto :goto_1

    .line 79
    :cond_4
    iget-object v2, p0, Lio/reactivex/subjects/SerializedSubject;->actual:Lio/reactivex/subjects/Subject;

    invoke-virtual {v2, p1}, Lio/reactivex/subjects/Subject;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 80
    invoke-virtual {p0}, Lio/reactivex/subjects/SerializedSubject;->emitLoop()V

    goto :goto_2
.end method

.method protected subscribeActual(Lio/reactivex/Observer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lio/reactivex/subjects/SerializedSubject;, "Lio/reactivex/subjects/SerializedSubject<TT;>;"
    .local p1, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/SerializedSubject;->actual:Lio/reactivex/subjects/Subject;

    invoke-virtual {v0, p1}, Lio/reactivex/subjects/Subject;->subscribe(Lio/reactivex/Observer;)V

    .line 49
    return-void
.end method

.method public test(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 182
    .local p0, "this":Lio/reactivex/subjects/SerializedSubject;, "Lio/reactivex/subjects/SerializedSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/SerializedSubject;->actual:Lio/reactivex/subjects/Subject;

    invoke-static {p1, v0}, Lio/reactivex/internal/util/NotificationLite;->acceptFull(Ljava/lang/Object;Lio/reactivex/Observer;)Z

    move-result v0

    return v0
.end method
