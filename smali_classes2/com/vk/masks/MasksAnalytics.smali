.class public Lcom/vk/masks/MasksAnalytics;
.super Ljava/lang/Object;
.source "MasksAnalytics.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/masks/MasksAnalytics$MaskLoadingEvent;,
        Lcom/vk/masks/MasksAnalytics$MaskUsageEvent;,
        Lcom/vk/masks/MasksAnalytics$Event;
    }
.end annotation


# instance fields
.field private final events:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/vk/masks/MasksAnalytics$Event;",
            ">;"
        }
    .end annotation
.end field

.field private maskUsageStart:Ljava/lang/Long;

.field private pendingMaskId:Ljava/lang/String;

.field private pendingSectionId:Ljava/lang/Integer;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/vk/masks/MasksAnalytics;->events:Ljava/util/LinkedList;

    .line 30
    return-void
.end method

.method static synthetic access$000(Lcom/vk/masks/MasksAnalytics;)Ljava/util/LinkedList;
    .locals 1
    .param p0, "x0"    # Lcom/vk/masks/MasksAnalytics;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/vk/masks/MasksAnalytics;->events:Ljava/util/LinkedList;

    return-object v0
.end method

.method public static masksAnalytics()Lcom/vk/masks/MasksAnalytics;
    .locals 1

    .prologue
    .line 20
    new-instance v0, Lcom/vk/masks/MasksAnalytics;

    invoke-direct {v0}, Lcom/vk/masks/MasksAnalytics;-><init>()V

    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/vk/masks/MasksAnalytics;->events:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 69
    return-void
.end method

.method public endMaskUsage()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 40
    iget-object v0, p0, Lcom/vk/masks/MasksAnalytics;->maskUsageStart:Ljava/lang/Long;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/masks/MasksAnalytics;->pendingSectionId:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/masks/MasksAnalytics;->pendingMaskId:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 41
    iget-object v0, p0, Lcom/vk/masks/MasksAnalytics;->events:Ljava/util/LinkedList;

    new-instance v1, Lcom/vk/masks/MasksAnalytics$MaskUsageEvent;

    iget-object v2, p0, Lcom/vk/masks/MasksAnalytics;->pendingSectionId:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget-object v3, p0, Lcom/vk/masks/MasksAnalytics;->pendingMaskId:Ljava/lang/String;

    .line 42
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-object v6, p0, Lcom/vk/masks/MasksAnalytics;->maskUsageStart:Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    long-to-int v4, v4

    invoke-direct {v1, v2, v3, v4}, Lcom/vk/masks/MasksAnalytics$MaskUsageEvent;-><init>(ILjava/lang/String;I)V

    .line 41
    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 44
    :cond_0
    iput-object v8, p0, Lcom/vk/masks/MasksAnalytics;->maskUsageStart:Ljava/lang/Long;

    .line 45
    iput-object v8, p0, Lcom/vk/masks/MasksAnalytics;->pendingSectionId:Ljava/lang/Integer;

    .line 46
    iput-object v8, p0, Lcom/vk/masks/MasksAnalytics;->pendingMaskId:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public flush()V
    .locals 4

    .prologue
    .line 72
    invoke-virtual {p0}, Lcom/vk/masks/MasksAnalytics;->endMaskUsage()V

    .line 73
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/vk/masks/MasksAnalytics$1;

    invoke-direct {v1, p0}, Lcom/vk/masks/MasksAnalytics$1;-><init>(Lcom/vk/masks/MasksAnalytics;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 95
    return-void
.end method

.method public startMaskUsage(ILjava/lang/String;)V
    .locals 2
    .param p1, "sectionId"    # I
    .param p2, "maskId"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-virtual {p0}, Lcom/vk/masks/MasksAnalytics;->endMaskUsage()V

    .line 34
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/masks/MasksAnalytics;->maskUsageStart:Ljava/lang/Long;

    .line 35
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/masks/MasksAnalytics;->pendingSectionId:Ljava/lang/Integer;

    .line 36
    iput-object p2, p0, Lcom/vk/masks/MasksAnalytics;->pendingMaskId:Ljava/lang/String;

    .line 37
    return-void
.end method

.method public trackMaskLoadingCanceled(Lcom/vk/masks/model/Mask;)V
    .locals 4
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 62
    if-eqz p1, :cond_0

    .line 63
    iget-object v0, p0, Lcom/vk/masks/MasksAnalytics;->events:Ljava/util/LinkedList;

    new-instance v1, Lcom/vk/masks/MasksAnalytics$MaskLoadingEvent;

    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->getFullId()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "canceled"

    invoke-direct {v1, v2, v3}, Lcom/vk/masks/MasksAnalytics$MaskLoadingEvent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 65
    :cond_0
    return-void
.end method

.method public trackMaskLoadingFailed(Lcom/vk/masks/model/Mask;)V
    .locals 4
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 56
    if-eqz p1, :cond_0

    .line 57
    iget-object v0, p0, Lcom/vk/masks/MasksAnalytics;->events:Ljava/util/LinkedList;

    new-instance v1, Lcom/vk/masks/MasksAnalytics$MaskLoadingEvent;

    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->getFullId()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "failed"

    invoke-direct {v1, v2, v3}, Lcom/vk/masks/MasksAnalytics$MaskLoadingEvent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 59
    :cond_0
    return-void
.end method

.method public trackMaskLoadingSuccess(Lcom/vk/masks/model/Mask;)V
    .locals 4
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 50
    if-eqz p1, :cond_0

    .line 51
    iget-object v0, p0, Lcom/vk/masks/MasksAnalytics;->events:Ljava/util/LinkedList;

    new-instance v1, Lcom/vk/masks/MasksAnalytics$MaskLoadingEvent;

    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->getFullId()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "successful"

    invoke-direct {v1, v2, v3}, Lcom/vk/masks/MasksAnalytics$MaskLoadingEvent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 53
    :cond_0
    return-void
.end method
