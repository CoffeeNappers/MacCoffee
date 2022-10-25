.class public Lcom/my/tracker/utils/e;
.super Ljava/lang/Object;
.source "PreferencesManager.java"


# static fields
.field private static a:Lcom/my/tracker/utils/e;

.field private static b:Z


# instance fields
.field private c:Landroid/content/SharedPreferences;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 183
    return-void
.end method

.method public static a()Lcom/my/tracker/utils/e;
    .locals 2

    .prologue
    .line 15
    const-class v1, Lcom/my/tracker/utils/e;

    monitor-enter v1

    .line 17
    :try_start_0
    sget-object v0, Lcom/my/tracker/utils/e;->a:Lcom/my/tracker/utils/e;

    if-nez v0, :cond_0

    .line 18
    new-instance v0, Lcom/my/tracker/utils/e;

    invoke-direct {v0}, Lcom/my/tracker/utils/e;-><init>()V

    sput-object v0, Lcom/my/tracker/utils/e;->a:Lcom/my/tracker/utils/e;

    .line 19
    :cond_0
    sget-object v0, Lcom/my/tracker/utils/e;->a:Lcom/my/tracker/utils/e;

    monitor-exit v1

    return-object v0

    .line 20
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private declared-synchronized a(Ljava/lang/String;J)V
    .locals 2

    .prologue
    .line 132
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/my/tracker/utils/e;->c:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 133
    invoke-interface {v0, p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 134
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    monitor-exit p0

    return-void

    .line 132
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 149
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/my/tracker/utils/e;->c:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 150
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 151
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 152
    monitor-exit p0

    return-void

    .line 149
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized a(Ljava/lang/String;Z)V
    .locals 1

    .prologue
    .line 171
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/my/tracker/utils/e;->c:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 172
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 173
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 174
    monitor-exit p0

    return-void

    .line 171
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private h(Ljava/lang/String;)J
    .locals 4

    .prologue
    .line 51
    iget-object v0, p0, Lcom/my/tracker/utils/e;->c:Landroid/content/SharedPreferences;

    const-wide/16 v2, 0x0

    invoke-interface {v0, p1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method private i(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 66
    iget-object v0, p0, Lcom/my/tracker/utils/e;->c:Landroid/content/SharedPreferences;

    const-string/jumbo v1, ""

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private j(Ljava/lang/String;)Z
    .locals 2

    .prologue
    .line 102
    iget-object v0, p0, Lcom/my/tracker/utils/e;->c:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Lcom/my/tracker/utils/e;
    .locals 2

    .prologue
    .line 187
    sget-boolean v0, Lcom/my/tracker/utils/e;->b:Z

    if-nez v0, :cond_0

    .line 189
    const-string/jumbo v0, "mytracker_prefs"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/my/tracker/utils/e;->c:Landroid/content/SharedPreferences;

    .line 190
    const/4 v0, 0x1

    sput-boolean v0, Lcom/my/tracker/utils/e;->b:Z

    .line 193
    :cond_0
    return-object p0
.end method

.method public final a(J)V
    .locals 1

    .prologue
    .line 122
    const-string/jumbo v0, "customEventsSkipped"

    invoke-direct {p0, v0, p1, p2}, Lcom/my/tracker/utils/e;->a(Ljava/lang/String;J)V

    .line 123
    return-void
.end method

.method public final a(Z)V
    .locals 1

    .prologue
    .line 166
    const-string/jumbo v0, "referrerSent"

    invoke-direct {p0, v0, p1}, Lcom/my/tracker/utils/e;->a(Ljava/lang/String;Z)V

    .line 167
    return-void
.end method

.method public final a(Ljava/lang/String;)Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 83
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 87
    :cond_0
    :goto_0
    return v0

    .line 86
    :cond_1
    const-string/jumbo v1, "appId"

    invoke-direct {p0, v1}, Lcom/my/tracker/utils/e;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 87
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final b()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    const-string/jumbo v0, "appVersion"

    invoke-direct {p0, v0}, Lcom/my/tracker/utils/e;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final b(J)V
    .locals 1

    .prologue
    .line 127
    const-string/jumbo v0, "eventTimestampBase"

    invoke-direct {p0, v0, p1, p2}, Lcom/my/tracker/utils/e;->a(Ljava/lang/String;J)V

    .line 128
    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 107
    const-string/jumbo v0, "appVersion"

    invoke-direct {p0, v0, p1}, Lcom/my/tracker/utils/e;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    return-void
.end method

.method public final c()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    const-string/jumbo v0, "appsHash"

    invoke-direct {p0, v0}, Lcom/my/tracker/utils/e;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final c(J)V
    .locals 1

    .prologue
    .line 178
    const-string/jumbo v0, "lastStopTimeStampSec"

    invoke-direct {p0, v0, p1, p2}, Lcom/my/tracker/utils/e;->a(Ljava/lang/String;J)V

    .line 179
    return-void
.end method

.method public final c(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 112
    const-string/jumbo v0, "appId"

    invoke-direct {p0, v0, p1}, Lcom/my/tracker/utils/e;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    return-void
.end method

.method public final d()J
    .locals 2

    .prologue
    .line 41
    const-string/jumbo v0, "customEventsSkipped"

    invoke-direct {p0, v0}, Lcom/my/tracker/utils/e;->h(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public final d(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 117
    const-string/jumbo v0, "appsHash"

    invoke-direct {p0, v0, p1}, Lcom/my/tracker/utils/e;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    return-void
.end method

.method public final e()J
    .locals 2

    .prologue
    .line 46
    const-string/jumbo v0, "eventTimestampBase"

    invoke-direct {p0, v0}, Lcom/my/tracker/utils/e;->h(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public final e(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 139
    const-string/jumbo v0, "mrgsDeviceId"

    invoke-direct {p0, v0, p1}, Lcom/my/tracker/utils/e;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    return-void
.end method

.method public final f()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    const-string/jumbo v0, "mrgsDeviceId"

    invoke-direct {p0, v0}, Lcom/my/tracker/utils/e;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final f(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 144
    const-string/jumbo v0, "mac"

    invoke-direct {p0, v0, p1}, Lcom/my/tracker/utils/e;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    return-void
.end method

.method public final g()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    const-string/jumbo v0, "mac"

    invoke-direct {p0, v0}, Lcom/my/tracker/utils/e;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final g(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 161
    const-string/jumbo v0, "referrer"

    invoke-direct {p0, v0, p1}, Lcom/my/tracker/utils/e;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    return-void
.end method

.method public final h()Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    const-string/jumbo v0, "referrer"

    invoke-direct {p0, v0}, Lcom/my/tracker/utils/e;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final i()J
    .locals 6

    .prologue
    .line 76
    const-string/jumbo v0, "lastStopTimeStampSec"

    invoke-direct {p0, v0}, Lcom/my/tracker/utils/e;->h(Ljava/lang/String;)J

    move-result-wide v0

    .line 77
    const-string/jumbo v2, "lastStopTimeStampSec"

    const-wide/16 v4, 0x0

    invoke-direct {p0, v2, v4, v5}, Lcom/my/tracker/utils/e;->a(Ljava/lang/String;J)V

    .line 78
    return-wide v0
.end method

.method public final j()Z
    .locals 1

    .prologue
    .line 92
    const-string/jumbo v0, "preinstallRead"

    invoke-direct {p0, v0}, Lcom/my/tracker/utils/e;->j(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public final k()Z
    .locals 1

    .prologue
    .line 97
    const-string/jumbo v0, "referrerSent"

    invoke-direct {p0, v0}, Lcom/my/tracker/utils/e;->j(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public final l()V
    .locals 2

    .prologue
    .line 156
    const-string/jumbo v0, "preinstallRead"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/my/tracker/utils/e;->a(Ljava/lang/String;Z)V

    .line 157
    return-void
.end method
