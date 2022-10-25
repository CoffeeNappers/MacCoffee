.class final Lru/mail/libverify/api/ad$d;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/fetcher/e;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/ad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "d"
.end annotation


# instance fields
.field volatile a:Ljava/util/concurrent/ExecutorService;

.field volatile b:Ljava/util/concurrent/ExecutorService;

.field final synthetic c:Lru/mail/libverify/api/ad;


# direct methods
.method private constructor <init>(Lru/mail/libverify/api/ad;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lru/mail/libverify/api/ad;B)V
    .locals 0

    invoke-direct {p0, p1}, Lru/mail/libverify/api/ad$d;-><init>(Lru/mail/libverify/api/ad;)V

    return-void
.end method


# virtual methods
.method public final a()Lru/mail/libverify/storage/o;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->j(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/o;

    move-result-object v0

    return-object v0
.end method

.method public final a(Ljava/lang/String;)V
    .locals 5
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v2, "received message from fetcher: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v1

    invoke-static {v0, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :try_start_0
    const-class v0, [Lru/mail/libverify/gcm/ServerNotificationMessage;

    invoke-static {p1, v0}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lru/mail/libverify/gcm/ServerNotificationMessage;

    array-length v2, v0

    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    sget-object v4, Lru/mail/libverify/requests/k$b;->FETCHER:Lru/mail/libverify/requests/k$b;

    iput-object v4, v3, Lru/mail/libverify/gcm/ServerNotificationMessage;->deliveryMethod:Lru/mail/libverify/requests/k$b;

    iget-object v4, p0, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    invoke-static {v4, v3}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Lru/mail/libverify/gcm/ServerNotificationMessage;)V
    :try_end_0
    .catch Lru/mail/libverify/utils/json/JsonParseException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v2, "failed to parse fetcher json"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public final a(Lru/mail/libverify/gcm/ServerInfo;)V
    .locals 2
    .param p1    # Lru/mail/libverify/gcm/ServerInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    sget-object v1, Lru/mail/libverify/requests/k$b;->FETCHER:Lru/mail/libverify/requests/k$b;

    invoke-static {v0, p1, v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Lru/mail/libverify/gcm/ServerInfo;Lru/mail/libverify/requests/k$b;)V

    return-void
.end method

.method public final a(Lru/mail/libverify/requests/e;Ljava/lang/Throwable;)V
    .locals 5
    .param p1    # Lru/mail/libverify/requests/e;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "fetcher received server failure in api %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lru/mail/libverify/requests/e;->l()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, p2, v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0, p1, p2}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Lru/mail/libverify/requests/e;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)V
    .locals 1
    .param p1    # Lru/mail/libverify/requests/response/ClientApiResponseBase;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v0

    invoke-virtual {v0, p1}, Lru/mail/libverify/statistics/b;->a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)V

    return-void
.end method

.method public final a(Z)V
    .locals 5

    const/4 v4, 0x0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "fetcher stopped, publish = %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0, p1}, Lru/mail/libverify/storage/l;->b(Z)V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/w;->d()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0, v4}, Lru/mail/libverify/api/ad;->b(Lru/mail/libverify/api/ad;Z)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v0

    iget-object v0, v0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v2, Lru/mail/libverify/statistics/a;->Instance_Fetcher_Stopped:Lru/mail/libverify/statistics/a;

    invoke-interface {v0, v2}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;)V

    goto :goto_0

    :cond_0
    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "fetcher started, did\'t published"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public final b()Ljava/util/concurrent/ExecutorService;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->b:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->b:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/api/ad$d$1;

    invoke-direct {v0, p0}, Lru/mail/libverify/api/ad$d$1;-><init>(Lru/mail/libverify/api/ad$d;)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/api/ad$d;->b:Ljava/util/concurrent/ExecutorService;

    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->b:Ljava/util/concurrent/ExecutorService;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final b(Z)V
    .locals 6

    const/4 v5, 0x1

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "fetcher started, publish = %s"

    new-array v2, v5, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->I()V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/w;->d()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0, v5}, Lru/mail/libverify/api/ad;->b(Lru/mail/libverify/api/ad;Z)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v0

    iget-object v0, v0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v2, Lru/mail/libverify/statistics/a;->Instance_Fetcher_Started:Lru/mail/libverify/statistics/a;

    invoke-interface {v0, v2}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;)V

    goto :goto_0

    :cond_0
    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "fetcher started, did\'t published"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public final c()Ljava/util/concurrent/ExecutorService;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->a:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->a:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/api/ad$d$2;

    invoke-direct {v0, p0}, Lru/mail/libverify/api/ad$d$2;-><init>(Lru/mail/libverify/api/ad$d;)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/api/ad$d;->a:Ljava/util/concurrent/ExecutorService;

    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->a:Ljava/util/concurrent/ExecutorService;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final d()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    iget-object v0, v0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    return-object v0
.end method

.method public final e()Z
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$d;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/w;->d()Z

    move-result v0

    return v0
.end method
