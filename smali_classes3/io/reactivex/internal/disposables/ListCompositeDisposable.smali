.class public final Lio/reactivex/internal/disposables/ListCompositeDisposable;
.super Ljava/lang/Object;
.source "ListCompositeDisposable.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;
.implements Lio/reactivex/internal/disposables/DisposableContainer;


# instance fields
.field volatile disposed:Z

.field resources:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/disposables/Disposable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p1, "resources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/disposables/Disposable;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const-string/jumbo v2, "resources is null"

    invoke-static {p1, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 45
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    .line 46
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    .line 47
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    const-string/jumbo v2, "Disposable item is null"

    invoke-static {v0, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 48
    iget-object v2, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 50
    .end local v0    # "d":Lio/reactivex/disposables/Disposable;
    :cond_0
    return-void
.end method

.method public varargs constructor <init>([Lio/reactivex/disposables/Disposable;)V
    .locals 5
    .param p1, "resources"    # [Lio/reactivex/disposables/Disposable;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const-string/jumbo v4, "resources is null"

    invoke-static {p1, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 36
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    iput-object v4, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    .line 37
    move-object v0, p1

    .local v0, "arr$":[Lio/reactivex/disposables/Disposable;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 38
    .local v1, "d":Lio/reactivex/disposables/Disposable;
    const-string/jumbo v4, "Disposable item is null"

    invoke-static {v1, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 39
    iget-object v4, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 41
    .end local v1    # "d":Lio/reactivex/disposables/Disposable;
    :cond_0
    return-void
.end method


# virtual methods
.method public add(Lio/reactivex/disposables/Disposable;)Z
    .locals 2
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 77
    const-string/jumbo v1, "d is null"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 78
    iget-boolean v1, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    if-nez v1, :cond_2

    .line 79
    monitor-enter p0

    .line 80
    :try_start_0
    iget-boolean v1, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    if-nez v1, :cond_1

    .line 81
    iget-object v0, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    .line 82
    .local v0, "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    if-nez v0, :cond_0

    .line 83
    new-instance v0, Ljava/util/LinkedList;

    .end local v0    # "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 84
    .restart local v0    # "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    iput-object v0, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    .line 86
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    const/4 v1, 0x1

    monitor-exit p0

    .line 92
    .end local v0    # "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    :goto_0
    return v1

    .line 89
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    :cond_2
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 92
    const/4 v1, 0x0

    goto :goto_0

    .line 89
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public varargs addAll([Lio/reactivex/disposables/Disposable;)Z
    .locals 6
    .param p1, "ds"    # [Lio/reactivex/disposables/Disposable;

    .prologue
    .line 96
    const-string/jumbo v5, "ds is null"

    invoke-static {p1, v5}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 97
    iget-boolean v5, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    if-nez v5, :cond_3

    .line 98
    monitor-enter p0

    .line 99
    :try_start_0
    iget-boolean v5, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    if-nez v5, :cond_2

    .line 100
    iget-object v4, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    .line 101
    .local v4, "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    if-nez v4, :cond_0

    .line 102
    new-instance v4, Ljava/util/LinkedList;

    .end local v4    # "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 103
    .restart local v4    # "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    iput-object v4, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    .line 105
    :cond_0
    move-object v0, p1

    .local v0, "arr$":[Lio/reactivex/disposables/Disposable;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 106
    .local v1, "d":Lio/reactivex/disposables/Disposable;
    const-string/jumbo v5, "d is null"

    invoke-static {v1, v5}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 107
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 109
    .end local v1    # "d":Lio/reactivex/disposables/Disposable;
    :cond_1
    const/4 v5, 0x1

    monitor-exit p0

    .line 116
    .end local v4    # "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    :goto_1
    return v5

    .line 111
    .end local v0    # "arr$":[Lio/reactivex/disposables/Disposable;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    :cond_3
    move-object v0, p1

    .restart local v0    # "arr$":[Lio/reactivex/disposables/Disposable;
    array-length v3, v0

    .restart local v3    # "len$":I
    const/4 v2, 0x0

    .restart local v2    # "i$":I
    :goto_2
    if-ge v2, v3, :cond_4

    aget-object v1, v0, v2

    .line 114
    .restart local v1    # "d":Lio/reactivex/disposables/Disposable;
    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 113
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 111
    .end local v0    # "arr$":[Lio/reactivex/disposables/Disposable;
    .end local v1    # "d":Lio/reactivex/disposables/Disposable;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 116
    .restart local v0    # "arr$":[Lio/reactivex/disposables/Disposable;
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    :cond_4
    const/4 v5, 0x0

    goto :goto_1
.end method

.method public clear()V
    .locals 2

    .prologue
    .line 148
    iget-boolean v1, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    if-eqz v1, :cond_0

    .line 162
    :goto_0
    return-void

    .line 152
    :cond_0
    monitor-enter p0

    .line 153
    :try_start_0
    iget-boolean v1, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    if-eqz v1, :cond_1

    .line 154
    monitor-exit p0

    goto :goto_0

    .line 159
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 157
    :cond_1
    :try_start_1
    iget-object v0, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    .line 158
    .local v0, "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    .line 159
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 161
    invoke-virtual {p0, v0}, Lio/reactivex/internal/disposables/ListCompositeDisposable;->dispose(Ljava/util/List;)V

    goto :goto_0
.end method

.method public delete(Lio/reactivex/disposables/Disposable;)Z
    .locals 3
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    const/4 v1, 0x0

    .line 130
    const-string/jumbo v2, "Disposable item is null"

    invoke-static {p1, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 131
    iget-boolean v2, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    if-eqz v2, :cond_0

    .line 144
    :goto_0
    return v1

    .line 134
    :cond_0
    monitor-enter p0

    .line 135
    :try_start_0
    iget-boolean v2, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    if-eqz v2, :cond_1

    .line 136
    monitor-exit p0

    goto :goto_0

    .line 143
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 139
    :cond_1
    :try_start_1
    iget-object v0, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    .line 140
    .local v0, "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    if-eqz v0, :cond_2

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 141
    :cond_2
    monitor-exit p0

    goto :goto_0

    .line 143
    :cond_3
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 144
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public dispose()V
    .locals 2

    .prologue
    .line 54
    iget-boolean v1, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    if-eqz v1, :cond_0

    .line 68
    :goto_0
    return-void

    .line 58
    :cond_0
    monitor-enter p0

    .line 59
    :try_start_0
    iget-boolean v1, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    if-eqz v1, :cond_1

    .line 60
    monitor-exit p0

    goto :goto_0

    .line 65
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 62
    :cond_1
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    .line 63
    iget-object v0, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    .line 64
    .local v0, "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    .line 65
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 67
    invoke-virtual {p0, v0}, Lio/reactivex/internal/disposables/ListCompositeDisposable;->dispose(Ljava/util/List;)V

    goto :goto_0
.end method

.method dispose(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 165
    .local p1, "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    if-nez p1, :cond_1

    .line 186
    :cond_0
    return-void

    .line 168
    :cond_1
    const/4 v0, 0x0

    .line 169
    .local v0, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/reactivex/disposables/Disposable;

    .line 171
    .local v3, "o":Lio/reactivex/disposables/Disposable;
    :try_start_0
    invoke-interface {v3}, Lio/reactivex/disposables/Disposable;->dispose()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 172
    :catch_0
    move-exception v1

    .line 173
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 174
    if-nez v0, :cond_2

    .line 175
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 177
    .restart local v0    # "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :cond_2
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 180
    .end local v1    # "ex":Ljava/lang/Throwable;
    .end local v3    # "o":Lio/reactivex/disposables/Disposable;
    :cond_3
    if-eqz v0, :cond_0

    .line 181
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_4

    .line 182
    const/4 v4, 0x0

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Throwable;

    invoke-static {v4}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4

    .line 184
    :cond_4
    new-instance v4, Lio/reactivex/exceptions/CompositeException;

    invoke-direct {v4, v0}, Lio/reactivex/exceptions/CompositeException;-><init>(Ljava/lang/Iterable;)V

    throw v4
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 72
    iget-boolean v0, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    return v0
.end method

.method public remove(Lio/reactivex/disposables/Disposable;)Z
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 121
    invoke-virtual {p0, p1}, Lio/reactivex/internal/disposables/ListCompositeDisposable;->delete(Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 122
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 123
    const/4 v0, 0x1

    .line 125
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
