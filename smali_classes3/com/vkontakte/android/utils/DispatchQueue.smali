.class public Lcom/vkontakte/android/utils/DispatchQueue;
.super Ljava/lang/Thread;
.source "DispatchQueue.java"


# instance fields
.field private volatile handler:Landroid/os/Handler;

.field private syncLatch:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "threadName"    # Ljava/lang/String;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 12
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/utils/DispatchQueue;->handler:Landroid/os/Handler;

    .line 13
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/utils/DispatchQueue;->syncLatch:Ljava/util/concurrent/CountDownLatch;

    .line 16
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/utils/DispatchQueue;->setName(Ljava/lang/String;)V

    .line 17
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/DispatchQueue;->start()V

    .line 18
    return-void
.end method

.method private sendMessage(Landroid/os/Message;I)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;
    .param p2, "delay"    # I

    .prologue
    .line 22
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/DispatchQueue;->syncLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 23
    if-gtz p2, :cond_0

    .line 24
    iget-object v1, p0, Lcom/vkontakte/android/utils/DispatchQueue;->handler:Landroid/os/Handler;

    invoke-virtual {v1, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 31
    :goto_0
    return-void

    .line 26
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/DispatchQueue;->handler:Landroid/os/Handler;

    int-to-long v2, p2

    invoke-virtual {v1, p1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 28
    :catch_0
    move-exception v0

    .line 29
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "send message failure"

    invoke-static {v1, v2, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public cancelRunnable(Ljava/lang/Runnable;)V
    .locals 3
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 35
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/DispatchQueue;->syncLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 36
    iget-object v1, p0, Lcom/vkontakte/android/utils/DispatchQueue;->handler:Landroid/os/Handler;

    invoke-virtual {v1, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    :goto_0
    return-void

    .line 37
    :catch_0
    move-exception v0

    .line 38
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "cancel task failure"

    invoke-static {v1, v2, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public cleanupQueue()V
    .locals 3

    .prologue
    .line 61
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/DispatchQueue;->syncLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 62
    iget-object v1, p0, Lcom/vkontakte/android/utils/DispatchQueue;->handler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    :goto_0
    return-void

    .line 63
    :catch_0
    move-exception v0

    .line 64
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "cleanup failure"

    invoke-static {v1, v2, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public postRunnable(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 43
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;J)V

    .line 44
    return-void
.end method

.method public postRunnable(Ljava/lang/Runnable;J)V
    .locals 4
    .param p1, "runnable"    # Ljava/lang/Runnable;
    .param p2, "delay"    # J

    .prologue
    .line 48
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/DispatchQueue;->syncLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 49
    const-wide/16 v2, 0x0

    cmp-long v1, p2, v2

    if-gtz v1, :cond_0

    .line 50
    iget-object v1, p0, Lcom/vkontakte/android/utils/DispatchQueue;->handler:Landroid/os/Handler;

    invoke-virtual {v1, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 57
    :goto_0
    return-void

    .line 52
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/DispatchQueue;->handler:Landroid/os/Handler;

    invoke-virtual {v1, p1, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 54
    :catch_0
    move-exception v0

    .line 55
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "post task failure"

    invoke-static {v1, v2, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public run()V
    .locals 1

    .prologue
    .line 70
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 71
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/utils/DispatchQueue;->handler:Landroid/os/Handler;

    .line 72
    iget-object v0, p0, Lcom/vkontakte/android/utils/DispatchQueue;->syncLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 73
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 74
    return-void
.end method
