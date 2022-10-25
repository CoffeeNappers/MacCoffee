.class public final Lcom/my/tracker/MyTracker;
.super Ljava/lang/Object;
.source "MyTracker.java"


# static fields
.field public static final VERSION:Ljava/lang/String; = "1.3.8"

.field private static volatile a:Lcom/my/tracker/Tracker;

.field private static volatile b:Lcom/my/tracker/MyTrackerParams;

.field private static volatile c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x1

    sput-boolean v0, Lcom/my/tracker/MyTracker;->c:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 181
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 183
    return-void
.end method

.method private static a()Z
    .locals 1

    .prologue
    .line 165
    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    invoke-interface {v0}, Lcom/my/tracker/Tracker;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_1

    .line 167
    :cond_0
    const-string/jumbo v0, "You should call MyTracker.initTracker method first"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 168
    const/4 v0, 0x0

    .line 170
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static declared-synchronized createTracker(Ljava/lang/String;Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 67
    const-class v1, Lcom/my/tracker/MyTracker;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    if-nez v0, :cond_0

    .line 69
    new-instance v0, Lcom/my/tracker/DefaultTracker;

    invoke-direct {v0, p0, p1}, Lcom/my/tracker/DefaultTracker;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    sput-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    .line 70
    new-instance v0, Lcom/my/tracker/MyTrackerParams;

    sget-object v2, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    invoke-interface {v2}, Lcom/my/tracker/Tracker;->getParams()Lcom/my/tracker/b;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/my/tracker/MyTrackerParams;-><init>(Lcom/my/tracker/b;)V

    sput-object v0, Lcom/my/tracker/MyTracker;->b:Lcom/my/tracker/MyTrackerParams;

    .line 71
    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    sget-boolean v2, Lcom/my/tracker/MyTracker;->c:Z

    invoke-interface {v0, v2}, Lcom/my/tracker/Tracker;->setEnabled(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    :cond_0
    monitor-exit v1

    return-void

    .line 67
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getTrackerParams()Lcom/my/tracker/MyTrackerParams;
    .locals 1

    .prologue
    .line 59
    sget-object v0, Lcom/my/tracker/MyTracker;->b:Lcom/my/tracker/MyTrackerParams;

    return-object v0
.end method

.method public static declared-synchronized initTracker()V
    .locals 2

    .prologue
    .line 77
    const-class v1, Lcom/my/tracker/MyTracker;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    if-nez v0, :cond_0

    const-string/jumbo v0, "You should call MyTracker.createTracker method first"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    :goto_0
    monitor-exit v1

    return-void

    .line 78
    :cond_0
    :try_start_1
    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    invoke-interface {v0}, Lcom/my/tracker/Tracker;->init()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 77
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static isDebugMode()Z
    .locals 1

    .prologue
    .line 33
    sget-boolean v0, Lcom/my/tracker/a;->a:Z

    return v0
.end method

.method public static isEnabled()Z
    .locals 1

    .prologue
    .line 43
    sget-boolean v0, Lcom/my/tracker/MyTracker;->c:Z

    return v0
.end method

.method public static onStartActivity(Landroid/app/Activity;)V
    .locals 1

    .prologue
    .line 83
    invoke-static {}, Lcom/my/tracker/MyTracker;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    invoke-interface {v0, p0}, Lcom/my/tracker/Tracker;->onStartActivity(Landroid/app/Activity;)V

    .line 84
    :cond_0
    return-void
.end method

.method public static onStopActivity(Landroid/app/Activity;)V
    .locals 1

    .prologue
    .line 88
    invoke-static {}, Lcom/my/tracker/MyTracker;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    invoke-interface {v0, p0}, Lcom/my/tracker/Tracker;->onStopActivity(Landroid/app/Activity;)V

    .line 89
    :cond_0
    return-void
.end method

.method public static setDebugMode(Z)V
    .locals 0

    .prologue
    .line 38
    sput-boolean p0, Lcom/my/tracker/a;->a:Z

    .line 39
    return-void
.end method

.method public static setEnabled(Z)V
    .locals 1

    .prologue
    .line 48
    sput-boolean p0, Lcom/my/tracker/MyTracker;->c:Z

    .line 49
    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    invoke-interface {v0, p0}, Lcom/my/tracker/Tracker;->setEnabled(Z)V

    .line 50
    :cond_0
    return-void
.end method

.method public static setLogHandler(Lcom/my/tracker/LogHandler;)V
    .locals 0

    .prologue
    .line 54
    sput-object p0, Lcom/my/tracker/a;->b:Lcom/my/tracker/LogHandler;

    .line 55
    return-void
.end method

.method public static trackEvent(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 93
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/my/tracker/MyTracker;->trackEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 94
    return-void
.end method

.method public static trackEvent(Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 98
    invoke-static {}, Lcom/my/tracker/MyTracker;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    invoke-interface {v0, p0, p1}, Lcom/my/tracker/Tracker;->trackEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 99
    :cond_0
    return-void
.end method

.method public static trackInviteEvent()V
    .locals 1

    .prologue
    .line 123
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/my/tracker/MyTracker;->trackInviteEvent(Ljava/util/Map;)V

    .line 124
    return-void
.end method

.method public static trackInviteEvent(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 128
    invoke-static {}, Lcom/my/tracker/MyTracker;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    invoke-interface {v0, p0}, Lcom/my/tracker/Tracker;->trackInviteEvent(Ljava/util/Map;)V

    .line 129
    :cond_0
    return-void
.end method

.method public static trackLevelEvent()V
    .locals 1

    .prologue
    .line 133
    invoke-static {}, Lcom/my/tracker/MyTracker;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    invoke-interface {v0}, Lcom/my/tracker/Tracker;->trackLevelEvent()V

    .line 134
    :cond_0
    return-void
.end method

.method public static trackLevelEvent(ILjava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 143
    invoke-static {}, Lcom/my/tracker/MyTracker;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    invoke-interface {v0, p0, p1}, Lcom/my/tracker/Tracker;->trackLevelEvent(ILjava/util/Map;)V

    .line 144
    :cond_0
    return-void
.end method

.method public static trackLevelEvent(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 138
    invoke-static {}, Lcom/my/tracker/MyTracker;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    invoke-interface {v0, p0}, Lcom/my/tracker/Tracker;->trackLevelEvent(Ljava/util/Map;)V

    .line 139
    :cond_0
    return-void
.end method

.method public static trackLoginEvent()V
    .locals 1

    .prologue
    .line 103
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/my/tracker/MyTracker;->trackLoginEvent(Ljava/util/Map;)V

    .line 104
    return-void
.end method

.method public static trackLoginEvent(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 108
    invoke-static {}, Lcom/my/tracker/MyTracker;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    invoke-interface {v0, p0}, Lcom/my/tracker/Tracker;->trackLoginEvent(Ljava/util/Map;)V

    .line 109
    :cond_0
    return-void
.end method

.method public static trackPurchaseEvent(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 159
    invoke-static {}, Lcom/my/tracker/MyTracker;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 160
    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    invoke-interface {v0, p0, p1, p2}, Lcom/my/tracker/Tracker;->trackPurchaseEvent(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 161
    :cond_0
    return-void
.end method

.method public static trackPurchaseEvent(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 151
    invoke-static {}, Lcom/my/tracker/MyTracker;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 152
    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    invoke-interface {v0, p0, p1, p2, p3}, Lcom/my/tracker/Tracker;->trackPurchaseEvent(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/util/Map;)V

    .line 153
    :cond_0
    return-void
.end method

.method public static trackRegistrationEvent()V
    .locals 1

    .prologue
    .line 113
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/my/tracker/MyTracker;->trackRegistrationEvent(Ljava/util/Map;)V

    .line 114
    return-void
.end method

.method public static trackRegistrationEvent(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 118
    invoke-static {}, Lcom/my/tracker/MyTracker;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/my/tracker/MyTracker;->a:Lcom/my/tracker/Tracker;

    invoke-interface {v0, p0}, Lcom/my/tracker/Tracker;->trackRegistrationEvent(Ljava/util/Map;)V

    .line 119
    :cond_0
    return-void
.end method
