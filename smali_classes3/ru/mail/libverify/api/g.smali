.class final Lru/mail/libverify/api/g;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/api/e;


# instance fields
.field final a:Lru/mail/libverify/storage/k;

.field final b:Lru/mail/libverify/api/f;

.field c:Ljava/util/concurrent/Future;

.field d:Ljava/lang/String;


# direct methods
.method constructor <init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/api/f;)V
    .locals 0
    .param p1    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lru/mail/libverify/api/g;->a:Lru/mail/libverify/storage/k;

    iput-object p2, p0, Lru/mail/libverify/api/g;->b:Lru/mail/libverify/api/f;

    return-void
.end method

.method private d()V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lru/mail/libverify/api/g;->c:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/g;->c:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    iput-object v2, p0, Lru/mail/libverify/api/g;->c:Ljava/util/concurrent/Future;

    :cond_0
    iput-object v2, p0, Lru/mail/libverify/api/g;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    iget-object v0, p0, Lru/mail/libverify/api/g;->b:Lru/mail/libverify/api/f;

    invoke-interface {v0}, Lru/mail/libverify/api/f;->b()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "app_check_started"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "ApplicationChecker"

    const-string/jumbo v1, "no pending job"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/g;->d:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v0, p0, Lru/mail/libverify/api/g;->b:Lru/mail/libverify/api/f;

    invoke-interface {v0}, Lru/mail/libverify/api/f;->a()V

    const-string/jumbo v0, "ApplicationChecker"

    const-string/jumbo v1, "request server for an application check id"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lru/mail/libverify/api/g;->c:Ljava/util/concurrent/Future;

    if-nez v1, :cond_0

    iget-object v1, p0, Lru/mail/libverify/api/g;->b:Lru/mail/libverify/api/f;

    invoke-interface {v1}, Lru/mail/libverify/api/f;->c()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lru/mail/libverify/api/g$1;

    invoke-direct {v2, p0, v0}, Lru/mail/libverify/api/g$1;-><init>(Lru/mail/libverify/api/g;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/api/g;->c:Ljava/util/concurrent/Future;

    goto :goto_0
.end method

.method public final a(Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "ApplicationChecker"

    const-string/jumbo v1, "application check server id %s received"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iput-object p1, p0, Lru/mail/libverify/api/g;->d:Ljava/lang/String;

    invoke-virtual {p0}, Lru/mail/libverify/api/g;->a()V

    return-void
.end method

.method public final b()V
    .locals 4

    iget-object v0, p0, Lru/mail/libverify/api/g;->b:Lru/mail/libverify/api/f;

    invoke-interface {v0}, Lru/mail/libverify/api/f;->b()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "app_check_completed"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    sub-long v0, v2, v0

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    const-wide/32 v2, 0x5265c00

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    const-string/jumbo v0, "ApplicationChecker"

    const-string/jumbo v1, "application check blocked by timeout"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "ApplicationChecker"

    const-string/jumbo v1, "application check requested"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/g;->b:Lru/mail/libverify/api/f;

    invoke-interface {v0}, Lru/mail/libverify/api/f;->b()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "app_check_started"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    invoke-direct {p0}, Lru/mail/libverify/api/g;->d()V

    invoke-virtual {p0}, Lru/mail/libverify/api/g;->a()V

    goto :goto_1
.end method

.method public final c()V
    .locals 2

    invoke-direct {p0}, Lru/mail/libverify/api/g;->d()V

    iget-object v0, p0, Lru/mail/libverify/api/g;->b:Lru/mail/libverify/api/f;

    invoke-interface {v0}, Lru/mail/libverify/api/f;->b()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "app_check_completed"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "app_check_started"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    return-void
.end method
