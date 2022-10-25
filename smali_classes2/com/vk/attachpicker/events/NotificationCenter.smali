.class public Lcom/vk/attachpicker/events/NotificationCenter;
.super Ljava/lang/Object;
.source "NotificationCenter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;
    }
.end annotation


# static fields
.field private static final KEY_DELIMITER:Ljava/lang/String; = "-"

.field public static final NO_ID:I = -0x80000000

.field private static final TAG:Ljava/lang/String; = "NotificationCenter"

.field private static volatile instance:Lcom/vk/attachpicker/events/NotificationCenter;


# instance fields
.field private final backgroundFireExecutor:Ljava/util/concurrent/ExecutorService;

.field private final fireRemoveSyncObject:Ljava/lang/Object;

.field private final handler:Landroid/os/Handler;

.field private final listeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/attachpicker/events/NotificationCenter;->handler:Landroid/os/Handler;

    .line 47
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/events/NotificationCenter;->fireRemoveSyncObject:Ljava/lang/Object;

    .line 38
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/events/NotificationCenter;->backgroundFireExecutor:Ljava/util/concurrent/ExecutorService;

    .line 40
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/events/NotificationCenter;->listeners:Ljava/util/Set;

    .line 41
    return-void
.end method

.method static synthetic access$100(Lcom/vk/attachpicker/events/NotificationCenter;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/events/NotificationCenter;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/vk/attachpicker/events/NotificationCenter;->fireRemoveSyncObject:Ljava/lang/Object;

    return-object v0
.end method

.method public static getInstance()Lcom/vk/attachpicker/events/NotificationCenter;
    .locals 2

    .prologue
    .line 26
    sget-object v0, Lcom/vk/attachpicker/events/NotificationCenter;->instance:Lcom/vk/attachpicker/events/NotificationCenter;

    if-nez v0, :cond_1

    .line 27
    const-class v1, Lcom/vk/attachpicker/events/NotificationCenter;

    monitor-enter v1

    .line 28
    :try_start_0
    sget-object v0, Lcom/vk/attachpicker/events/NotificationCenter;->instance:Lcom/vk/attachpicker/events/NotificationCenter;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lcom/vk/attachpicker/events/NotificationCenter;

    invoke-direct {v0}, Lcom/vk/attachpicker/events/NotificationCenter;-><init>()V

    sput-object v0, Lcom/vk/attachpicker/events/NotificationCenter;->instance:Lcom/vk/attachpicker/events/NotificationCenter;

    .line 31
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    :cond_1
    sget-object v0, Lcom/vk/attachpicker/events/NotificationCenter;->instance:Lcom/vk/attachpicker/events/NotificationCenter;

    return-object v0

    .line 31
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private getKeyForEvent(II)Ljava/lang/String;
    .locals 2
    .param p1, "eventType"    # I
    .param p2, "eventId"    # I

    .prologue
    .line 178
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static isUiThread()Z
    .locals 2

    .prologue
    .line 261
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addListener(IILcom/vk/attachpicker/events/NotificationListener;)V
    .locals 8
    .param p1, "eventType"    # I
    .param p2, "eventId"    # I
    .param p3, "notificationListener"    # Lcom/vk/attachpicker/events/NotificationListener;

    .prologue
    .line 71
    if-eqz p3, :cond_0

    .line 72
    iget-object v7, p0, Lcom/vk/attachpicker/events/NotificationCenter;->listeners:Ljava/util/Set;

    new-instance v0, Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;

    invoke-static {}, Lcom/vk/attachpicker/events/NotificationCenter;->isUiThread()Z

    move-result v5

    const/4 v6, 0x0

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v6}, Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;-><init>(Lcom/vk/attachpicker/events/NotificationCenter;IILcom/vk/attachpicker/events/NotificationListener;ZLcom/vk/attachpicker/events/NotificationCenter$1;)V

    invoke-interface {v7, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 74
    :cond_0
    return-void
.end method

.method public addListener(ILcom/vk/attachpicker/events/NotificationListener;)V
    .locals 1
    .param p1, "eventType"    # I
    .param p2, "notificationListener"    # Lcom/vk/attachpicker/events/NotificationListener;

    .prologue
    .line 83
    const/high16 v0, -0x80000000

    invoke-virtual {p0, p1, v0, p2}, Lcom/vk/attachpicker/events/NotificationCenter;->addListener(IILcom/vk/attachpicker/events/NotificationListener;)V

    .line 84
    return-void
.end method

.method public fireEvent(I)V
    .locals 2
    .param p1, "eventType"    # I

    .prologue
    .line 174
    const/high16 v0, -0x80000000

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/vk/attachpicker/events/NotificationCenter;->fireEvent(IILjava/lang/Object;)V

    .line 175
    return-void
.end method

.method public fireEvent(II)V
    .locals 1
    .param p1, "eventType"    # I
    .param p2, "eventId"    # I

    .prologue
    .line 160
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vk/attachpicker/events/NotificationCenter;->fireEvent(IILjava/lang/Object;)V

    .line 161
    return-void
.end method

.method public fireEvent(IILjava/lang/Object;)V
    .locals 9
    .param p1, "eventType"    # I
    .param p2, "eventId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(IITT;)V"
        }
    .end annotation

    .prologue
    .line 106
    .local p3, "arg":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lcom/vk/attachpicker/events/NotificationCenter;->listeners:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .line 108
    .local v7, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;>;"
    invoke-static {}, Lcom/vk/attachpicker/events/NotificationCenter;->isUiThread()Z

    move-result v6

    .line 110
    .local v6, "isUiThread":Z
    :cond_0
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 111
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;

    .line 113
    .local v2, "listenerContainer":Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;
    if-nez v2, :cond_1

    .line 114
    invoke-interface {v7}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 115
    :cond_1
    iget v1, v2, Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;->eventType:I

    if-ne v1, p1, :cond_0

    iget v1, v2, Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;->eventId:I

    if-ne v1, p2, :cond_0

    .line 117
    iget-object v8, p0, Lcom/vk/attachpicker/events/NotificationCenter;->fireRemoveSyncObject:Ljava/lang/Object;

    monitor-enter v8

    .line 118
    :try_start_0
    invoke-virtual {v2}, Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;->isDeleted()Z

    move-result v1

    if-nez v1, :cond_3

    .line 119
    if-eqz v6, :cond_2

    iget-boolean v1, v2, Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;->wasAddedInUIThread:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_2

    .line 121
    :try_start_1
    iget-object v1, v2, Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;->listener:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-interface {v1, p1, p2, p3}, Lcom/vk/attachpicker/events/NotificationListener;->onNotification(IILjava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 125
    :goto_1
    :try_start_2
    monitor-exit v8

    goto :goto_0

    .line 148
    :catchall_0
    move-exception v1

    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 127
    :cond_2
    :try_start_3
    new-instance v0, Lcom/vk/attachpicker/events/NotificationCenter$1;

    move-object v1, p0

    move v3, p1

    move v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/vk/attachpicker/events/NotificationCenter$1;-><init>(Lcom/vk/attachpicker/events/NotificationCenter;Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;IILjava/lang/Object;)V

    .line 142
    .local v0, "fireEvent":Ljava/lang/Runnable;
    iget-boolean v1, v2, Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;->wasAddedInUIThread:Z

    if-eqz v1, :cond_4

    .line 143
    iget-object v1, p0, Lcom/vk/attachpicker/events/NotificationCenter;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 148
    .end local v0    # "fireEvent":Ljava/lang/Runnable;
    :cond_3
    :goto_2
    monitor-exit v8

    goto :goto_0

    .line 145
    .restart local v0    # "fireEvent":Ljava/lang/Runnable;
    :cond_4
    iget-object v1, p0, Lcom/vk/attachpicker/events/NotificationCenter;->backgroundFireExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    .line 151
    .end local v0    # "fireEvent":Ljava/lang/Runnable;
    .end local v2    # "listenerContainer":Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;
    :cond_5
    return-void

    .line 122
    .restart local v2    # "listenerContainer":Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method public fireEvent(ILjava/lang/Object;)V
    .locals 1
    .param p1, "eventType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(ITT;)V"
        }
    .end annotation

    .prologue
    .line 164
    .local p2, "obj":Ljava/lang/Object;, "TT;"
    const/high16 v0, -0x80000000

    invoke-virtual {p0, p1, v0, p2}, Lcom/vk/attachpicker/events/NotificationCenter;->fireEvent(IILjava/lang/Object;)V

    .line 165
    return-void
.end method

.method public printCurrentListeners()V
    .locals 6

    .prologue
    .line 242
    iget-object v3, p0, Lcom/vk/attachpicker/events/NotificationCenter;->fireRemoveSyncObject:Ljava/lang/Object;

    monitor-enter v3

    .line 243
    const/4 v2, 0x2

    :try_start_0
    new-array v2, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "NotificationCenter"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string/jumbo v5, "---------------------------------------"

    aput-object v5, v2, v4

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 245
    iget-object v2, p0, Lcom/vk/attachpicker/events/NotificationCenter;->listeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 247
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 248
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;

    .line 249
    .local v1, "listenerContainer":Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;
    if-eqz v1, :cond_0

    .line 250
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "NotificationCenter"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/vk/attachpicker/events/NotificationCenter;->listeners:Ljava/util/Set;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    goto :goto_0

    .line 257
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;>;"
    .end local v1    # "listenerContainer":Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 252
    .restart local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;>;"
    .restart local v1    # "listenerContainer":Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;
    :cond_0
    const/4 v2, 0x2

    :try_start_1
    new-array v2, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "NotificationCenter"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string/jumbo v5, "Empty WeakReference, removing"

    aput-object v5, v2, v4

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 253
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 256
    .end local v1    # "listenerContainer":Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;
    :cond_1
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "NotificationCenter"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string/jumbo v5, "---------------------------------------"

    aput-object v5, v2, v4

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 257
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 258
    return-void
.end method

.method public removeListener(Lcom/vk/attachpicker/events/NotificationListener;)V
    .locals 4
    .param p1, "notificationListener"    # Lcom/vk/attachpicker/events/NotificationListener;

    .prologue
    .line 88
    iget-object v2, p0, Lcom/vk/attachpicker/events/NotificationCenter;->listeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 90
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 91
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;

    .line 92
    .local v1, "listenerContainer":Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;
    if-nez v1, :cond_1

    .line 93
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 94
    :cond_1
    iget-object v2, v1, Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;->listener:Lcom/vk/attachpicker/events/NotificationListener;

    if-ne v2, p1, :cond_0

    .line 95
    iget-object v3, p0, Lcom/vk/attachpicker/events/NotificationCenter;->fireRemoveSyncObject:Ljava/lang/Object;

    monitor-enter v3

    .line 96
    :try_start_0
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 97
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;->setDeleted(Z)V

    .line 98
    monitor-exit v3

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 103
    .end local v1    # "listenerContainer":Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;
    :cond_2
    return-void
.end method
