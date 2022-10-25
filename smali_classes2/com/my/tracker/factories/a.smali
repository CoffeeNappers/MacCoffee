.class public final Lcom/my/tracker/factories/a;
.super Ljava/lang/Object;
.source "AsyncCommandsFactory.java"


# direct methods
.method public static a(JLandroid/content/Context;)Lcom/my/tracker/async/commands/d;
    .locals 2

    .prologue
    .line 75
    new-instance v0, Lcom/my/tracker/async/commands/g;

    invoke-direct {v0, p0, p1, p2}, Lcom/my/tracker/async/commands/g;-><init>(JLandroid/content/Context;)V

    return-object v0
.end method

.method public static a(Lcom/my/tracker/models/events/c;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)Lcom/my/tracker/async/commands/d;
    .locals 6

    .prologue
    .line 37
    new-instance v0, Lcom/my/tracker/async/commands/i;

    invoke-static {}, Lcom/my/tracker/net/a;->a()Ljava/lang/String;

    move-result-object v1

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/my/tracker/async/commands/i;-><init>(Ljava/lang/String;Lcom/my/tracker/models/events/c;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)V

    return-object v0
.end method
