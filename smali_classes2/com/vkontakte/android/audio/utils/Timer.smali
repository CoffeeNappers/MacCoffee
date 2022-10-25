.class public Lcom/vkontakte/android/audio/utils/Timer;
.super Ljava/lang/Object;
.source "Timer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/utils/Timer$TimerRunnable;
    }
.end annotation


# instance fields
.field private final mDelay:Lcom/vkontakte/android/audio/utils/Delay;

.field private final mPeriod:J

.field private final mRunnable:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;J)V
    .locals 4
    .param p1, "runnable"    # Ljava/lang/Runnable;
    .param p2, "period"    # J

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/vkontakte/android/audio/utils/Timer;->mRunnable:Ljava/lang/Runnable;

    .line 11
    iput-wide p2, p0, Lcom/vkontakte/android/audio/utils/Timer;->mPeriod:J

    .line 12
    new-instance v0, Lcom/vkontakte/android/audio/utils/Delay;

    new-instance v1, Lcom/vkontakte/android/audio/utils/Timer$TimerRunnable;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/audio/utils/Timer$TimerRunnable;-><init>(Lcom/vkontakte/android/audio/utils/Timer;Lcom/vkontakte/android/audio/utils/Timer$1;)V

    invoke-direct {v0, v1}, Lcom/vkontakte/android/audio/utils/Delay;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/utils/Timer;->mDelay:Lcom/vkontakte/android/audio/utils/Delay;

    .line 13
    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/audio/utils/Timer;)J
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/audio/utils/Timer;

    .prologue
    .line 3
    iget-wide v0, p0, Lcom/vkontakte/android/audio/utils/Timer;->mPeriod:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/audio/utils/Timer;)Lcom/vkontakte/android/audio/utils/Delay;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/utils/Timer;

    .prologue
    .line 3
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/Timer;->mDelay:Lcom/vkontakte/android/audio/utils/Delay;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/audio/utils/Timer;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/utils/Timer;

    .prologue
    .line 3
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/Timer;->mRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method public static startNewTimer(Ljava/lang/Runnable;JJ)Lcom/vkontakte/android/audio/utils/Timer;
    .locals 1
    .param p0, "runnable"    # Ljava/lang/Runnable;
    .param p1, "delay"    # J
    .param p3, "period"    # J

    .prologue
    .line 16
    new-instance v0, Lcom/vkontakte/android/audio/utils/Timer;

    invoke-direct {v0, p0, p3, p4}, Lcom/vkontakte/android/audio/utils/Timer;-><init>(Ljava/lang/Runnable;J)V

    .line 17
    .local v0, "timer":Lcom/vkontakte/android/audio/utils/Timer;
    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/audio/utils/Timer;->start(J)V

    .line 19
    return-object v0
.end method


# virtual methods
.method public start(J)V
    .locals 1
    .param p1, "delay"    # J

    .prologue
    .line 23
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/Timer;->mDelay:Lcom/vkontakte/android/audio/utils/Delay;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/audio/utils/Delay;->delay(J)V

    .line 24
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/Timer;->mDelay:Lcom/vkontakte/android/audio/utils/Delay;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/utils/Delay;->cancel()V

    .line 28
    return-void
.end method
