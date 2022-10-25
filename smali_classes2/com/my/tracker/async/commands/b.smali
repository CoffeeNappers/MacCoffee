.class public abstract Lcom/my/tracker/async/commands/b;
.super Lcom/my/tracker/async/commands/a;
.source "AbstractAsyncContextCommand.java"


# instance fields
.field protected a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/my/tracker/async/commands/a;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/my/tracker/async/commands/b;->a:Landroid/content/Context;

    .line 34
    return-void
.end method
