.class final Lru/mail/libverify/api/p;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/api/p$a;
    }
.end annotation


# static fields
.field private static a:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

.field private static b:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

.field private static c:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

.field private static d:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;


# instance fields
.field private final e:Lru/mail/libverify/api/VerificationApi$FailReason;

.field private final f:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

.field private final g:Z

.field private final h:[Ljava/lang/String;

.field private final i:Lru/mail/libverify/api/p$a;


# direct methods
.method private constructor <init>(Lru/mail/libverify/api/VerificationApi$FailReason;[Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lru/mail/libverify/api/p;->e:Lru/mail/libverify/api/VerificationApi$FailReason;

    iput-object p4, p0, Lru/mail/libverify/api/p;->f:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    iput-boolean p5, p0, Lru/mail/libverify/api/p;->g:Z

    iput-object p2, p0, Lru/mail/libverify/api/p;->h:[Ljava/lang/String;

    check-cast p3, Lru/mail/libverify/api/p$a;

    iput-object p3, p0, Lru/mail/libverify/api/p;->i:Lru/mail/libverify/api/p$a;

    return-void
.end method

.method static a()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;
    .locals 2

    sget-object v0, Lru/mail/libverify/api/p;->a:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    if-nez v0, :cond_0

    invoke-static {}, Lru/mail/libverify/api/m;->a()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lru/mail/libverify/api/p;->a(Lru/mail/libverify/api/VerificationApi$FailReason;Z)Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v0

    sput-object v0, Lru/mail/libverify/api/p;->a:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    :cond_0
    sget-object v0, Lru/mail/libverify/api/p;->a:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    return-object v0
.end method

.method private static a(Lru/mail/libverify/api/VerificationApi$FailReason;Z)Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;
    .locals 6

    const/4 v2, 0x0

    new-instance v0, Lru/mail/libverify/api/p;

    sget-object v4, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;->INVALID:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    move-object v1, p0

    move-object v3, v2

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lru/mail/libverify/api/p;-><init>(Lru/mail/libverify/api/VerificationApi$FailReason;[Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;Z)V

    return-object v0
.end method

.method static a(Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;)Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;
    .locals 6
    .param p0    # Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v2, 0x0

    const/4 v5, 0x1

    invoke-interface {p0}, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;->getExtendedInfo()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;

    move-result-object v3

    invoke-interface {p0}, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;->isValid()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lru/mail/libverify/api/p;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-interface {p0}, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;->getState()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    move-result-object v4

    invoke-direct/range {v0 .. v5}, Lru/mail/libverify/api/p;-><init>(Lru/mail/libverify/api/VerificationApi$FailReason;[Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;Z)V

    :goto_0
    return-object v0

    :cond_0
    if-eqz v3, :cond_4

    invoke-static {v3}, Lru/mail/libverify/api/p$a;->a(Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;)Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;->getRemainingLength()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_2

    invoke-interface {v3}, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;->isMobile()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-interface {v3}, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;->isFixedLine()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    move v0, v5

    :goto_1
    if-eqz v0, :cond_3

    sget-object v4, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;->VALID:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    :goto_2
    new-instance v0, Lru/mail/libverify/api/p;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-static {v3}, Lru/mail/libverify/api/p$a;->a(Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;)Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;

    move-result-object v3

    invoke-direct/range {v0 .. v5}, Lru/mail/libverify/api/p;-><init>(Lru/mail/libverify/api/VerificationApi$FailReason;[Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;Z)V

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    :cond_3
    invoke-interface {p0}, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;->getState()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    move-result-object v4

    goto :goto_2

    :cond_4
    move-object v0, v2

    goto :goto_0
.end method

.method static a(Lru/mail/libverify/requests/response/PhoneInfoResponse;)Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;
    .locals 6
    .param p0    # Lru/mail/libverify/requests/response/PhoneInfoResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lru/mail/libverify/api/p$1;->a:[I

    invoke-virtual {p0}, Lru/mail/libverify/requests/response/PhoneInfoResponse;->getStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    move-result-object v1

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :pswitch_0
    sget-object v4, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;->VALID:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    :goto_0
    new-instance v0, Lru/mail/libverify/api/p;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-virtual {p0}, Lru/mail/libverify/requests/response/PhoneInfoResponse;->getPrintable()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lru/mail/libverify/requests/response/PhoneInfoResponse;->getTypingCheck()Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;

    move-result-object v3

    invoke-static {v3}, Lru/mail/libverify/api/p$a;->a(Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;)Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;

    move-result-object v3

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lru/mail/libverify/api/p;-><init>(Lru/mail/libverify/api/VerificationApi$FailReason;[Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;Z)V

    return-object v0

    :pswitch_1
    sget-object v4, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;->INVALID:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    goto :goto_0

    :pswitch_2
    sget-object v4, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;->UNKNOWN:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method static b()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;
    .locals 2

    sget-object v0, Lru/mail/libverify/api/p;->b:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    if-nez v0, :cond_0

    invoke-static {}, Lru/mail/libverify/api/m;->a()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lru/mail/libverify/api/p;->a(Lru/mail/libverify/api/VerificationApi$FailReason;Z)Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v0

    sput-object v0, Lru/mail/libverify/api/p;->b:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    :cond_0
    sget-object v0, Lru/mail/libverify/api/p;->b:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    return-object v0
.end method

.method static c()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;
    .locals 2

    sget-object v0, Lru/mail/libverify/api/p;->c:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    if-nez v0, :cond_0

    invoke-static {}, Lru/mail/libverify/api/m;->c()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lru/mail/libverify/api/p;->a(Lru/mail/libverify/api/VerificationApi$FailReason;Z)Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v0

    sput-object v0, Lru/mail/libverify/api/p;->c:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    :cond_0
    sget-object v0, Lru/mail/libverify/api/p;->c:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    return-object v0
.end method

.method static d()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;
    .locals 2

    sget-object v0, Lru/mail/libverify/api/p;->d:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    if-nez v0, :cond_0

    sget-object v0, Lru/mail/libverify/api/VerificationApi$FailReason;->INCORRECT_PHONE_NUMBER:Lru/mail/libverify/api/VerificationApi$FailReason;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lru/mail/libverify/api/p;->a(Lru/mail/libverify/api/VerificationApi$FailReason;Z)Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    move-result-object v0

    sput-object v0, Lru/mail/libverify/api/p;->d:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    :cond_0
    sget-object v0, Lru/mail/libverify/api/p;->d:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;

    return-object v0
.end method


# virtual methods
.method public final getExtendedInfo()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/p;->i:Lru/mail/libverify/api/p$a;

    return-object v0
.end method

.method public final getPrintableText()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/p;->h:[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/p;->h:[Ljava/lang/String;

    array-length v0, v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/p;->h:[Ljava/lang/String;

    goto :goto_0
.end method

.method public final getReason()Lru/mail/libverify/api/VerificationApi$FailReason;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/p;->e:Lru/mail/libverify/api/VerificationApi$FailReason;

    return-object v0
.end method

.method public final getState()Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/p;->f:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    return-object v0
.end method

.method public final isApproximate()Z
    .locals 1

    iget-boolean v0, p0, Lru/mail/libverify/api/p;->g:Z

    return v0
.end method

.method public final isInvalid()Z
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/p;->f:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;->INVALID:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isUnknown()Z
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/p;->f:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;->UNKNOWN:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isValid()Z
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/p;->f:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;->VALID:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isWarning()Z
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/p;->f:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;->INVALID:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/p;->i:Lru/mail/libverify/api/p$a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/p;->i:Lru/mail/libverify/api/p$a;

    invoke-static {v0}, Lru/mail/libverify/api/p$a;->a(Lru/mail/libverify/api/p$a;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/p;->e:Lru/mail/libverify/api/VerificationApi$FailReason;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->INCORRECT_PHONE_NUMBER:Lru/mail/libverify/api/VerificationApi$FailReason;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/p;->e:Lru/mail/libverify/api/VerificationApi$FailReason;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->UNSUPPORTED_NUMBER:Lru/mail/libverify/api/VerificationApi$FailReason;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "PhoneCheckResult{isApproximate="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lru/mail/libverify/api/p;->g:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/p;->f:Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$State;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", reason="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/p;->e:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", extendedInfo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/p;->i:Lru/mail/libverify/api/p$a;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
