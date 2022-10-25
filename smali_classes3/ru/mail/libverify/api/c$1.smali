.class final Lru/mail/libverify/api/c$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/c;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/c;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/c$1;->a:Lru/mail/libverify/api/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    const-string/jumbo v0, "AccountChecker"

    const-string/jumbo v1, "sms info request timeout expired"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/c$1;->a:Lru/mail/libverify/api/c;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$AccountCheckResult;->NO_SMS_INFO:Lru/mail/libverify/api/VerificationApi$AccountCheckResult;

    invoke-static {v0, v1}, Lru/mail/libverify/api/c;->a(Lru/mail/libverify/api/c;Lru/mail/libverify/api/VerificationApi$AccountCheckResult;)V

    return-void
.end method
