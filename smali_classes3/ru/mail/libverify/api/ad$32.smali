.class final Lru/mail/libverify/api/ad$32;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->requestVerificationState(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;

.field final synthetic c:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$32;->c:Lru/mail/libverify/api/ad;

    iput-object p2, p0, Lru/mail/libverify/api/ad$32;->a:Ljava/lang/String;

    iput-object p3, p0, Lru/mail/libverify/api/ad$32;->b:Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    iget-object v0, p0, Lru/mail/libverify/api/ad$32;->c:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$32;->a:Ljava/lang/String;

    sget v2, Lru/mail/libverify/api/w$a;->c:I

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/w;->a(Ljava/lang/String;I)Lru/mail/libverify/api/ae;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lru/mail/libverify/api/ae;->i()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    const-string/jumbo v1, "VerificationApi"

    const-string/jumbo v2, "session %s state is %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lru/mail/libverify/api/ad$32;->a:Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lru/mail/libverify/api/ad$32;->b:Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;

    iget-object v2, p0, Lru/mail/libverify/api/ad$32;->a:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;->onStateChanged(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$32;->b:Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;

    iget-object v1, p0, Lru/mail/libverify/api/ad$32;->a:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;->onStateChanged(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    goto :goto_0
.end method
