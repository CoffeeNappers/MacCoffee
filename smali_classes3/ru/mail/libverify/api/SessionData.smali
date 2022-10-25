.class final Lru/mail/libverify/api/SessionData;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/utils/Gsonable;


# instance fields
.field transient a:I

.field private transient b:Lru/mail/libverify/api/VerificationApi$VerificationState;

.field callFragmentTemplate:[Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field final defaultSmsCodeTemplates:Ljava/util/Map;
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

.field final id:Ljava/lang/String;

.field final rawSmsTexts:Ljava/util/Set;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field reason:Lru/mail/libverify/api/VerificationApi$FailReason;

.field smsCode:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

.field final startTimeStamp:J

.field state:Lru/mail/libverify/api/VerificationApi$VerificationState;

.field final userId:Ljava/lang/String;

.field final userProvidedPhoneNumber:Ljava/lang/String;

.field final verificationService:Ljava/lang/String;

.field verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lru/mail/libverify/api/SessionData;->a:I

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationSource;->UNKNOWN:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    iput-object v0, p0, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->INITIAL:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iput-object v0, p0, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v0, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    iput-object v0, p0, Lru/mail/libverify/api/SessionData;->reason:Lru/mail/libverify/api/VerificationApi$FailReason;

    iput-object v1, p0, Lru/mail/libverify/api/SessionData;->verificationService:Ljava/lang/String;

    iput-object v1, p0, Lru/mail/libverify/api/SessionData;->defaultSmsCodeTemplates:Ljava/util/Map;

    iput-object v1, p0, Lru/mail/libverify/api/SessionData;->userProvidedPhoneNumber:Ljava/lang/String;

    iput-object v1, p0, Lru/mail/libverify/api/SessionData;->userId:Ljava/lang/String;

    iput-object v1, p0, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lru/mail/libverify/api/SessionData;->startTimeStamp:J

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/api/SessionData;->rawSmsTexts:Ljava/util/Set;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lru/mail/libverify/api/SessionData;->a:I

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationSource;->UNKNOWN:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    iput-object v0, p0, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->INITIAL:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iput-object v0, p0, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v0, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    iput-object v0, p0, Lru/mail/libverify/api/SessionData;->reason:Lru/mail/libverify/api/VerificationApi$FailReason;

    iput-object p1, p0, Lru/mail/libverify/api/SessionData;->verificationService:Ljava/lang/String;

    iput-object p2, p0, Lru/mail/libverify/api/SessionData;->userProvidedPhoneNumber:Ljava/lang/String;

    iput-object p3, p0, Lru/mail/libverify/api/SessionData;->userId:Ljava/lang/String;

    iput-object p4, p0, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lru/mail/libverify/api/SessionData;->startTimeStamp:J

    iput-object p5, p0, Lru/mail/libverify/api/SessionData;->defaultSmsCodeTemplates:Ljava/util/Map;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/api/SessionData;->rawSmsTexts:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method final a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$FailReason;)V
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lru/mail/libverify/api/SessionData;->b:Lru/mail/libverify/api/VerificationApi$VerificationState;

    if-ne v0, p1, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->SUSPENDED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    if-ne v0, v1, :cond_0

    iget v0, p0, Lru/mail/libverify/api/SessionData;->a:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lru/mail/libverify/api/SessionData;->a:I

    :cond_0
    :goto_0
    iget-object v0, p0, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iput-object v0, p0, Lru/mail/libverify/api/SessionData;->b:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iput-object p1, p0, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iput-object p2, p0, Lru/mail/libverify/api/SessionData;->reason:Lru/mail/libverify/api/VerificationApi$FailReason;

    const-string/jumbo v0, "SessionData"

    const-string/jumbo v1, "Change session = %s state %s->%s (count %d) reason %s"

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    aput-object v3, v2, v4

    const/4 v3, 0x1

    iget-object v4, p0, Lru/mail/libverify/api/SessionData;->b:Lru/mail/libverify/api/VerificationApi$VerificationState;

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p1, v2, v3

    const/4 v3, 0x3

    iget v4, p0, Lru/mail/libverify/api/SessionData;->a:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    aput-object p2, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_1
    iput v4, p0, Lru/mail/libverify/api/SessionData;->a:I

    goto :goto_0
.end method
