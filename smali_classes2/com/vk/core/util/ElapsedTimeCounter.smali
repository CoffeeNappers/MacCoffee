.class public Lcom/vk/core/util/ElapsedTimeCounter;
.super Ljava/lang/Object;
.source "ElapsedTimeCounter.java"


# instance fields
.field private currentSliceStart:J

.field private started:Z

.field private totalTimeMs:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const-wide/16 v0, 0x0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    iput-wide v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->totalTimeMs:J

    .line 8
    iput-wide v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->currentSliceStart:J

    .line 9
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->started:Z

    return-void
.end method


# virtual methods
.method public elapsedTime()J
    .locals 6

    .prologue
    .line 27
    iget-boolean v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->started:Z

    if-eqz v0, :cond_0

    .line 28
    iget-wide v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->totalTimeMs:J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/vk/core/util/ElapsedTimeCounter;->currentSliceStart:J

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 30
    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->totalTimeMs:J

    goto :goto_0
.end method

.method public reset()V
    .locals 2

    .prologue
    const-wide/16 v0, 0x0

    .line 35
    iput-wide v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->totalTimeMs:J

    .line 36
    iput-wide v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->currentSliceStart:J

    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->started:Z

    .line 38
    return-void
.end method

.method public start()V
    .locals 2

    .prologue
    .line 12
    iget-boolean v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->started:Z

    if-nez v0, :cond_0

    .line 13
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->started:Z

    .line 14
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->currentSliceStart:J

    .line 16
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 6

    .prologue
    .line 19
    iget-boolean v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->started:Z

    if-eqz v0, :cond_0

    .line 20
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->started:Z

    .line 21
    iget-wide v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->totalTimeMs:J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/vk/core/util/ElapsedTimeCounter;->currentSliceStart:J

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->totalTimeMs:J

    .line 22
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vk/core/util/ElapsedTimeCounter;->currentSliceStart:J

    .line 24
    :cond_0
    return-void
.end method
