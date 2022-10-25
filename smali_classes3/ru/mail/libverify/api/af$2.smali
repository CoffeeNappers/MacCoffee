.class final Lru/mail/libverify/api/af$2;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/requests/i$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/af;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lru/mail/libverify/requests/i$b",
        "<",
        "Lru/mail/libverify/requests/response/VerifyApiResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/requests/p;

.field final synthetic b:Lru/mail/libverify/api/af;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/af;Lru/mail/libverify/requests/p;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/af$2;->b:Lru/mail/libverify/api/af;

    iput-object p2, p0, Lru/mail/libverify/api/af$2;->a:Lru/mail/libverify/requests/p;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/af$2;->b:Lru/mail/libverify/api/af;

    invoke-static {v0}, Lru/mail/libverify/api/af;->e(Lru/mail/libverify/api/af;)Lru/mail/libverify/api/v;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/v;->a()Landroid/os/Handler;

    move-result-object v0

    return-object v0
.end method

.method public final a(Ljava/util/concurrent/Future;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future",
            "<",
            "Lru/mail/libverify/requests/response/VerifyApiResponse;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/af$2;->b:Lru/mail/libverify/api/af;

    invoke-static {v0}, Lru/mail/libverify/api/af;->f(Lru/mail/libverify/api/af;)Ljava/util/concurrent/Future;

    iget-object v0, p0, Lru/mail/libverify/api/af$2;->b:Lru/mail/libverify/api/af;

    iget-object v1, p0, Lru/mail/libverify/api/af$2;->b:Lru/mail/libverify/api/af;

    iget-object v2, p0, Lru/mail/libverify/api/af$2;->a:Lru/mail/libverify/requests/p;

    invoke-static {v1, v2, p1}, Lru/mail/libverify/api/af;->b(Lru/mail/libverify/api/af;Lru/mail/libverify/requests/e;Ljava/util/concurrent/Future;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v1

    invoke-static {v0, v1}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/af;Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    goto :goto_0
.end method
