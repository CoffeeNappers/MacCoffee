.class Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;
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
    name = "VigoDataSender"
.end annotation


# static fields
.field static final MIN_TIMEOUT:J = 0xea60L


# instance fields
.field timeout:J


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 325
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 327
    const-wide/32 v0, 0xea60

    iput-wide v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;->timeout:J

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/data/BenchmarkTracker$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/data/BenchmarkTracker$1;

    .prologue
    .line 325
    invoke-direct {p0}, Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 335
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$800()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 336
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$900()V

    .line 337
    iget-wide v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;->timeout:J

    invoke-static {p0, v0, v1}, Lcom/vkontakte/android/api/APIController;->runInBgDelayed(Ljava/lang/Runnable;J)V

    .line 339
    :cond_0
    return-void
.end method

.method setTimeout(J)V
    .locals 3
    .param p1, "timeout"    # J

    .prologue
    .line 330
    const-wide/32 v0, 0xea60

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$VigoDataSender;->timeout:J

    .line 331
    return-void
.end method
