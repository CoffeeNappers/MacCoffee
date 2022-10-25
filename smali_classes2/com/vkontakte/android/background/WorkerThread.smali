.class public Lcom/vkontakte/android/background/WorkerThread;
.super Ljava/lang/Thread;
.source "WorkerThread.java"


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private final mLock:Ljava/lang/Object;

.field private mReady:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "threadName"    # Ljava/lang/String;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 10
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/background/WorkerThread;->mLock:Ljava/lang/Object;

    .line 11
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/background/WorkerThread;->mReady:Z

    .line 15
    return-void
.end method


# virtual methods
.method public interrupt()V
    .locals 3

    .prologue
    .line 77
    iget-object v1, p0, Lcom/vkontakte/android/background/WorkerThread;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 78
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/background/WorkerThread;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/vkontakte/android/background/WorkerThread;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 81
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    :try_start_1
    invoke-virtual {p0}, Lcom/vkontakte/android/background/WorkerThread;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/background/WorkerThread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_1

    .line 85
    invoke-super {p0}, Ljava/lang/Thread;->interrupt()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 89
    :cond_1
    :goto_0
    return-void

    .line 81
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 87
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public isStarted()Z
    .locals 1

    .prologue
    .line 109
    iget-boolean v0, p0, Lcom/vkontakte/android/background/WorkerThread;->mReady:Z

    return v0
.end method

.method public postRunnable(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 33
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/vkontakte/android/background/WorkerThread;->postRunnable(Ljava/lang/Runnable;J)V

    .line 34
    return-void
.end method

.method public postRunnable(Ljava/lang/Runnable;J)V
    .locals 6
    .param p1, "runnable"    # Ljava/lang/Runnable;
    .param p2, "delayMillis"    # J

    .prologue
    .line 56
    iget-object v2, p0, Lcom/vkontakte/android/background/WorkerThread;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 57
    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/vkontakte/android/background/WorkerThread;->mReady:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 59
    :try_start_1
    iget-object v1, p0, Lcom/vkontakte/android/background/WorkerThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 60
    :catch_0
    move-exception v0

    .line 61
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 72
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 65
    :cond_0
    :try_start_3
    iget-object v1, p0, Lcom/vkontakte/android/background/WorkerThread;->mHandler:Landroid/os/Handler;

    if-eqz v1, :cond_1

    .line 66
    const-wide/16 v4, 0x0

    cmp-long v1, p2, v4

    if-gtz v1, :cond_2

    .line 67
    iget-object v1, p0, Lcom/vkontakte/android/background/WorkerThread;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 72
    :cond_1
    :goto_1
    monitor-exit v2

    .line 73
    return-void

    .line 69
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/background/WorkerThread;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method

.method public removeCallbacks(Ljava/lang/Runnable;)V
    .locals 3
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 92
    iget-object v2, p0, Lcom/vkontakte/android/background/WorkerThread;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 94
    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/vkontakte/android/background/WorkerThread;->mReady:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 96
    :try_start_1
    iget-object v1, p0, Lcom/vkontakte/android/background/WorkerThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 105
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 102
    :cond_0
    :try_start_3
    iget-object v1, p0, Lcom/vkontakte/android/background/WorkerThread;->mHandler:Landroid/os/Handler;

    if-eqz v1, :cond_1

    .line 103
    iget-object v1, p0, Lcom/vkontakte/android/background/WorkerThread;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 105
    :cond_1
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 106
    return-void
.end method

.method public run()V
    .locals 2

    .prologue
    .line 19
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 20
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/background/WorkerThread;->mHandler:Landroid/os/Handler;

    .line 21
    iget-object v1, p0, Lcom/vkontakte/android/background/WorkerThread;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 22
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/background/WorkerThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 23
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/background/WorkerThread;->mReady:Z

    .line 24
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 26
    return-void

    .line 24
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public sendMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    .line 29
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/vkontakte/android/background/WorkerThread;->sendMessage(Landroid/os/Message;J)V

    .line 30
    return-void
.end method

.method public sendMessage(Landroid/os/Message;J)V
    .locals 6
    .param p1, "message"    # Landroid/os/Message;
    .param p2, "delayMillis"    # J

    .prologue
    .line 37
    iget-object v2, p0, Lcom/vkontakte/android/background/WorkerThread;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 38
    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/vkontakte/android/background/WorkerThread;->mReady:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 40
    :try_start_1
    iget-object v1, p0, Lcom/vkontakte/android/background/WorkerThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 41
    :catch_0
    move-exception v0

    .line 42
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 52
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 45
    :cond_0
    :try_start_3
    iget-object v1, p0, Lcom/vkontakte/android/background/WorkerThread;->mHandler:Landroid/os/Handler;

    if-eqz v1, :cond_1

    .line 46
    const-wide/16 v4, 0x0

    cmp-long v1, p2, v4

    if-gtz v1, :cond_2

    .line 47
    iget-object v1, p0, Lcom/vkontakte/android/background/WorkerThread;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 52
    :cond_1
    :goto_1
    monitor-exit v2

    .line 53
    return-void

    .line 49
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/background/WorkerThread;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1, p2, p3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method
