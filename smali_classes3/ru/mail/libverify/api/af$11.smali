.class final Lru/mail/libverify/api/af$11;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/api/af$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/af;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/util/concurrent/Future;

.field final synthetic b:Lru/mail/libverify/api/af;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/af;Ljava/util/concurrent/Future;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/af$11;->b:Lru/mail/libverify/api/af;

    iput-object p2, p0, Lru/mail/libverify/api/af$11;->a:Ljava/util/concurrent/Future;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
    .locals 2

    iget-object v1, p0, Lru/mail/libverify/api/af$11;->b:Lru/mail/libverify/api/af;

    iget-object v0, p0, Lru/mail/libverify/api/af$11;->a:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-static {v1, v0}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/af;Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    return-object v0
.end method
