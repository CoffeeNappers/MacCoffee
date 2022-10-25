.class public final Lcom/my/tracker/async/commands/e;
.super Ljava/lang/Object;
.source "AsyncCommandResult.java"


# instance fields
.field private a:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/tracker/async/commands/e;->a:Z

    .line 37
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 0

    .prologue
    .line 29
    iput-boolean p1, p0, Lcom/my/tracker/async/commands/e;->a:Z

    .line 30
    return-void
.end method

.method public final a()Z
    .locals 1

    .prologue
    .line 24
    iget-boolean v0, p0, Lcom/my/tracker/async/commands/e;->a:Z

    return v0
.end method
