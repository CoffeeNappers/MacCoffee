.class Lcom/vkontakte/android/LongPollService$14;
.super Ljava/util/TimerTask;
.source "LongPollService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LongPollService;->stopDelayed()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/LongPollService;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LongPollService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/LongPollService;

    .prologue
    .line 2015
    iput-object p1, p0, Lcom/vkontakte/android/LongPollService$14;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 2018
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService$14;->this$0:Lcom/vkontakte/android/LongPollService;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/LongPollService;->stopDelayTimer:Ljava/util/Timer;

    .line 2019
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService$14;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-virtual {v0}, Lcom/vkontakte/android/LongPollService;->stopSelf()V

    .line 2020
    return-void
.end method
