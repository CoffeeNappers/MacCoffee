.class final Lcom/vkontakte/android/LongPollService$5;
.super Ljava/util/TimerTask;
.source "LongPollService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LongPollService;->broadcastStateChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 683
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 685
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->doBroadcastStateChanged()V

    .line 686
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/vkontakte/android/LongPollService;->access$302(Ljava/util/Timer;)Ljava/util/Timer;

    .line 687
    return-void
.end method
