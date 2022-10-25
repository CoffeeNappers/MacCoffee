.class final Lru/mail/libverify/fetcher/c;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/fetcher/a;


# instance fields
.field final a:Lru/mail/libverify/storage/k;

.field final b:Lru/mail/libverify/fetcher/b;

.field private final c:Ljava/lang/Object;

.field private final d:Ljava/lang/Runnable;

.field private e:Ljava/util/concurrent/Future;


# direct methods
.method constructor <init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/fetcher/b;)V
    .locals 1
    .param p1    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/fetcher/b;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/fetcher/c;->c:Ljava/lang/Object;

    new-instance v0, Lru/mail/libverify/fetcher/c$1;

    invoke-direct {v0, p0}, Lru/mail/libverify/fetcher/c$1;-><init>(Lru/mail/libverify/fetcher/c;)V

    iput-object v0, p0, Lru/mail/libverify/fetcher/c;->d:Ljava/lang/Runnable;

    iput-object p1, p0, Lru/mail/libverify/fetcher/c;->a:Lru/mail/libverify/storage/k;

    iput-object p2, p0, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    return-void
.end method

.method private b(I)Z
    .locals 7

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget-object v2, p0, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v2}, Lru/mail/libverify/fetcher/b;->g()I

    move-result v2

    mul-int/lit16 v3, p1, 0x1f4

    mul-int/2addr v3, p1

    add-int/2addr v2, v3

    const-string/jumbo v3, "FetcherExecutor"

    const-string/jumbo v4, "wait timeout %d on attempt (%d)"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-static {v3, v4, v5}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    if-gez v2, :cond_0

    :goto_0
    return v0

    :cond_0
    if-nez v2, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    iget-object v3, p0, Lru/mail/libverify/fetcher/c;->c:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/fetcher/c;->c:Ljava/lang/Object;

    int-to-long v4, v2

    invoke-virtual {v0, v4, v5}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    monitor-exit v3

    move v0, v1

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "FetcherExecutor"

    const-string/jumbo v2, "fetcher thread was interrupted"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private d()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/fetcher/c;->e:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/fetcher/c;->e:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/fetcher/c;->e:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lru/mail/libverify/fetcher/c;->e:Ljava/util/concurrent/Future;

    :cond_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v0, "FetcherExecutor"

    const-string/jumbo v1, "fetcher thread stopped"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public final a()V
    .locals 5

    const-string/jumbo v0, "FetcherExecutor"

    const-string/jumbo v1, "fetcher thread start requested, future %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/fetcher/c;->e:Ljava/util/concurrent/Future;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/fetcher/c;->e:Ljava/util/concurrent/Future;

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/b;->d()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/fetcher/c;->d:Ljava/lang/Runnable;

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/fetcher/c;->e:Ljava/util/concurrent/Future;

    :cond_0
    return-void
.end method

.method final a(I)Z
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v1}, Lru/mail/libverify/fetcher/b;->e()Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "FetcherExecutor"

    const-string/jumbo v2, "fetcher start not allowed"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return v0

    :cond_0
    const/16 v1, 0x14

    if-lt p1, v1, :cond_1

    const-string/jumbo v1, "FetcherExecutor"

    const-string/jumbo v2, "fetcher request max attempts reached"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v1}, Lru/mail/libverify/fetcher/b;->f()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-direct {p0, p1}, Lru/mail/libverify/fetcher/c;->b(I)Z

    move-result v2

    if-nez v2, :cond_2

    const-string/jumbo v1, "FetcherExecutor"

    const-string/jumbo v2, "fetcher timeout check failed"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v2}, Lru/mail/libverify/fetcher/b;->e()Z

    move-result v2

    if-nez v2, :cond_3

    const-string/jumbo v1, "FetcherExecutor"

    const-string/jumbo v2, "fetcher start blocked"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lru/mail/libverify/fetcher/c;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v2}, Lru/mail/libverify/storage/k;->j()Z

    move-result v2

    if-nez v2, :cond_4

    const-string/jumbo v1, "FetcherExecutor"

    const-string/jumbo v2, "fetcher start blocked, no network"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    if-nez v1, :cond_5

    iget-object v1, p0, Lru/mail/libverify/fetcher/c;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v1}, Lru/mail/libverify/storage/k;->l()Z

    move-result v1

    if-eqz v1, :cond_5

    const-string/jumbo v1, "FetcherExecutor"

    const-string/jumbo v2, "fetcher start blocked, low battery"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public final b()V
    .locals 5

    const-string/jumbo v0, "FetcherExecutor"

    const-string/jumbo v1, "fetcher thread stop requested, future %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/fetcher/c;->e:Ljava/util/concurrent/Future;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lru/mail/libverify/fetcher/c;->d()V

    return-void
.end method

.method public final c()V
    .locals 0

    invoke-direct {p0}, Lru/mail/libverify/fetcher/c;->d()V

    invoke-virtual {p0}, Lru/mail/libverify/fetcher/c;->a()V

    return-void
.end method
