.class Lcom/vkontakte/android/LongPollService$9;
.super Ljava/util/TimerTask;
.source "LongPollService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LongPollService;->startSendingOnline()V
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
    .line 1821
    iput-object p1, p0, Lcom/vkontakte/android/LongPollService$9;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1824
    iget-object v0, p0, Lcom/vkontakte/android/LongPollService$9;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-static {v0}, Lcom/vkontakte/android/LongPollService;->access$700(Lcom/vkontakte/android/LongPollService;)V

    .line 1825
    return-void
.end method
