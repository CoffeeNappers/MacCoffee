.class final Lru/mail/libverify/api/ad$31;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->requestVerificationStates(Lru/mail/libverify/api/VerificationApi$VerificationStatesHandler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/VerificationApi$VerificationStatesHandler;

.field final synthetic b:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Lru/mail/libverify/api/VerificationApi$VerificationStatesHandler;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$31;->b:Lru/mail/libverify/api/ad;

    iput-object p2, p0, Lru/mail/libverify/api/ad$31;->a:Lru/mail/libverify/api/VerificationApi$VerificationStatesHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lru/mail/libverify/api/ad$31;->a:Lru/mail/libverify/api/VerificationApi$VerificationStatesHandler;

    iget-object v1, p0, Lru/mail/libverify/api/ad$31;->b:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->o(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/w;

    move-result-object v1

    sget v2, Lru/mail/libverify/api/w$a;->c:I

    invoke-interface {v1, v2}, Lru/mail/libverify/api/w;->b(I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/api/VerificationApi$VerificationStatesHandler;->onExistingVerificationsFound(Ljava/util/List;)V

    return-void
.end method
