.class final Lru/mail/libverify/api/ad$b;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/requests/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/ad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/ad;


# direct methods
.method private constructor <init>(Lru/mail/libverify/api/ad;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lru/mail/libverify/api/ad;B)V
    .locals 0

    invoke-direct {p0, p1}, Lru/mail/libverify/api/ad$b;-><init>(Lru/mail/libverify/api/ad;)V

    return-void
.end method


# virtual methods
.method public final a()Lru/mail/libverify/storage/k;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    return-object v0
.end method

.method public final a(Lru/mail/libverify/requests/e;)V
    .locals 3
    .param p1    # Lru/mail/libverify/requests/e;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/16 v2, 0x8

    instance-of v0, p1, Lru/mail/libverify/requests/k;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, p1, v1, v2}, Lru/mail/libverify/storage/l;->a(Ljava/lang/Object;ZI)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1, v2}, Lru/mail/libverify/storage/l;->a(Ljava/lang/Object;ZI)V

    goto :goto_0
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

    const-string/jumbo v1, "action received server failure in api %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lru/mail/libverify/requests/e;->l()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, p2, v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0, p1, p2}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Lru/mail/libverify/requests/e;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)V
    .locals 6
    .param p1    # Lru/mail/libverify/requests/response/ClientApiResponseBase;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    :try_start_0
    invoke-virtual {p1}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->getOwner()Lru/mail/libverify/requests/e;

    move-result-object v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Owner request can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v2, "api request process error"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    :try_start_1
    invoke-virtual {p1}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->getStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    move-result-object v1

    sget-object v2, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->OK:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    if-ne v1, v2, :cond_7

    instance-of v1, p1, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;

    if-eqz v1, :cond_6

    check-cast p1, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;->getUpdateSettingsTimeout()I

    move-result v1

    iget-object v2, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v2}, Lru/mail/libverify/api/ad;->j(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/o;

    move-result-object v2

    const-string/jumbo v3, "api_last_sent_push_token"

    check-cast v0, Lru/mail/libverify/requests/o;

    iget-object v0, v0, Lru/mail/libverify/requests/o;->b:Ljava/lang/String;

    invoke-interface {v2, v3, v0}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v2, "api_settings_timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-interface {v0, v2, v4, v5}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;J)Lru/mail/libverify/storage/o;

    if-lez v1, :cond_2

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/l;->a(I)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->j(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v2, "api_settings_timeout"

    invoke-interface {v0, v2, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;I)Lru/mail/libverify/storage/o;

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->j(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;->getFeatures()Lru/mail/libverify/storage/n;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/l;->a(Lru/mail/libverify/storage/n;)V

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;->hasSmsInfo()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->d(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/a;

    move-result-object v0

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;->getSmsInfo()Lru/mail/libverify/requests/response/SmsInfo;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/api/a;->a(Lru/mail/libverify/requests/response/SmsInfo;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->K()Lru/mail/libverify/storage/n;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/n;->interceptAlienSms()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;->getSmsInfo()Lru/mail/libverify/requests/response/SmsInfo;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/l;->a(Lru/mail/libverify/requests/response/SmsInfo;)V

    :cond_3
    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->K()Lru/mail/libverify/storage/n;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/n;->interceptAlienSms()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->M()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->E()V

    :cond_4
    :goto_1
    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->f(Lru/mail/libverify/api/ad;)Lru/mail/libverify/fetcher/d;

    move-result-object v0

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;->getFetcherInfo()Lru/mail/libverify/requests/response/FetcherInfo;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/fetcher/d;->a(Lru/mail/libverify/requests/response/FetcherInfo;)V

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;->getAppCheckId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->e(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/e;

    move-result-object v0

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/UpdateSettingsApiResponse;->getAppCheckId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/api/e;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_5
    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/l;->a(Lru/mail/libverify/requests/response/SmsInfo;)V

    goto :goto_1

    :cond_6
    instance-of v1, p1, Lru/mail/libverify/requests/response/PushStatusApiResponse;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v1

    check-cast v0, Lru/mail/libverify/requests/k;

    iget-object v0, v0, Lru/mail/libverify/requests/k;->b:Lru/mail/libverify/requests/PushStatusData;

    iget-wide v2, v0, Lru/mail/libverify/requests/PushStatusData;->statusTimestamp:J

    invoke-virtual {v1, v2, v3}, Lru/mail/libverify/statistics/b;->a(J)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->f(Lru/mail/libverify/api/ad;)Lru/mail/libverify/fetcher/d;

    move-result-object v0

    check-cast p1, Lru/mail/libverify/requests/response/PushStatusApiResponse;

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/PushStatusApiResponse;->getFetcherInfo()Lru/mail/libverify/requests/response/FetcherInfo;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/fetcher/d;->a(Lru/mail/libverify/requests/response/FetcherInfo;)V

    goto/16 :goto_0

    :cond_7
    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v0

    invoke-virtual {v0, p1}, Lru/mail/libverify/statistics/b;->a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)V

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->getStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    move-result-object v0

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ERROR:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->getDetailStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$DetailStatus;

    move-result-object v0

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$DetailStatus;->UNKNOWN_LIBVERIFY:Lru/mail/libverify/requests/response/ClientApiResponseBase$DetailStatus;

    if-eq v0, v1, :cond_8

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->getDetailStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$DetailStatus;

    move-result-object v0

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$DetailStatus;->UNDEFINED_PHONE:Lru/mail/libverify/requests/response/ClientApiResponseBase$DetailStatus;

    if-ne v0, v1, :cond_0

    :cond_8
    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Z)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->w(Lru/mail/libverify/api/ad;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public final b()Ljava/util/concurrent/ExecutorService;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->l(Lru/mail/libverify/api/ad;)Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v0

    return-object v0
.end method

.method public final b(Lru/mail/libverify/requests/e;)V
    .locals 1
    .param p1    # Lru/mail/libverify/requests/e;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0, p1}, Lru/mail/libverify/storage/l;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final c()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    iget-object v0, v0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    return-object v0
.end method

.method public final d()Lru/mail/libverify/storage/o;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$b;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->j(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/o;

    move-result-object v0

    return-object v0
.end method
