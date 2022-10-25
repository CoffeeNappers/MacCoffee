.class public abstract Lcom/my/tracker/async/commands/a;
.super Ljava/lang/Object;
.source "AbstractAsyncCommand.java"

# interfaces
.implements Lcom/my/tracker/async/commands/d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/tracker/async/commands/a$a;
    }
.end annotation


# static fields
.field private static final a:Ljava/util/concurrent/ExecutorService;

.field private static final b:Landroid/os/Handler;


# instance fields
.field private c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 24
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/my/tracker/async/commands/a;->a:Ljava/util/concurrent/ExecutorService;

    .line 25
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/my/tracker/async/commands/a;->b:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    return-void
.end method

.method static synthetic a(Lcom/my/tracker/async/commands/a;)Ljava/lang/ref/WeakReference;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/my/tracker/async/commands/a;->c:Ljava/lang/ref/WeakReference;

    return-object v0
.end method


# virtual methods
.method public final a()V
    .locals 1

    .prologue
    .line 78
    sget-object v0, Lcom/my/tracker/async/commands/a;->a:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 79
    return-void
.end method

.method public final b()Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 83
    sget-object v0, Lcom/my/tracker/async/commands/a;->a:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method protected c()Lcom/my/tracker/async/commands/e;
    .locals 1

    .prologue
    .line 89
    new-instance v0, Lcom/my/tracker/async/commands/e;

    invoke-direct {v0}, Lcom/my/tracker/async/commands/e;-><init>()V

    return-object v0
.end method

.method public final run()V
    .locals 4

    .prologue
    .line 67
    :try_start_0
    invoke-virtual {p0}, Lcom/my/tracker/async/commands/a;->c()Lcom/my/tracker/async/commands/e;

    move-result-object v0

    .line 1094
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 1096
    :try_start_1
    iget-object v1, p0, Lcom/my/tracker/async/commands/a;->c:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/my/tracker/async/commands/a;->c:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1097
    sget-object v1, Lcom/my/tracker/async/commands/a;->b:Landroid/os/Handler;

    new-instance v2, Lcom/my/tracker/async/commands/a$a;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v0, v3}, Lcom/my/tracker/async/commands/a$a;-><init>(Lcom/my/tracker/async/commands/a;Lcom/my/tracker/async/commands/e;B)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1098
    :cond_0
    monitor-exit p0

    :goto_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 69
    :catch_0
    move-exception v0

    .line 71
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
