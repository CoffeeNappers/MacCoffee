.class final Lru/mail/libverify/api/af$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/af;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/af;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/af;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/af$4;->a:Lru/mail/libverify/api/af;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/af$4;->a:Lru/mail/libverify/api/af;

    invoke-static {v0}, Lru/mail/libverify/api/af;->b(Lru/mail/libverify/api/af;)Lru/mail/libverify/api/SessionData;

    move-result-object v0

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    if-nez v0, :cond_0

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "wait for verify answer timeout expired"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/af$4;->a:Lru/mail/libverify/api/af;

    iget-object v1, p0, Lru/mail/libverify/api/af$4;->a:Lru/mail/libverify/api/af;

    invoke-static {v1}, Lru/mail/libverify/api/af;->c(Lru/mail/libverify/api/af;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v1

    invoke-static {v0, v1}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/af;Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    :cond_0
    return-void
.end method
