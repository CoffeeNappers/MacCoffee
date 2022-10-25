.class Lcom/vkontakte/android/data/BenchmarkTracker$ApplicationStateTracker;
.super Ljava/lang/Object;
.source "BenchmarkTracker.java"

# interfaces
.implements Lcom/vkontakte/android/AppStateTracker$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/data/BenchmarkTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ApplicationStateTracker"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/data/BenchmarkTracker;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/data/BenchmarkTracker;)V
    .locals 0

    .prologue
    .line 423
    iput-object p1, p0, Lcom/vkontakte/android/data/BenchmarkTracker$ApplicationStateTracker;->this$0:Lcom/vkontakte/android/data/BenchmarkTracker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/data/BenchmarkTracker;Lcom/vkontakte/android/data/BenchmarkTracker$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/data/BenchmarkTracker;
    .param p2, "x1"    # Lcom/vkontakte/android/data/BenchmarkTracker$1;

    .prologue
    .line 423
    invoke-direct {p0, p1}, Lcom/vkontakte/android/data/BenchmarkTracker$ApplicationStateTracker;-><init>(Lcom/vkontakte/android/data/BenchmarkTracker;)V

    return-void
.end method


# virtual methods
.method public onAppPaused()V
    .locals 1

    .prologue
    .line 435
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$800()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 436
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$802(Z)Z

    .line 437
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$ApplicationStateTracker;->this$0:Lcom/vkontakte/android/data/BenchmarkTracker;

    invoke-static {v0}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$1300(Lcom/vkontakte/android/data/BenchmarkTracker;)V

    .line 438
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$ApplicationStateTracker;->this$0:Lcom/vkontakte/android/data/BenchmarkTracker;

    invoke-static {v0}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$1400(Lcom/vkontakte/android/data/BenchmarkTracker;)V

    .line 440
    :cond_0
    return-void
.end method

.method public onAppResumed()V
    .locals 1

    .prologue
    .line 426
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$800()Z

    move-result v0

    if-nez v0, :cond_0

    .line 427
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$802(Z)Z

    .line 428
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$ApplicationStateTracker;->this$0:Lcom/vkontakte/android/data/BenchmarkTracker;

    invoke-static {v0}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$1100(Lcom/vkontakte/android/data/BenchmarkTracker;)V

    .line 429
    iget-object v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$ApplicationStateTracker;->this$0:Lcom/vkontakte/android/data/BenchmarkTracker;

    invoke-static {v0}, Lcom/vkontakte/android/data/BenchmarkTracker;->access$1200(Lcom/vkontakte/android/data/BenchmarkTracker;)V

    .line 431
    :cond_0
    return-void
.end method
