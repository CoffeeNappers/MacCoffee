.class public Lcom/vkontakte/android/audio/utils/Delay;
.super Ljava/lang/Object;
.source "Delay.java"


# instance fields
.field private final mHandler:Landroid/os/Handler;

.field private final mRunnable:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/vkontakte/android/audio/utils/Delay;->mRunnable:Ljava/lang/Runnable;

    .line 12
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/utils/Delay;->mHandler:Landroid/os/Handler;

    .line 13
    return-void
.end method

.method public static newDelay(Ljava/lang/Runnable;J)Lcom/vkontakte/android/audio/utils/Delay;
    .locals 1
    .param p0, "runnable"    # Ljava/lang/Runnable;
    .param p1, "delay"    # J

    .prologue
    .line 16
    new-instance v0, Lcom/vkontakte/android/audio/utils/Delay;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/audio/utils/Delay;-><init>(Ljava/lang/Runnable;)V

    .line 17
    .local v0, "d":Lcom/vkontakte/android/audio/utils/Delay;
    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/audio/utils/Delay;->delay(J)V

    .line 19
    return-object v0
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/Delay;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/Delay;->mRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 32
    return-void
.end method

.method public delay(J)V
    .locals 3
    .param p1, "delay"    # J

    .prologue
    .line 23
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/utils/Delay;->cancel()V

    .line 24
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    .line 25
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/Delay;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/Delay;->mRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 28
    :goto_0
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/Delay;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/Delay;->mRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public run()V
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/Delay;->mRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 36
    return-void
.end method
