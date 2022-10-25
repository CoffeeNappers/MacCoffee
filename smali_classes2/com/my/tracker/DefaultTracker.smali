.class public final Lcom/my/tracker/DefaultTracker;
.super Ljava/lang/Object;
.source "DefaultTracker.java"

# interfaces
.implements Lcom/my/tracker/Tracker;


# static fields
.field private static a:Z


# instance fields
.field private final b:Lcom/my/tracker/b;

.field private final c:Landroid/content/Context;

.field private final d:Lcom/my/tracker/database/a;

.field private final e:Landroid/os/Handler;

.field private volatile f:Z

.field private volatile g:Z

.field private h:I

.field private i:Z

.field private j:J

.field private k:J

.field private l:J

.field private final m:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x0

    sput-boolean v0, Lcom/my/tracker/DefaultTracker;->a:Z

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 2

    .prologue
    const-wide/16 v0, 0x0

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-wide v0, p0, Lcom/my/tracker/DefaultTracker;->j:J

    .line 53
    iput-wide v0, p0, Lcom/my/tracker/DefaultTracker;->k:J

    .line 54
    iput-wide v0, p0, Lcom/my/tracker/DefaultTracker;->l:J

    .line 56
    new-instance v0, Lcom/my/tracker/DefaultTracker$1;

    invoke-direct {v0, p0}, Lcom/my/tracker/DefaultTracker$1;-><init>(Lcom/my/tracker/DefaultTracker;)V

    iput-object v0, p0, Lcom/my/tracker/DefaultTracker;->m:Ljava/lang/Runnable;

    .line 100
    new-instance v0, Lcom/my/tracker/b;

    invoke-direct {v0, p1}, Lcom/my/tracker/b;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    .line 101
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/my/tracker/DefaultTracker;->c:Landroid/content/Context;

    .line 102
    new-instance v0, Lcom/my/tracker/database/a;

    iget-object v1, p0, Lcom/my/tracker/DefaultTracker;->c:Landroid/content/Context;

    invoke-direct {v0, p1, v1}, Lcom/my/tracker/database/a;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/tracker/DefaultTracker;->d:Lcom/my/tracker/database/a;

    .line 103
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/my/tracker/DefaultTracker;->e:Landroid/os/Handler;

    .line 104
    return-void
.end method

.method private a()V
    .locals 6

    .prologue
    .line 316
    const-string/jumbo v0, "Send events by timer"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 317
    sget-object v2, Lcom/my/tracker/enums/a;->c:Lcom/my/tracker/enums/a;

    iget-object v3, p0, Lcom/my/tracker/DefaultTracker;->d:Lcom/my/tracker/database/a;

    iget-object v4, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    iget-object v5, p0, Lcom/my/tracker/DefaultTracker;->c:Landroid/content/Context;

    .line 2069
    new-instance v0, Lcom/my/tracker/async/commands/h;

    invoke-static {}, Lcom/my/tracker/net/a;->a()Ljava/lang/String;

    move-result-object v1

    invoke-direct/range {v0 .. v5}, Lcom/my/tracker/async/commands/h;-><init>(Ljava/lang/String;Lcom/my/tracker/enums/a;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)V

    .line 317
    invoke-interface {v0}, Lcom/my/tracker/async/commands/d;->a()V

    .line 319
    const-wide/32 v0, 0xdbba0

    invoke-direct {p0, v0, v1}, Lcom/my/tracker/DefaultTracker;->a(J)V

    .line 320
    return-void
.end method

.method private a(J)V
    .locals 3

    .prologue
    .line 308
    iget-object v0, p0, Lcom/my/tracker/DefaultTracker;->e:Landroid/os/Handler;

    iget-object v1, p0, Lcom/my/tracker/DefaultTracker;->m:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 309
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/tracker/DefaultTracker;->i:Z

    .line 310
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/my/tracker/DefaultTracker;->l:J

    .line 311
    iget-object v0, p0, Lcom/my/tracker/DefaultTracker;->e:Landroid/os/Handler;

    iget-object v1, p0, Lcom/my/tracker/DefaultTracker;->m:Ljava/lang/Runnable;

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 312
    return-void
.end method

.method static synthetic a(Lcom/my/tracker/DefaultTracker;)Z
    .locals 1

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/my/tracker/DefaultTracker;->i:Z

    return v0
.end method

.method static synthetic b(Lcom/my/tracker/DefaultTracker;)V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/my/tracker/DefaultTracker;->a()V

    return-void
.end method


# virtual methods
.method public final getParams()Lcom/my/tracker/b;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    return-object v0
.end method

.method public final declared-synchronized init()V
    .locals 5

    .prologue
    .line 112
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/my/tracker/DefaultTracker;->f:Z

    if-nez v0, :cond_1

    .line 114
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/tracker/DefaultTracker;->f:Z

    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Tracker initialized. Version: 1.3.8. ID: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    invoke-virtual {v1}, Lcom/my/tracker/b;->i()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->b(Ljava/lang/String;)V

    .line 117
    iget-object v0, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->k()I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/my/tracker/DefaultTracker;->j:J

    .line 118
    invoke-static {}, Lcom/my/tracker/providers/e;->a()Lcom/my/tracker/providers/e;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/tracker/providers/e;->d()Lcom/my/tracker/providers/b;

    move-result-object v0

    iget-object v1, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    invoke-virtual {v1}, Lcom/my/tracker/b;->t()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/tracker/providers/b;->a(Z)V

    .line 120
    iget-object v0, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->i()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/campaign/CampaignService;->a(Ljava/lang/String;)V

    .line 122
    iget-boolean v0, p0, Lcom/my/tracker/DefaultTracker;->g:Z

    if-eqz v0, :cond_0

    .line 123
    iget-object v0, p0, Lcom/my/tracker/DefaultTracker;->d:Lcom/my/tracker/database/a;

    iget-object v1, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    iget-object v2, p0, Lcom/my/tracker/DefaultTracker;->c:Landroid/content/Context;

    .line 1054
    new-instance v3, Lcom/my/tracker/async/commands/k;

    invoke-static {}, Lcom/my/tracker/net/a;->a()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0, v1, v2}, Lcom/my/tracker/async/commands/k;-><init>(Ljava/lang/String;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)V

    .line 123
    invoke-interface {v3}, Lcom/my/tracker/async/commands/d;->a()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 126
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 125
    :cond_1
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Tracker with id "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    invoke-virtual {v1}, Lcom/my/tracker/b;->i()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "already initialized"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 112
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final isEnabled()Z
    .locals 1

    .prologue
    .line 86
    iget-boolean v0, p0, Lcom/my/tracker/DefaultTracker;->g:Z

    return v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 74
    iget-boolean v0, p0, Lcom/my/tracker/DefaultTracker;->f:Z

    return v0
.end method

.method public final declared-synchronized onStartActivity(Landroid/app/Activity;)V
    .locals 8

    .prologue
    const-wide/16 v6, 0x0

    .line 131
    monitor-enter p0

    :try_start_0
    sget-boolean v0, Lcom/my/tracker/DefaultTracker;->a:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/my/tracker/DefaultTracker;->g:Z

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/my/tracker/DefaultTracker;->h:I

    if-gtz v0, :cond_2

    .line 133
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 134
    sget-boolean v2, Lcom/my/tracker/DefaultTracker;->a:Z

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    invoke-virtual {v2}, Lcom/my/tracker/b;->v()Z

    move-result v2

    if-eqz v2, :cond_3

    iget-wide v2, p0, Lcom/my/tracker/DefaultTracker;->k:J

    sub-long v2, v0, v2

    iget-wide v4, p0, Lcom/my/tracker/DefaultTracker;->j:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_3

    .line 137
    :cond_1
    iget-object v2, p0, Lcom/my/tracker/DefaultTracker;->d:Lcom/my/tracker/database/a;

    iget-object v3, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    iget-wide v0, p0, Lcom/my/tracker/DefaultTracker;->k:J

    const-wide/16 v4, 0x3e8

    div-long v4, v0, v4

    iget-object v6, p0, Lcom/my/tracker/DefaultTracker;->c:Landroid/content/Context;

    .line 2046
    new-instance v0, Lcom/my/tracker/async/commands/j;

    invoke-static {}, Lcom/my/tracker/net/a;->a()Ljava/lang/String;

    move-result-object v1

    invoke-direct/range {v0 .. v6}, Lcom/my/tracker/async/commands/j;-><init>(Ljava/lang/String;Lcom/my/tracker/database/a;Lcom/my/tracker/b;JLandroid/content/Context;)V

    .line 140
    invoke-interface {v0}, Lcom/my/tracker/async/commands/d;->a()V

    .line 141
    sget-boolean v0, Lcom/my/tracker/DefaultTracker;->a:Z

    if-nez v0, :cond_2

    .line 142
    const-wide/32 v0, 0xdbba0

    invoke-direct {p0, v0, v1}, Lcom/my/tracker/DefaultTracker;->a(J)V

    .line 152
    :cond_2
    :goto_0
    iget v0, p0, Lcom/my/tracker/DefaultTracker;->h:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/my/tracker/DefaultTracker;->h:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 153
    monitor-exit p0

    return-void

    .line 145
    :cond_3
    :try_start_1
    iget-wide v2, p0, Lcom/my/tracker/DefaultTracker;->l:J

    sub-long v0, v2, v0

    .line 146
    cmp-long v2, v0, v6

    if-lez v2, :cond_4

    invoke-direct {p0, v0, v1}, Lcom/my/tracker/DefaultTracker;->a(J)V

    .line 149
    :goto_1
    const-wide/16 v0, 0x0

    iget-object v2, p0, Lcom/my/tracker/DefaultTracker;->c:Landroid/content/Context;

    invoke-static {v0, v1, v2}, Lcom/my/tracker/factories/a;->a(JLandroid/content/Context;)Lcom/my/tracker/async/commands/d;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/tracker/async/commands/d;->a()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 131
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 147
    :cond_4
    :try_start_2
    invoke-direct {p0}, Lcom/my/tracker/DefaultTracker;->a()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method public final declared-synchronized onStopActivity(Landroid/app/Activity;)V
    .locals 4

    .prologue
    .line 158
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/my/tracker/DefaultTracker;->h:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/my/tracker/DefaultTracker;->h:I

    .line 159
    iget v0, p0, Lcom/my/tracker/DefaultTracker;->h:I

    if-gtz v0, :cond_0

    .line 161
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/tracker/DefaultTracker;->i:Z

    .line 162
    iget-object v0, p0, Lcom/my/tracker/DefaultTracker;->e:Landroid/os/Handler;

    iget-object v1, p0, Lcom/my/tracker/DefaultTracker;->m:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 163
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/my/tracker/DefaultTracker;->k:J

    .line 164
    iget-wide v0, p0, Lcom/my/tracker/DefaultTracker;->k:J

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iget-object v2, p0, Lcom/my/tracker/DefaultTracker;->c:Landroid/content/Context;

    invoke-static {v0, v1, v2}, Lcom/my/tracker/factories/a;->a(JLandroid/content/Context;)Lcom/my/tracker/async/commands/d;

    move-result-object v0

    .line 166
    invoke-interface {v0}, Lcom/my/tracker/async/commands/d;->a()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 168
    :cond_0
    monitor-exit p0

    return-void

    .line 158
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final setEnabled(Z)V
    .locals 0

    .prologue
    .line 92
    iput-boolean p1, p0, Lcom/my/tracker/DefaultTracker;->g:Z

    .line 93
    return-void
.end method

.method public final trackEvent(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 173
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/my/tracker/DefaultTracker;->trackEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 174
    return-void
.end method

.method public final trackEvent(Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
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
    .line 179
    if-eqz p1, :cond_0

    const-string/jumbo v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 181
    :cond_0
    const-string/jumbo v0, "Event name should be not null and not empty"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 194
    :cond_1
    :goto_0
    return-void

    .line 184
    :cond_2
    const-string/jumbo v0, "custom"

    invoke-static {v0, p1}, Lcom/my/tracker/factories/b;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 186
    if-eqz p2, :cond_3

    const-string/jumbo v0, "custom"

    invoke-static {v0, p2}, Lcom/my/tracker/factories/b;->c(Ljava/lang/String;Ljava/util/Map;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 189
    :cond_3
    iget-boolean v0, p0, Lcom/my/tracker/DefaultTracker;->g:Z

    if-eqz v0, :cond_1

    .line 191
    invoke-static {p1, p2}, Lcom/my/tracker/factories/b;->a(Ljava/lang/String;Ljava/util/Map;)Lcom/my/tracker/models/events/c;

    move-result-object v0

    .line 192
    iget-object v1, p0, Lcom/my/tracker/DefaultTracker;->d:Lcom/my/tracker/database/a;

    iget-object v2, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    iget-object v3, p0, Lcom/my/tracker/DefaultTracker;->c:Landroid/content/Context;

    invoke-static {v0, v1, v2, v3}, Lcom/my/tracker/factories/a;->a(Lcom/my/tracker/models/events/c;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)Lcom/my/tracker/async/commands/d;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/tracker/async/commands/d;->a()V

    goto :goto_0
.end method

.method public final trackInviteEvent()V
    .locals 1

    .prologue
    .line 240
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/my/tracker/DefaultTracker;->trackInviteEvent(Ljava/util/Map;)V

    .line 241
    return-void
.end method

.method public final trackInviteEvent(Ljava/util/Map;)V
    .locals 4
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
    .line 246
    if-eqz p1, :cond_1

    const-string/jumbo v0, "invite"

    invoke-static {v0, p1}, Lcom/my/tracker/factories/b;->c(Ljava/lang/String;Ljava/util/Map;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 256
    :cond_0
    :goto_0
    return-void

    .line 251
    :cond_1
    iget-boolean v0, p0, Lcom/my/tracker/DefaultTracker;->g:Z

    if-eqz v0, :cond_0

    .line 253
    const-string/jumbo v0, "invite"

    invoke-static {v0, p1}, Lcom/my/tracker/factories/b;->b(Ljava/lang/String;Ljava/util/Map;)Lcom/my/tracker/models/events/c;

    move-result-object v0

    .line 254
    iget-object v1, p0, Lcom/my/tracker/DefaultTracker;->d:Lcom/my/tracker/database/a;

    iget-object v2, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    iget-object v3, p0, Lcom/my/tracker/DefaultTracker;->c:Landroid/content/Context;

    invoke-static {v0, v1, v2, v3}, Lcom/my/tracker/factories/a;->a(Lcom/my/tracker/models/events/c;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)Lcom/my/tracker/async/commands/d;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/tracker/async/commands/d;->a()V

    goto :goto_0
.end method

.method public final trackLevelEvent()V
    .locals 2

    .prologue
    .line 303
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/my/tracker/DefaultTracker;->trackLevelEvent(ILjava/util/Map;)V

    .line 304
    return-void
.end method

.method public final trackLevelEvent(ILjava/util/Map;)V
    .locals 4
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
    .line 282
    if-eqz p2, :cond_1

    const-string/jumbo v0, "level_achieved"

    .line 283
    invoke-static {v0, p2}, Lcom/my/tracker/factories/b;->c(Ljava/lang/String;Ljava/util/Map;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 292
    :cond_0
    :goto_0
    return-void

    .line 287
    :cond_1
    iget-boolean v0, p0, Lcom/my/tracker/DefaultTracker;->g:Z

    if-eqz v0, :cond_0

    .line 289
    invoke-static {p1, p2}, Lcom/my/tracker/factories/b;->a(ILjava/util/Map;)Lcom/my/tracker/models/events/c;

    move-result-object v0

    .line 290
    iget-object v1, p0, Lcom/my/tracker/DefaultTracker;->d:Lcom/my/tracker/database/a;

    iget-object v2, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    iget-object v3, p0, Lcom/my/tracker/DefaultTracker;->c:Landroid/content/Context;

    invoke-static {v0, v1, v2, v3}, Lcom/my/tracker/factories/a;->a(Lcom/my/tracker/models/events/c;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)Lcom/my/tracker/async/commands/d;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/tracker/async/commands/d;->a()V

    goto :goto_0
.end method

.method public final trackLevelEvent(Ljava/util/Map;)V
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
    .line 297
    const/4 v0, -0x1

    invoke-virtual {p0, v0, p1}, Lcom/my/tracker/DefaultTracker;->trackLevelEvent(ILjava/util/Map;)V

    .line 298
    return-void
.end method

.method public final trackLoginEvent()V
    .locals 1

    .prologue
    .line 199
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/my/tracker/DefaultTracker;->trackLoginEvent(Ljava/util/Map;)V

    .line 200
    return-void
.end method

.method public final trackLoginEvent(Ljava/util/Map;)V
    .locals 4
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
    .line 205
    if-eqz p1, :cond_1

    const-string/jumbo v0, "login"

    invoke-static {v0, p1}, Lcom/my/tracker/factories/b;->c(Ljava/lang/String;Ljava/util/Map;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 213
    :cond_0
    :goto_0
    return-void

    .line 208
    :cond_1
    iget-boolean v0, p0, Lcom/my/tracker/DefaultTracker;->g:Z

    if-eqz v0, :cond_0

    .line 210
    const-string/jumbo v0, "login"

    invoke-static {v0, p1}, Lcom/my/tracker/factories/b;->b(Ljava/lang/String;Ljava/util/Map;)Lcom/my/tracker/models/events/c;

    move-result-object v0

    .line 211
    iget-object v1, p0, Lcom/my/tracker/DefaultTracker;->d:Lcom/my/tracker/database/a;

    iget-object v2, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    iget-object v3, p0, Lcom/my/tracker/DefaultTracker;->c:Landroid/content/Context;

    invoke-static {v0, v1, v2, v3}, Lcom/my/tracker/factories/a;->a(Lcom/my/tracker/models/events/c;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)Lcom/my/tracker/async/commands/d;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/tracker/async/commands/d;->a()V

    goto :goto_0
.end method

.method public final trackPurchaseEvent(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 276
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/my/tracker/DefaultTracker;->trackPurchaseEvent(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/util/Map;)V

    .line 277
    return-void
.end method

.method public final trackPurchaseEvent(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
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
    .line 262
    if-eqz p4, :cond_1

    const-string/jumbo v0, "purchase"

    invoke-static {v0, p4}, Lcom/my/tracker/factories/b;->c(Ljava/lang/String;Ljava/util/Map;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 271
    :cond_0
    :goto_0
    return-void

    .line 266
    :cond_1
    iget-boolean v0, p0, Lcom/my/tracker/DefaultTracker;->g:Z

    if-eqz v0, :cond_0

    .line 268
    invoke-static {p1, p2, p3, p4}, Lcom/my/tracker/factories/b;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/util/Map;)Lcom/my/tracker/models/events/c;

    move-result-object v0

    .line 269
    iget-object v1, p0, Lcom/my/tracker/DefaultTracker;->d:Lcom/my/tracker/database/a;

    iget-object v2, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    iget-object v3, p0, Lcom/my/tracker/DefaultTracker;->c:Landroid/content/Context;

    invoke-static {v0, v1, v2, v3}, Lcom/my/tracker/factories/a;->a(Lcom/my/tracker/models/events/c;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)Lcom/my/tracker/async/commands/d;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/tracker/async/commands/d;->a()V

    goto :goto_0
.end method

.method public final trackRegistrationEvent()V
    .locals 1

    .prologue
    .line 218
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/my/tracker/DefaultTracker;->trackRegistrationEvent(Ljava/util/Map;)V

    .line 219
    return-void
.end method

.method public final trackRegistrationEvent(Ljava/util/Map;)V
    .locals 4
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
    .line 224
    if-eqz p1, :cond_1

    const-string/jumbo v0, "registration"

    .line 225
    invoke-static {v0, p1}, Lcom/my/tracker/factories/b;->c(Ljava/lang/String;Ljava/util/Map;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 235
    :cond_0
    :goto_0
    return-void

    .line 230
    :cond_1
    iget-boolean v0, p0, Lcom/my/tracker/DefaultTracker;->g:Z

    if-eqz v0, :cond_0

    .line 232
    const-string/jumbo v0, "registration"

    invoke-static {v0, p1}, Lcom/my/tracker/factories/b;->b(Ljava/lang/String;Ljava/util/Map;)Lcom/my/tracker/models/events/c;

    move-result-object v0

    .line 233
    iget-object v1, p0, Lcom/my/tracker/DefaultTracker;->d:Lcom/my/tracker/database/a;

    iget-object v2, p0, Lcom/my/tracker/DefaultTracker;->b:Lcom/my/tracker/b;

    iget-object v3, p0, Lcom/my/tracker/DefaultTracker;->c:Landroid/content/Context;

    invoke-static {v0, v1, v2, v3}, Lcom/my/tracker/factories/a;->a(Lcom/my/tracker/models/events/c;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)Lcom/my/tracker/async/commands/d;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/tracker/async/commands/d;->a()V

    goto :goto_0
.end method
