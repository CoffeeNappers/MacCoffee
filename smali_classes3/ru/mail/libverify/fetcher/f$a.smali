.class final Lru/mail/libverify/fetcher/f$a;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/fetcher/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/fetcher/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/fetcher/f;


# direct methods
.method private constructor <init>(Lru/mail/libverify/fetcher/f;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lru/mail/libverify/fetcher/f;B)V
    .locals 0

    invoke-direct {p0, p1}, Lru/mail/libverify/fetcher/f$a;-><init>(Lru/mail/libverify/fetcher/f;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/e;->d()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/fetcher/f$a$3;

    invoke-direct {v1, p0}, Lru/mail/libverify/fetcher/f$a$3;-><init>(Lru/mail/libverify/fetcher/f$a;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final a(Ljava/lang/Long;)V
    .locals 1
    .param p1    # Ljava/lang/Long;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    invoke-virtual {v0, p1}, Lru/mail/libverify/fetcher/f;->a(Ljava/lang/Long;)V

    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/e;->d()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/fetcher/f$a$1;

    invoke-direct {v1, p0, p1, p2}, Lru/mail/libverify/fetcher/f$a$1;-><init>(Lru/mail/libverify/fetcher/f$a;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final a(Lru/mail/libverify/gcm/ServerInfo;)V
    .locals 2
    .param p1    # Lru/mail/libverify/gcm/ServerInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/e;->d()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/fetcher/f$a$2;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/fetcher/f$a$2;-><init>(Lru/mail/libverify/fetcher/f$a;Lru/mail/libverify/gcm/ServerInfo;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final a(Lru/mail/libverify/requests/e;Ljava/lang/Throwable;)V
    .locals 2
    .param p1    # Lru/mail/libverify/requests/e;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/e;->d()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/fetcher/f$a$5;

    invoke-direct {v1, p0, p1, p2}, Lru/mail/libverify/fetcher/f$a$5;-><init>(Lru/mail/libverify/fetcher/f$a;Lru/mail/libverify/requests/e;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)V
    .locals 2
    .param p1    # Lru/mail/libverify/requests/response/ClientApiResponseBase;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/e;->d()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/fetcher/f$a$6;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/fetcher/f$a$6;-><init>(Lru/mail/libverify/fetcher/f$a;Lru/mail/libverify/requests/response/ClientApiResponseBase;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final a(Lru/mail/libverify/requests/response/FetcherInfo;)V
    .locals 2
    .param p1    # Lru/mail/libverify/requests/response/FetcherInfo;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    if-nez p1, :cond_0

    const-string/jumbo v0, "FetcherManager"

    const-string/jumbo v1, "empty fetcher info has been skipped"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    invoke-virtual {v0, p1}, Lru/mail/libverify/fetcher/f;->b(Lru/mail/libverify/requests/response/FetcherInfo;)V

    goto :goto_0
.end method

.method public final b()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/e;->d()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/fetcher/f$a$4;

    invoke-direct {v1, p0}, Lru/mail/libverify/fetcher/f$a$4;-><init>(Lru/mail/libverify/fetcher/f$a;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final c()Ljava/util/concurrent/ExecutorService;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/e;->b()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    return-object v0
.end method

.method public final d()Ljava/util/concurrent/ExecutorService;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/e;->c()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    return-object v0
.end method

.method public final e()Z
    .locals 3

    iget-object v1, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    invoke-virtual {v0}, Lru/mail/libverify/fetcher/f;->e()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    sget-object v2, Lru/mail/libverify/fetcher/f$b;->SUSPENDED_OTHER_SERVICE:Lru/mail/libverify/fetcher/f$b;

    if-eq v0, v2, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public final f()Z
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/e;->e()Z

    move-result v0

    return v0
.end method

.method public final g()I
    .locals 6

    const/4 v0, 0x0

    iget-object v1, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    invoke-virtual {v2}, Lru/mail/libverify/fetcher/f;->f()V

    iget-object v2, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    invoke-virtual {v2}, Lru/mail/libverify/fetcher/f;->e()Z

    move-result v2

    if-nez v2, :cond_0

    monitor-exit v1

    :goto_0
    return v0

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v4, v4, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-virtual {v4}, Lru/mail/libverify/requests/response/FetcherInfo;->getTimestamp()J

    move-result-wide v4

    sub-long/2addr v2, v4

    iget-object v4, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v4, v4, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-virtual {v4}, Lru/mail/libverify/requests/response/FetcherInfo;->getTimeout()I

    move-result v4

    int-to-long v4, v4

    cmp-long v4, v2, v4

    if-lez v4, :cond_1

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_1
    :try_start_1
    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetcherInfo;->getTimeout()I

    move-result v0

    int-to-long v4, v0

    sub-long v2, v4, v2

    long-to-int v0, v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public final h()Ljava/lang/String;
    .locals 2

    iget-object v1, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    invoke-virtual {v0}, Lru/mail/libverify/fetcher/f;->f()V

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    invoke-virtual {v0}, Lru/mail/libverify/fetcher/f;->e()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetcherInfo;->getUrl()Ljava/lang/String;

    move-result-object v0

    :goto_0
    monitor-exit v1

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public final i()J
    .locals 6

    const-wide/16 v0, 0x0

    iget-object v2, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    invoke-virtual {v3}, Lru/mail/libverify/fetcher/f;->f()V

    iget-object v3, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    invoke-virtual {v3}, Lru/mail/libverify/fetcher/f;->e()Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "FetcherManager"

    const-string/jumbo v4, "no valid fetcher info to get timestamp"

    invoke-static {v3, v4}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v2

    :goto_0
    return-wide v0

    :cond_0
    iget-object v3, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v3, v3, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-virtual {v3}, Lru/mail/libverify/requests/response/FetcherInfo;->getLastModified()J

    move-result-wide v4

    cmp-long v0, v4, v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetcherInfo;->getLastModified()J

    move-result-wide v0

    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_1
    :try_start_1
    const-string/jumbo v0, "FetcherManager"

    const-string/jumbo v1, "no last modified timestamp, use current time"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetcherInfo;->getTimestamp()J

    move-result-wide v0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method
