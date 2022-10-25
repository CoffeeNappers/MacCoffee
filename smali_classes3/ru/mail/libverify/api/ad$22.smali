.class final Lru/mail/libverify/api/ad$22;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->verifySmsCode(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$22;->c:Lru/mail/libverify/api/ad;

    iput-object p2, p0, Lru/mail/libverify/api/ad$22;->a:Ljava/lang/String;

    iput-object p3, p0, Lru/mail/libverify/api/ad$22;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "sms code %s code verification for session %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/api/ad$22;->a:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lru/mail/libverify/api/ad$22;->b:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$22;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$22;->b:Ljava/lang/String;

    sget v2, Lru/mail/libverify/api/w$a;->c:I

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/w;->a(Ljava/lang/String;I)Lru/mail/libverify/api/ae;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lru/mail/libverify/api/ad$22;->a:Ljava/lang/String;

    invoke-interface {v0, v1}, Lru/mail/libverify/api/ae;->a(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$22;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->i(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/v;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$22;->b:Ljava/lang/String;

    new-instance v2, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    sget-object v3, Lru/mail/libverify/api/VerificationApi$VerificationState;->FINAL:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-static {}, Lru/mail/libverify/api/m;->a()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;-><init>(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$FailReason;)V

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/v;->a(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    goto :goto_0
.end method
