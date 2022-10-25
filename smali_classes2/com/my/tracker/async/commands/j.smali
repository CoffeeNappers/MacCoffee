.class public final Lcom/my/tracker/async/commands/j;
.super Lcom/my/tracker/async/commands/f;
.source "TrackLaunchSessionCommand.java"


# instance fields
.field private final e:Lcom/my/tracker/models/events/c;

.field private final f:Lcom/my/tracker/models/events/h;

.field private g:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/my/tracker/database/a;Lcom/my/tracker/b;JLandroid/content/Context;)V
    .locals 2

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3, p6}, Lcom/my/tracker/async/commands/f;-><init>(Ljava/lang/String;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)V

    .line 35
    iput-wide p4, p0, Lcom/my/tracker/async/commands/j;->g:J

    .line 36
    const-string/jumbo v0, "launch"

    .line 1053
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/my/tracker/factories/b;->b(Ljava/lang/String;Ljava/util/Map;)Lcom/my/tracker/models/events/c;

    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/my/tracker/async/commands/j;->e:Lcom/my/tracker/models/events/c;

    .line 1063
    new-instance v0, Lcom/my/tracker/models/events/h;

    invoke-direct {v0}, Lcom/my/tracker/models/events/h;-><init>()V

    .line 37
    iput-object v0, p0, Lcom/my/tracker/async/commands/j;->f:Lcom/my/tracker/models/events/h;

    .line 38
    return-void
.end method


# virtual methods
.method protected final c()Lcom/my/tracker/async/commands/e;
    .locals 8

    .prologue
    .line 43
    invoke-super {p0}, Lcom/my/tracker/async/commands/f;->c()Lcom/my/tracker/async/commands/e;

    move-result-object v1

    .line 45
    invoke-virtual {v1}, Lcom/my/tracker/async/commands/e;->a()Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, v1

    .line 67
    :goto_0
    return-object v0

    .line 47
    :cond_0
    iget-object v0, p0, Lcom/my/tracker/async/commands/j;->e:Lcom/my/tracker/models/events/c;

    invoke-virtual {p0, v0}, Lcom/my/tracker/async/commands/j;->a(Lcom/my/tracker/models/events/c;)Z

    move-result v2

    .line 49
    iget-wide v4, p0, Lcom/my/tracker/async/commands/j;->g:J

    const-wide/16 v6, 0x0

    cmp-long v0, v4, v6

    if-nez v0, :cond_1

    .line 54
    :try_start_0
    invoke-static {}, Lcom/my/tracker/utils/e;->a()Lcom/my/tracker/utils/e;

    move-result-object v0

    iget-object v3, p0, Lcom/my/tracker/async/commands/j;->a:Landroid/content/Context;

    invoke-virtual {v0, v3}, Lcom/my/tracker/utils/e;->a(Landroid/content/Context;)Lcom/my/tracker/utils/e;

    move-result-object v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    invoke-virtual {v0}, Lcom/my/tracker/utils/e;->i()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/my/tracker/async/commands/j;->g:J
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    :cond_1
    :goto_1
    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/my/tracker/async/commands/j;->f:Lcom/my/tracker/models/events/h;

    iget-wide v2, p0, Lcom/my/tracker/async/commands/j;->g:J

    invoke-virtual {p0, v0, v2, v3}, Lcom/my/tracker/async/commands/j;->a(Lcom/my/tracker/models/events/c;J)Z

    move-result v0

    .line 64
    :goto_2
    if-eqz v0, :cond_2

    sget-object v0, Lcom/my/tracker/enums/a;->c:Lcom/my/tracker/enums/a;

    invoke-virtual {p0, v0}, Lcom/my/tracker/async/commands/j;->a(Lcom/my/tracker/enums/a;)Z

    move-result v0

    .line 65
    :cond_2
    invoke-virtual {v1, v0}, Lcom/my/tracker/async/commands/e;->a(Z)V

    move-object v0, v1

    .line 67
    goto :goto_0

    .line 57
    :catch_0
    move-exception v0

    .line 59
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "PreferencesManager error: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    move v0, v2

    goto :goto_2
.end method
