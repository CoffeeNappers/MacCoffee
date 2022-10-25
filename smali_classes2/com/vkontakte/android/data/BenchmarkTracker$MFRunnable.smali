.class Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;
.super Ljava/lang/Object;
.source "BenchmarkTracker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/data/BenchmarkTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MFRunnable"
.end annotation


# static fields
.field static final MIN_TIMEOUT:J = 0x7530L


# instance fields
.field private endPointUrl:Ljava/lang/String;

.field private isRunning:Z

.field private timeInterval:J


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 385
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/data/BenchmarkTracker$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/data/BenchmarkTracker$1;

    .prologue
    .line 385
    invoke-direct {p0}, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;-><init>()V

    return-void
.end method


# virtual methods
.method public isRunning()Z
    .locals 1

    .prologue
    .line 393
    iget-boolean v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;->isRunning:Z

    return v0
.end method

.method public run()V
    .locals 6

    .prologue
    .line 410
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;->endPointUrl:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 411
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;->isRunning:Z

    .line 417
    :goto_0
    return-void

    .line 413
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;->isRunning:Z

    .line 414
    new-instance v0, Lcom/vkontakte/android/statistics/StatisticUrl;

    iget-object v1, p0, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;->endPointUrl:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/statistics/StatisticUrl;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->trackExternal(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    .line 415
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$1000()Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;

    move-result-object v0

    const-wide/16 v2, 0x7530

    iget-wide v4, p0, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;->timeInterval:J

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/vkontakte/android/api/APIController;->runInBgDelayed(Ljava/lang/Runnable;J)V

    goto :goto_0
.end method

.method public setEndPointUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "endPointUrl"    # Ljava/lang/String;

    .prologue
    .line 401
    iput-object p1, p0, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;->endPointUrl:Ljava/lang/String;

    .line 402
    return-void
.end method

.method public setRunning(Z)V
    .locals 0
    .param p1, "running"    # Z

    .prologue
    .line 397
    iput-boolean p1, p0, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;->isRunning:Z

    .line 398
    return-void
.end method

.method public setTimeInterval(J)V
    .locals 1
    .param p1, "timeInterval"    # J

    .prologue
    .line 405
    iput-wide p1, p0, Lcom/vkontakte/android/data/BenchmarkTracker$MFRunnable;->timeInterval:J

    .line 406
    return-void
.end method
