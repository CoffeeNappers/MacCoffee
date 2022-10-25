.class public final Lcom/my/tracker/async/commands/i;
.super Lcom/my/tracker/async/commands/f;
.source "TrackEventCommand.java"


# instance fields
.field private e:Lcom/my/tracker/models/events/c;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/my/tracker/models/events/c;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0, p1, p3, p4, p5}, Lcom/my/tracker/async/commands/f;-><init>(Ljava/lang/String;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)V

    .line 37
    iput-object p2, p0, Lcom/my/tracker/async/commands/i;->e:Lcom/my/tracker/models/events/c;

    .line 38
    return-void
.end method


# virtual methods
.method protected final c()Lcom/my/tracker/async/commands/e;
    .locals 2

    .prologue
    .line 46
    invoke-super {p0}, Lcom/my/tracker/async/commands/f;->c()Lcom/my/tracker/async/commands/e;

    move-result-object v1

    .line 48
    invoke-virtual {v1}, Lcom/my/tracker/async/commands/e;->a()Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, v1

    .line 54
    :goto_0
    return-object v0

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/my/tracker/async/commands/i;->e:Lcom/my/tracker/models/events/c;

    invoke-virtual {p0, v0}, Lcom/my/tracker/async/commands/i;->a(Lcom/my/tracker/models/events/c;)Z

    move-result v0

    .line 51
    if-eqz v0, :cond_1

    sget-object v0, Lcom/my/tracker/enums/a;->b:Lcom/my/tracker/enums/a;

    invoke-virtual {p0, v0}, Lcom/my/tracker/async/commands/i;->a(Lcom/my/tracker/enums/a;)Z

    move-result v0

    .line 52
    :cond_1
    invoke-virtual {v1, v0}, Lcom/my/tracker/async/commands/e;->a(Z)V

    move-object v0, v1

    .line 54
    goto :goto_0
.end method
