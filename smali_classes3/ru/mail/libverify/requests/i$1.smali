.class final Lru/mail/libverify/requests/i$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/requests/i;->a()Ljava/util/concurrent/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<TTW;>;"
    }
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/requests/i;


# direct methods
.method constructor <init>(Lru/mail/libverify/requests/i;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/requests/i$1;->a:Lru/mail/libverify/requests/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TTW;"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/requests/i$1;->a:Lru/mail/libverify/requests/i;

    iget-object v0, v0, Lru/mail/libverify/requests/i;->a:Ljava/util/concurrent/Callable;

    invoke-interface {v0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/requests/i$1;->a:Lru/mail/libverify/requests/i;

    iget-object v1, v1, Lru/mail/libverify/requests/i;->c:Lru/mail/libverify/requests/i$b;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lru/mail/libverify/requests/i$1;->a:Lru/mail/libverify/requests/i;

    iget-object v1, v1, Lru/mail/libverify/requests/i;->c:Lru/mail/libverify/requests/i$b;

    invoke-interface {v1}, Lru/mail/libverify/requests/i$b;->a()Landroid/os/Handler;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lru/mail/libverify/requests/i$1;->a:Lru/mail/libverify/requests/i;

    iget-object v1, v1, Lru/mail/libverify/requests/i;->c:Lru/mail/libverify/requests/i$b;

    invoke-interface {v1}, Lru/mail/libverify/requests/i$b;->a()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lru/mail/libverify/requests/i$1$1;

    invoke-direct {v2, p0}, Lru/mail/libverify/requests/i$1$1;-><init>(Lru/mail/libverify/requests/i$1;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lru/mail/libverify/requests/i$1;->a:Lru/mail/libverify/requests/i;

    iget-object v1, v1, Lru/mail/libverify/requests/i;->c:Lru/mail/libverify/requests/i$b;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lru/mail/libverify/requests/i$1;->a:Lru/mail/libverify/requests/i;

    iget-object v1, v1, Lru/mail/libverify/requests/i;->c:Lru/mail/libverify/requests/i$b;

    invoke-interface {v1}, Lru/mail/libverify/requests/i$b;->a()Landroid/os/Handler;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lru/mail/libverify/requests/i$1;->a:Lru/mail/libverify/requests/i;

    iget-object v1, v1, Lru/mail/libverify/requests/i;->c:Lru/mail/libverify/requests/i$b;

    invoke-interface {v1}, Lru/mail/libverify/requests/i$b;->a()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lru/mail/libverify/requests/i$1$1;

    invoke-direct {v2, p0}, Lru/mail/libverify/requests/i$1$1;-><init>(Lru/mail/libverify/requests/i$1;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    throw v0
.end method
