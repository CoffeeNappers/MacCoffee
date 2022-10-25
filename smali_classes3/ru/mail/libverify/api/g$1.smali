.class final Lru/mail/libverify/api/g$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/g;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lru/mail/libverify/api/g;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/g;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/g$1;->b:Lru/mail/libverify/api/g;

    iput-object p2, p0, Lru/mail/libverify/api/g$1;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    const/4 v1, 0x0

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "ApplicationChecker"

    const-string/jumbo v1, "application check interrupted"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/api/g$1;->b:Lru/mail/libverify/api/g;

    iget-object v0, v0, Lru/mail/libverify/api/g;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Lru/mail/libverify/api/g$1;->a:Ljava/lang/String;

    invoke-static {v2}, Lru/mail/libverify/utils/m;->e(Ljava/lang/String;)[B

    move-result-object v2

    const-string/jumbo v3, "ApplicationChecker"

    const-string/jumbo v4, "jws request started"

    invoke-static {v3, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    invoke-direct {v3, v0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;-><init>(Landroid/content/Context;)V

    sget-object v0, Lcom/google/android/gms/safetynet/SafetyNet;->API:Lcom/google/android/gms/common/api/Api;

    invoke-virtual {v3, v0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addApi(Lcom/google/android/gms/common/api/Api;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->build()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->blockingConnect()Lcom/google/android/gms/common/ConnectionResult;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v4

    if-nez v4, :cond_1

    const-string/jumbo v0, "ApplicationChecker"

    const-string/jumbo v2, "connection failed with result %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v3}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v4, v5

    invoke-static {v0, v2, v4}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lru/mail/libverify/api/GAPIClientFailedException;

    invoke-direct {v0}, Lru/mail/libverify/api/GAPIClientFailedException;-><init>()V

    throw v0
    :try_end_0
    .catch Lru/mail/libverify/api/AttestationFailedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lru/mail/libverify/api/GAPIClientFailedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_3

    :catch_0
    move-exception v0

    move-object v2, v0

    sget-object v0, Lru/mail/libverify/api/d;->ATTESTATION_FAILED:Lru/mail/libverify/api/d;

    const-string/jumbo v3, "ApplicationChecker"

    const-string/jumbo v4, "application check failed"

    invoke-static {v3, v4, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    iget-object v2, p0, Lru/mail/libverify/api/g$1;->b:Lru/mail/libverify/api/g;

    iget-object v3, v2, Lru/mail/libverify/api/g;->b:Lru/mail/libverify/api/f;

    invoke-interface {v3}, Lru/mail/libverify/api/f;->d()Landroid/os/Handler;

    move-result-object v3

    new-instance v4, Lru/mail/libverify/api/g$2;

    invoke-direct {v4, v2, v1, v0}, Lru/mail/libverify/api/g$2;-><init>(Lru/mail/libverify/api/g;Ljava/lang/String;Lru/mail/libverify/api/d;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_1
    :try_start_1
    sget-object v3, Lcom/google/android/gms/safetynet/SafetyNet;->SafetyNetApi:Lcom/google/android/gms/safetynet/SafetyNetApi;

    invoke-interface {v3, v0, v2}, Lcom/google/android/gms/safetynet/SafetyNetApi;->attest(Lcom/google/android/gms/common/api/GoogleApiClient;[B)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/PendingResult;->await()Lcom/google/android/gms/common/api/Result;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/safetynet/SafetyNetApi$AttestationResult;

    invoke-interface {v0}, Lcom/google/android/gms/safetynet/SafetyNetApi$AttestationResult;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/common/api/Status;->isSuccess()Z

    move-result v3

    if-eqz v3, :cond_2

    const-string/jumbo v3, "ApplicationChecker"

    const-string/jumbo v4, "attestation completed with status %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    invoke-static {v3, v4, v5}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {v0}, Lcom/google/android/gms/safetynet/SafetyNetApi$AttestationResult;->getJwsResult()Ljava/lang/String;

    move-result-object v1

    sget-object v0, Lru/mail/libverify/api/d;->SUCCESS:Lru/mail/libverify/api/d;

    goto :goto_1

    :cond_2
    invoke-virtual {v2}, Lcom/google/android/gms/common/api/Status;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {v2}, Lcom/google/android/gms/common/api/Status;->isCanceled()Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_3
    const-string/jumbo v0, "ApplicationChecker"

    const-string/jumbo v3, "attestation cancelled with status %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    invoke-static {v0, v3, v4}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0
    :try_end_1
    .catch Lru/mail/libverify/api/AttestationFailedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lru/mail/libverify/api/GAPIClientFailedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_3

    :catch_1
    move-exception v0

    move-object v2, v0

    sget-object v0, Lru/mail/libverify/api/d;->GP_SERVICE_NOT_AVAILABLE:Lru/mail/libverify/api/d;

    const-string/jumbo v3, "ApplicationChecker"

    const-string/jumbo v4, "application check failed"

    invoke-static {v3, v4, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_4
    :try_start_2
    const-string/jumbo v0, "ApplicationChecker"

    const-string/jumbo v3, "attestation failed with status %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    invoke-static {v0, v3, v4}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lru/mail/libverify/api/AttestationFailedException;

    invoke-direct {v0}, Lru/mail/libverify/api/AttestationFailedException;-><init>()V

    throw v0
    :try_end_2
    .catch Lru/mail/libverify/api/AttestationFailedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lru/mail/libverify/api/GAPIClientFailedException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_3

    :catch_2
    move-exception v0

    const-string/jumbo v1, "ApplicationChecker"

    const-string/jumbo v2, "application check interrupted"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    :catch_3
    move-exception v0

    move-object v2, v0

    sget-object v0, Lru/mail/libverify/api/d;->GENERAL_ERROR:Lru/mail/libverify/api/d;

    const-string/jumbo v3, "ApplicationChecker"

    const-string/jumbo v4, "application check failed"

    invoke-static {v3, v4, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1
.end method
