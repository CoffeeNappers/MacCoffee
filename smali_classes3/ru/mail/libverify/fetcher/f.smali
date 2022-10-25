.class public final Lru/mail/libverify/fetcher/f;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/fetcher/d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/fetcher/f$a;,
        Lru/mail/libverify/fetcher/f$b;
    }
.end annotation


# instance fields
.field final a:Lru/mail/libverify/storage/k;

.field final b:Lru/mail/libverify/fetcher/e;

.field c:Lru/mail/libverify/fetcher/f$b;

.field d:Lru/mail/libverify/requests/response/FetcherInfo;

.field private final e:Lru/mail/libverify/fetcher/a;


# direct methods
.method public constructor <init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/fetcher/e;)V
    .locals 3
    .param p1    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/fetcher/e;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lru/mail/libverify/fetcher/f$b;->NOT_ACTIVE:Lru/mail/libverify/fetcher/f$b;

    iput-object v0, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    iput-object p1, p0, Lru/mail/libverify/fetcher/f;->a:Lru/mail/libverify/storage/k;

    iput-object p2, p0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    new-instance v0, Lru/mail/libverify/fetcher/c;

    new-instance v1, Lru/mail/libverify/fetcher/f$a;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lru/mail/libverify/fetcher/f$a;-><init>(Lru/mail/libverify/fetcher/f;B)V

    invoke-direct {v0, p1, v1}, Lru/mail/libverify/fetcher/c;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/fetcher/b;)V

    iput-object v0, p0, Lru/mail/libverify/fetcher/f;->e:Lru/mail/libverify/fetcher/a;

    return-void
.end method

.method private declared-synchronized a(Lru/mail/libverify/fetcher/f$b;Ljava/lang/String;Z)Z
    .locals 8
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    const/4 v1, 0x0

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lru/mail/libverify/fetcher/f;->f()V

    iget-object v2, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    iget-object v3, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    sget-object v4, Lru/mail/libverify/fetcher/f$2;->a:[I

    invoke-virtual {p1}, Lru/mail/libverify/fetcher/f$b;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :pswitch_0
    :try_start_1
    sget-object v4, Lru/mail/libverify/fetcher/f$b;->NOT_ACTIVE:Lru/mail/libverify/fetcher/f$b;

    iput-object v4, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    iget-object v4, p0, Lru/mail/libverify/fetcher/f;->e:Lru/mail/libverify/fetcher/a;

    invoke-interface {v4}, Lru/mail/libverify/fetcher/a;->b()V

    sget-object v4, Lru/mail/libverify/fetcher/f$b;->NOT_ACTIVE:Lru/mail/libverify/fetcher/f$b;

    if-eq v3, v4, :cond_2

    :cond_0
    :goto_0
    const-string/jumbo v1, "FetcherManager"

    const-string/jumbo v3, "fetcher state %s -> %s, publish %s"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const/4 v5, 0x1

    iget-object v6, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v1, v3, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    if-eq v2, v1, :cond_1

    iget-object v1, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-direct {p0, v1}, Lru/mail/libverify/fetcher/f;->c(Lru/mail/libverify/requests/response/FetcherInfo;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    monitor-exit p0

    return v0

    :cond_2
    move v0, v1

    goto :goto_0

    :pswitch_1
    :try_start_2
    invoke-virtual {p0}, Lru/mail/libverify/fetcher/f;->e()Z

    move-result v4

    if-eqz v4, :cond_4

    sget-object v0, Lru/mail/libverify/fetcher/f$b;->SUSPENDED_OTHER_SERVICE:Lru/mail/libverify/fetcher/f$b;

    if-ne v3, v0, :cond_3

    sget-object v0, Lru/mail/libverify/fetcher/f$b;->SUSPENDED_OTHER_SERVICE:Lru/mail/libverify/fetcher/f$b;

    iput-object v0, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->e:Lru/mail/libverify/fetcher/a;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/a;->b()V

    move v0, v1

    goto :goto_0

    :cond_3
    sget-object v0, Lru/mail/libverify/fetcher/f$b;->SUSPENDED_TEMPORARY:Lru/mail/libverify/fetcher/f$b;

    iput-object v0, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->e:Lru/mail/libverify/fetcher/a;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/a;->b()V

    move v0, v1

    goto :goto_0

    :cond_4
    sget-object v4, Lru/mail/libverify/fetcher/f$b;->NOT_ACTIVE:Lru/mail/libverify/fetcher/f$b;

    iput-object v4, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    iget-object v4, p0, Lru/mail/libverify/fetcher/f;->e:Lru/mail/libverify/fetcher/a;

    invoke-interface {v4}, Lru/mail/libverify/fetcher/a;->b()V

    sget-object v4, Lru/mail/libverify/fetcher/f$b;->NOT_ACTIVE:Lru/mail/libverify/fetcher/f$b;

    if-ne v3, v4, :cond_0

    move v0, v1

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0}, Lru/mail/libverify/fetcher/f;->e()Z

    move-result v4

    if-eqz v4, :cond_6

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v0, p2}, Lru/mail/libverify/storage/k;->b(Ljava/lang/String;)Z

    move-result v0

    const-string/jumbo v3, "FetcherManager"

    const-string/jumbo v4, "this is the last installed libverify instance %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v0, :cond_5

    sget-object v0, Lru/mail/libverify/fetcher/f$b;->NOT_ACTIVE:Lru/mail/libverify/fetcher/f$b;

    iput-object v0, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->e:Lru/mail/libverify/fetcher/a;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/a;->c()V

    move v0, v1

    goto/16 :goto_0

    :cond_5
    sget-object v0, Lru/mail/libverify/fetcher/f$b;->SUSPENDED_OTHER_SERVICE:Lru/mail/libverify/fetcher/f$b;

    iput-object v0, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->e:Lru/mail/libverify/fetcher/a;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/a;->b()V

    move v0, v1

    goto/16 :goto_0

    :cond_6
    sget-object v4, Lru/mail/libverify/fetcher/f$b;->NOT_ACTIVE:Lru/mail/libverify/fetcher/f$b;

    iput-object v4, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    iget-object v4, p0, Lru/mail/libverify/fetcher/f;->e:Lru/mail/libverify/fetcher/a;

    invoke-interface {v4}, Lru/mail/libverify/fetcher/a;->b()V

    sget-object v4, Lru/mail/libverify/fetcher/f$b;->NOT_ACTIVE:Lru/mail/libverify/fetcher/f$b;

    if-ne v3, v4, :cond_0

    move v0, v1

    goto/16 :goto_0

    :pswitch_3
    invoke-virtual {p0}, Lru/mail/libverify/fetcher/f;->e()Z

    move-result v4

    if-nez v4, :cond_7

    sget-object v4, Lru/mail/libverify/fetcher/f$b;->NOT_ACTIVE:Lru/mail/libverify/fetcher/f$b;

    iput-object v4, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    iget-object v4, p0, Lru/mail/libverify/fetcher/f;->e:Lru/mail/libverify/fetcher/a;

    invoke-interface {v4}, Lru/mail/libverify/fetcher/a;->b()V

    sget-object v4, Lru/mail/libverify/fetcher/f$b;->NOT_ACTIVE:Lru/mail/libverify/fetcher/f$b;

    if-ne v3, v4, :cond_0

    move v0, v1

    goto/16 :goto_0

    :cond_7
    sget-object v4, Lru/mail/libverify/fetcher/f$b;->SUSPENDED_TEMPORARY:Lru/mail/libverify/fetcher/f$b;

    if-ne v3, v4, :cond_8

    sget-object v0, Lru/mail/libverify/fetcher/f$b;->ACTIVE:Lru/mail/libverify/fetcher/f$b;

    iput-object v0, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->e:Lru/mail/libverify/fetcher/a;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/a;->a()V

    move v0, v1

    goto/16 :goto_0

    :cond_8
    sget-object v4, Lru/mail/libverify/fetcher/f$b;->SUSPENDED_OTHER_SERVICE:Lru/mail/libverify/fetcher/f$b;

    if-ne v3, v4, :cond_a

    if-nez p3, :cond_a

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_9

    sget-object v0, Lru/mail/libverify/fetcher/f$b;->SUSPENDED_OTHER_SERVICE:Lru/mail/libverify/fetcher/f$b;

    iput-object v0, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->e:Lru/mail/libverify/fetcher/a;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/a;->b()V

    move v0, v1

    goto/16 :goto_0

    :cond_9
    sget-object v1, Lru/mail/libverify/fetcher/f$b;->ACTIVE:Lru/mail/libverify/fetcher/f$b;

    iput-object v1, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    iget-object v1, p0, Lru/mail/libverify/fetcher/f;->e:Lru/mail/libverify/fetcher/a;

    invoke-interface {v1}, Lru/mail/libverify/fetcher/a;->a()V

    goto/16 :goto_0

    :cond_a
    sget-object v4, Lru/mail/libverify/fetcher/f$b;->ACTIVE:Lru/mail/libverify/fetcher/f$b;

    iput-object v4, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    iget-object v4, p0, Lru/mail/libverify/fetcher/f;->e:Lru/mail/libverify/fetcher/a;

    invoke-interface {v4}, Lru/mail/libverify/fetcher/a;->a()V

    sget-object v4, Lru/mail/libverify/fetcher/f$b;->ACTIVE:Lru/mail/libverify/fetcher/f$b;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-ne v3, v4, :cond_0

    if-nez p3, :cond_0

    move v0, v1

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private c(Lru/mail/libverify/requests/response/FetcherInfo;)V
    .locals 3
    .param p1    # Lru/mail/libverify/requests/response/FetcherInfo;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    if-nez p1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/e;->a()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "fetcher_manager_info"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "fetcher_state"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    :goto_0
    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/e;->a()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "fetcher_manager_info"

    invoke-static {p1}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "fetcher_state"

    iget-object v2, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    invoke-virtual {v2}, Lru/mail/libverify/fetcher/f$b;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V
    :try_end_0
    .catch Lru/mail/libverify/utils/json/JsonParseException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "FetcherManager"

    const-string/jumbo v2, "failed to save fetcher info"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public final a()V
    .locals 3

    const/4 v2, 0x0

    const-string/jumbo v0, "FetcherManager"

    const-string/jumbo v1, "reset and stop fetcher"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lru/mail/libverify/fetcher/f;->b(Lru/mail/libverify/requests/response/FetcherInfo;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v2, v0}, Lru/mail/libverify/fetcher/f;->a(Ljava/lang/String;Z)V

    return-void
.end method

.method final declared-synchronized a(Ljava/lang/Long;)V
    .locals 4
    .param p1    # Ljava/lang/Long;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    monitor-enter p0

    if-nez p1, :cond_0

    :goto_0
    monitor-exit p0

    return-void

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lru/mail/libverify/fetcher/f;->f()V

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    if-nez v0, :cond_1

    const-string/jumbo v0, "FetcherManager"

    const-string/jumbo v1, "failed to update last modified time (there is no saved info)"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    :try_start_1
    const-string/jumbo v0, "FetcherManager"

    const-string/jumbo v1, "update fetcher info last modified %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-virtual {v0, p1}, Lru/mail/libverify/requests/response/FetcherInfo;->setLastModified(Ljava/lang/Long;)V

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-direct {p0, v0}, Lru/mail/libverify/fetcher/f;->c(Lru/mail/libverify/requests/response/FetcherInfo;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public final a(Ljava/lang/String;)V
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v6, 0x1

    const/4 v5, 0x0

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "FetcherManager"

    const-string/jumbo v1, "package name %s matches with local"

    new-array v2, v6, [Ljava/lang/Object;

    aput-object p1, v2, v5

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_0
    const-string/jumbo v0, "FetcherManager"

    const-string/jumbo v1, "remote fetcher from %s started"

    new-array v2, v6, [Ljava/lang/Object;

    aput-object p1, v2, v5

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v0, Lru/mail/libverify/fetcher/f$b;->SUSPENDED_OTHER_SERVICE:Lru/mail/libverify/fetcher/f$b;

    invoke-direct {p0, v0, p1, v5}, Lru/mail/libverify/fetcher/f;->a(Lru/mail/libverify/fetcher/f$b;Ljava/lang/String;Z)Z

    move-result v0

    const-string/jumbo v1, "FetcherManager"

    const-string/jumbo v2, "activate fetcher, publish = %s, package = %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v5

    aput-object p1, v3, v6

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v1, v0}, Lru/mail/libverify/fetcher/e;->a(Z)V

    goto :goto_0
.end method

.method final a(Ljava/lang/String;Z)V
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    sget-object v0, Lru/mail/libverify/fetcher/f$b;->ACTIVE:Lru/mail/libverify/fetcher/f$b;

    invoke-direct {p0, v0, p1, p2}, Lru/mail/libverify/fetcher/f;->a(Lru/mail/libverify/fetcher/f$b;Ljava/lang/String;Z)Z

    move-result v0

    const-string/jumbo v1, "FetcherManager"

    const-string/jumbo v2, "activate fetcher, publish = %s, package = %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p1, v3, v4

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    sget-object v2, Lru/mail/libverify/fetcher/f$b;->ACTIVE:Lru/mail/libverify/fetcher/f$b;

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v1, v0}, Lru/mail/libverify/fetcher/e;->b(Z)V

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v1, v0}, Lru/mail/libverify/fetcher/e;->a(Z)V

    goto :goto_0
.end method

.method public final declared-synchronized a(Lru/mail/libverify/requests/response/FetcherInfo;)V
    .locals 2
    .param p1    # Lru/mail/libverify/requests/response/FetcherInfo;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    monitor-enter p0

    if-nez p1, :cond_0

    :try_start_0
    const-string/jumbo v0, "FetcherManager"

    const-string/jumbo v1, "empty fetcher info has been skipped"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/e;->d()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/fetcher/f$1;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/fetcher/f$1;-><init>(Lru/mail/libverify/fetcher/f;Lru/mail/libverify/requests/response/FetcherInfo;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(Lru/mail/libverify/fetcher/f$b;)Z
    .locals 2

    monitor-enter p0

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_0
    invoke-direct {p0, p1, v0, v1}, Lru/mail/libverify/fetcher/f;->a(Lru/mail/libverify/fetcher/f$b;Ljava/lang/String;Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized b()V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string/jumbo v0, "FetcherManager"

    const-string/jumbo v1, "run fetcher with check"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lru/mail/libverify/fetcher/f;->f()V

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-virtual {p0, v0}, Lru/mail/libverify/fetcher/f;->b(Lru/mail/libverify/requests/response/FetcherInfo;)V

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lru/mail/libverify/fetcher/f;->a(Ljava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final b(Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "FetcherManager"

    const-string/jumbo v1, "package name %s matches with local"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_0
    const-string/jumbo v0, "FetcherManager"

    const-string/jumbo v1, "remote fetcher from %s stopped"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0, p1, v3}, Lru/mail/libverify/fetcher/f;->a(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method final declared-synchronized b(Lru/mail/libverify/requests/response/FetcherInfo;)V
    .locals 6
    .param p1    # Lru/mail/libverify/requests/response/FetcherInfo;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lru/mail/libverify/fetcher/f;->f()V

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    iget-object v1, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    if-eqz p1, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/FetcherInfo;->getLastModified()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/FetcherInfo;->getLastModified()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v1}, Lru/mail/libverify/requests/response/FetcherInfo;->setLastModified(Ljava/lang/Long;)V

    :cond_0
    iput-object p1, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    iget-object v1, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-direct {p0, v1}, Lru/mail/libverify/fetcher/f;->c(Lru/mail/libverify/requests/response/FetcherInfo;)V

    const-string/jumbo v1, "FetcherManager"

    const-string/jumbo v2, "fetcher info updated %s -> %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    iget-object v4, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    aput-object v4, v3, v0

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final c()V
    .locals 2

    const-string/jumbo v0, "FetcherManager"

    const-string/jumbo v1, "pause fetcher"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    sget-object v1, Lru/mail/libverify/fetcher/f$b;->SUSPENDED_TEMPORARY:Lru/mail/libverify/fetcher/f$b;

    invoke-virtual {p0, v1}, Lru/mail/libverify/fetcher/f;->a(Lru/mail/libverify/fetcher/f$b;)Z

    move-result v1

    invoke-interface {v0, v1}, Lru/mail/libverify/fetcher/e;->a(Z)V

    return-void
.end method

.method public final declared-synchronized d()V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string/jumbo v0, "FetcherManager"

    const-string/jumbo v1, "check and activate fetcher"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lru/mail/libverify/fetcher/f;->a(Ljava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized e()Z
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lru/mail/libverify/fetcher/f;->f()V

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetcherInfo;->getStatus()Lru/mail/libverify/requests/response/FetcherInfo$Status;

    move-result-object v0

    sget-object v1, Lru/mail/libverify/requests/response/FetcherInfo$Status;->ENABLED:Lru/mail/libverify/requests/response/FetcherInfo$Status;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetcherInfo;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/FetcherInfo;->getTimeout()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final f()V
    .locals 5

    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v0}, Lru/mail/libverify/fetcher/e;->a()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "fetcher_manager_info"

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v1}, Lru/mail/libverify/fetcher/e;->a()Lru/mail/libverify/storage/o;

    move-result-object v1

    const-string/jumbo v2, "fetcher_state"

    invoke-interface {v1, v2}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-static {v1}, Lru/mail/libverify/fetcher/f$b;->valueOf(Ljava/lang/String;)Lru/mail/libverify/fetcher/f$b;

    move-result-object v1

    iput-object v1, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    :cond_2
    :try_start_0
    const-class v1, Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-static {v0, v1}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/response/FetcherInfo;

    iput-object v0, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    const-string/jumbo v0, "FetcherManager"

    const-string/jumbo v1, "fetcher info loaded %s state %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/fetcher/f;->d:Lru/mail/libverify/requests/response/FetcherInfo;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lru/mail/libverify/utils/json/JsonParseException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lru/mail/libverify/fetcher/f$b;->NOT_ACTIVE:Lru/mail/libverify/fetcher/f$b;

    iput-object v1, p0, Lru/mail/libverify/fetcher/f;->c:Lru/mail/libverify/fetcher/f$b;

    iget-object v1, p0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    invoke-interface {v1}, Lru/mail/libverify/fetcher/e;->a()Lru/mail/libverify/storage/o;

    move-result-object v1

    const-string/jumbo v2, "fetcher_manager_info"

    invoke-interface {v1, v2}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v1

    const-string/jumbo v2, "fetcher_state"

    invoke-interface {v1, v2}, Lru/mail/libverify/storage/o;->d(Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v1

    invoke-interface {v1}, Lru/mail/libverify/storage/o;->a()V

    const-string/jumbo v1, "FetcherManager"

    const-string/jumbo v2, "failed to load fetcher state"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
