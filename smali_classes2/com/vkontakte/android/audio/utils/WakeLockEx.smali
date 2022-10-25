.class public Lcom/vkontakte/android/audio/utils/WakeLockEx;
.super Ljava/lang/Object;
.source "WakeLockEx.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/utils/WakeLockEx$ReleaseRunnable;
    }
.end annotation


# instance fields
.field private mDelay:Lcom/vkontakte/android/audio/utils/Delay;

.field private final mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    invoke-static {p1}, Lcom/vkontakte/android/audio/utils/Utils;->getPowerManager(Landroid/content/Context;)Landroid/os/PowerManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 15
    return-void
.end method

.method static synthetic access$102(Lcom/vkontakte/android/audio/utils/WakeLockEx;Lcom/vkontakte/android/audio/utils/Delay;)Lcom/vkontakte/android/audio/utils/Delay;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/utils/WakeLockEx;
    .param p1, "x1"    # Lcom/vkontakte/android/audio/utils/Delay;

    .prologue
    .line 8
    iput-object p1, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx;->mDelay:Lcom/vkontakte/android/audio/utils/Delay;

    return-object p1
.end method


# virtual methods
.method public acquire()V
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-nez v0, :cond_0

    .line 19
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 20
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx;->mDelay:Lcom/vkontakte/android/audio/utils/Delay;

    if-eqz v0, :cond_1

    .line 23
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx;->mDelay:Lcom/vkontakte/android/audio/utils/Delay;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/utils/Delay;->cancel()V

    .line 24
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx;->mDelay:Lcom/vkontakte/android/audio/utils/Delay;

    .line 26
    :cond_1
    return-void
.end method

.method public release(J)V
    .locals 3
    .param p1, "delay"    # J

    .prologue
    const/4 v2, 0x0

    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 34
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_1

    .line 35
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx;->mDelay:Lcom/vkontakte/android/audio/utils/Delay;

    if-eqz v0, :cond_0

    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx;->mDelay:Lcom/vkontakte/android/audio/utils/Delay;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/utils/Delay;->cancel()V

    .line 39
    iput-object v2, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx;->mDelay:Lcom/vkontakte/android/audio/utils/Delay;

    .line 44
    :cond_0
    :goto_0
    return-void

    .line 41
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx;->mDelay:Lcom/vkontakte/android/audio/utils/Delay;

    if-nez v0, :cond_0

    .line 42
    new-instance v0, Lcom/vkontakte/android/audio/utils/WakeLockEx$ReleaseRunnable;

    invoke-direct {v0, p0, v2}, Lcom/vkontakte/android/audio/utils/WakeLockEx$ReleaseRunnable;-><init>(Lcom/vkontakte/android/audio/utils/WakeLockEx;Lcom/vkontakte/android/audio/utils/WakeLockEx$1;)V

    invoke-static {v0, p1, p2}, Lcom/vkontakte/android/audio/utils/Delay;->newDelay(Ljava/lang/Runnable;J)Lcom/vkontakte/android/audio/utils/Delay;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx;->mDelay:Lcom/vkontakte/android/audio/utils/Delay;

    goto :goto_0
.end method

.method public releaseSafety()V
    .locals 2

    .prologue
    .line 29
    const-wide/16 v0, 0x2710

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/audio/utils/WakeLockEx;->release(J)V

    .line 30
    return-void
.end method
