.class final Lru/mail/libverify/api/ad$a;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/api/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/ad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/ad;


# direct methods
.method private constructor <init>(Lru/mail/libverify/api/ad;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lru/mail/libverify/api/ad;B)V
    .locals 0

    invoke-direct {p0, p1}, Lru/mail/libverify/api/ad$a;-><init>(Lru/mail/libverify/api/ad;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "account check logic requested sms info"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->K()Lru/mail/libverify/storage/n;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/n;->interceptAlienSms()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->L()Lru/mail/libverify/requests/response/SmsInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->d(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/a;

    move-result-object v1

    invoke-interface {v1, v0}, Lru/mail/libverify/api/a;->a(Lru/mail/libverify/requests/response/SmsInfo;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    iget-object v1, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v1

    invoke-static {v1}, Lru/mail/libverify/requests/o;->b(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;

    move-result-object v1

    invoke-static {v0, v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Lru/mail/libverify/requests/e;)V

    goto :goto_0
.end method

.method public final a(Ljava/lang/String;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "empty alien sms"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->K()Lru/mail/libverify/storage/n;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/n;->interceptAlienSms()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "alien sms interception blocked"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v0

    iget-object v0, v0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v2, Lru/mail/libverify/statistics/a;->Instance_Alien_Sms_Intercepted:Lru/mail/libverify/statistics/a;

    invoke-interface {v0, v2}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    iget-object v1, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v1

    invoke-static {v1, p1}, Lru/mail/libverify/requests/o;->c(Lru/mail/libverify/storage/k;Ljava/lang/String;)Lru/mail/libverify/requests/o;

    move-result-object v1

    invoke-static {v0, v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Lru/mail/libverify/requests/e;)V

    goto :goto_0
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)V
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    const/4 v2, 0x0

    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v3, "account check completed with result %s for %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p3, v4, v2

    aput-object p1, v4, v0

    invoke-static {v1, v3, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    iget-object v3, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    invoke-static {v3}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v3

    invoke-static {v3, p1, p2}, Lru/mail/libverify/requests/o;->a(Lru/mail/libverify/storage/k;Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/requests/o;

    move-result-object v3

    invoke-static {v1, v3}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Lru/mail/libverify/requests/e;)V

    iget-object v1, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v3

    sget-object v1, Lru/mail/libverify/api/VerificationApi$AccountCheckResult;->OK:Lru/mail/libverify/api/VerificationApi$AccountCheckResult;

    if-ne p3, v1, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    move v1, v0

    :goto_0
    iget-object v0, v3, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v4, Lru/mail/libverify/statistics/a;->Check_Account_Completed:Lru/mail/libverify/statistics/a;

    new-instance v5, Lru/mail/libverify/statistics/b$a;

    invoke-direct {v5, v2}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v6, "Result"

    invoke-virtual {p3}, Lru/mail/libverify/api/VerificationApi$AccountCheckResult;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v5

    const-string/jumbo v6, "SmsFound"

    invoke-static {v1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v5

    iget-object v5, v5, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v0, v4, v5}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V

    goto :goto_1

    :cond_0
    move v1, v2

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->K()Lru/mail/libverify/storage/n;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/n;->useSafetyNet()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->e(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/e;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/e;->b()V

    :cond_2
    return-void
.end method

.method public final b()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0, p0, v1, v1}, Lru/mail/libverify/storage/l;->a(Ljava/lang/Object;ZI)V

    return-void
.end method

.method public final c()V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0, p0}, Lru/mail/libverify/storage/l;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final d()Lru/mail/libverify/storage/o;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->j(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/o;

    move-result-object v0

    return-object v0
.end method

.method public final e()Ljava/util/concurrent/ExecutorService;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->l(Lru/mail/libverify/api/ad;)Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v0

    return-object v0
.end method

.method public final f()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$a;->a:Lru/mail/libverify/api/ad;

    iget-object v0, v0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    return-object v0
.end method
