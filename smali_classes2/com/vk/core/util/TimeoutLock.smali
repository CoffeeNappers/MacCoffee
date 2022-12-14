.class public Lcom/vk/core/util/TimeoutLock;
.super Ljava/lang/Object;
.source "TimeoutLock.java"


# static fields
.field private static final MSG_LOCK:I


# instance fields
.field private defaultLockTime:J

.field private final lockHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(J)V
    .locals 3
    .param p1, "defaultLockTime"    # J

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/core/util/TimeoutLock;->lockHandler:Landroid/os/Handler;

    .line 14
    iput-wide p1, p0, Lcom/vk/core/util/TimeoutLock;->defaultLockTime:J

    .line 15
    return-void
.end method


# virtual methods
.method public declared-synchronized checkAndMaybeLock()Z
    .locals 1

    .prologue
    .line 18
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 19
    const/4 v0, 0x1

    .line 22
    :goto_0
    monitor-exit p0

    return v0

    .line 21
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/vk/core/util/TimeoutLock;->lock()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    const/4 v0, 0x0

    goto :goto_0

    .line 18
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isLocked()Z
    .locals 2

    .prologue
    .line 26
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vk/core/util/TimeoutLock;->lockHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized lock()V
    .locals 2

    .prologue
    .line 30
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/vk/core/util/TimeoutLock;->defaultLockTime:J

    invoke-virtual {p0, v0, v1}, Lcom/vk/core/util/TimeoutLock;->lock(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    monitor-exit p0

    return-void

    .line 30
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized lock(J)V
    .locals 3
    .param p1, "lockTime"    # J

    .prologue
    .line 34
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vk/core/util/TimeoutLock;->lockHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    monitor-exit p0

    return-void

    .line 34
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized unlock()V
    .locals 2

    .prologue
    .line 38
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vk/core/util/TimeoutLock;->lockHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    monitor-exit p0

    return-void

    .line 38
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
