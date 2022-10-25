.class Lcom/vkontakte/android/AppStateTracker$BgTrackerTask;
.super Ljava/util/TimerTask;
.source "AppStateTracker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/AppStateTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BgTrackerTask"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 102
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/AppStateTracker$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/AppStateTracker$1;

    .prologue
    .line 102
    invoke-direct {p0}, Lcom/vkontakte/android/AppStateTracker$BgTrackerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 104
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 105
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/vkontakte/android/AppStateTracker;->access$102(Ljava/util/Timer;)Ljava/util/Timer;

    .line 106
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/vkontakte/android/AppStateTracker;->access$202(Z)Z

    .line 107
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "==== ENTER BACKGROUND ===="

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    sget-object v1, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    if-eqz v1, :cond_0

    .line 109
    sget-object v1, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    invoke-virtual {v1}, Lcom/vkontakte/android/LongPollService;->stopDelayed()V

    .line 111
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->access$300()Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/AppStateTracker$Callback;

    .line 112
    .local v0, "callback":Lcom/vkontakte/android/AppStateTracker$Callback;
    invoke-interface {v0}, Lcom/vkontakte/android/AppStateTracker$Callback;->onAppPaused()V

    goto :goto_0

    .line 114
    .end local v0    # "callback":Lcom/vkontakte/android/AppStateTracker$Callback;
    :cond_1
    invoke-static {p0}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 115
    :cond_2
    return-void
.end method
