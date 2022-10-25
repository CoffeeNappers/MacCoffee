.class public abstract Lcom/vkontakte/android/audio/events/ObservableEventBase;
.super Ljava/lang/Object;
.source "ObservableEventBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingRemoving;,
        Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingAdding;,
        Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Handler:",
        "Ljava/lang/Object;",
        "Sender:",
        "Ljava/lang/Object;",
        "Argument:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final handlers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<THandler;>;"
        }
    .end annotation
.end field

.field private lockEditing:I

.field private pendingActions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase",
            "<THandler;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 9
    .local p0, "this":Lcom/vkontakte/android/audio/events/ObservableEventBase;, "Lcom/vkontakte/android/audio/events/ObservableEventBase<THandler;TSender;TArgument;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->handlers:Ljava/util/List;

    .line 12
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->lockEditing:I

    return-void
.end method

.method private getEditQueue()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase",
            "<THandler;>;>;"
        }
    .end annotation

    .prologue
    .line 37
    .local p0, "this":Lcom/vkontakte/android/audio/events/ObservableEventBase;, "Lcom/vkontakte/android/audio/events/ObservableEventBase<THandler;TSender;TArgument;>;"
    iget-object v0, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->pendingActions:Ljava/util/List;

    if-nez v0, :cond_0

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->pendingActions:Ljava/util/List;

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->pendingActions:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(THandler;)THandler;"
        }
    .end annotation

    .prologue
    .line 16
    .local p0, "this":Lcom/vkontakte/android/audio/events/ObservableEventBase;, "Lcom/vkontakte/android/audio/events/ObservableEventBase<THandler;TSender;TArgument;>;"
    .local p1, "handler":Ljava/lang/Object;, "THandler;"
    iget-object v1, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->handlers:Ljava/util/List;

    monitor-enter v1

    .line 17
    :try_start_0
    iget v0, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->lockEditing:I

    if-lez v0, :cond_0

    .line 18
    invoke-direct {p0}, Lcom/vkontakte/android/audio/events/ObservableEventBase;->getEditQueue()Ljava/util/List;

    move-result-object v0

    new-instance v2, Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingAdding;

    invoke-direct {v2, p1}, Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingAdding;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    :goto_0
    monitor-exit v1

    .line 23
    return-object p1

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->handlers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 22
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected fire(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TSender;TArgument;)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p0, "this":Lcom/vkontakte/android/audio/events/ObservableEventBase;, "Lcom/vkontakte/android/audio/events/ObservableEventBase<THandler;TSender;TArgument;>;"
    .local p1, "sender":Ljava/lang/Object;, "TSender;"
    .local p2, "args":Ljava/lang/Object;, "TArgument;"
    iget-object v3, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->handlers:Ljava/util/List;

    monitor-enter v3

    .line 45
    :try_start_0
    iget v2, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->lockEditing:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->lockEditing:I

    .line 46
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 49
    :try_start_1
    iget-object v2, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->handlers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 50
    .local v1, "handler":Ljava/lang/Object;, "THandler;"
    invoke-virtual {p0, v1, p1, p2}, Lcom/vkontakte/android/audio/events/ObservableEventBase;->notifyHandler(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 53
    .end local v1    # "handler":Ljava/lang/Object;, "THandler;"
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->handlers:Ljava/util/List;

    monitor-enter v3

    .line 54
    :try_start_2
    iget v4, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->lockEditing:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->lockEditing:I

    .line 55
    iget v4, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->lockEditing:I

    if-nez v4, :cond_4

    iget-object v4, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->pendingActions:Ljava/util/List;

    if-eqz v4, :cond_4

    .line 56
    iget-object v4, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->pendingActions:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase;

    .line 57
    .local v0, "action":Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase;, "Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase<THandler;>;"
    iget-object v5, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->handlers:Ljava/util/List;

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase;->run(Ljava/util/List;)V

    goto :goto_1

    .line 60
    .end local v0    # "action":Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase;, "Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase<THandler;>;"
    :catchall_1
    move-exception v2

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v2

    .line 46
    :catchall_2
    move-exception v2

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v2

    .line 53
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->handlers:Ljava/util/List;

    monitor-enter v3

    .line 54
    :try_start_4
    iget v2, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->lockEditing:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->lockEditing:I

    .line 55
    iget v2, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->lockEditing:I

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->pendingActions:Ljava/util/List;

    if-eqz v2, :cond_2

    .line 56
    iget-object v2, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->pendingActions:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase;

    .line 57
    .restart local v0    # "action":Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase;, "Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase<THandler;>;"
    iget-object v4, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->handlers:Ljava/util/List;

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase;->run(Ljava/util/List;)V

    goto :goto_2

    .line 60
    .end local v0    # "action":Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase;, "Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase<THandler;>;"
    :catchall_3
    move-exception v2

    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    throw v2

    .line 58
    :cond_1
    const/4 v2, 0x0

    :try_start_5
    iput-object v2, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->pendingActions:Ljava/util/List;

    .line 60
    :cond_2
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 62
    return-void

    .line 58
    :cond_3
    const/4 v4, 0x0

    :try_start_6
    iput-object v4, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->pendingActions:Ljava/util/List;

    .line 60
    :cond_4
    monitor-exit v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v2
.end method

.method protected abstract notifyHandler(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(THandler;TSender;TArgument;)V"
        }
    .end annotation
.end method

.method public remove(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(THandler;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lcom/vkontakte/android/audio/events/ObservableEventBase;, "Lcom/vkontakte/android/audio/events/ObservableEventBase<THandler;TSender;TArgument;>;"
    .local p1, "handler":Ljava/lang/Object;, "THandler;"
    iget-object v1, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->handlers:Ljava/util/List;

    monitor-enter v1

    .line 28
    :try_start_0
    iget v0, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->lockEditing:I

    if-lez v0, :cond_0

    .line 29
    invoke-direct {p0}, Lcom/vkontakte/android/audio/events/ObservableEventBase;->getEditQueue()Ljava/util/List;

    move-result-object v0

    new-instance v2, Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingRemoving;

    invoke-direct {v2, p1}, Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingRemoving;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    :goto_0
    monitor-exit v1

    .line 34
    return-void

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase;->handlers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
