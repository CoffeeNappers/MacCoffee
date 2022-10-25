.class final Lru/mail/libverify/api/af$7;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/sms/k$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/af;->q()V
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

    iput-object p1, p0, Lru/mail/libverify/api/af$7;->a:Lru/mail/libverify/api/af;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lru/mail/libverify/sms/b;)V
    .locals 4

    if-nez p1, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/af$7;->a:Lru/mail/libverify/api/af;

    iget-object v1, p1, Lru/mail/libverify/sms/b;->d:Ljava/lang/String;

    iget-object v2, p0, Lru/mail/libverify/api/af$7;->a:Lru/mail/libverify/api/af;

    invoke-static {v2}, Lru/mail/libverify/api/af;->d(Lru/mail/libverify/api/af;)Lru/mail/libverify/api/h$a;

    move-result-object v2

    invoke-static {v1, v2}, Lru/mail/libverify/api/h;->a(Ljava/lang/String;Lru/mail/libverify/api/h$a;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lru/mail/libverify/sms/b;->d:Ljava/lang/String;

    sget-object v3, Lru/mail/libverify/api/VerificationApi$VerificationSource;->SMS:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-static {v0, v1, v2, v3}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/af;Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationSource;)V

    goto :goto_0
.end method
