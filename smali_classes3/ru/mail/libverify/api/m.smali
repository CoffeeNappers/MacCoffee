.class final Lru/mail/libverify/api/m;
.super Ljava/lang/Object;


# static fields
.field private static a:Lru/mail/libverify/api/VerificationApi$FailReason;

.field private static b:Lru/mail/libverify/api/VerificationApi$FailReason;

.field private static c:Lru/mail/libverify/api/VerificationApi$FailReason;

.field private static d:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lru/mail/libverify/api/m;->a:Lru/mail/libverify/api/VerificationApi$FailReason;

    sput-object v0, Lru/mail/libverify/api/m;->b:Lru/mail/libverify/api/VerificationApi$FailReason;

    sput-object v0, Lru/mail/libverify/api/m;->c:Lru/mail/libverify/api/VerificationApi$FailReason;

    return-void
.end method

.method public static a()Lru/mail/libverify/api/VerificationApi$FailReason;
    .locals 3

    sget-object v0, Lru/mail/libverify/api/m;->a:Lru/mail/libverify/api/VerificationApi$FailReason;

    if-nez v0, :cond_0

    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->GENERAL_ERROR:Lru/mail/libverify/api/VerificationApi$FailReason;

    sget-object v0, Lru/mail/libverify/api/m;->d:Landroid/content/Context;

    if-eqz v0, :cond_1

    sget-object v0, Lru/mail/libverify/api/m;->d:Landroid/content/Context;

    sget v2, Lru/mail/libverify/R$string;->general_error_description:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, v1, Lru/mail/libverify/api/VerificationApi$FailReason;->description:Ljava/lang/String;

    sput-object v1, Lru/mail/libverify/api/m;->a:Lru/mail/libverify/api/VerificationApi$FailReason;

    :cond_0
    sget-object v0, Lru/mail/libverify/api/m;->a:Lru/mail/libverify/api/VerificationApi$FailReason;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static a(Landroid/content/Context;)V
    .locals 0
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sput-object p0, Lru/mail/libverify/api/m;->d:Landroid/content/Context;

    return-void
.end method

.method public static b()Lru/mail/libverify/api/VerificationApi$FailReason;
    .locals 3

    sget-object v0, Lru/mail/libverify/api/m;->b:Lru/mail/libverify/api/VerificationApi$FailReason;

    if-nez v0, :cond_0

    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->NO_NETWORK:Lru/mail/libverify/api/VerificationApi$FailReason;

    sget-object v0, Lru/mail/libverify/api/m;->d:Landroid/content/Context;

    if-eqz v0, :cond_1

    sget-object v0, Lru/mail/libverify/api/m;->d:Landroid/content/Context;

    sget v2, Lru/mail/libverify/R$string;->network_error_description:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, v1, Lru/mail/libverify/api/VerificationApi$FailReason;->description:Ljava/lang/String;

    sput-object v1, Lru/mail/libverify/api/m;->b:Lru/mail/libverify/api/VerificationApi$FailReason;

    :cond_0
    sget-object v0, Lru/mail/libverify/api/m;->b:Lru/mail/libverify/api/VerificationApi$FailReason;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static c()Lru/mail/libverify/api/VerificationApi$FailReason;
    .locals 3

    sget-object v0, Lru/mail/libverify/api/m;->c:Lru/mail/libverify/api/VerificationApi$FailReason;

    if-nez v0, :cond_0

    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->NETWORK_ERROR:Lru/mail/libverify/api/VerificationApi$FailReason;

    sget-object v0, Lru/mail/libverify/api/m;->d:Landroid/content/Context;

    if-eqz v0, :cond_1

    sget-object v0, Lru/mail/libverify/api/m;->d:Landroid/content/Context;

    sget v2, Lru/mail/libverify/R$string;->general_error_description:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, v1, Lru/mail/libverify/api/VerificationApi$FailReason;->description:Ljava/lang/String;

    sput-object v1, Lru/mail/libverify/api/m;->c:Lru/mail/libverify/api/VerificationApi$FailReason;

    :cond_0
    sget-object v0, Lru/mail/libverify/api/m;->c:Lru/mail/libverify/api/VerificationApi$FailReason;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
