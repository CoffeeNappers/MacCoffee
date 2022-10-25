.class public final Lru/mail/libverify/requests/d;
.super Lru/mail/libverify/requests/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lru/mail/libverify/requests/e",
        "<",
        "Lru/mail/libverify/requests/response/AttemptApiResponse;",
        ">;"
    }
.end annotation


# instance fields
.field private final b:Lru/mail/libverify/requests/f;

.field private final c:Lru/mail/libverify/requests/AttemptData;


# direct methods
.method public constructor <init>(Lru/mail/libverify/storage/k;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lru/mail/libverify/requests/e;-><init>(Lru/mail/libverify/storage/k;)V

    new-instance v0, Lru/mail/libverify/requests/f;

    invoke-direct {v0, p2}, Lru/mail/libverify/requests/f;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lru/mail/libverify/requests/d;->b:Lru/mail/libverify/requests/f;

    new-instance v0, Lru/mail/libverify/requests/AttemptData;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->APPLICATION_EXTERNAL:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-direct {v0, p2, p3, v1, p4}, Lru/mail/libverify/requests/AttemptData;-><init>(Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationSource;Ljava/lang/String;)V

    iput-object v0, p0, Lru/mail/libverify/requests/d;->c:Lru/mail/libverify/requests/AttemptData;

    return-void
.end method

.method public constructor <init>(Lru/mail/libverify/storage/k;Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationSource;)V
    .locals 2
    .param p1    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lru/mail/libverify/requests/e;-><init>(Lru/mail/libverify/storage/k;)V

    new-instance v0, Lru/mail/libverify/requests/f;

    invoke-direct {v0, p2}, Lru/mail/libverify/requests/f;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lru/mail/libverify/requests/d;->b:Lru/mail/libverify/requests/f;

    new-instance v0, Lru/mail/libverify/requests/AttemptData;

    invoke-interface {p1}, Lru/mail/libverify/storage/k;->e()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p2, p3, p4, v1}, Lru/mail/libverify/requests/AttemptData;-><init>(Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationSource;Ljava/lang/String;)V

    iput-object v0, p0, Lru/mail/libverify/requests/d;->c:Lru/mail/libverify/requests/AttemptData;

    return-void
.end method

.method constructor <init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/m;)V
    .locals 2
    .param p1    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/requests/m;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lru/mail/libverify/requests/e;-><init>(Lru/mail/libverify/storage/k;)V

    iget-object v0, p2, Lru/mail/libverify/requests/m;->a:Ljava/lang/String;

    const-class v1, Lru/mail/libverify/requests/AttemptData;

    invoke-static {v0, v1}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/AttemptData;

    iput-object v0, p0, Lru/mail/libverify/requests/d;->c:Lru/mail/libverify/requests/AttemptData;

    new-instance v0, Lru/mail/libverify/requests/f;

    iget-object v1, p0, Lru/mail/libverify/requests/d;->c:Lru/mail/libverify/requests/AttemptData;

    iget-object v1, v1, Lru/mail/libverify/requests/AttemptData;->verificationUrl:Ljava/lang/String;

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/f;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lru/mail/libverify/requests/d;->b:Lru/mail/libverify/requests/f;

    return-void
.end method


# virtual methods
.method protected final a()Lru/mail/libverify/requests/e$a;
    .locals 3

    new-instance v0, Lru/mail/libverify/requests/e$a;

    iget-object v1, p0, Lru/mail/libverify/requests/d;->b:Lru/mail/libverify/requests/f;

    iget-object v1, v1, Lru/mail/libverify/requests/f;->a:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/e$a;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "code"

    iget-object v2, p0, Lru/mail/libverify/requests/d;->c:Lru/mail/libverify/requests/AttemptData;

    iget-object v2, v2, Lru/mail/libverify/requests/AttemptData;->code:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v1, "application_id"

    iget-object v2, p0, Lru/mail/libverify/requests/d;->c:Lru/mail/libverify/requests/AttemptData;

    iget-object v2, v2, Lru/mail/libverify/requests/AttemptData;->applicationId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v1, "code_source"

    iget-object v2, p0, Lru/mail/libverify/requests/d;->c:Lru/mail/libverify/requests/AttemptData;

    iget-object v2, v2, Lru/mail/libverify/requests/AttemptData;->codeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-virtual {v2}, Lru/mail/libverify/api/VerificationApi$VerificationSource;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    return-object v0
.end method

.method protected final synthetic a(Ljava/lang/String;)Lru/mail/libverify/requests/response/ClientApiResponseBase;
    .locals 4

    const-class v0, Lru/mail/libverify/requests/response/AttemptApiResponse;

    invoke-static {p1, v0}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/response/AttemptApiResponse;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/AttemptApiResponse;->getFetcherInfo()Lru/mail/libverify/requests/response/FetcherInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/AttemptApiResponse;->getFetcherInfo()Lru/mail/libverify/requests/response/FetcherInfo;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lru/mail/libverify/requests/response/FetcherInfo;->setTimestamp(J)V

    :cond_0
    return-object v0
.end method

.method protected final b()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final c()Lru/mail/libverify/requests/m;
    .locals 2

    new-instance v0, Lru/mail/libverify/requests/m;

    iget-object v1, p0, Lru/mail/libverify/requests/d;->c:Lru/mail/libverify/requests/AttemptData;

    invoke-static {v1}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/m;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method protected final d()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/d;->b:Lru/mail/libverify/requests/f;

    invoke-virtual {v0}, Lru/mail/libverify/requests/f;->a()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected final e()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/d;->b:Lru/mail/libverify/requests/f;

    iget-object v0, v0, Lru/mail/libverify/requests/f;->a:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected final f()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/d;->b:Lru/mail/libverify/requests/f;

    invoke-virtual {v0}, Lru/mail/libverify/requests/f;->b()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected final g()Lru/mail/libverify/requests/l;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/d;->c:Lru/mail/libverify/requests/AttemptData;

    return-object v0
.end method
