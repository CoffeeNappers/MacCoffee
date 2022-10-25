.class public final Lru/mail/libverify/requests/c;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/requests/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/requests/c$a;
    }
.end annotation


# instance fields
.field final a:Lru/mail/libverify/requests/a;

.field private b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lru/mail/libverify/requests/c$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lru/mail/libverify/requests/a;)V
    .locals 0
    .param p1    # Lru/mail/libverify/requests/a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lru/mail/libverify/requests/c;->a:Lru/mail/libverify/requests/a;

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/requests/c;Ljava/lang/Throwable;Lru/mail/libverify/requests/c$a;)V
    .locals 5

    const-string/jumbo v0, "ActionExecutor"

    const-string/jumbo v1, "Action %s failed"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p2, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, p1, v1, v2}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0, p2}, Lru/mail/libverify/requests/c;->a(Lru/mail/libverify/requests/c$a;)V

    return-void
.end method

.method private b(Lru/mail/libverify/requests/c$a;)Z
    .locals 6
    .param p1    # Lru/mail/libverify/requests/c$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x1

    const/4 v0, 0x0

    iget-object v2, p0, Lru/mail/libverify/requests/c;->a:Lru/mail/libverify/requests/a;

    invoke-interface {v2}, Lru/mail/libverify/requests/a;->a()Lru/mail/libverify/storage/k;

    move-result-object v2

    invoke-interface {v2}, Lru/mail/libverify/storage/k;->j()Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "ActionExecutor"

    const-string/jumbo v3, "Action %s start delayed"

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p1, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v0

    invoke-static {v2, v3, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return v0

    :cond_0
    iget-object v2, p1, Lru/mail/libverify/requests/c$a;->a:Lru/mail/libverify/requests/ActionDescriptor;

    iget v3, v2, Lru/mail/libverify/requests/ActionDescriptor;->attemptCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Lru/mail/libverify/requests/ActionDescriptor;->attemptCount:I

    iget-object v2, p1, Lru/mail/libverify/requests/c$a;->a:Lru/mail/libverify/requests/ActionDescriptor;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, v2, Lru/mail/libverify/requests/ActionDescriptor;->lastAttemptTimestamp:J

    iget-object v2, p1, Lru/mail/libverify/requests/c$a;->b:Lru/mail/libverify/requests/e;

    iget-object v3, p0, Lru/mail/libverify/requests/c;->a:Lru/mail/libverify/requests/a;

    invoke-interface {v3}, Lru/mail/libverify/requests/a;->b()Ljava/util/concurrent/ExecutorService;

    move-result-object v3

    new-instance v4, Lru/mail/libverify/requests/c$3;

    invoke-direct {v4, p0, p1}, Lru/mail/libverify/requests/c$3;-><init>(Lru/mail/libverify/requests/c;Lru/mail/libverify/requests/c$a;)V

    invoke-virtual {v2, v3, v4}, Lru/mail/libverify/requests/e;->a(Ljava/util/concurrent/ExecutorService;Lru/mail/libverify/requests/i$b;)Ljava/util/concurrent/Future;

    move-result-object v2

    iput-object v2, p1, Lru/mail/libverify/requests/c$a;->d:Ljava/util/concurrent/Future;

    const-string/jumbo v2, "ActionExecutor"

    const-string/jumbo v3, "Action id %s url %s started (attemptCount %d)"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p1, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v0

    iget-object v0, p1, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    aput-object v0, v4, v1

    const/4 v0, 0x2

    iget-object v5, p1, Lru/mail/libverify/requests/c$a;->a:Lru/mail/libverify/requests/ActionDescriptor;

    iget v5, v5, Lru/mail/libverify/requests/ActionDescriptor;->attemptCount:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v0

    invoke-static {v2, v3, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    move v0, v1

    goto :goto_0
.end method

.method private d()V
    .locals 4

    iget-object v0, p0, Lru/mail/libverify/requests/c;->b:Ljava/util/Map;

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/requests/c;->b:Ljava/util/Map;

    iget-object v0, p0, Lru/mail/libverify/requests/c;->a:Lru/mail/libverify/requests/a;

    invoke-interface {v0}, Lru/mail/libverify/requests/a;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "serializable_actions_data"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    :try_start_0
    const-class v1, Lru/mail/libverify/requests/ActionDescriptor;

    invoke-static {v0, v1}, Lru/mail/libverify/utils/json/a;->b(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/ActionDescriptor;

    new-instance v2, Lru/mail/libverify/requests/c$a;

    iget-object v3, p0, Lru/mail/libverify/requests/c;->a:Lru/mail/libverify/requests/a;

    invoke-direct {v2, v3, v0}, Lru/mail/libverify/requests/c$a;-><init>(Lru/mail/libverify/requests/a;Lru/mail/libverify/requests/ActionDescriptor;)V

    iget-object v0, p0, Lru/mail/libverify/requests/c;->b:Ljava/util/Map;

    iget-object v3, v2, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lru/mail/libverify/requests/c;->a:Lru/mail/libverify/requests/a;

    iget-object v2, v2, Lru/mail/libverify/requests/c$a;->b:Lru/mail/libverify/requests/e;

    invoke-interface {v0, v2}, Lru/mail/libverify/requests/a;->a(Lru/mail/libverify/requests/e;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string/jumbo v1, "ActionExecutor"

    const-string/jumbo v2, "Failed to read saved items"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p0}, Lru/mail/libverify/requests/c;->b()V

    goto :goto_0
.end method


# virtual methods
.method public final a()V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lru/mail/libverify/requests/c;->a(Z)V

    return-void
.end method

.method final a(Lru/mail/libverify/requests/c$a;)V
    .locals 2
    .param p1    # Lru/mail/libverify/requests/c$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/requests/c;->b:Ljava/util/Map;

    iget-object v1, p1, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lru/mail/libverify/requests/c;->a:Lru/mail/libverify/requests/a;

    iget-object v1, p1, Lru/mail/libverify/requests/c$a;->b:Lru/mail/libverify/requests/e;

    invoke-interface {v0, v1}, Lru/mail/libverify/requests/a;->b(Lru/mail/libverify/requests/e;)V

    invoke-virtual {p0}, Lru/mail/libverify/requests/c;->c()V

    return-void
.end method

.method public final a(Lru/mail/libverify/requests/e;)V
    .locals 5
    .param p1    # Lru/mail/libverify/requests/e;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Lru/mail/libverify/requests/c;->d()V

    new-instance v0, Lru/mail/libverify/requests/c$a;

    invoke-direct {v0, p1}, Lru/mail/libverify/requests/c$a;-><init>(Lru/mail/libverify/requests/e;)V

    iget-object v1, p0, Lru/mail/libverify/requests/c;->b:Ljava/util/Map;

    iget-object v2, v0, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lru/mail/libverify/requests/c;->b:Ljava/util/Map;

    iget-object v2, v0, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lru/mail/libverify/requests/c;->a:Lru/mail/libverify/requests/a;

    iget-object v2, v0, Lru/mail/libverify/requests/c$a;->b:Lru/mail/libverify/requests/e;

    invoke-interface {v1, v2}, Lru/mail/libverify/requests/a;->a(Lru/mail/libverify/requests/e;)V

    invoke-virtual {p0}, Lru/mail/libverify/requests/c;->c()V

    invoke-direct {p0, v0}, Lru/mail/libverify/requests/c;->b(Lru/mail/libverify/requests/c$a;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/requests/c;->a:Lru/mail/libverify/requests/a;

    invoke-interface {v0}, Lru/mail/libverify/requests/a;->c()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/requests/c$1;

    invoke-direct {v1, p0}, Lru/mail/libverify/requests/c$1;-><init>(Lru/mail/libverify/requests/c;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string/jumbo v1, "ActionExecutor"

    const-string/jumbo v2, "request %s dropped as a duplicate"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v0, v0, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v4

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method final a(Z)V
    .locals 3

    invoke-direct {p0}, Lru/mail/libverify/requests/c;->d()V

    new-instance v1, Ljava/util/ArrayList;

    iget-object v0, p0, Lru/mail/libverify/requests/c;->b:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const/4 v0, 0x0

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/c$a;

    invoke-virtual {p0, v0, p1}, Lru/mail/libverify/requests/c;->a(Lru/mail/libverify/requests/c$a;Z)Z

    move-result v0

    or-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lru/mail/libverify/requests/c;->c()V

    :cond_1
    return-void
.end method

.method final a(Lru/mail/libverify/requests/c$a;Z)Z
    .locals 8
    .param p1    # Lru/mail/libverify/requests/c$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-object v2, p1, Lru/mail/libverify/requests/c$a;->a:Lru/mail/libverify/requests/ActionDescriptor;

    iget v2, v2, Lru/mail/libverify/requests/ActionDescriptor;->attemptCount:I

    const/16 v3, 0xa

    if-le v2, v3, :cond_0

    const-string/jumbo v2, "ActionExecutor"

    const-string/jumbo v3, "Action %s dropped by max attempt count"

    new-array v4, v0, [Ljava/lang/Object;

    iget-object v5, p1, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v2, v3, v4}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Lru/mail/libverify/requests/c;->a(Lru/mail/libverify/requests/c$a;)V

    :goto_0
    return v0

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, p1, Lru/mail/libverify/requests/c$a;->a:Lru/mail/libverify/requests/ActionDescriptor;

    iget-wide v4, v4, Lru/mail/libverify/requests/ActionDescriptor;->lastAttemptTimestamp:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gez v4, :cond_1

    const-string/jumbo v2, "ActionExecutor"

    const-string/jumbo v3, "Action %s dropped by wrong timestamp"

    new-array v4, v0, [Ljava/lang/Object;

    iget-object v5, p1, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v2, v3, v4}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Lru/mail/libverify/requests/c;->a(Lru/mail/libverify/requests/c$a;)V

    goto :goto_0

    :cond_1
    iget-object v4, p1, Lru/mail/libverify/requests/c$a;->d:Ljava/util/concurrent/Future;

    if-eqz v4, :cond_2

    if-eqz p2, :cond_3

    const-string/jumbo v4, "ActionExecutor"

    const-string/jumbo v5, "Action %s cancelled"

    new-array v6, v0, [Ljava/lang/Object;

    iget-object v7, p1, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {v4, v5, v6}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v4, p1, Lru/mail/libverify/requests/c$a;->d:Ljava/util/concurrent/Future;

    invoke-interface {v4, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    const/4 v4, 0x0

    iput-object v4, p1, Lru/mail/libverify/requests/c$a;->d:Ljava/util/concurrent/Future;

    iget-object v4, p1, Lru/mail/libverify/requests/c$a;->a:Lru/mail/libverify/requests/ActionDescriptor;

    iput v1, v4, Lru/mail/libverify/requests/ActionDescriptor;->attemptCount:I

    :cond_2
    iget-object v4, p1, Lru/mail/libverify/requests/c$a;->a:Lru/mail/libverify/requests/ActionDescriptor;

    iget v4, v4, Lru/mail/libverify/requests/ActionDescriptor;->attemptCount:I

    mul-int/lit16 v4, v4, 0x1f4

    iget-object v5, p1, Lru/mail/libverify/requests/c$a;->a:Lru/mail/libverify/requests/ActionDescriptor;

    iget v5, v5, Lru/mail/libverify/requests/ActionDescriptor;->attemptCount:I

    mul-int/2addr v4, v5

    int-to-long v6, v4

    cmp-long v5, v2, v6

    if-gtz v5, :cond_4

    int-to-long v4, v4

    sub-long v2, v4, v2

    const-string/jumbo v4, "ActionExecutor"

    const-string/jumbo v5, "Action %s will be started after %d ms"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p1, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v0

    invoke-static {v4, v5, v6}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/requests/c;->a:Lru/mail/libverify/requests/a;

    invoke-interface {v0}, Lru/mail/libverify/requests/a;->c()Landroid/os/Handler;

    move-result-object v0

    new-instance v4, Lru/mail/libverify/requests/c$2;

    invoke-direct {v4, p0, p1}, Lru/mail/libverify/requests/c$2;-><init>(Lru/mail/libverify/requests/c;Lru/mail/libverify/requests/c$a;)V

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    move v0, v1

    goto/16 :goto_0

    :cond_3
    move v0, v1

    goto/16 :goto_0

    :cond_4
    invoke-direct {p0, p1}, Lru/mail/libverify/requests/c;->b(Lru/mail/libverify/requests/c$a;)Z

    move-result v0

    goto/16 :goto_0
.end method

.method public final b()V
    .locals 4

    iget-object v0, p0, Lru/mail/libverify/requests/c;->b:Ljava/util/Map;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/requests/c;->b:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/c$a;

    iget-object v2, v0, Lru/mail/libverify/requests/c$a;->d:Ljava/util/concurrent/Future;

    if-eqz v2, :cond_1

    iget-object v2, v0, Lru/mail/libverify/requests/c$a;->d:Ljava/util/concurrent/Future;

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    const/4 v2, 0x0

    iput-object v2, v0, Lru/mail/libverify/requests/c$a;->d:Ljava/util/concurrent/Future;

    iget-object v2, p0, Lru/mail/libverify/requests/c;->a:Lru/mail/libverify/requests/a;

    iget-object v0, v0, Lru/mail/libverify/requests/c$a;->b:Lru/mail/libverify/requests/e;

    invoke-interface {v2, v0}, Lru/mail/libverify/requests/a;->b(Lru/mail/libverify/requests/e;)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/requests/c;->b:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    invoke-virtual {p0}, Lru/mail/libverify/requests/c;->c()V

    goto :goto_0
.end method

.method final c()V
    .locals 5

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lru/mail/libverify/requests/c;->b:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/c$a;

    iget-object v3, v0, Lru/mail/libverify/requests/c$a;->a:Lru/mail/libverify/requests/ActionDescriptor;

    iget v3, v3, Lru/mail/libverify/requests/ActionDescriptor;->attemptCount:I

    const/16 v4, 0xa

    if-gt v3, v4, :cond_0

    iget-object v0, v0, Lru/mail/libverify/requests/c$a;->a:Lru/mail/libverify/requests/ActionDescriptor;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/requests/c;->a:Lru/mail/libverify/requests/a;

    invoke-interface {v0}, Lru/mail/libverify/requests/a;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v2, "serializable_actions_data"

    invoke-static {v1}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V
    :try_end_0
    .catch Lru/mail/libverify/utils/json/JsonParseException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "ActionExecutor"

    const-string/jumbo v2, "failed to save actions"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
