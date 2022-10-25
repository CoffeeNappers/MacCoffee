.class final Lru/mail/libverify/api/af$10;
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

.field final synthetic b:Lru/mail/libverify/api/VerificationApi$IvrStateListener;

.field final synthetic c:Lru/mail/libverify/api/af;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/af;Lru/mail/libverify/requests/p;Lru/mail/libverify/api/VerificationApi$IvrStateListener;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/af$10;->c:Lru/mail/libverify/api/af;

    iput-object p2, p0, Lru/mail/libverify/api/af$10;->a:Lru/mail/libverify/requests/p;

    iput-object p3, p0, Lru/mail/libverify/api/af$10;->b:Lru/mail/libverify/api/VerificationApi$IvrStateListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/af$10;->c:Lru/mail/libverify/api/af;

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

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/af$10;->c:Lru/mail/libverify/api/af;

    invoke-static {v0}, Lru/mail/libverify/api/af;->g(Lru/mail/libverify/api/af;)Ljava/util/concurrent/Future;

    iget-object v0, p0, Lru/mail/libverify/api/af$10;->c:Lru/mail/libverify/api/af;

    iget-object v1, p0, Lru/mail/libverify/api/af$10;->a:Lru/mail/libverify/requests/p;

    invoke-static {v0, v1, p1}, Lru/mail/libverify/api/af;->b(Lru/mail/libverify/api/af;Lru/mail/libverify/requests/e;Ljava/util/concurrent/Future;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/af$10;->b:Lru/mail/libverify/api/VerificationApi$IvrStateListener;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lru/mail/libverify/api/af$10;->b:Lru/mail/libverify/api/VerificationApi$IvrStateListener;

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getReason()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v2

    invoke-interface {v1, v2}, Lru/mail/libverify/api/VerificationApi$IvrStateListener;->onRequestExecuted(Lru/mail/libverify/api/VerificationApi$FailReason;)V

    :cond_2
    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getState()Lru/mail/libverify/api/VerificationApi$VerificationState;

    move-result-object v1

    sget-object v2, Lru/mail/libverify/api/VerificationApi$VerificationState;->SUCCEEDED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lru/mail/libverify/api/af$10;->c:Lru/mail/libverify/api/af;

    invoke-static {v1, v0}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/af;Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    goto :goto_0
.end method
