.class final Lru/mail/libverify/api/ad$f;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/api/v;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/ad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "f"
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/ad;

.field private b:Lru/mail/libverify/sms/k;

.field private c:Lru/mail/libverify/sms/g;

.field private d:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lru/mail/libverify/api/ad;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lru/mail/libverify/api/ad;B)V
    .locals 0

    invoke-direct {p0, p1}, Lru/mail/libverify/api/ad$f;-><init>(Lru/mail/libverify/api/ad;)V

    return-void
.end method


# virtual methods
.method public final a()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    iget-object v0, v0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    return-object v0
.end method

.method public final a(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V
    .locals 10
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v0

    invoke-interface {v0, p1}, Lru/mail/libverify/api/w;->c(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->K()Lru/mail/libverify/storage/n;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/n;->backgroundVerify()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v0

    sget v1, Lru/mail/libverify/api/w$a;->b:I

    invoke-interface {v0, p1, v1}, Lru/mail/libverify/api/w;->a(Ljava/lang/String;I)Lru/mail/libverify/api/ae;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-interface {v1}, Lru/mail/libverify/api/ae;->i()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->completedSuccessfully()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v0

    invoke-interface {v0, p1}, Lru/mail/libverify/api/w;->d(Ljava/lang/String;)Lru/mail/libverify/api/ae;

    invoke-interface {v1}, Lru/mail/libverify/api/ae;->b()V

    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v0

    if-eqz v1, :cond_0

    iget-object v0, v0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v3, Lru/mail/libverify/statistics/a;->Verification_Completed_Background:Lru/mail/libverify/statistics/a;

    new-instance v4, Lru/mail/libverify/statistics/b$a;

    invoke-direct {v4, v7}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v5, "ServiceName"

    invoke-interface {v1}, Lru/mail/libverify/api/ae;->k()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v4

    const-string/jumbo v5, "VerificationSource"

    invoke-interface {v1}, Lru/mail/libverify/api/ae;->i()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v6

    invoke-virtual {v6}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getSource()Lru/mail/libverify/api/VerificationApi$VerificationSource;

    move-result-object v6

    invoke-virtual {v6}, Lru/mail/libverify/api/VerificationApi$VerificationSource;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v4

    iget-object v4, v4, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v0, v3, v4}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V

    goto :goto_0

    :cond_0
    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "temporary session %s state has been removed after completion (%s)"

    new-array v2, v9, [Ljava/lang/Object;

    aput-object p1, v2, v7

    aput-object p2, v2, v8

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    return-void

    :cond_2
    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "session %s state changed to %s"

    new-array v2, v9, [Ljava/lang/Object;

    aput-object p1, v2, v7

    aput-object p2, v2, v8

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    monitor-enter v1

    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v2}, Lru/mail/libverify/api/ad;->v(Lru/mail/libverify/api/ad;)Ljava/util/HashSet;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;

    invoke-interface {v0, p1, p2}, Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;->onStateChanged(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    goto :goto_1

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
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

    const-string/jumbo v1, "session received server failure in api %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lru/mail/libverify/requests/e;->l()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, p2, v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0, p1, p2}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Lru/mail/libverify/requests/e;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)V
    .locals 5
    .param p1    # Lru/mail/libverify/requests/response/ClientApiResponseBase;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "session received server error in api %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->getOwner()Lru/mail/libverify/requests/e;

    move-result-object v4

    invoke-virtual {v4}, Lru/mail/libverify/requests/e;->l()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v0

    invoke-virtual {v0, p1}, Lru/mail/libverify/statistics/b;->a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)V

    return-void
.end method

.method public final a(Lru/mail/libverify/requests/response/FetcherInfo;)V
    .locals 1
    .param p1    # Lru/mail/libverify/requests/response/FetcherInfo;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->f(Lru/mail/libverify/api/ad;)Lru/mail/libverify/fetcher/d;

    move-result-object v0

    invoke-interface {v0, p1}, Lru/mail/libverify/fetcher/d;->a(Lru/mail/libverify/requests/response/FetcherInfo;)V

    return-void
.end method

.method public final a(Ljava/lang/String;)Z
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v4, 0x2

    const/4 v2, 0x1

    const/4 v1, 0x0

    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->d:Ljava/util/HashMap;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/api/ad$f;->d:Ljava/util/HashMap;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->d:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_0
    return v0

    :cond_1
    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v3, "check phone is able to intercept calls"

    invoke-static {v0, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->d()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v3, "android.permission.READ_PHONE_STATE"

    invoke-static {v0, v3}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v3, "can\'t intercept calls to %s (%s)"

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v1

    const-string/jumbo v5, "no permission"

    aput-object v5, v4, v2

    invoke-static {v0, v3, v4}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    move v0, v1

    :goto_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$f;->d:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->p()Lru/mail/libverify/accounts/d;

    move-result-object v0

    invoke-virtual {v0}, Lru/mail/libverify/accounts/d;->m()Z

    move-result v0

    if-nez v0, :cond_3

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v3, "can\'t intercept calls to %s (%s)"

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v1

    const-string/jumbo v5, "no ready sim"

    aput-object v5, v4, v2

    invoke-static {v0, v3, v4}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    move v0, v1

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->p()Lru/mail/libverify/accounts/d;

    move-result-object v0

    invoke-virtual {v0, p1}, Lru/mail/libverify/accounts/d;->a(Ljava/lang/String;)I

    move-result v0

    sget v3, Lru/mail/libverify/accounts/d$a;->c:I

    if-ne v0, v3, :cond_4

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v3, "can\'t intercept calls to %s (%s)"

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v1

    const-string/jumbo v5, "no matched sim"

    aput-object v5, v4, v2

    invoke-static {v0, v3, v4}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    move v0, v1

    goto :goto_1

    :cond_4
    move v0, v2

    goto :goto_1
.end method

.method public final b()Lru/mail/libverify/sms/k;
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->b:Lru/mail/libverify/sms/k;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/sms/m;

    new-instance v1, Lru/mail/libverify/api/ad$f$1;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$f$1;-><init>(Lru/mail/libverify/api/ad$f;)V

    invoke-direct {v0, v1}, Lru/mail/libverify/sms/m;-><init>(Lru/mail/libverify/sms/l;)V

    iput-object v0, p0, Lru/mail/libverify/api/ad$f;->b:Lru/mail/libverify/sms/k;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->b:Lru/mail/libverify/sms/k;

    return-object v0
.end method

.method public final c()Lru/mail/libverify/sms/g;
    .locals 4

    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->c:Lru/mail/libverify/sms/g;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/sms/h;

    iget-object v1, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v1

    invoke-interface {v1}, Lru/mail/libverify/storage/l;->d()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    iget-object v2, v2, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    iget-object v3, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v3}, Lru/mail/libverify/api/ad;->l(Lru/mail/libverify/api/ad;)Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lru/mail/libverify/sms/h;-><init>(Landroid/content/Context;Landroid/os/Handler;Ljava/util/concurrent/ExecutorService;)V

    iput-object v0, p0, Lru/mail/libverify/api/ad$f;->c:Lru/mail/libverify/sms/g;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->c:Lru/mail/libverify/sms/g;

    return-object v0
.end method

.method public final d()Lru/mail/libverify/storage/o;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->j(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/o;

    move-result-object v0

    return-object v0
.end method

.method public final e()Ljava/util/concurrent/ExecutorService;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->l(Lru/mail/libverify/api/ad;)Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v0

    return-object v0
.end method
