.class public Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/VerificationApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VerificationStateDescriptor"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$IvrInfo;,
        Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;
    }
.end annotation


# instance fields
.field private a:Lru/mail/libverify/api/VerificationApi$VerificationState;

.field private b:Lru/mail/libverify/api/VerificationApi$VerificationSource;

.field private c:Lru/mail/libverify/api/VerificationApi$FailReason;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:I

.field private g:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

.field private h:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$IvrInfo;

.field private i:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lru/mail/libverify/api/VerificationApi$VerificationState;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->INITIAL:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iput-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->a:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationSource;->UNKNOWN:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    iput-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->b:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    sget-object v0, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    iput-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->c:Lru/mail/libverify/api/VerificationApi$FailReason;

    iput-object p1, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->a:Lru/mail/libverify/api/VerificationApi$VerificationState;

    return-void
.end method

.method public constructor <init>(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$FailReason;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->INITIAL:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iput-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->a:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationSource;->UNKNOWN:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    iput-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->b:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    sget-object v0, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    iput-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->c:Lru/mail/libverify/api/VerificationApi$FailReason;

    iput-object p1, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->a:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iput-object p2, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->c:Lru/mail/libverify/api/VerificationApi$FailReason;

    return-void
.end method

.method public constructor <init>(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$VerificationSource;Lru/mail/libverify/api/VerificationApi$FailReason;Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;Ljava/util/Set;ILjava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lru/mail/libverify/api/VerificationApi$VerificationState;",
            "Lru/mail/libverify/api/VerificationApi$VerificationSource;",
            "Lru/mail/libverify/api/VerificationApi$FailReason;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "IIZ",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;I",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->INITIAL:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iput-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->a:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationSource;->UNKNOWN:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    iput-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->b:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    sget-object v0, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    iput-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->c:Lru/mail/libverify/api/VerificationApi$FailReason;

    iput-object p4, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->d:Ljava/lang/String;

    iput-object p2, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->b:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    iput-object p3, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->c:Lru/mail/libverify/api/VerificationApi$FailReason;

    iput-object p5, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->e:Ljava/lang/String;

    iput p6, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->f:I

    iput-object p1, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->a:Lru/mail/libverify/api/VerificationApi$VerificationState;

    new-instance v0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    invoke-direct {v0, p0, p7, p8, p9}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;-><init>(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;IZLjava/lang/String;)V

    iput-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->g:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    new-instance v0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$IvrInfo;

    invoke-direct {v0, p0, p10, p11}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$IvrInfo;-><init>(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;Ljava/util/Set;I)V

    iput-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->h:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$IvrInfo;

    iput-object p12, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->i:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public completedSuccessfully()Z
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->a:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->FINAL:Lru/mail/libverify/api/VerificationApi$VerificationState;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->a:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->SUCCEEDED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    if-ne v0, v1, :cond_1

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->c:Lru/mail/libverify/api/VerificationApi$FailReason;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->e:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getAppEndpoints()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->i:Ljava/util/Map;

    return-object v0
.end method

.method public getIvrInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$IvrInfo;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->h:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$IvrInfo;

    return-object v0
.end method

.method public getModifiedPhoneNumber()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->d:Ljava/lang/String;

    return-object v0
.end method

.method public getReason()Lru/mail/libverify/api/VerificationApi$FailReason;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->c:Lru/mail/libverify/api/VerificationApi$FailReason;

    return-object v0
.end method

.method public getSmsCodeInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->g:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    return-object v0
.end method

.method public getSource()Lru/mail/libverify/api/VerificationApi$VerificationSource;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->b:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    return-object v0
.end method

.method public getState()Lru/mail/libverify/api/VerificationApi$VerificationState;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->a:Lru/mail/libverify/api/VerificationApi$VerificationState;

    return-object v0
.end method

.method public getToken()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->e:Ljava/lang/String;

    return-object v0
.end method

.method public getTokenExpirationTimeoutSec()I
    .locals 1

    iget v0, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->f:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    const/16 v2, 0x27

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "VerificationStateDescriptor{state=\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->a:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", source=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->b:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", reason=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->c:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", modifiedPhoneNumber=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", token=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", smsCodeInfo=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->g:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", ivrInfo=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->h:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$IvrInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", appEndpoints=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->i:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
