.class final Lru/mail/libverify/api/p$a;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/p;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private final a:Z

.field private final b:Z

.field private final c:[Ljava/lang/Integer;

.field private final d:Z

.field private final e:Ljava/lang/Integer;

.field private final f:Ljava/lang/String;

.field private final g:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;)V
    .locals 3
    .param p1    # Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;->isMobileNumber()Z

    move-result v0

    iput-boolean v0, p0, Lru/mail/libverify/api/p$a;->a:Z

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;->isFixedLineNumber()Z

    move-result v0

    iput-boolean v0, p0, Lru/mail/libverify/api/p$a;->b:Z

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;->getRemainingLengths()[Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lru/mail/libverify/api/p$a;->a([Ljava/lang/Integer;)[Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/api/p$a;->c:[Ljava/lang/Integer;

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;->getRemainingLengths()[Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/p$a;->c:[Ljava/lang/Integer;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lru/mail/libverify/api/p$a;->a([Ljava/lang/Integer;[Ljava/lang/Integer;Z)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/api/p$a;->e:Ljava/lang/Integer;

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;->isShowWarning()Z

    move-result v0

    iput-boolean v0, p0, Lru/mail/libverify/api/p$a;->d:Z

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;->getModifiedPhoneNumber()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/api/p$a;->f:Ljava/lang/String;

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;->getModifiedPrefix()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/api/p$a;->g:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(ZZZLjava/lang/Integer;[Ljava/lang/Integer;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lru/mail/libverify/api/p$a;->a:Z

    iput-boolean p2, p0, Lru/mail/libverify/api/p$a;->b:Z

    iput-object p4, p0, Lru/mail/libverify/api/p$a;->e:Ljava/lang/Integer;

    iput-object p5, p0, Lru/mail/libverify/api/p$a;->c:[Ljava/lang/Integer;

    iput-boolean p3, p0, Lru/mail/libverify/api/p$a;->d:Z

    iput-object v0, p0, Lru/mail/libverify/api/p$a;->f:Ljava/lang/String;

    iput-object v0, p0, Lru/mail/libverify/api/p$a;->g:Ljava/lang/String;

    return-void
.end method

.method private static a([Ljava/lang/Integer;[Ljava/lang/Integer;Z)Ljava/lang/Integer;
    .locals 4

    const/4 v1, 0x0

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    array-length v0, p0

    array-length v2, p1

    if-eq v0, v2, :cond_2

    :cond_0
    move-object v0, v1

    :cond_1
    return-object v0

    :cond_2
    const v2, 0x7fffffff

    const/4 v0, 0x0

    move v3, v0

    move-object v0, v1

    :goto_0
    array-length v1, p0

    if-ge v3, v1, :cond_1

    if-eqz p2, :cond_3

    aget-object v1, p0, v3

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_1
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, p1, v3

    aget-object v1, p1, v3

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    if-ge v1, v2, :cond_4

    aget-object v0, p1, v3

    :goto_2
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    move v2, v1

    goto :goto_0

    :cond_3
    aget-object v1, p0, v3

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_1

    :cond_4
    move v1, v2

    goto :goto_2
.end method

.method static synthetic a(Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;)Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;
    .locals 6

    const/4 v3, 0x1

    if-eqz p0, :cond_0

    instance-of v0, p0, Lru/mail/libverify/api/p$a;

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_1
    check-cast p0, Lru/mail/libverify/api/p$a;

    iget-object v0, p0, Lru/mail/libverify/api/p$a;->c:[Ljava/lang/Integer;

    invoke-static {v0}, Lru/mail/libverify/api/p$a;->a([Ljava/lang/Integer;)[Ljava/lang/Integer;

    move-result-object v5

    iget-object v0, p0, Lru/mail/libverify/api/p$a;->c:[Ljava/lang/Integer;

    invoke-static {v0, v5, v3}, Lru/mail/libverify/api/p$a;->a([Ljava/lang/Integer;[Ljava/lang/Integer;Z)Ljava/lang/Integer;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    iget-boolean v0, p0, Lru/mail/libverify/api/p$a;->d:Z

    if-eqz v0, :cond_3

    :goto_1
    new-instance v0, Lru/mail/libverify/api/p$a;

    iget-boolean v1, p0, Lru/mail/libverify/api/p$a;->a:Z

    iget-boolean v2, p0, Lru/mail/libverify/api/p$a;->b:Z

    invoke-direct/range {v0 .. v5}, Lru/mail/libverify/api/p$a;-><init>(ZZZLjava/lang/Integer;[Ljava/lang/Integer;)V

    goto :goto_0

    :cond_3
    const/4 v3, 0x0

    goto :goto_1
.end method

.method static synthetic a(Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;)Lru/mail/libverify/api/VerificationApi$PhoneCheckResult$ExtendedInfo;
    .locals 1

    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lru/mail/libverify/api/p$a;

    invoke-direct {v0, p0}, Lru/mail/libverify/api/p$a;-><init>(Lru/mail/libverify/requests/response/PhoneInfoResponse$TypingCheck;)V

    goto :goto_0
.end method

.method static synthetic a(Lru/mail/libverify/api/p$a;)Z
    .locals 1

    iget-boolean v0, p0, Lru/mail/libverify/api/p$a;->d:Z

    return v0
.end method

.method private static a([Ljava/lang/Integer;)[Ljava/lang/Integer;
    .locals 1

    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_1
    array-length v0, p0

    new-array v0, v0, [Ljava/lang/Integer;

    goto :goto_0
.end method


# virtual methods
.method public final getModifiedPhoneNumber()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/p$a;->f:Ljava/lang/String;

    return-object v0
.end method

.method public final getModifiedPrefix()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/p$a;->g:Ljava/lang/String;

    return-object v0
.end method

.method public final getRemainingLength()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/p$a;->e:Ljava/lang/Integer;

    return-object v0
.end method

.method public final isFixedLine()Z
    .locals 1

    iget-boolean v0, p0, Lru/mail/libverify/api/p$a;->b:Z

    return v0
.end method

.method public final isMobile()Z
    .locals 1

    iget-boolean v0, p0, Lru/mail/libverify/api/p$a;->a:Z

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Info{isMobile="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lru/mail/libverify/api/p$a;->a:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", isFixedLine="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lru/mail/libverify/api/p$a;->b:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", remainingLengths="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/p$a;->c:[Ljava/lang/Integer;

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", isWarning="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lru/mail/libverify/api/p$a;->d:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
