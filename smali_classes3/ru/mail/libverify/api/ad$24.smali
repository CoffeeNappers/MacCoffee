.class final Lru/mail/libverify/api/ad$24;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->requestNewSmsCode(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$24;->b:Lru/mail/libverify/api/ad;

    iput-object p2, p0, Lru/mail/libverify/api/ad$24;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    const/4 v7, 0x0

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "request new sms code for session %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lru/mail/libverify/api/ad$24;->a:Ljava/lang/String;

    aput-object v3, v2, v7

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$24;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$24;->a:Ljava/lang/String;

    sget v2, Lru/mail/libverify/api/w$a;->c:I

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/w;->a(Ljava/lang/String;I)Lru/mail/libverify/api/ae;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lru/mail/libverify/api/ae;->c()V

    iget-object v0, p0, Lru/mail/libverify/api/ad$24;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v0

    if-eqz v1, :cond_1

    iget-object v0, v0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    sget-object v3, Lru/mail/libverify/statistics/a;->Verification_NewSmsCode_Requested:Lru/mail/libverify/statistics/a;

    new-instance v4, Lru/mail/libverify/statistics/b$a;

    invoke-direct {v4, v7}, Lru/mail/libverify/statistics/b$a;-><init>(B)V

    const-string/jumbo v5, "ServiceName"

    invoke-interface {v1}, Lru/mail/libverify/api/ae;->k()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lru/mail/libverify/statistics/b$a;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/statistics/b$a;

    move-result-object v4

    iget-object v4, v4, Lru/mail/libverify/statistics/b$a;->a:Ljava/util/Map;

    invoke-interface {v0, v3, v4}, Lru/mail/libverify/statistics/c;->a(Lru/mail/libverify/statistics/a;Ljava/util/Map;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$24;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->i(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/v;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$24;->a:Ljava/lang/String;

    new-instance v2, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    sget-object v3, Lru/mail/libverify/api/VerificationApi$VerificationState;->FINAL:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-static {}, Lru/mail/libverify/api/m;->a()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;-><init>(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$FailReason;)V

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/v;->a(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    :cond_1
    return-void
.end method
