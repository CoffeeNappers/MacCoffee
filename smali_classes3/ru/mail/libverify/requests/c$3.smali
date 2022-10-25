.class final Lru/mail/libverify/requests/c$3;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/requests/i$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/requests/c;->b(Lru/mail/libverify/requests/c$a;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lru/mail/libverify/requests/i$b",
        "<",
        "Lru/mail/libverify/requests/response/ClientApiResponseBase;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/requests/c$a;

.field final synthetic b:Lru/mail/libverify/requests/c;


# direct methods
.method constructor <init>(Lru/mail/libverify/requests/c;Lru/mail/libverify/requests/c$a;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/requests/c$3;->b:Lru/mail/libverify/requests/c;

    iput-object p2, p0, Lru/mail/libverify/requests/c$3;->a:Lru/mail/libverify/requests/c$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/c$3;->b:Lru/mail/libverify/requests/c;

    iget-object v0, v0, Lru/mail/libverify/requests/c;->a:Lru/mail/libverify/requests/a;

    invoke-interface {v0}, Lru/mail/libverify/requests/a;->c()Landroid/os/Handler;

    move-result-object v0

    return-object v0
.end method

.method public final a(Ljava/util/concurrent/Future;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future",
            "<",
            "Lru/mail/libverify/requests/response/ClientApiResponseBase;",
            ">;)V"
        }
    .end annotation

    const/4 v7, 0x1

    const/4 v6, 0x0

    invoke-interface {p1}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    :try_start_0
    invoke-interface {p1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/response/ClientApiResponseBase;

    const-string/jumbo v1, "ActionExecutor"

    const-string/jumbo v2, "Action %s completed"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lru/mail/libverify/requests/c$3;->a:Lru/mail/libverify/requests/c$a;

    iget-object v5, v5, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lru/mail/libverify/requests/c$3;->b:Lru/mail/libverify/requests/c;

    iget-object v2, p0, Lru/mail/libverify/requests/c$3;->a:Lru/mail/libverify/requests/c$a;

    invoke-virtual {v1, v2}, Lru/mail/libverify/requests/c;->a(Lru/mail/libverify/requests/c$a;)V

    iget-object v1, p0, Lru/mail/libverify/requests/c$3;->b:Lru/mail/libverify/requests/c;

    iget-object v1, v1, Lru/mail/libverify/requests/c;->a:Lru/mail/libverify/requests/a;

    invoke-interface {v1, v0}, Lru/mail/libverify/requests/a;->a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)V
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lru/mail/libverify/requests/c$3;->b:Lru/mail/libverify/requests/c;

    iget-object v2, p0, Lru/mail/libverify/requests/c$3;->a:Lru/mail/libverify/requests/c$a;

    invoke-static {v1, v0, v2}, Lru/mail/libverify/requests/c;->a(Lru/mail/libverify/requests/c;Ljava/lang/Throwable;Lru/mail/libverify/requests/c$a;)V

    goto :goto_0

    :cond_1
    instance-of v2, v1, Lru/mail/libverify/utils/ServerException;

    instance-of v3, v1, Ljava/io/IOException;

    if-nez v2, :cond_2

    if-eqz v3, :cond_4

    :cond_2
    iget-object v3, p0, Lru/mail/libverify/requests/c$3;->a:Lru/mail/libverify/requests/c$a;

    const/4 v4, 0x0

    iput-object v4, v3, Lru/mail/libverify/requests/c$a;->d:Ljava/util/concurrent/Future;

    iget-object v3, p0, Lru/mail/libverify/requests/c$3;->b:Lru/mail/libverify/requests/c;

    invoke-virtual {v3, v6}, Lru/mail/libverify/requests/c;->a(Z)V

    if-eqz v2, :cond_3

    const-string/jumbo v2, "ActionExecutor"

    const-string/jumbo v3, "Action %s failed by server"

    new-array v4, v7, [Ljava/lang/Object;

    iget-object v5, p0, Lru/mail/libverify/requests/c$3;->a:Lru/mail/libverify/requests/c$a;

    iget-object v5, v5, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v2, v0, v3, v4}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_1
    iget-object v0, p0, Lru/mail/libverify/requests/c$3;->b:Lru/mail/libverify/requests/c;

    iget-object v0, v0, Lru/mail/libverify/requests/c;->a:Lru/mail/libverify/requests/a;

    iget-object v2, p0, Lru/mail/libverify/requests/c$3;->a:Lru/mail/libverify/requests/c$a;

    iget-object v2, v2, Lru/mail/libverify/requests/c$a;->b:Lru/mail/libverify/requests/e;

    invoke-interface {v0, v2, v1}, Lru/mail/libverify/requests/a;->a(Lru/mail/libverify/requests/e;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_3
    const-string/jumbo v2, "ActionExecutor"

    const-string/jumbo v3, "Action %s failed by network"

    new-array v4, v7, [Ljava/lang/Object;

    iget-object v5, p0, Lru/mail/libverify/requests/c$3;->a:Lru/mail/libverify/requests/c$a;

    iget-object v5, v5, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v2, v0, v3, v4}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1

    :cond_4
    iget-object v2, p0, Lru/mail/libverify/requests/c$3;->b:Lru/mail/libverify/requests/c;

    iget-object v3, p0, Lru/mail/libverify/requests/c$3;->a:Lru/mail/libverify/requests/c$a;

    invoke-static {v2, v0, v3}, Lru/mail/libverify/requests/c;->a(Lru/mail/libverify/requests/c;Ljava/lang/Throwable;Lru/mail/libverify/requests/c$a;)V

    goto :goto_1

    :catch_1
    move-exception v0

    iget-object v1, p0, Lru/mail/libverify/requests/c$3;->b:Lru/mail/libverify/requests/c;

    iget-object v2, p0, Lru/mail/libverify/requests/c$3;->a:Lru/mail/libverify/requests/c$a;

    invoke-static {v1, v0, v2}, Lru/mail/libverify/requests/c;->a(Lru/mail/libverify/requests/c;Ljava/lang/Throwable;Lru/mail/libverify/requests/c$a;)V

    goto/16 :goto_0
.end method
