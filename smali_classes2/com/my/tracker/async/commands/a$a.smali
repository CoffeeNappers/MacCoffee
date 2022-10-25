.class final Lcom/my/tracker/async/commands/a$a;
.super Ljava/lang/Object;
.source "AbstractAsyncCommand.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/tracker/async/commands/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/my/tracker/async/commands/a;

.field private b:Lcom/my/tracker/async/commands/e;


# direct methods
.method private constructor <init>(Lcom/my/tracker/async/commands/a;Lcom/my/tracker/async/commands/e;)V
    .locals 0

    .prologue
    .line 106
    iput-object p1, p0, Lcom/my/tracker/async/commands/a$a;->a:Lcom/my/tracker/async/commands/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput-object p2, p0, Lcom/my/tracker/async/commands/a$a;->b:Lcom/my/tracker/async/commands/e;

    .line 108
    return-void
.end method

.method synthetic constructor <init>(Lcom/my/tracker/async/commands/a;Lcom/my/tracker/async/commands/e;B)V
    .locals 0

    .prologue
    .line 101
    invoke-direct {p0, p1, p2}, Lcom/my/tracker/async/commands/a$a;-><init>(Lcom/my/tracker/async/commands/a;Lcom/my/tracker/async/commands/e;)V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .prologue
    .line 113
    iget-object v1, p0, Lcom/my/tracker/async/commands/a$a;->a:Lcom/my/tracker/async/commands/a;

    monitor-enter v1

    .line 115
    :try_start_0
    iget-object v0, p0, Lcom/my/tracker/async/commands/a$a;->a:Lcom/my/tracker/async/commands/a;

    invoke-static {v0}, Lcom/my/tracker/async/commands/a;->a(Lcom/my/tracker/async/commands/a;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 117
    iget-object v0, p0, Lcom/my/tracker/async/commands/a$a;->a:Lcom/my/tracker/async/commands/a;

    invoke-static {v0}, Lcom/my/tracker/async/commands/a;->a(Lcom/my/tracker/async/commands/a;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 120
    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
