.class Lcom/vkontakte/android/audio/utils/Timer$TimerRunnable;
.super Ljava/lang/Object;
.source "Timer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/utils/Timer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TimerRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/utils/Timer;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/utils/Timer;)V
    .locals 0

    .prologue
    .line 30
    iput-object p1, p0, Lcom/vkontakte/android/audio/utils/Timer$TimerRunnable;->this$0:Lcom/vkontakte/android/audio/utils/Timer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/utils/Timer;Lcom/vkontakte/android/audio/utils/Timer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/utils/Timer;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/utils/Timer$1;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/utils/Timer$TimerRunnable;-><init>(Lcom/vkontakte/android/audio/utils/Timer;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/Timer$TimerRunnable;->this$0:Lcom/vkontakte/android/audio/utils/Timer;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Timer;->access$100(Lcom/vkontakte/android/audio/utils/Timer;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 34
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/Timer$TimerRunnable;->this$0:Lcom/vkontakte/android/audio/utils/Timer;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Timer;->access$200(Lcom/vkontakte/android/audio/utils/Timer;)Lcom/vkontakte/android/audio/utils/Delay;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/Timer$TimerRunnable;->this$0:Lcom/vkontakte/android/audio/utils/Timer;

    invoke-static {v1}, Lcom/vkontakte/android/audio/utils/Timer;->access$100(Lcom/vkontakte/android/audio/utils/Timer;)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/audio/utils/Delay;->delay(J)V

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/Timer$TimerRunnable;->this$0:Lcom/vkontakte/android/audio/utils/Timer;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Timer;->access$300(Lcom/vkontakte/android/audio/utils/Timer;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 36
    return-void
.end method
