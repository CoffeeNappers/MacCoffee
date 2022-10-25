.class final Lru/mail/libverify/fetcher/c$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/fetcher/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/fetcher/c;


# direct methods
.method constructor <init>(Lru/mail/libverify/fetcher/c;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/fetcher/c$1;->a:Lru/mail/libverify/fetcher/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 14

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object v8, p0, Lru/mail/libverify/fetcher/c$1;->a:Lru/mail/libverify/fetcher/c;

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {v8, v0}, Lru/mail/libverify/fetcher/c;->a(I)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_7
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/b;->a()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    :try_start_1
    iget-object v0, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/b;->b()V

    const-string/jumbo v0, "FetcherExecutor"

    const-string/jumbo v3, "fetch loop started"

    invoke-static {v0, v3}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    move v7, v1

    :goto_1
    invoke-virtual {v8, v7}, Lru/mail/libverify/fetcher/c;->a(I)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_7
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-wide v10

    :try_start_2
    const-string/jumbo v0, "FetcherExecutor"

    const-string/jumbo v3, "fetch loop start iteration (%d): url %s last %d"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v4, v6

    const/4 v6, 0x1

    iget-object v9, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v9}, Lru/mail/libverify/fetcher/b;->h()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v4, v6

    const/4 v6, 0x2

    iget-object v9, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v9}, Lru/mail/libverify/fetcher/b;->i()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v4, v6

    invoke-static {v0, v3, v4}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v4, Lru/mail/libverify/requests/h;

    iget-object v0, v8, Lru/mail/libverify/fetcher/c;->a:Lru/mail/libverify/storage/k;

    iget-object v3, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v3}, Lru/mail/libverify/fetcher/b;->h()Ljava/lang/String;

    move-result-object v3

    iget-object v6, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v6}, Lru/mail/libverify/fetcher/b;->i()J

    move-result-wide v12

    invoke-direct {v4, v0, v3, v12, v13}, Lru/mail/libverify/requests/h;-><init>(Lru/mail/libverify/storage/k;Ljava/lang/String;J)V
    :try_end_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_2 .. :try_end_2} :catch_10
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Lru/mail/libverify/utils/ClientException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2 .. :try_end_2} :catch_c
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/InterruptedException;

    const-string/jumbo v3, "Upper logic interrupted fetch loop"

    invoke-direct {v0, v3}, Ljava/lang/InterruptedException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Lru/mail/libverify/utils/ClientException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/util/concurrent/CancellationException; {:try_start_3 .. :try_end_3} :catch_c
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catch_0
    move-exception v0

    move-object v3, v0

    move-object v6, v4

    move-object v4, v5

    :goto_2
    :try_start_4
    invoke-virtual {v3}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_a

    const-string/jumbo v0, "FetcherExecutor"

    const-string/jumbo v2, "fetch loop was interrupted (bad error)"

    invoke-static {v0, v2, v3}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    if-eqz v4, :cond_11

    const/4 v0, 0x1

    :try_start_5
    invoke-interface {v4, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_6
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_7
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move v0, v1

    :goto_3
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v1

    if-nez v1, :cond_2

    if-nez v0, :cond_2

    iget-object v0, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/b;->a()V

    :cond_2
    :goto_4
    const-string/jumbo v0, "FetcherExecutor"

    const-string/jumbo v1, "fetch loop stopped"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_3
    :try_start_6
    iget-object v0, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/b;->c()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-virtual {v4}, Lru/mail/libverify/requests/e;->u()Lru/mail/libverify/utils/e;

    move-result-object v3

    new-instance v6, Lru/mail/libverify/requests/i;

    new-instance v9, Lru/mail/libverify/requests/e$2;

    invoke-direct {v9, v4, v3}, Lru/mail/libverify/requests/e$2;-><init>(Lru/mail/libverify/requests/e;Lru/mail/libverify/utils/e;)V

    new-instance v12, Lru/mail/libverify/requests/e$3;

    invoke-direct {v12, v4, v3}, Lru/mail/libverify/requests/e$3;-><init>(Lru/mail/libverify/requests/e;Lru/mail/libverify/utils/e;)V

    const/4 v3, 0x0

    invoke-direct {v6, v0, v9, v12, v3}, Lru/mail/libverify/requests/i;-><init>(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/Callable;Lru/mail/libverify/requests/i$a;Lru/mail/libverify/requests/i$b;)V

    invoke-virtual {v6}, Lru/mail/libverify/requests/i;->a()Ljava/util/concurrent/Future;
    :try_end_6
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Lru/mail/libverify/utils/ClientException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/util/concurrent/CancellationException; {:try_start_6 .. :try_end_6} :catch_c
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_4
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result-object v3

    :try_start_7
    invoke-interface {v3}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/response/FetchDataResponse;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetchDataResponse;->getStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    move-result-object v6

    sget-object v9, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->OK:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    if-eq v6, v9, :cond_4

    const-string/jumbo v6, "FetcherExecutor"

    const-string/jumbo v9, "fetcher illegal server response: %s"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetchDataResponse;->getStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v6, v9, v10}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v6, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v6, v0}, Lru/mail/libverify/fetcher/b;->a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)V
    :try_end_7
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_f
    .catch Lru/mail/libverify/utils/ClientException; {:try_start_7 .. :try_end_7} :catch_e
    .catch Ljava/util/concurrent/CancellationException; {:try_start_7 .. :try_end_7} :catch_d
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_b
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_a
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    if-eqz v3, :cond_11

    const/4 v0, 0x1

    :try_start_8
    invoke-interface {v3, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_6
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_7
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    move v0, v1

    goto :goto_3

    :cond_4
    :try_start_9
    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetchDataResponse;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/response/FetchDataResponse$ResponseItem;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetchDataResponse$ResponseItem;->getServerInfo()Lru/mail/libverify/gcm/ServerInfo;

    move-result-object v9

    if-eqz v9, :cond_5

    iget-object v9, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetchDataResponse$ResponseItem;->getServerInfo()Lru/mail/libverify/gcm/ServerInfo;

    move-result-object v12

    invoke-interface {v9, v12}, Lru/mail/libverify/fetcher/b;->a(Lru/mail/libverify/gcm/ServerInfo;)V

    :cond_5
    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetchDataResponse$ResponseItem;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_6

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetchDataResponse$ResponseItem;->getKey()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_6

    iget-object v9, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetchDataResponse$ResponseItem;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetchDataResponse$ResponseItem;->getKey()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v9, v12, v13}, Lru/mail/libverify/fetcher/b;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetchDataResponse$ResponseItem;->getFetcherInfo()Lru/mail/libverify/requests/response/FetcherInfo;

    move-result-object v9

    if-eqz v9, :cond_7

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetchDataResponse$ResponseItem;->getFetcherInfo()Lru/mail/libverify/requests/response/FetcherInfo;

    move-result-object v9

    invoke-virtual {v4}, Lru/mail/libverify/requests/h;->m()Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v9, v12}, Lru/mail/libverify/requests/response/FetcherInfo;->setLastModified(Ljava/lang/Long;)V

    :cond_7
    iget-object v9, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetchDataResponse$ResponseItem;->getFetcherInfo()Lru/mail/libverify/requests/response/FetcherInfo;

    move-result-object v0

    invoke-interface {v9, v0}, Lru/mail/libverify/fetcher/b;->a(Lru/mail/libverify/requests/response/FetcherInfo;)V

    goto :goto_5

    :catch_1
    move-exception v0

    move-object v6, v4

    move-object v4, v3

    move-object v3, v0

    goto/16 :goto_2

    :cond_8
    iget-object v0, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-virtual {v4}, Lru/mail/libverify/requests/h;->m()Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v0, v6}, Lru/mail/libverify/fetcher/b;->a(Ljava/lang/Long;)V

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v12

    sub-long v10, v12, v10

    const-wide/32 v12, 0xf4240

    div-long/2addr v10, v12
    :try_end_9
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_9 .. :try_end_9} :catch_1
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_f
    .catch Lru/mail/libverify/utils/ClientException; {:try_start_9 .. :try_end_9} :catch_e
    .catch Ljava/util/concurrent/CancellationException; {:try_start_9 .. :try_end_9} :catch_d
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_9} :catch_b
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_a
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    const-wide/16 v12, 0x3e8

    cmp-long v0, v10, v12

    if-gez v0, :cond_9

    add-int/lit8 v0, v7, 0x1

    :goto_6
    if-eqz v3, :cond_f

    const/4 v4, 0x1

    :try_start_a
    invoke-interface {v3, v4}, Ljava/util/concurrent/Future;->cancel(Z)Z
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_a} :catch_6
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_7
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    move v7, v0

    goto/16 :goto_1

    :cond_9
    move v0, v1

    goto :goto_6

    :cond_a
    :try_start_b
    instance-of v9, v0, Lru/mail/libverify/utils/ServerException;

    if-eqz v9, :cond_c

    check-cast v0, Lru/mail/libverify/utils/ServerException;

    iget v9, v0, Lru/mail/libverify/utils/ServerException;->a:I

    const/16 v10, 0x130

    if-ne v9, v10, :cond_b

    iget-object v0, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-virtual {v6}, Lru/mail/libverify/requests/h;->m()Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v0, v6}, Lru/mail/libverify/fetcher/b;->a(Ljava/lang/Long;)V

    const-string/jumbo v0, "FetcherExecutor"

    const-string/jumbo v6, "fetch loop iteration ended, go to next"

    invoke-static {v0, v6, v3}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    move v0, v1

    :goto_7
    if-eqz v4, :cond_f

    const/4 v3, 0x1

    :try_start_c
    invoke-interface {v4, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_c} :catch_6
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_7
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    move v7, v0

    goto/16 :goto_1

    :cond_b
    :try_start_d
    const-string/jumbo v9, "FetcherExecutor"

    const-string/jumbo v10, "server error received during fetch loop"

    invoke-static {v9, v10, v3}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v3, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v3, v6, v0}, Lru/mail/libverify/fetcher/b;->a(Lru/mail/libverify/requests/e;Ljava/lang/Throwable;)V

    add-int/lit8 v0, v7, 0x1

    goto :goto_7

    :cond_c
    instance-of v0, v0, Ljava/io/IOException;

    if-eqz v0, :cond_d

    const-string/jumbo v0, "FetcherExecutor"

    const-string/jumbo v6, "fetch connection problem occurred"

    invoke-static {v0, v6, v3}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    add-int/lit8 v0, v7, 0x1

    goto :goto_7

    :cond_d
    const-string/jumbo v0, "FetcherExecutor"

    const-string/jumbo v2, "fetch loop was interrupted by error"

    invoke-static {v0, v2, v3}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    if-eqz v4, :cond_11

    const/4 v0, 0x1

    :try_start_e
    invoke-interface {v4, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z
    :try_end_e
    .catch Ljava/lang/InterruptedException; {:try_start_e .. :try_end_e} :catch_6
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_7
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    move v0, v1

    goto/16 :goto_3

    :catch_2
    move-exception v0

    move-object v3, v5

    :goto_8
    :try_start_f
    const-string/jumbo v4, "FetcherExecutor"

    const-string/jumbo v6, "fetch connection problem occurred"

    invoke-static {v4, v6, v0}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    add-int/lit8 v0, v7, 0x1

    if-eqz v3, :cond_f

    const/4 v4, 0x1

    :try_start_10
    invoke-interface {v3, v4}, Ljava/util/concurrent/Future;->cancel(Z)Z
    :try_end_10
    .catch Ljava/lang/InterruptedException; {:try_start_10 .. :try_end_10} :catch_6
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_7
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    move v7, v0

    goto/16 :goto_1

    :catch_3
    move-exception v0

    move-object v3, v5

    :goto_9
    :try_start_11
    const-string/jumbo v2, "FetcherExecutor"

    const-string/jumbo v4, "fetch loop was interrupted"

    invoke-static {v2, v4, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_3

    if-eqz v3, :cond_11

    const/4 v0, 0x1

    :try_start_12
    invoke-interface {v3, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z
    :try_end_12
    .catch Ljava/lang/InterruptedException; {:try_start_12 .. :try_end_12} :catch_6
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_7
    .catchall {:try_start_12 .. :try_end_12} :catchall_1

    move v0, v1

    goto/16 :goto_3

    :catch_4
    move-exception v0

    move-object v3, v5

    :goto_a
    :try_start_13
    const-string/jumbo v4, "FetcherExecutor"

    const-string/jumbo v5, "fetch loop was interrupted"

    invoke-static {v4, v5, v0}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_3

    if-eqz v3, :cond_12

    const/4 v0, 0x1

    :try_start_14
    invoke-interface {v3, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z
    :try_end_14
    .catch Ljava/lang/InterruptedException; {:try_start_14 .. :try_end_14} :catch_9
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_8
    .catchall {:try_start_14 .. :try_end_14} :catchall_2

    move v0, v2

    goto/16 :goto_3

    :catch_5
    move-exception v0

    move-object v3, v5

    :goto_b
    :try_start_15
    const-string/jumbo v2, "FetcherExecutor"

    const-string/jumbo v4, "failed to create fetch request"

    invoke-static {v2, v4, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_3

    if-eqz v3, :cond_11

    const/4 v0, 0x1

    :try_start_16
    invoke-interface {v3, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    move v0, v1

    goto/16 :goto_3

    :catchall_0
    move-exception v0

    move-object v3, v5

    :goto_c
    if-eqz v3, :cond_e

    const/4 v2, 0x1

    invoke-interface {v3, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_e
    throw v0
    :try_end_16
    .catch Ljava/lang/InterruptedException; {:try_start_16 .. :try_end_16} :catch_6
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_7
    .catchall {:try_start_16 .. :try_end_16} :catchall_1

    :catch_6
    move-exception v0

    :goto_d
    :try_start_17
    const-string/jumbo v2, "FetcherExecutor"

    const-string/jumbo v3, "fetch loop exit by interrupt"

    invoke-static {v2, v3, v0}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_1

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_2

    goto/16 :goto_4

    :cond_f
    move v7, v0

    goto/16 :goto_1

    :catch_7
    move-exception v0

    :goto_e
    :try_start_18
    const-string/jumbo v2, "FetcherExecutor"

    const-string/jumbo v3, "fetch loop fatal error"

    invoke-static {v2, v3, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_1

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_2

    if-nez v1, :cond_2

    iget-object v0, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/b;->a()V

    goto/16 :goto_4

    :catchall_1
    move-exception v0

    :goto_f
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v2

    if-nez v2, :cond_10

    if-nez v1, :cond_10

    iget-object v1, v8, Lru/mail/libverify/fetcher/c;->b:Lru/mail/libverify/fetcher/b;

    invoke-interface {v1}, Lru/mail/libverify/fetcher/b;->a()V

    :cond_10
    throw v0

    :catchall_2
    move-exception v0

    move v1, v2

    goto :goto_f

    :catch_8
    move-exception v0

    move v1, v2

    goto :goto_e

    :catch_9
    move-exception v0

    move v1, v2

    goto :goto_d

    :catchall_3
    move-exception v0

    goto :goto_c

    :catchall_4
    move-exception v0

    move-object v3, v4

    goto :goto_c

    :catch_a
    move-exception v0

    goto :goto_b

    :catch_b
    move-exception v0

    goto :goto_a

    :catch_c
    move-exception v0

    move-object v3, v5

    goto :goto_a

    :catch_d
    move-exception v0

    goto/16 :goto_a

    :catch_e
    move-exception v0

    goto/16 :goto_9

    :catch_f
    move-exception v0

    goto/16 :goto_8

    :catch_10
    move-exception v0

    move-object v3, v0

    move-object v4, v5

    move-object v6, v5

    goto/16 :goto_2

    :cond_11
    move v0, v1

    goto/16 :goto_3

    :cond_12
    move v0, v2

    goto/16 :goto_3
.end method
