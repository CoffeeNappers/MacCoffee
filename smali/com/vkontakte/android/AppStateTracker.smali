.class public Lcom/vkontakte/android/AppStateTracker;
.super Ljava/lang/Object;
.source "AppStateTracker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/AppStateTracker$BgTrackerTask;,
        Lcom/vkontakte/android/AppStateTracker$Callback;
    }
.end annotation


# static fields
.field private static final callbacks:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/vkontakte/android/AppStateTracker$Callback;",
            ">;"
        }
    .end annotation
.end field

.field private static currentActivity:Landroid/app/Activity;

.field private static isInBG:Z

.field private static final keepScreenObjects:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static timer:Ljava/util/Timer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const/4 v0, 0x0

    sput-boolean v0, Lcom/vkontakte/android/AppStateTracker;->isInBG:Z

    .line 21
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lcom/vkontakte/android/AppStateTracker;->callbacks:Ljava/util/Vector;

    .line 36
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/vkontakte/android/AppStateTracker;->keepScreenObjects:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$102(Ljava/util/Timer;)Ljava/util/Timer;
    .locals 0
    .param p0, "x0"    # Ljava/util/Timer;

    .prologue
    .line 16
    sput-object p0, Lcom/vkontakte/android/AppStateTracker;->timer:Ljava/util/Timer;

    return-object p0
.end method

.method static synthetic access$202(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .prologue
    .line 16
    sput-boolean p0, Lcom/vkontakte/android/AppStateTracker;->isInBG:Z

    return p0
.end method

.method static synthetic access$300()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 16
    sget-object v0, Lcom/vkontakte/android/AppStateTracker;->callbacks:Ljava/util/Vector;

    return-object v0
.end method

.method public static addCallback(Lcom/vkontakte/android/AppStateTracker$Callback;)V
    .locals 1
    .param p0, "call"    # Lcom/vkontakte/android/AppStateTracker$Callback;

    .prologue
    .line 29
    sget-object v0, Lcom/vkontakte/android/AppStateTracker;->callbacks:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 30
    return-void
.end method

.method public static getCurrentActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 95
    sget-object v0, Lcom/vkontakte/android/AppStateTracker;->currentActivity:Landroid/app/Activity;

    return-object v0
.end method

.method public static isInBackground()Z
    .locals 1

    .prologue
    .line 99
    sget-boolean v0, Lcom/vkontakte/android/AppStateTracker;->isInBG:Z

    return v0
.end method

.method public static keepScreenOn(Ljava/lang/Object;Z)V
    .locals 2
    .param p0, "o"    # Ljava/lang/Object;
    .param p1, "value"    # Z

    .prologue
    .line 39
    sget-object v1, Lcom/vkontakte/android/AppStateTracker;->keepScreenObjects:Ljava/util/Set;

    monitor-enter v1

    .line 40
    if-eqz p1, :cond_1

    :try_start_0
    sget-object v0, Lcom/vkontakte/android/AppStateTracker;->keepScreenObjects:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 41
    :goto_0
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->processKeepScreenOn()V

    .line 43
    :cond_0
    monitor-exit v1

    .line 44
    return-void

    .line 40
    :cond_1
    sget-object v0, Lcom/vkontakte/android/AppStateTracker;->keepScreenObjects:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 43
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static synthetic lambda$processKeepScreenOn$0()V
    .locals 4

    .prologue
    .line 48
    sget-object v2, Lcom/vkontakte/android/AppStateTracker;->keepScreenObjects:Ljava/util/Set;

    monitor-enter v2

    .line 49
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/AppStateTracker;->currentActivity:Landroid/app/Activity;

    .line 50
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 51
    sget-object v1, Lcom/vkontakte/android/AppStateTracker;->keepScreenObjects:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 52
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v3, 0x80

    invoke-virtual {v1, v3}, Landroid/view/Window;->addFlags(I)V

    .line 57
    :cond_0
    :goto_0
    monitor-exit v2

    .line 58
    return-void

    .line 54
    :cond_1
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v3, 0x80

    invoke-virtual {v1, v3}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_0

    .line 57
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static onActivityPaused()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 62
    sget-object v0, Lcom/vkontakte/android/AppStateTracker;->timer:Ljava/util/Timer;

    if-nez v0, :cond_0

    .line 63
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    sput-object v0, Lcom/vkontakte/android/AppStateTracker;->timer:Ljava/util/Timer;

    .line 64
    sget-object v0, Lcom/vkontakte/android/AppStateTracker;->timer:Ljava/util/Timer;

    new-instance v1, Lcom/vkontakte/android/AppStateTracker$BgTrackerTask;

    invoke-direct {v1, v4}, Lcom/vkontakte/android/AppStateTracker$BgTrackerTask;-><init>(Lcom/vkontakte/android/AppStateTracker$1;)V

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 66
    :cond_0
    sput-object v4, Lcom/vkontakte/android/AppStateTracker;->currentActivity:Landroid/app/Activity;

    .line 67
    return-void
.end method

.method public static onActivityResumed(Landroid/app/Activity;)V
    .locals 4
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 70
    sget-object v2, Lcom/vkontakte/android/AppStateTracker;->timer:Ljava/util/Timer;

    if-eqz v2, :cond_0

    .line 71
    sget-object v2, Lcom/vkontakte/android/AppStateTracker;->timer:Ljava/util/Timer;

    invoke-virtual {v2}, Ljava/util/Timer;->cancel()V

    .line 72
    const/4 v2, 0x0

    sput-object v2, Lcom/vkontakte/android/AppStateTracker;->timer:Ljava/util/Timer;

    .line 75
    :cond_0
    sput-object p0, Lcom/vkontakte/android/AppStateTracker;->currentActivity:Landroid/app/Activity;

    .line 77
    sget-boolean v2, Lcom/vkontakte/android/AppStateTracker;->isInBG:Z

    if-nez v2, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->isTaskRoot()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 78
    :cond_1
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "==== LEAVE BACKGROUND ===="

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    const/4 v2, 0x0

    sput-boolean v2, Lcom/vkontakte/android/AppStateTracker;->isInBG:Z

    .line 80
    sget-object v2, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    if-eqz v2, :cond_2

    .line 81
    sget-object v2, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    invoke-virtual {v2}, Lcom/vkontakte/android/LongPollService;->cancelDelayedStop()V

    .line 86
    :goto_0
    sget-object v2, Lcom/vkontakte/android/AppStateTracker;->callbacks:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/AppStateTracker$Callback;

    .line 87
    .local v0, "callback":Lcom/vkontakte/android/AppStateTracker$Callback;
    invoke-interface {v0}, Lcom/vkontakte/android/AppStateTracker$Callback;->onAppResumed()V

    goto :goto_1

    .line 83
    .end local v0    # "callback":Lcom/vkontakte/android/AppStateTracker$Callback;
    :cond_2
    new-instance v1, Landroid/content/Intent;

    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-class v3, Lcom/vkontakte/android/LongPollService;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 84
    .local v1, "intent":Landroid/content/Intent;
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0

    .line 91
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_3
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->processKeepScreenOn()V

    .line 92
    return-void
.end method

.method private static processKeepScreenOn()V
    .locals 1

    .prologue
    .line 47
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker$$Lambda$1;->lambdaFactory$()Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 59
    return-void
.end method

.method public static removeCallback(Lcom/vkontakte/android/AppStateTracker$Callback;)V
    .locals 1
    .param p0, "call"    # Lcom/vkontakte/android/AppStateTracker$Callback;

    .prologue
    .line 33
    sget-object v0, Lcom/vkontakte/android/AppStateTracker;->callbacks:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 34
    return-void
.end method
