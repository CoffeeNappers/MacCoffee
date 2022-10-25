.class final Lru/mail/libverify/api/af;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/api/ae;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/api/af$c;,
        Lru/mail/libverify/api/af$b;,
        Lru/mail/libverify/api/af$a;
    }
.end annotation


# static fields
.field private static final a:Lru/mail/libverify/api/af$b;


# instance fields
.field private final b:Lru/mail/libverify/api/v;

.field private final c:Lru/mail/libverify/storage/k;

.field private final d:Lru/mail/libverify/api/SessionData;

.field private e:Lru/mail/libverify/sms/e;

.field private f:Lru/mail/libverify/sms/g$b;

.field private g:Ljava/util/concurrent/Future;

.field private h:Ljava/util/concurrent/Future;

.field private i:Ljava/lang/Runnable;

.field private j:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lru/mail/libverify/api/af$c;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lru/mail/libverify/api/af$c;-><init>(B)V

    sput-object v0, Lru/mail/libverify/api/af;->a:Lru/mail/libverify/api/af$b;

    return-void
.end method

.method constructor <init>(Lru/mail/libverify/api/v;Lru/mail/libverify/storage/k;Ljava/lang/String;)V
    .locals 2
    .param p1    # Lru/mail/libverify/api/v;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lru/mail/libverify/api/af$1;

    invoke-direct {v0, p0}, Lru/mail/libverify/api/af$1;-><init>(Lru/mail/libverify/api/af;)V

    iput-object v0, p0, Lru/mail/libverify/api/af;->i:Ljava/lang/Runnable;

    new-instance v0, Lru/mail/libverify/api/af$4;

    invoke-direct {v0, p0}, Lru/mail/libverify/api/af$4;-><init>(Lru/mail/libverify/api/af;)V

    iput-object v0, p0, Lru/mail/libverify/api/af;->j:Ljava/lang/Runnable;

    iput-object p1, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    iput-object p2, p0, Lru/mail/libverify/api/af;->c:Lru/mail/libverify/storage/k;

    const-class v0, Lru/mail/libverify/api/SessionData;

    invoke-static {p3, v0}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/api/SessionData;

    iput-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "data field must be initialized"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method constructor <init>(Lru/mail/libverify/api/v;Lru/mail/libverify/storage/k;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 6
    .param p1    # Lru/mail/libverify/api/v;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lru/mail/libverify/api/v;",
            "Lru/mail/libverify/storage/k;",
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

    new-instance v0, Lru/mail/libverify/api/af$1;

    invoke-direct {v0, p0}, Lru/mail/libverify/api/af$1;-><init>(Lru/mail/libverify/api/af;)V

    iput-object v0, p0, Lru/mail/libverify/api/af;->i:Ljava/lang/Runnable;

    new-instance v0, Lru/mail/libverify/api/af$4;

    invoke-direct {v0, p0}, Lru/mail/libverify/api/af$4;-><init>(Lru/mail/libverify/api/af;)V

    iput-object v0, p0, Lru/mail/libverify/api/af;->j:Ljava/lang/Runnable;

    iput-object p1, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    iput-object p2, p0, Lru/mail/libverify/api/af;->c:Lru/mail/libverify/storage/k;

    new-instance v0, Lru/mail/libverify/api/SessionData;

    sget-object v1, Lru/mail/libverify/api/af;->a:Lru/mail/libverify/api/af$b;

    invoke-interface {v1}, Lru/mail/libverify/api/af$b;->a()Ljava/lang/String;

    move-result-object v4

    move-object v1, p3

    move-object v2, p4

    move-object v3, p5

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Lru/mail/libverify/api/SessionData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    iput-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    return-void
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v0}, Lru/mail/libverify/api/v;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v2, "%s_%s_%s"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v5, v5, Lru/mail/libverify/api/SessionData;->verificationService:Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    aput-object p2, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$VerificationSource;Lru/mail/libverify/api/VerificationApi$FailReason;Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
    .locals 14
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    if-nez p4, :cond_0

    new-instance v1, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-object/from16 v0, p3

    invoke-direct {v1, p1, v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;-><init>(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$FailReason;)V

    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual/range {p4 .. p4}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getModifiedPhoneNumber()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p4 .. p4}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getToken()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p4 .. p4}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getTokenExpirationTime()I

    move-result v7

    invoke-virtual/range {p4 .. p4}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCodeLength()I

    move-result v8

    invoke-virtual/range {p4 .. p4}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCodeType()Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;

    move-result-object v2

    sget-object v3, Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;->NUMERIC:Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;

    if-ne v2, v3, :cond_1

    const/4 v9, 0x1

    :goto_1
    iget-object v2, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v2, v2, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    sget-object v3, Lru/mail/libverify/api/VerificationApi$VerificationSource;->CALL:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v10, v2, Lru/mail/libverify/api/SessionData;->smsCode:Ljava/lang/String;

    :goto_2
    invoke-virtual/range {p4 .. p4}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getSupportedIvrLanguages()Ljava/util/Set;

    move-result-object v11

    invoke-static/range {p4 .. p4}, Lru/mail/libverify/api/af;->b(Lru/mail/libverify/requests/response/VerifyApiResponse;)I

    move-result v12

    invoke-virtual/range {p4 .. p4}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getAppEndpoints()Ljava/util/Map;

    move-result-object v13

    move-object v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    invoke-direct/range {v1 .. v13}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;-><init>(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$VerificationSource;Lru/mail/libverify/api/VerificationApi$FailReason;Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;Ljava/util/Set;ILjava/util/Map;)V

    goto :goto_0

    :cond_1
    const/4 v9, 0x0

    goto :goto_1

    :cond_2
    const/4 v10, 0x0

    goto :goto_2
.end method

.method static synthetic a(Lru/mail/libverify/api/af;Lru/mail/libverify/requests/e;Ljava/util/concurrent/Future;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
    .locals 1

    new-instance v0, Lru/mail/libverify/api/af$9;

    invoke-direct {v0, p0, p2}, Lru/mail/libverify/api/af$9;-><init>(Lru/mail/libverify/api/af;Ljava/util/concurrent/Future;)V

    invoke-direct {p0, p1, v0}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/requests/e;Lru/mail/libverify/api/af$a;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    return-object v0
.end method

.method static synthetic a(Lru/mail/libverify/api/af;Lru/mail/libverify/requests/response/AttemptApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
    .locals 5

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "session with id = %s received AttemptApiResponse response = %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v4, v4, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/AttemptApiResponse;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/AttemptApiResponse;->getFetcherInfo()Lru/mail/libverify/requests/response/FetcherInfo;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/api/v;->a(Lru/mail/libverify/requests/response/FetcherInfo;)V

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/AttemptApiResponse;->getStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    move-result-object v0

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->OK:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    const/4 v1, 0x0

    iput-object v1, v0, Lru/mail/libverify/api/SessionData;->smsCode:Ljava/lang/String;

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->rawSmsTexts:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    :goto_0
    sget-object v0, Lru/mail/libverify/api/af$3;->a:[I

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/AttemptApiResponse;->getStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    move-result-object v1

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v0, p1}, Lru/mail/libverify/api/v;->a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)V

    invoke-static {p1}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    :goto_1
    return-object v0

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    if-nez v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    new-instance v1, Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-direct {v1}, Lru/mail/libverify/requests/response/VerifyApiResponse;-><init>()V

    iput-object v1, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/AttemptApiResponse;->getToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->setToken(Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/AttemptApiResponse;->getAppEndpoints()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->setAppEndpoints(Ljava/util/Map;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/AttemptApiResponse;->getTokenExpirationTime()I

    move-result v1

    invoke-virtual {v0, v1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->setTokenExpirationTime(I)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p1}, Lru/mail/libverify/requests/response/AttemptApiResponse;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lru/mail/libverify/api/af;->u()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    goto :goto_1

    :cond_2
    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->SUCCEEDED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    sget-object v2, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-direct {p0, v0, v1, v2, v3}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$VerificationSource;Lru/mail/libverify/api/VerificationApi$FailReason;Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    goto :goto_1

    :pswitch_2
    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->USER_INPUT:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    if-ne v0, v1, :cond_3

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->WAITING_FOR_SMS_CODE:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    sget-object v2, Lru/mail/libverify/api/VerificationApi$FailReason;->INCORRECT_SMS_CODE:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/AttemptApiResponse;->getDescription()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/api/VerificationApi$FailReason;->description:Ljava/lang/String;

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-direct {p0, v0, v1, v2, v3}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$VerificationSource;Lru/mail/libverify/api/VerificationApi$FailReason;Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    goto :goto_1

    :cond_3
    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->WAITING_FOR_SMS_CODE:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    sget-object v2, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-direct {p0, v0, v1, v2, v3}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$VerificationSource;Lru/mail/libverify/api/VerificationApi$FailReason;Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    goto/16 :goto_1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method static synthetic a(Lru/mail/libverify/api/af;Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
    .locals 1

    invoke-direct {p0, p1}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    return-object v0
.end method

.method private a(Lru/mail/libverify/requests/e;Lru/mail/libverify/api/af$a;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
    .locals 4
    .param p1    # Lru/mail/libverify/requests/e;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/af$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    :try_start_0
    invoke-interface {p2}, Lru/mail/libverify/api/af$a;->a()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "VerificationSession"

    const-string/jumbo v2, "apiMethodToNextState"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lru/mail/libverify/api/af;->u()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v2, "apiMethodToNextState"

    invoke-static {v0, v2, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v0, p1, v1}, Lru/mail/libverify/api/v;->a(Lru/mail/libverify/requests/e;Ljava/lang/Throwable;)V

    instance-of v0, v1, Lru/mail/libverify/utils/ServerException;

    instance-of v1, v1, Ljava/io/IOException;

    if-nez v0, :cond_1

    if-eqz v1, :cond_2

    :cond_1
    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->SUSPENDED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->UNKNOWN:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-static {}, Lru/mail/libverify/api/m;->c()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v2

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-direct {p0, v0, v1, v2, v3}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$VerificationSource;Lru/mail/libverify/api/VerificationApi$FailReason;Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-static {}, Lru/mail/libverify/api/af;->u()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    goto :goto_0

    :catch_1
    move-exception v0

    :goto_1
    const-string/jumbo v1, "VerificationSession"

    const-string/jumbo v2, "apiMethodToNextState"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lru/mail/libverify/api/af;->u()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    goto :goto_0

    :catch_2
    move-exception v0

    const-string/jumbo v1, "VerificationSession"

    const-string/jumbo v2, "apiMethodToNextState"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lru/mail/libverify/api/af;->u()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    goto :goto_0

    :catch_3
    move-exception v0

    goto :goto_1
.end method

.method private static a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
    .locals 4
    .param p0    # Lru/mail/libverify/requests/response/ClientApiResponseBase;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lru/mail/libverify/api/af$3;->a:[I

    invoke-virtual {p0}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->getStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    move-result-object v1

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Undefined response status"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    new-instance v1, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    sget-object v2, Lru/mail/libverify/api/VerificationApi$VerificationState;->FAILED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-virtual {p0}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->getDescription()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lru/mail/libverify/api/m;->a()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v0

    :goto_0
    invoke-direct {v1, v2, v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;-><init>(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$FailReason;)V

    move-object v0, v1

    :goto_1
    return-object v0

    :cond_0
    sget-object v0, Lru/mail/libverify/api/VerificationApi$FailReason;->GENERAL_ERROR:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-virtual {p0}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->getDescription()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lru/mail/libverify/api/VerificationApi$FailReason;->description:Ljava/lang/String;

    goto :goto_0

    :pswitch_1
    new-instance v0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->FAILED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v2, Lru/mail/libverify/api/VerificationApi$FailReason;->INCORRECT_PHONE_NUMBER:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-virtual {p0}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->getDescription()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/api/VerificationApi$FailReason;->description:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;-><init>(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$FailReason;)V

    goto :goto_1

    :pswitch_2
    new-instance v0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->FAILED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v2, Lru/mail/libverify/api/VerificationApi$FailReason;->UNSUPPORTED_NUMBER:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-virtual {p0}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->getDescription()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/api/VerificationApi$FailReason;->description:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;-><init>(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$FailReason;)V

    goto :goto_1

    :pswitch_3
    new-instance v0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->FAILED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v2, Lru/mail/libverify/api/VerificationApi$FailReason;->RATELIMIT:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-virtual {p0}, Lru/mail/libverify/requests/response/ClientApiResponseBase;->getDescription()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/api/VerificationApi$FailReason;->description:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;-><init>(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$FailReason;)V

    goto :goto_1

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method private a(Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
    .locals 6
    .param p1    # Lru/mail/libverify/requests/response/VerifyApiResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x1

    const-string/jumbo v2, "VerificationSession"

    const-string/jumbo v3, "session with id = %s received VerifyApiResponse response = %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v5, v5, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    aput-object v5, v4, v0

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v2, v3, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getFetcherInfo()Lru/mail/libverify/requests/response/FetcherInfo;

    move-result-object v3

    invoke-interface {v2, v3}, Lru/mail/libverify/api/v;->a(Lru/mail/libverify/requests/response/FetcherInfo;)V

    iget-object v2, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iput-object p1, v2, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    move-result-object v2

    sget-object v3, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->VERIFIED:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v2, v2, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    sget-object v3, Lru/mail/libverify/api/VerificationApi$VerificationSource;->UNKNOWN:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    sget-object v3, Lru/mail/libverify/api/VerificationApi$VerificationSource;->ALREADY_VERIFIED:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    iput-object v3, v2, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    :cond_0
    iget-object v2, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v2, v2, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-virtual {v2}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCallFragmentTemplate()[Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-virtual {v3}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCallFragmentTemplate()[Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/api/SessionData;->callFragmentTemplate:[Ljava/lang/String;

    :cond_1
    iget-object v2, p0, Lru/mail/libverify/api/af;->c:Lru/mail/libverify/storage/k;

    invoke-interface {v2}, Lru/mail/libverify/storage/k;->t()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCallTemplates()[Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCallTemplates()[Ljava/lang/String;

    move-result-object v3

    array-length v3, v3

    if-eqz v3, :cond_2

    :try_start_0
    const-string/jumbo v0, "verification_session_last_saved_call_template"

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCallTemplates()[Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v0, v3, v2}, Lru/mail/libverify/api/af;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lru/mail/libverify/utils/json/JsonParseException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    move v0, v1

    :cond_2
    invoke-virtual {p1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getSmsTemplate()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    const-string/jumbo v0, "verification_session_last_saved_sms_template"

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getSmsTemplate()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v0, v3, v2}, Lru/mail/libverify/api/af;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move v0, v1

    :cond_3
    invoke-virtual {p1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCodeType()Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;

    move-result-object v3

    if-eqz v3, :cond_4

    const-string/jumbo v0, "verification_session_last_saved_code_type"

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCodeType()Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;

    move-result-object v3

    invoke-virtual {v3}, Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v0, v3, v2}, Lru/mail/libverify/api/af;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move v0, v1

    :cond_4
    invoke-virtual {p1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCodeLength()I

    move-result v3

    if-eqz v3, :cond_7

    const-string/jumbo v0, "verification_session_last_saved_code_length"

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCodeLength()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v0, v3, v2}, Lru/mail/libverify/api/af;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    if-eqz v1, :cond_5

    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v0}, Lru/mail/libverify/api/v;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    :cond_5
    invoke-direct {p0}, Lru/mail/libverify/api/af;->o()V

    sget-object v0, Lru/mail/libverify/api/af$3;->a:[I

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getStatus()Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    move-result-object v1

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v0, p1}, Lru/mail/libverify/api/v;->a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)V

    invoke-static {p1}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/requests/response/ClientApiResponseBase;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    :goto_2
    return-object v0

    :catch_0
    move-exception v0

    const-string/jumbo v3, "VerificationSession"

    const-string/jumbo v4, "failed to save call templates"

    invoke-static {v3, v4, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :pswitch_0
    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->WAITING_FOR_SMS_CODE:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->UNKNOWN:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    sget-object v2, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-direct {p0, v0, v1, v2, p1}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$VerificationSource;Lru/mail/libverify/api/VerificationApi$FailReason;Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    goto :goto_2

    :pswitch_1
    invoke-virtual {p1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-static {}, Lru/mail/libverify/api/af;->u()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    goto :goto_2

    :cond_6
    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->SUCCEEDED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    sget-object v2, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-direct {p0, v0, v1, v2, p1}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$VerificationSource;Lru/mail/libverify/api/VerificationApi$FailReason;Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    goto :goto_2

    :cond_7
    move v1, v0

    goto :goto_1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private a([Lru/mail/libverify/requests/p$a;)Lru/mail/libverify/requests/p;
    .locals 7

    new-instance v0, Lru/mail/libverify/requests/p;

    iget-object v1, p0, Lru/mail/libverify/api/af;->c:Lru/mail/libverify/storage/k;

    iget-object v2, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v2, v2, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->verificationService:Ljava/lang/String;

    iget-object v4, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v4, v4, Lru/mail/libverify/api/SessionData;->userProvidedPhoneNumber:Ljava/lang/String;

    iget-object v5, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v5, v5, Lru/mail/libverify/api/SessionData;->userId:Ljava/lang/String;

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lru/mail/libverify/requests/p;-><init>(Lru/mail/libverify/storage/k;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Lru/mail/libverify/requests/p$a;)V

    return-object v0
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v0}, Lru/mail/libverify/api/v;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v2, "%s_%s_%s"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v5, v5, Lru/mail/libverify/api/SessionData;->verificationService:Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    aput-object p3, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    return-void
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationSource;)V
    .locals 5
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v2, 0x1

    const/4 v4, 0x0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "empty sms code received"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->rawSmsTexts:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iput-object p3, v0, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->rawSmsTexts:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "save raw sms text %s for further processing"

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->rawSmsTexts:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->o()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->smsCode:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "provided sms code: %s is equal to the last stored one"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v4

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lru/mail/libverify/api/af;->n()Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "received code: %s"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v4

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    iput-object v1, v0, Lru/mail/libverify/api/SessionData;->reason:Lru/mail/libverify/api/VerificationApi$FailReason;

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iput-object p1, v0, Lru/mail/libverify/api/SessionData;->smsCode:Ljava/lang/String;

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iput-object p3, v0, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->rawSmsTexts:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->o()V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->l()V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->v()V

    goto :goto_0
.end method

.method private a(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V
    .locals 10
    .param p1    # Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v9, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    invoke-interface {v0, v3, p1}, Lru/mail/libverify/api/v;->a(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getState()Lru/mail/libverify/api/VerificationApi$VerificationState;

    move-result-object v3

    if-eq v0, v3, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getState()Lru/mail/libverify/api/VerificationApi$VerificationState;

    move-result-object v3

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getReason()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lru/mail/libverify/api/SessionData;->a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$FailReason;)V

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, v3, Lru/mail/libverify/api/SessionData;->startTimeStamp:J

    sub-long/2addr v4, v6

    const-string/jumbo v6, "SessionData"

    const-string/jumbo v7, "Trace time from start = %d, state = %s, hasResponse = %s"

    const/4 v0, 0x3

    new-array v8, v0, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v8, v2

    iget-object v0, v3, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    aput-object v0, v8, v1

    iget-object v0, v3, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    if-eqz v0, :cond_4

    move v0, v1

    :goto_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v8, v9

    invoke-static {v6, v7, v8}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    const-wide/16 v6, 0x0

    cmp-long v0, v4, v6

    if-gez v0, :cond_5

    move v0, v2

    :goto_2
    if-nez v0, :cond_2

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v3, "Mark session = %s data as failed and run control loop"

    new-array v4, v1, [Ljava/lang/Object;

    iget-object v5, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v5, v5, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    aput-object v5, v4, v2

    invoke-static {v0, v3, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    sget-object v3, Lru/mail/libverify/api/VerificationApi$VerificationState;->FAILED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iput-object v3, v0, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-static {}, Lru/mail/libverify/api/m;->c()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v3

    iput-object v3, v0, Lru/mail/libverify/api/SessionData;->reason:Lru/mail/libverify/api/VerificationApi$FailReason;

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, p0, Lru/mail/libverify/api/af;->c:Lru/mail/libverify/storage/k;

    invoke-interface {v3}, Lru/mail/libverify/storage/k;->j()Z

    move-result v3

    iget-object v4, v0, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v5, Lru/mail/libverify/api/VerificationApi$VerificationState;->SUSPENDED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    if-ne v4, v5, :cond_8

    if-eqz v3, :cond_3

    iget v0, v0, Lru/mail/libverify/api/SessionData;->a:I

    const/16 v3, 0xa

    if-le v0, v3, :cond_8

    :cond_3
    move v0, v2

    :goto_3
    if-nez v0, :cond_9

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v3, "Stop control loop for session = %s"

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v4, v4, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_0

    :cond_4
    move v0, v2

    goto :goto_1

    :cond_5
    iget-object v0, v3, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v6, Lru/mail/libverify/api/VerificationApi$VerificationState;->SUSPENDED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    if-ne v0, v6, :cond_7

    iget-object v0, v3, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    if-nez v0, :cond_6

    const-wide/16 v6, 0x7530

    cmp-long v0, v4, v6

    if-lez v0, :cond_6

    move v0, v2

    goto :goto_2

    :cond_6
    iget-object v0, v3, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    if-eqz v0, :cond_7

    const-wide/32 v6, 0x36ee80

    cmp-long v0, v4, v6

    if-lez v0, :cond_7

    move v0, v2

    goto :goto_2

    :cond_7
    move v0, v1

    goto :goto_2

    :cond_8
    move v0, v1

    goto :goto_3

    :cond_9
    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v0, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v4, Lru/mail/libverify/api/VerificationApi$VerificationState;->SUSPENDED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    if-ne v3, v4, :cond_a

    iget v3, v0, Lru/mail/libverify/api/SessionData;->a:I

    mul-int/lit16 v3, v3, 0x12c

    iget v0, v0, Lru/mail/libverify/api/SessionData;->a:I

    mul-int/2addr v0, v3

    :goto_4
    const-string/jumbo v3, "VerificationSession"

    const-string/jumbo v4, "Schedule control loop for session = %s delay %d"

    new-array v5, v9, [Ljava/lang/Object;

    iget-object v6, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v6, v6, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    aput-object v6, v5, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v5, v1

    invoke-static {v3, v4, v5}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v1}, Lru/mail/libverify/api/v;->a()Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lru/mail/libverify/api/af;->i:Ljava/lang/Runnable;

    int-to-long v4, v0

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0

    :cond_a
    move v0, v2

    goto :goto_4
.end method

.method static synthetic a(Lru/mail/libverify/api/af;)V
    .locals 0

    invoke-direct {p0}, Lru/mail/libverify/api/af;->v()V

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/api/af;Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationSource;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lru/mail/libverify/api/af;->a(Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationSource;)V

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/api/af;Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V
    .locals 0

    invoke-direct {p0, p1}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/api/af;Ljava/lang/String;Z)Z
    .locals 1

    invoke-direct {p0, p1, p2}, Lru/mail/libverify/api/af;->b(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static b(Lru/mail/libverify/requests/response/VerifyApiResponse;)I
    .locals 1
    .param p0    # Lru/mail/libverify/requests/response/VerifyApiResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getIvrTimeoutSec()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getIvrTimeoutSec()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    :cond_0
    const/16 v0, 0x1e

    goto :goto_0
.end method

.method static synthetic b(Lru/mail/libverify/api/af;)Lru/mail/libverify/api/SessionData;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    return-object v0
.end method

.method static synthetic b(Lru/mail/libverify/api/af;Lru/mail/libverify/requests/e;Ljava/util/concurrent/Future;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
    .locals 1

    new-instance v0, Lru/mail/libverify/api/af$11;

    invoke-direct {v0, p0, p2}, Lru/mail/libverify/api/af$11;-><init>(Lru/mail/libverify/api/af;Ljava/util/concurrent/Future;)V

    invoke-direct {p0, p1, v0}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/requests/e;Lru/mail/libverify/api/af$a;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    return-object v0
.end method

.method private b(Ljava/lang/String;Z)Z
    .locals 5
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    const/4 v0, 0x1

    const-string/jumbo v2, "VerificationSession"

    const-string/jumbo v3, "try to verify phone %s"

    new-array v4, v0, [Ljava/lang/Object;

    aput-object p1, v4, v1

    invoke-static {v2, v3, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->r()Lru/mail/libverify/api/h$a;

    move-result-object v2

    invoke-static {p1, v2}, Lru/mail/libverify/api/h;->c(Ljava/lang/String;Lru/mail/libverify/api/h$a;)Z

    move-result v2

    if-eqz v2, :cond_1

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->CALL:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-direct {p0, p1, p1, v1}, Lru/mail/libverify/api/af;->a(Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationSource;)V

    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-direct {p0}, Lru/mail/libverify/api/af;->s()Lru/mail/libverify/api/h$a;

    move-result-object v2

    invoke-static {p1, v2}, Lru/mail/libverify/api/h;->a(Ljava/lang/String;Lru/mail/libverify/api/h$a;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    :goto_1
    if-nez v0, :cond_2

    if-eqz p2, :cond_0

    :cond_2
    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->CALL:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-direct {p0, v2, p1, v1}, Lru/mail/libverify/api/af;->a(Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationSource;)V

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_1
.end method

.method static synthetic c(Lru/mail/libverify/api/af;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
    .locals 1

    invoke-direct {p0}, Lru/mail/libverify/api/af;->y()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    return-object v0
.end method

.method static synthetic d(Lru/mail/libverify/api/af;)Lru/mail/libverify/api/h$a;
    .locals 1

    invoke-direct {p0}, Lru/mail/libverify/api/af;->t()Lru/mail/libverify/api/h$a;

    move-result-object v0

    return-object v0
.end method

.method static synthetic e(Lru/mail/libverify/api/af;)Lru/mail/libverify/api/v;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    return-object v0
.end method

.method static synthetic f(Lru/mail/libverify/api/af;)Ljava/util/concurrent/Future;
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lru/mail/libverify/api/af;->g:Ljava/util/concurrent/Future;

    return-object v0
.end method

.method static synthetic g(Lru/mail/libverify/api/af;)Ljava/util/concurrent/Future;
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lru/mail/libverify/api/af;->h:Ljava/util/concurrent/Future;

    return-object v0
.end method

.method private l()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/af;->g:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "cancel main request"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->g:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lru/mail/libverify/api/af;->g:Ljava/util/concurrent/Future;

    :cond_0
    return-void
.end method

.method private m()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/af;->h:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "cancel ivr request"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->h:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lru/mail/libverify/api/af;->h:Ljava/util/concurrent/Future;

    :cond_0
    return-void
.end method

.method private n()Z
    .locals 5

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v2, v3, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v4, Lru/mail/libverify/api/VerificationApi$VerificationState;->FINAL:Lru/mail/libverify/api/VerificationApi$VerificationState;

    if-eq v2, v4, :cond_0

    iget-object v2, v3, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v4, Lru/mail/libverify/api/VerificationApi$VerificationState;->SUCCEEDED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    if-ne v2, v4, :cond_1

    :cond_0
    move v2, v0

    :goto_0
    if-nez v2, :cond_3

    iget-object v2, v3, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v3, Lru/mail/libverify/api/VerificationApi$VerificationState;->FAILED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    if-ne v2, v3, :cond_2

    move v2, v0

    :goto_1
    if-eqz v2, :cond_5

    const-string/jumbo v1, "VerificationSession"

    const-string/jumbo v2, "failed to modify session state after completion"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2
    return v0

    :cond_1
    move v2, v1

    goto :goto_0

    :cond_2
    move v2, v1

    goto :goto_1

    :cond_3
    iget-object v2, v3, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    if-eqz v2, :cond_4

    iget-object v2, v3, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-virtual {v2}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getToken()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    move v2, v0

    goto :goto_1

    :cond_4
    move v2, v1

    goto :goto_1

    :cond_5
    move v0, v1

    goto :goto_2
.end method

.method private o()V
    .locals 6

    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    iget-object v2, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v2, v2, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    iget-object v4, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v4, v4, Lru/mail/libverify/api/SessionData;->reason:Lru/mail/libverify/api/VerificationApi$FailReason;

    iget-object v5, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v5, v5, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-direct {p0, v2, v3, v4, v5}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$VerificationSource;Lru/mail/libverify/api/VerificationApi$FailReason;Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/v;->a(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    return-void
.end method

.method private p()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/af;->f:Lru/mail/libverify/sms/g$b;

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    new-instance v0, Lru/mail/libverify/api/af$5;

    invoke-direct {v0, p0}, Lru/mail/libverify/api/af$5;-><init>(Lru/mail/libverify/api/af;)V

    iput-object v0, p0, Lru/mail/libverify/api/af;->f:Lru/mail/libverify/sms/g$b;

    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v0}, Lru/mail/libverify/api/v;->c()Lru/mail/libverify/sms/g;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/af;->f:Lru/mail/libverify/sms/g$b;

    invoke-interface {v0, v1}, Lru/mail/libverify/sms/g;->a(Lru/mail/libverify/sms/g$b;)V

    goto :goto_0
.end method

.method private q()V
    .locals 8

    iget-object v0, p0, Lru/mail/libverify/api/af;->e:Lru/mail/libverify/sms/e;

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v0}, Lru/mail/libverify/api/v;->b()Lru/mail/libverify/sms/k;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/sms/k;->a()Lru/mail/libverify/sms/i;

    move-result-object v1

    new-instance v0, Lru/mail/libverify/api/af$7;

    invoke-direct {v0, p0}, Lru/mail/libverify/api/af$7;-><init>(Lru/mail/libverify/api/af;)V

    iput-object v0, v1, Lru/mail/libverify/sms/i;->c:Lru/mail/libverify/sms/k$b;

    iget-object v3, v1, Lru/mail/libverify/sms/i;->b:Lru/mail/libverify/sms/k$f;

    iget-object v4, v1, Lru/mail/libverify/sms/i;->c:Lru/mail/libverify/sms/k$b;

    iget-object v6, v1, Lru/mail/libverify/sms/i;->d:Lru/mail/libverify/sms/k$d;

    iget-object v2, v1, Lru/mail/libverify/sms/i;->e:Lru/mail/libverify/sms/k$a;

    iget-object v7, v1, Lru/mail/libverify/sms/i;->f:Lru/mail/libverify/sms/k$e;

    iget-object v5, v1, Lru/mail/libverify/sms/i;->g:Lru/mail/libverify/sms/k$c;

    new-instance v0, Lru/mail/libverify/sms/i$1;

    invoke-direct/range {v0 .. v7}, Lru/mail/libverify/sms/i$1;-><init>(Lru/mail/libverify/sms/i;Lru/mail/libverify/sms/k$a;Lru/mail/libverify/sms/k$f;Lru/mail/libverify/sms/k$b;Lru/mail/libverify/sms/k$c;Lru/mail/libverify/sms/k$d;Lru/mail/libverify/sms/k$e;)V

    iget-object v2, v1, Lru/mail/libverify/sms/i;->a:Lru/mail/libverify/sms/j;

    iget-object v3, v1, Lru/mail/libverify/sms/i;->h:Ljava/util/regex/Pattern;

    iget-object v1, v1, Lru/mail/libverify/sms/i;->i:Ljava/util/regex/Pattern;

    invoke-interface {v2, v3, v1, v0}, Lru/mail/libverify/sms/j;->a(Ljava/util/regex/Pattern;Ljava/util/regex/Pattern;Lru/mail/libverify/sms/k$f;)Lru/mail/libverify/sms/e;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/api/af;->e:Lru/mail/libverify/sms/e;

    goto :goto_0
.end method

.method private r()Lru/mail/libverify/api/h$a;
    .locals 2

    new-instance v0, Lru/mail/libverify/api/h$a;

    invoke-direct {v0}, Lru/mail/libverify/api/h$a;-><init>()V

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->callFragmentTemplate:[Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->callFragmentTemplate:[Ljava/lang/String;

    array-length v1, v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->callFragmentTemplate:[Ljava/lang/String;

    iput-object v1, v0, Lru/mail/libverify/api/h$a;->a:[Ljava/lang/String;

    :cond_0
    return-object v0
.end method

.method private s()Lru/mail/libverify/api/h$a;
    .locals 5

    const/4 v1, 0x0

    new-instance v2, Lru/mail/libverify/api/h$a;

    invoke-direct {v2}, Lru/mail/libverify/api/h$a;-><init>()V

    sget-object v0, Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;->NUMERIC:Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;

    iput-object v0, v2, Lru/mail/libverify/api/h$a;->d:Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCallTemplates()[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCallTemplates()[Ljava/lang/String;

    move-result-object v0

    array-length v0, v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCallTemplates()[Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lru/mail/libverify/api/h$a;->b:[Ljava/lang/String;

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCodeLength()I

    move-result v0

    iput v0, v2, Lru/mail/libverify/api/h$a;->c:I

    :cond_0
    :goto_0
    move-object v0, v2

    :goto_1
    return-object v0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v0}, Lru/mail/libverify/api/v;->d()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v3, "verification_session_last_saved_call_template"

    invoke-interface {v0, v3}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v2, "getCallParseData - can\'t parse incoming call without pattern"

    invoke-static {v0, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v1

    goto :goto_1

    :cond_2
    :try_start_0
    const-class v3, [Ljava/lang/String;

    invoke-static {v0, v3}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, v2, Lru/mail/libverify/api/h$a;->b:[Ljava/lang/String;
    :try_end_0
    .catch Lru/mail/libverify/utils/json/JsonParseException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    iget-object v0, v2, Lru/mail/libverify/api/h$a;->b:[Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v0, v2, Lru/mail/libverify/api/h$a;->b:[Ljava/lang/String;

    array-length v0, v0

    if-nez v0, :cond_4

    :cond_3
    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v2, "getCallParseData - wrong saved pattern detected"

    invoke-static {v0, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v1

    goto :goto_1

    :catch_0
    move-exception v0

    const-string/jumbo v3, "VerificationSession"

    const-string/jumbo v4, "filed to read saved templates"

    invoke-static {v3, v4, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_4
    const-string/jumbo v0, "verification_session_last_saved_code_length"

    iget-object v1, p0, Lru/mail/libverify/api/af;->c:Lru/mail/libverify/storage/k;

    invoke-interface {v1}, Lru/mail/libverify/storage/k;->s()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lru/mail/libverify/api/af;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    :try_start_1
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v2, Lru/mail/libverify/api/h$a;->c:I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method private t()Lru/mail/libverify/api/h$a;
    .locals 7

    const/4 v1, 0x0

    const/4 v6, 0x1

    const/4 v5, 0x0

    new-instance v2, Lru/mail/libverify/api/h$a;

    invoke-direct {v2}, Lru/mail/libverify/api/h$a;-><init>()V

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getSmsTemplate()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    new-array v0, v6, [Ljava/lang/String;

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getSmsTemplate()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v5

    iput-object v0, v2, Lru/mail/libverify/api/h$a;->b:[Ljava/lang/String;

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCodeLength()I

    move-result v0

    iput v0, v2, Lru/mail/libverify/api/h$a;->c:I

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getCodeType()Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;

    move-result-object v0

    iput-object v0, v2, Lru/mail/libverify/api/h$a;->d:Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;

    :cond_0
    :goto_0
    move-object v1, v2

    :goto_1
    return-object v1

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/af;->c:Lru/mail/libverify/storage/k;

    invoke-interface {v0}, Lru/mail/libverify/storage/k;->s()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v0, "verification_session_last_saved_sms_template"

    invoke-direct {p0, v0, v3}, Lru/mail/libverify/api/af;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v4, "getSmsCodeParseData - there is no saved pattern. try to get default one."

    invoke-static {v0, v4}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v4, v0, Lru/mail/libverify/api/SessionData;->defaultSmsCodeTemplates:Ljava/util/Map;

    if-nez v4, :cond_2

    move-object v0, v1

    :goto_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v2, "getSmsCodeParseData - can\'t parse incoming sms without pattern"

    invoke-static {v0, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->defaultSmsCodeTemplates:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_2

    :cond_3
    new-array v1, v6, [Ljava/lang/String;

    aput-object v0, v1, v5

    iput-object v1, v2, Lru/mail/libverify/api/h$a;->b:[Ljava/lang/String;

    const-string/jumbo v0, "verification_session_last_saved_code_type"

    invoke-direct {p0, v0, v3}, Lru/mail/libverify/api/af;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-static {v0}, Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;->valueOf(Ljava/lang/String;)Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;

    move-result-object v0

    iput-object v0, v2, Lru/mail/libverify/api/h$a;->d:Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;

    :cond_4
    const-string/jumbo v0, "verification_session_last_saved_code_length"

    invoke-direct {p0, v0, v3}, Lru/mail/libverify/api/af;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v2, Lru/mail/libverify/api/h$a;->c:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private static u()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
    .locals 3

    new-instance v0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->FAILED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-static {}, Lru/mail/libverify/api/m;->a()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;-><init>(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$FailReason;)V

    return-object v0
.end method

.method private v()V
    .locals 8

    const/4 v3, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v1, 0x0

    sget-object v0, Lru/mail/libverify/api/af$3;->b:[I

    iget-object v2, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v2, v2, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-virtual {v2}, Lru/mail/libverify/api/VerificationApi$VerificationState;->ordinal()I

    move-result v2

    aget v0, v0, v2

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Undefined state for current session"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    new-instance v1, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->VERIFYING_PHONE_NUMBER:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-direct {v1, v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;-><init>(Lru/mail/libverify/api/VerificationApi$VerificationState;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v0}, Lru/mail/libverify/api/v;->a()Landroid/os/Handler;

    move-result-object v0

    iget-object v2, p0, Lru/mail/libverify/api/af;->j:Ljava/lang/Runnable;

    const-wide/32 v4, 0x9c40

    invoke-virtual {v0, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    :goto_0
    invoke-direct {p0, v1}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    return-void

    :pswitch_1
    invoke-direct {p0}, Lru/mail/libverify/api/af;->q()V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->p()V

    iget-object v0, p0, Lru/mail/libverify/api/af;->c:Lru/mail/libverify/storage/k;

    invoke-interface {v0}, Lru/mail/libverify/storage/k;->j()Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "handleVerifyState start disallowed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->y()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    :goto_1
    move-object v1, v0

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lru/mail/libverify/api/af;->x()Z

    move-result v0

    if-eqz v0, :cond_2

    move-object v0, v1

    goto :goto_1

    :cond_2
    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v2, "handleVerifyState start request"

    invoke-static {v0, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    iget-object v2, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v2, v2, Lru/mail/libverify/api/SessionData;->userProvidedPhoneNumber:Ljava/lang/String;

    invoke-interface {v0, v2}, Lru/mail/libverify/api/v;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x3

    new-array v0, v0, [Lru/mail/libverify/requests/p$a;

    sget-object v2, Lru/mail/libverify/requests/p$a;->SMS:Lru/mail/libverify/requests/p$a;

    aput-object v2, v0, v6

    sget-object v2, Lru/mail/libverify/requests/p$a;->PUSH:Lru/mail/libverify/requests/p$a;

    aput-object v2, v0, v7

    sget-object v2, Lru/mail/libverify/requests/p$a;->CALL:Lru/mail/libverify/requests/p$a;

    aput-object v2, v0, v3

    :goto_2
    invoke-direct {p0, v0}, Lru/mail/libverify/api/af;->a([Lru/mail/libverify/requests/p$a;)Lru/mail/libverify/requests/p;

    move-result-object v0

    iget-object v2, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v2}, Lru/mail/libverify/api/v;->e()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    new-instance v3, Lru/mail/libverify/api/af$2;

    invoke-direct {v3, p0, v0}, Lru/mail/libverify/api/af$2;-><init>(Lru/mail/libverify/api/af;Lru/mail/libverify/requests/p;)V

    invoke-virtual {v0, v2, v3}, Lru/mail/libverify/requests/p;->a(Ljava/util/concurrent/ExecutorService;Lru/mail/libverify/requests/i$b;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/api/af;->g:Ljava/util/concurrent/Future;

    move-object v0, v1

    goto :goto_1

    :cond_3
    new-array v0, v3, [Lru/mail/libverify/requests/p$a;

    sget-object v2, Lru/mail/libverify/requests/p$a;->SMS:Lru/mail/libverify/requests/p$a;

    aput-object v2, v0, v6

    sget-object v2, Lru/mail/libverify/requests/p$a;->PUSH:Lru/mail/libverify/requests/p$a;

    aput-object v2, v0, v7

    goto :goto_2

    :pswitch_2
    invoke-direct {p0}, Lru/mail/libverify/api/af;->q()V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->p()V

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    if-nez v0, :cond_5

    new-instance v1, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->VERIFYING_PHONE_NUMBER:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-direct {v1, v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;-><init>(Lru/mail/libverify/api/VerificationApi$VerificationState;)V

    :cond_4
    :goto_3
    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v2, Lru/mail/libverify/api/VerificationApi$VerificationState;->WAITING_FOR_SMS_CODE:Lru/mail/libverify/api/VerificationApi$VerificationState;

    if-ne v0, v2, :cond_0

    invoke-direct {p0}, Lru/mail/libverify/api/af;->w()V

    goto/16 :goto_0

    :cond_5
    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->SUCCEEDED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    sget-object v2, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-direct {p0, v0, v1, v2, v3}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$VerificationSource;Lru/mail/libverify/api/VerificationApi$FailReason;Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v1

    goto :goto_3

    :cond_6
    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->smsCode:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->VERIFYING_SMS_CODE:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    sget-object v2, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-direct {p0, v0, v1, v2, v3}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$VerificationSource;Lru/mail/libverify/api/VerificationApi$FailReason;Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v1

    goto :goto_3

    :cond_7
    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->rawSmsTexts:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->rawSmsTexts:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v2, "verifyRawText %s"

    new-array v3, v7, [Ljava/lang/Object;

    iget-object v4, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v4, v4, Lru/mail/libverify/api/SessionData;->rawSmsTexts:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v0, v2, v3}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->rawSmsTexts:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v3, Lru/mail/libverify/api/af$3;->c:[I

    iget-object v4, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v4, v4, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-virtual {v4}, Lru/mail/libverify/api/VerificationApi$VerificationSource;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_1

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v3, "Illegal state %s for a sms code restoring from a raw text"

    new-array v4, v7, [Ljava/lang/Object;

    iget-object v5, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v5, v5, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    aput-object v5, v4, v6

    invoke-static {v0, v3, v4}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    move-object v0, v1

    :cond_9
    :goto_4
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_8

    iget-object v2, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v2, v2, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-direct {p0, v0, v1, v2}, Lru/mail/libverify/api/af;->a(Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationSource;)V

    goto/16 :goto_3

    :pswitch_3
    invoke-direct {p0}, Lru/mail/libverify/api/af;->t()Lru/mail/libverify/api/h$a;

    move-result-object v3

    invoke-static {v0, v3}, Lru/mail/libverify/api/h;->a(Ljava/lang/String;Lru/mail/libverify/api/h$a;)Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :pswitch_4
    invoke-direct {p0}, Lru/mail/libverify/api/af;->r()Lru/mail/libverify/api/h$a;

    move-result-object v3

    invoke-static {v0, v3}, Lru/mail/libverify/api/h;->c(Ljava/lang/String;Lru/mail/libverify/api/h$a;)Z

    move-result v3

    if-nez v3, :cond_9

    invoke-direct {p0}, Lru/mail/libverify/api/af;->s()Lru/mail/libverify/api/h$a;

    move-result-object v3

    invoke-static {v0, v3}, Lru/mail/libverify/api/h;->a(Ljava/lang/String;Lru/mail/libverify/api/h$a;)Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :cond_a
    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->callFragmentTemplate:[Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->callFragmentTemplate:[Ljava/lang/String;

    if-nez v0, :cond_b

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v2, "skip checking last calls (no templates)"

    invoke-static {v0, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    :cond_b
    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    iget-object v2, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v2, v2, Lru/mail/libverify/api/SessionData;->userProvidedPhoneNumber:Ljava/lang/String;

    invoke-interface {v0, v2}, Lru/mail/libverify/api/v;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v2, "skip checking last calls (call is not possible)"

    invoke-static {v0, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    :cond_c
    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v2, "start checking last calls"

    invoke-static {v0, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v0}, Lru/mail/libverify/api/v;->c()Lru/mail/libverify/sms/g;

    move-result-object v0

    new-instance v2, Lru/mail/libverify/api/af$6;

    invoke-direct {v2, p0}, Lru/mail/libverify/api/af$6;-><init>(Lru/mail/libverify/api/af;)V

    invoke-interface {v0, v2}, Lru/mail/libverify/sms/g;->a(Lru/mail/libverify/sms/g$a;)V

    goto/16 :goto_3

    :pswitch_5
    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/api/af;->c:Lru/mail/libverify/storage/k;

    invoke-interface {v0}, Lru/mail/libverify/storage/k;->j()Z

    move-result v0

    if-nez v0, :cond_d

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "handleAttemptState start disallowed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->SUSPENDED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->UNKNOWN:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-static {}, Lru/mail/libverify/api/m;->b()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v2

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-direct {p0, v0, v1, v2, v3}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$VerificationSource;Lru/mail/libverify/api/VerificationApi$FailReason;Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v1

    goto/16 :goto_0

    :cond_d
    invoke-direct {p0}, Lru/mail/libverify/api/af;->x()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->smsCode:Ljava/lang/String;

    if-nez v0, :cond_f

    :cond_e
    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v2, "handleAttemptState not enough data to call attempt api method"

    invoke-static {v0, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception v0

    invoke-static {}, Lru/mail/libverify/api/af;->u()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v1

    goto/16 :goto_0

    :cond_f
    :try_start_1
    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v2, "handleAttemptState start request"

    invoke-static {v0, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    iget-object v2, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v2, v2, Lru/mail/libverify/api/SessionData;->smsCode:Ljava/lang/String;

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    new-instance v4, Lru/mail/libverify/requests/d;

    iget-object v5, p0, Lru/mail/libverify/api/af;->c:Lru/mail/libverify/storage/k;

    invoke-virtual {v0}, Lru/mail/libverify/requests/response/VerifyApiResponse;->getVerificationUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v5, v0, v2, v3}, Lru/mail/libverify/requests/d;-><init>(Lru/mail/libverify/storage/k;Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationSource;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v0}, Lru/mail/libverify/api/v;->e()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v2, Lru/mail/libverify/api/af$8;

    invoke-direct {v2, p0, v4}, Lru/mail/libverify/api/af$8;-><init>(Lru/mail/libverify/api/af;Lru/mail/libverify/requests/d;)V

    invoke-virtual {v4, v0, v2}, Lru/mail/libverify/requests/d;->a(Ljava/util/concurrent/ExecutorService;Lru/mail/libverify/requests/i$b;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/api/af;->g:Ljava/util/concurrent/Future;
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    :pswitch_6
    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->FINAL:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    iget-object v2, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v2, v2, Lru/mail/libverify/api/SessionData;->reason:Lru/mail/libverify/api/VerificationApi$FailReason;

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-direct {p0, v0, v1, v2, v3}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$VerificationSource;Lru/mail/libverify/api/VerificationApi$FailReason;Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v1

    goto/16 :goto_0

    :pswitch_7
    invoke-direct {p0}, Lru/mail/libverify/api/af;->l()V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->w()V

    iget-object v0, p0, Lru/mail/libverify/api/af;->e:Lru/mail/libverify/sms/e;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lru/mail/libverify/api/af;->e:Lru/mail/libverify/sms/e;

    invoke-interface {v0}, Lru/mail/libverify/sms/e;->a()V

    iput-object v1, p0, Lru/mail/libverify/api/af;->e:Lru/mail/libverify/sms/e;

    :cond_10
    iget-object v0, p0, Lru/mail/libverify/api/af;->f:Lru/mail/libverify/sms/g$b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v0}, Lru/mail/libverify/api/v;->c()Lru/mail/libverify/sms/g;

    move-result-object v0

    iget-object v2, p0, Lru/mail/libverify/api/af;->f:Lru/mail/libverify/sms/g$b;

    invoke-interface {v0, v2}, Lru/mail/libverify/sms/g;->b(Lru/mail/libverify/sms/g$b;)V

    iput-object v1, p0, Lru/mail/libverify/api/af;->f:Lru/mail/libverify/sms/g$b;

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_5
        :pswitch_6
        :pswitch_6
        :pswitch_7
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private w()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v0}, Lru/mail/libverify/api/v;->a()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/af;->j:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method private x()Z
    .locals 3

    const/4 v0, 0x1

    iget-object v1, p0, Lru/mail/libverify/api/af;->g:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lru/mail/libverify/api/af;->g:Ljava/util/concurrent/Future;

    invoke-interface {v1}, Ljava/util/concurrent/Future;->isDone()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lru/mail/libverify/api/af;->g:Ljava/util/concurrent/Future;

    invoke-interface {v1}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "VerificationSession"

    const-string/jumbo v2, "hasRunningRequest request has been already started"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return v0

    :cond_0
    const-string/jumbo v1, "VerificationSession"

    const-string/jumbo v2, "hasRunningRequest cancel previous request"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lru/mail/libverify/api/af;->g:Ljava/util/concurrent/Future;

    invoke-interface {v1, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private y()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
    .locals 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationState;->FAILED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->UNKNOWN:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-static {}, Lru/mail/libverify/api/m;->b()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v2

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-direct {p0, v0, v1, v2, v3}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$VerificationSource;Lru/mail/libverify/api/VerificationApi$FailReason;Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final a()V
    .locals 0

    invoke-direct {p0}, Lru/mail/libverify/api/af;->v()V

    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->USER_INPUT:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-direct {p0, p1, v0, v1}, Lru/mail/libverify/api/af;->a(Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationSource;)V

    return-void
.end method

.method public final a(Ljava/lang/String;Z)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "verifySmsText smsText can\'t be empty"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0}, Lru/mail/libverify/api/af;->t()Lru/mail/libverify/api/h$a;

    move-result-object v0

    invoke-static {p1, v0}, Lru/mail/libverify/api/h;->a(Ljava/lang/String;Lru/mail/libverify/api/h$a;)Ljava/lang/String;

    move-result-object v1

    if-eqz p2, :cond_1

    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationSource;->APPLICATION_LOCAL:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    :goto_1
    invoke-direct {p0, v1, p1, v0}, Lru/mail/libverify/api/af;->a(Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationSource;)V

    goto :goto_0

    :cond_1
    sget-object v0, Lru/mail/libverify/api/VerificationApi$VerificationSource;->SMS:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    goto :goto_1
.end method

.method public final a(Lru/mail/libverify/api/VerificationApi$IvrStateListener;)V
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "session %s ivr call requested"

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->WAITING_FOR_SMS_CODE:Lru/mail/libverify/api/VerificationApi$VerificationState;

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lru/mail/libverify/api/af;->c:Lru/mail/libverify/storage/k;

    invoke-interface {v0}, Lru/mail/libverify/storage/k;->j()Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "ivr request start disallowed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_0

    invoke-static {}, Lru/mail/libverify/api/m;->b()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v0

    invoke-interface {p1, v0}, Lru/mail/libverify/api/VerificationApi$IvrStateListener;->onRequestExecuted(Lru/mail/libverify/api/VerificationApi$FailReason;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-direct {p0}, Lru/mail/libverify/api/af;->m()V

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "start ivr request"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    new-array v0, v5, [Lru/mail/libverify/requests/p$a;

    sget-object v1, Lru/mail/libverify/requests/p$a;->IVR:Lru/mail/libverify/requests/p$a;

    aput-object v1, v0, v4

    invoke-direct {p0, v0}, Lru/mail/libverify/api/af;->a([Lru/mail/libverify/requests/p$a;)Lru/mail/libverify/requests/p;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/af;->b:Lru/mail/libverify/api/v;

    invoke-interface {v1}, Lru/mail/libverify/api/v;->e()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lru/mail/libverify/api/af$10;

    invoke-direct {v2, p0, v0, p1}, Lru/mail/libverify/api/af$10;-><init>(Lru/mail/libverify/api/af;Lru/mail/libverify/requests/p;Lru/mail/libverify/api/VerificationApi$IvrStateListener;)V

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/requests/p;->a(Ljava/util/concurrent/ExecutorService;Lru/mail/libverify/requests/i$b;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/api/af;->h:Ljava/util/concurrent/Future;

    goto :goto_0

    :cond_2
    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "session %s wrong state for ivr call detected"

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    invoke-static {}, Lru/mail/libverify/api/m;->a()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v0

    invoke-interface {p1, v0}, Lru/mail/libverify/api/VerificationApi$IvrStateListener;->onRequestExecuted(Lru/mail/libverify/api/VerificationApi$FailReason;)V

    goto :goto_0
.end method

.method public final a(Lru/mail/libverify/requests/response/CallInfo;)V
    .locals 5
    .param p1    # Lru/mail/libverify/requests/response/CallInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v2, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/CallInfo;->getHashedSessionId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    invoke-static {v0}, Lru/mail/libverify/utils/m;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/CallInfo;->getHashedSessionId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "call info update %s discarded (%s)"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v3

    const-string/jumbo v3, "session id not equal"

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->callFragmentTemplate:[Ljava/lang/String;

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/CallInfo;->getCallFragmentTemplate()[Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "call info update %s discarded (%s)"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v3

    const-string/jumbo v3, "equal to current"

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    invoke-virtual {p1}, Lru/mail/libverify/requests/response/CallInfo;->getCallFragmentTemplate()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lru/mail/libverify/api/SessionData;->callFragmentTemplate:[Ljava/lang/String;

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "call info updated %s"

    new-array v2, v4, [Ljava/lang/Object;

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->o()V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->v()V

    goto :goto_0
.end method

.method public final b()V
    .locals 3

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "cancel session"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->l()V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->m()V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->w()V

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->FINAL:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v2, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/api/SessionData;->a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$FailReason;)V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->v()V

    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lru/mail/libverify/api/af;->b(Ljava/lang/String;Z)Z

    return-void
.end method

.method public final c()V
    .locals 6

    const/4 v5, 0x0

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "session %s new sms code requested"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v4, v4, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->n()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iput-object v5, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iput-object v5, v0, Lru/mail/libverify/api/SessionData;->callFragmentTemplate:[Ljava/lang/String;

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->UNKNOWN:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    iput-object v1, v0, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iput-object v5, v0, Lru/mail/libverify/api/SessionData;->smsCode:Ljava/lang/String;

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->rawSmsTexts:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->o()V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->v()V

    goto :goto_0
.end method

.method public final d()V
    .locals 5

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "session %s reset verification error"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v4, v4, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->WAITING_FOR_SMS_CODE:Lru/mail/libverify/api/VerificationApi$VerificationState;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->reason:Lru/mail/libverify/api/VerificationApi$FailReason;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->INCORRECT_SMS_CODE:Lru/mail/libverify/api/VerificationApi$FailReason;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    iput-object v1, v0, Lru/mail/libverify/api/SessionData;->reason:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-direct {p0}, Lru/mail/libverify/api/af;->o()V

    :cond_0
    return-void
.end method

.method public final e()V
    .locals 6

    const/4 v5, 0x0

    const-string/jumbo v0, "VerificationSession"

    const-string/jumbo v1, "session %s verified from other instance"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v4, v4, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->n()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iput-object v5, v0, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iput-object v5, v0, Lru/mail/libverify/api/SessionData;->callFragmentTemplate:[Ljava/lang/String;

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->APPLICATION_EXTERNAL:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    iput-object v1, v0, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-direct {p0}, Lru/mail/libverify/api/af;->o()V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->v()V

    goto :goto_0
.end method

.method public final f()V
    .locals 0

    invoke-direct {p0}, Lru/mail/libverify/api/af;->l()V

    invoke-direct {p0}, Lru/mail/libverify/api/af;->v()V

    return-void
.end method

.method public final g()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    return-object v0
.end method

.method public final h()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    invoke-static {v0}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final i()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
    .locals 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->smsCodeSource:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    iget-object v2, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v2, v2, Lru/mail/libverify/api/SessionData;->reason:Lru/mail/libverify/api/VerificationApi$FailReason;

    iget-object v3, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v3, v3, Lru/mail/libverify/api/SessionData;->verifyApiResponse:Lru/mail/libverify/requests/response/VerifyApiResponse;

    invoke-direct {p0, v0, v1, v2, v3}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/VerificationApi$VerificationState;Lru/mail/libverify/api/VerificationApi$VerificationSource;Lru/mail/libverify/api/VerificationApi$FailReason;Lru/mail/libverify/requests/response/VerifyApiResponse;)Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public final j()J
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-wide v0, v0, Lru/mail/libverify/api/SessionData;->startTimeStamp:J

    return-wide v0
.end method

.method public final k()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v0, v0, Lru/mail/libverify/api/SessionData;->verificationService:Ljava/lang/String;

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    const/16 v2, 0x27

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "VerificationSession{id=\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->state:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", userId=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->userId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", userProvidedPhoneNumber=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->userProvidedPhoneNumber:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", verificationService=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/af;->d:Lru/mail/libverify/api/SessionData;

    iget-object v1, v1, Lru/mail/libverify/api/SessionData;->verificationService:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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
