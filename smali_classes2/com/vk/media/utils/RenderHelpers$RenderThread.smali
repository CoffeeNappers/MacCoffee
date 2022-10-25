.class public Lcom/vk/media/utils/RenderHelpers$RenderThread;
.super Ljava/lang/Object;
.source "RenderHelpers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/utils/RenderHelpers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RenderThread"
.end annotation


# static fields
.field protected static final TAG:Ljava/lang/String;


# instance fields
.field private volatile mHandler:Lcom/vk/media/utils/RenderHelpers$RenderHandler;

.field private mReady:Z

.field private mRunnable:Ljava/lang/Runnable;

.field private final mStartLock:Ljava/lang/Object;

.field private mThread:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-class v0, Lcom/vk/media/utils/RenderHelpers$RenderThread;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mStartLock:Ljava/lang/Object;

    .line 19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mReady:Z

    .line 21
    new-instance v0, Lcom/vk/media/utils/RenderHelpers$RenderThread$1;

    invoke-direct {v0, p0}, Lcom/vk/media/utils/RenderHelpers$RenderThread$1;-><init>(Lcom/vk/media/utils/RenderHelpers$RenderThread;)V

    iput-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$002(Lcom/vk/media/utils/RenderHelpers$RenderThread;Lcom/vk/media/utils/RenderHelpers$RenderHandler;)Lcom/vk/media/utils/RenderHelpers$RenderHandler;
    .locals 0
    .param p0, "x0"    # Lcom/vk/media/utils/RenderHelpers$RenderThread;
    .param p1, "x1"    # Lcom/vk/media/utils/RenderHelpers$RenderHandler;

    .prologue
    .line 15
    iput-object p1, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mHandler:Lcom/vk/media/utils/RenderHelpers$RenderHandler;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vk/media/utils/RenderHelpers$RenderThread;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/utils/RenderHelpers$RenderThread;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mStartLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$202(Lcom/vk/media/utils/RenderHelpers$RenderThread;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/media/utils/RenderHelpers$RenderThread;
    .param p1, "x1"    # Z

    .prologue
    .line 15
    iput-boolean p1, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mReady:Z

    return p1
.end method

.method static synthetic access$300(Lcom/vk/media/utils/RenderHelpers$RenderThread;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/media/utils/RenderHelpers$RenderThread;

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/vk/media/utils/RenderHelpers$RenderThread;->shutdown()V

    return-void
.end method

.method private shutdown()V
    .locals 2

    .prologue
    .line 67
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mReady:Z

    .line 68
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 70
    :try_start_0
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mThread:Ljava/lang/Thread;

    .line 76
    sget-object v0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "shutdown"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    return-void

    .line 74
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public final getHandler()Lcom/vk/media/utils/RenderHelpers$RenderHandler;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mHandler:Lcom/vk/media/utils/RenderHelpers$RenderHandler;

    return-object v0
.end method

.method public isAlive()Z
    .locals 1

    .prologue
    .line 63
    iget-boolean v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mReady:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected notifyDoEvent(Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "event"    # Ljava/lang/Runnable;

    .prologue
    .line 96
    if-eqz p1, :cond_0

    .line 97
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 99
    :cond_0
    return-void
.end method

.method protected notifyDoFrame(J)V
    .locals 0
    .param p1, "timestamp"    # J

    .prologue
    .line 93
    return-void
.end method

.method protected notifySurfaceChanged(II)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 87
    return-void
.end method

.method protected notifySurfaceCreated(Landroid/view/Surface;)V
    .locals 0
    .param p1, "surface"    # Landroid/view/Surface;

    .prologue
    .line 84
    return-void
.end method

.method protected notifySurfaceDestroyed()V
    .locals 0

    .prologue
    .line 90
    return-void
.end method

.method public start()V
    .locals 2

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mReady:Z

    if-nez v0, :cond_1

    .line 43
    sget-object v0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mThread:Ljava/lang/Thread;

    if-nez v0, :cond_0

    .line 45
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mRunnable:Ljava/lang/Runnable;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mThread:Ljava/lang/Thread;

    .line 47
    :cond_0
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 48
    invoke-virtual {p0}, Lcom/vk/media/utils/RenderHelpers$RenderThread;->waitUntilReady()V

    .line 50
    :cond_1
    return-void
.end method

.method public waitUntilReady()V
    .locals 2

    .prologue
    .line 53
    iget-object v1, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mStartLock:Ljava/lang/Object;

    monitor-enter v1

    .line 54
    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mReady:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 56
    :try_start_1
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderThread;->mStartLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 57
    :catch_0
    move-exception v0

    goto :goto_0

    .line 59
    :cond_0
    :try_start_2
    monitor-exit v1

    .line 60
    return-void

    .line 59
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method
