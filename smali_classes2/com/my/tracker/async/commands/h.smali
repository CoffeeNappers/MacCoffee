.class public final Lcom/my/tracker/async/commands/h;
.super Lcom/my/tracker/async/commands/f;
.source "SendEventsCommand.java"


# instance fields
.field private e:Lcom/my/tracker/enums/a;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/my/tracker/enums/a;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0, p1, p3, p4, p5}, Lcom/my/tracker/async/commands/f;-><init>(Ljava/lang/String;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)V

    .line 38
    iput-object p2, p0, Lcom/my/tracker/async/commands/h;->e:Lcom/my/tracker/enums/a;

    .line 39
    return-void
.end method


# virtual methods
.method protected final c()Lcom/my/tracker/async/commands/e;
    .locals 2

    .prologue
    .line 47
    invoke-super {p0}, Lcom/my/tracker/async/commands/f;->c()Lcom/my/tracker/async/commands/e;

    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lcom/my/tracker/async/commands/e;->a()Z

    move-result v1

    if-nez v1, :cond_0

    .line 54
    :goto_0
    return-object v0

    .line 51
    :cond_0
    iget-object v1, p0, Lcom/my/tracker/async/commands/h;->e:Lcom/my/tracker/enums/a;

    invoke-virtual {p0, v1}, Lcom/my/tracker/async/commands/h;->a(Lcom/my/tracker/enums/a;)Z

    move-result v1

    .line 52
    invoke-virtual {v0, v1}, Lcom/my/tracker/async/commands/e;->a(Z)V

    goto :goto_0
.end method
