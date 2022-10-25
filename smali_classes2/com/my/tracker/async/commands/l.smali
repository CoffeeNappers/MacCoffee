.class public final Lcom/my/tracker/async/commands/l;
.super Lcom/my/tracker/async/commands/c;
.source "TrackReferrerCommand.java"


# instance fields
.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;

.field private g:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    .locals 4

    .prologue
    .line 44
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p4}, Lcom/my/tracker/async/commands/c;-><init>(Ljava/lang/String;Lcom/my/tracker/b;Landroid/content/Context;)V

    .line 45
    iput-object p2, p0, Lcom/my/tracker/async/commands/l;->e:Ljava/lang/String;

    .line 46
    iput-object p3, p0, Lcom/my/tracker/async/commands/l;->f:Ljava/lang/String;

    .line 47
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iput-wide v0, p0, Lcom/my/tracker/async/commands/l;->g:J

    .line 48
    return-void
.end method

.method private static a(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 122
    const-string/jumbo v0, ""

    .line 123
    if-eqz p0, :cond_0

    .line 127
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 128
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 129
    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 135
    :cond_0
    :goto_0
    return-object v0

    .line 132
    :catch_0
    move-exception v1

    const-string/jumbo v1, "cannot retrieve \"installer\", packageManager exception"

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method protected final c()Lcom/my/tracker/async/commands/e;
    .locals 8

    .prologue
    const/4 v0, 0x0

    .line 56
    invoke-super {p0}, Lcom/my/tracker/async/commands/c;->c()Lcom/my/tracker/async/commands/e;

    move-result-object v1

    .line 58
    invoke-virtual {v1}, Lcom/my/tracker/async/commands/e;->a()Z

    move-result v2

    if-nez v2, :cond_0

    move-object v0, v1

    .line 80
    :goto_0
    return-object v0

    .line 63
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/my/tracker/utils/e;->a()Lcom/my/tracker/utils/e;

    move-result-object v2

    iget-object v3, p0, Lcom/my/tracker/async/commands/l;->a:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/my/tracker/utils/e;->a(Landroid/content/Context;)Lcom/my/tracker/utils/e;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 71
    iget-object v3, p0, Lcom/my/tracker/async/commands/l;->e:Ljava/lang/String;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/my/tracker/async/commands/l;->e:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1

    .line 73
    iget-object v3, p0, Lcom/my/tracker/async/commands/l;->e:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/my/tracker/utils/e;->g(Ljava/lang/String;)V

    .line 74
    iget-object v3, p0, Lcom/my/tracker/async/commands/l;->f:Ljava/lang/String;

    if-eqz v3, :cond_1

    .line 76
    iget-object v3, p0, Lcom/my/tracker/async/commands/l;->e:Ljava/lang/String;

    .line 1085
    invoke-virtual {p0}, Lcom/my/tracker/async/commands/l;->e()Z

    move-result v4

    if-nez v4, :cond_2

    .line 1087
    const-string/jumbo v2, "no internet connection"

    invoke-static {v2}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 77
    :goto_1
    invoke-virtual {v1, v0}, Lcom/my/tracker/async/commands/e;->a(Z)V

    :cond_1
    move-object v0, v1

    .line 80
    goto :goto_0

    .line 64
    :catch_0
    move-exception v2

    .line 66
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "PreferencesManager error: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 67
    invoke-virtual {v1, v0}, Lcom/my/tracker/async/commands/e;->a(Z)V

    move-object v0, v1

    .line 68
    goto :goto_0

    .line 1091
    :cond_2
    invoke-virtual {p0}, Lcom/my/tracker/async/commands/l;->d()V

    .line 1092
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "track referrer: "

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 1094
    iget-object v0, p0, Lcom/my/tracker/async/commands/l;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/my/tracker/async/commands/l;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-wide/16 v4, 0x0

    invoke-static {v3, v0, v4, v5}, Lcom/my/tracker/factories/b;->a(Ljava/lang/String;Ljava/lang/String;J)Lcom/my/tracker/models/events/c;

    move-result-object v0

    .line 1096
    new-instance v3, Lcom/my/tracker/builders/a;

    invoke-direct {v3}, Lcom/my/tracker/builders/a;-><init>()V

    .line 1097
    iget-object v4, p0, Lcom/my/tracker/async/commands/l;->f:Ljava/lang/String;

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/my/tracker/async/commands/l;->f:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/my/tracker/builders/a;->a(Ljava/lang/String;)V

    .line 1098
    :cond_3
    iget-wide v4, p0, Lcom/my/tracker/async/commands/l;->g:J

    invoke-virtual {v3, v4, v5}, Lcom/my/tracker/builders/a;->a(J)V

    .line 1099
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    invoke-virtual {v3, v4, v5}, Lcom/my/tracker/builders/a;->b(J)V

    .line 1101
    invoke-static {}, Lcom/my/tracker/providers/e;->a()Lcom/my/tracker/providers/e;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/my/tracker/providers/e;->a(Lcom/my/tracker/builders/a;)V

    .line 1103
    invoke-virtual {v3, v0}, Lcom/my/tracker/builders/a;->a(Lcom/my/tracker/models/events/c;)V

    .line 1105
    invoke-virtual {v3}, Lcom/my/tracker/builders/a;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1106
    const-string/jumbo v3, "send referrer"

    invoke-static {v3}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 1108
    invoke-virtual {p0, v0}, Lcom/my/tracker/async/commands/l;->a(Ljava/lang/String;)Z

    move-result v0

    .line 1109
    invoke-virtual {v2, v0}, Lcom/my/tracker/utils/e;->a(Z)V

    .line 1110
    if-eqz v0, :cond_4

    .line 1112
    const-string/jumbo v2, "referrer sent successfully"

    invoke-static {v2}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 1113
    invoke-static {}, Lcom/my/tracker/providers/e;->a()Lcom/my/tracker/providers/e;

    move-result-object v2

    iget-object v3, p0, Lcom/my/tracker/async/commands/l;->a:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/my/tracker/providers/e;->a(Landroid/content/Context;)V

    goto/16 :goto_1

    .line 1115
    :cond_4
    const-string/jumbo v2, "Send referrer failed"

    invoke-static {v2}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto/16 :goto_1
.end method
