.class public final Lcom/my/tracker/async/commands/g;
.super Lcom/my/tracker/async/commands/b;
.source "LastStopCommand.java"


# instance fields
.field private final b:J


# direct methods
.method public constructor <init>(JLandroid/content/Context;)V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0, p3}, Lcom/my/tracker/async/commands/b;-><init>(Landroid/content/Context;)V

    .line 39
    iput-wide p1, p0, Lcom/my/tracker/async/commands/g;->b:J

    .line 40
    return-void
.end method


# virtual methods
.method protected final c()Lcom/my/tracker/async/commands/e;
    .locals 4

    .prologue
    .line 48
    invoke-super {p0}, Lcom/my/tracker/async/commands/b;->c()Lcom/my/tracker/async/commands/e;

    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lcom/my/tracker/async/commands/e;->a()Z

    move-result v1

    if-nez v1, :cond_1

    .line 62
    :cond_0
    :goto_0
    return-object v0

    .line 52
    :cond_1
    :try_start_0
    invoke-static {}, Lcom/my/tracker/utils/e;->a()Lcom/my/tracker/utils/e;

    move-result-object v1

    iget-object v2, p0, Lcom/my/tracker/async/commands/g;->a:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/my/tracker/utils/e;->a(Landroid/content/Context;)Lcom/my/tracker/utils/e;

    move-result-object v1

    .line 53
    if-eqz v1, :cond_0

    .line 55
    iget-wide v2, p0, Lcom/my/tracker/async/commands/g;->b:J

    invoke-virtual {v1, v2, v3}, Lcom/my/tracker/utils/e;->c(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 59
    :catch_0
    move-exception v1

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/my/tracker/async/commands/e;->a(Z)V

    .line 60
    const-string/jumbo v1, "Preference manager exception"

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_0
.end method
