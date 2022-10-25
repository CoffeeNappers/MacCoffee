.class final Lru/mail/libverify/api/ad$18;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->startVerification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/ae;

.field final synthetic b:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Lru/mail/libverify/api/ae;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$18;->b:Lru/mail/libverify/api/ad;

    iput-object p2, p0, Lru/mail/libverify/api/ad$18;->a:Lru/mail/libverify/api/ae;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    iget-object v0, p0, Lru/mail/libverify/api/ad$18;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$18;->a:Lru/mail/libverify/api/ae;

    invoke-interface {v1}, Lru/mail/libverify/api/ae;->g()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/api/w;->b(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/ad$18;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->i(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/v;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$18;->a:Lru/mail/libverify/api/ae;

    invoke-interface {v1}, Lru/mail/libverify/api/ae;->g()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    sget-object v3, Lru/mail/libverify/api/VerificationApi$VerificationState;->FINAL:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-static {}, Lru/mail/libverify/api/m;->a()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;-><init>(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$FailReason;)V

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/v;->a(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Two verification sessions have same ids."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/ad$18;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$18;->a:Lru/mail/libverify/api/ae;

    invoke-interface {v1}, Lru/mail/libverify/api/ae;->g()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lru/mail/libverify/api/ad$18;->a:Lru/mail/libverify/api/ae;

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/w;->a(Ljava/lang/String;Lru/mail/libverify/api/ae;)Lru/mail/libverify/api/ae;

    iget-object v0, p0, Lru/mail/libverify/api/ad$18;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->q(Lru/mail/libverify/api/ad;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$18;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->g(Lru/mail/libverify/api/ad;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$18;->b:Lru/mail/libverify/api/ad;

    new-instance v1, Lru/mail/libverify/api/ad$18$1;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$18$1;-><init>(Lru/mail/libverify/api/ad$18;)V

    invoke-static {v0, v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Ljava/lang/Runnable;)V

    return-void
.end method
