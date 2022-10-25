.class public abstract Lru/mail/libverify/controls/VerificationController;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/controls/VerificationSupportProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/controls/VerificationController$State;,
        Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener;,
        Lru/mail/libverify/controls/VerificationController$VerificationStateChangedListener;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "VerificationController"

.field private static final VERIFICATION_INITIAL_PROFILE_CHECK:Ljava/lang/String; = "verification_initial_profile_check"

.field private static final VERIFICATION_SESSION_ID:Ljava/lang/String; = "verification_session_id"


# instance fields
.field private final accountListener:Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchListener;

.field private final apiListener:Lru/mail/libverify/controls/VerificationController$VerificationStateChangedListener;

.field protected final context:Landroid/content/Context;

.field private descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

.field private listener:Lru/mail/libverify/controls/VerificationListener;

.field private phoneNumberCheckSession:Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;

.field private suggestedAccounts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchItem;",
            ">;"
        }
    .end annotation
.end field

.field private suggestedAccountsRequested:Z

.field private validationRequestStarted:J

.field private verificationApi:Lru/mail/libverify/api/VerificationApi;

.field private verificationId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lru/mail/libverify/controls/VerificationController$VerificationStateChangedListener;

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/controls/VerificationController$VerificationStateChangedListener;-><init>(Lru/mail/libverify/controls/VerificationController;Lru/mail/libverify/controls/VerificationController$1;)V

    iput-object v0, p0, Lru/mail/libverify/controls/VerificationController;->apiListener:Lru/mail/libverify/controls/VerificationController$VerificationStateChangedListener;

    new-instance v0, Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener;

    invoke-direct {v0, p0, v1}, Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener;-><init>(Lru/mail/libverify/controls/VerificationController;Lru/mail/libverify/controls/VerificationController$1;)V

    iput-object v0, p0, Lru/mail/libverify/controls/VerificationController;->accountListener:Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchListener;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lru/mail/libverify/controls/VerificationController;->suggestedAccountsRequested:Z

    iput-object p1, p0, Lru/mail/libverify/controls/VerificationController;->context:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$200(Lru/mail/libverify/controls/VerificationController;)Lru/mail/libverify/controls/VerificationListener;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    return-object v0
.end method

.method static synthetic access$302(Lru/mail/libverify/controls/VerificationController;Ljava/util/List;)Ljava/util/List;
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/controls/VerificationController;->suggestedAccounts:Ljava/util/List;

    return-object p1
.end method

.method private static isNumericCode(Ljava/lang/CharSequence;)Z
    .locals 3
    .param p0    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    move v0, v1

    :goto_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-ge v0, v2, :cond_1

    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isDigit(C)Z

    move-result v2

    if-nez v2, :cond_0

    :goto_1
    return v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private isOnEnterSmsCodeStage()Z
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getModifiedPhoneNumber()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getSmsCodeInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getIvrInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$IvrInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private loadVerificationId()V
    .locals 3

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "verification_session_id"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method private resetVerificationId()V
    .locals 3

    const/4 v2, 0x0

    iput-object v2, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    iput-object v2, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lru/mail/libverify/controls/VerificationController;->validationRequestStarted:J

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "verification_session_id"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    sget-object v1, Lru/mail/libverify/controls/VerificationController$State;->EnterPhone:Lru/mail/libverify/controls/VerificationController$State;

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onStateChanged(Lru/mail/libverify/controls/VerificationController$State;)V

    :cond_0
    return-void
.end method

.method private updateVerificationId(Ljava/lang/String;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "verification_session_id"

    iget-object v2, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method


# virtual methods
.method protected cancel()Z
    .locals 2

    const/4 v0, 0x0

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getVerificationApi()Lru/mail/libverify/api/VerificationApi;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-interface {v0, v1}, Lru/mail/libverify/api/VerificationApi;->cancelVerification(Ljava/lang/String;)V

    const/4 v0, 0x1

    :cond_0
    invoke-direct {p0}, Lru/mail/libverify/controls/VerificationController;->resetVerificationId()V

    return v0
.end method

.method public final checkProfileVerification()V
    .locals 3

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "verification_initial_profile_check"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getAlreadyExistingProfileDataJson()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getVerificationApi()Lru/mail/libverify/api/VerificationApi;

    move-result-object v0

    invoke-interface {v0, v1}, Lru/mail/libverify/api/VerificationApi;->checkAccountVerification(Ljava/lang/String;)V

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "verification_initial_profile_check"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_0
    return-void
.end method

.method protected complete()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getVerificationApi()Lru/mail/libverify/api/VerificationApi;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-interface {v0, v1}, Lru/mail/libverify/api/VerificationApi;->completeVerification(Ljava/lang/String;)V

    :cond_0
    invoke-direct {p0}, Lru/mail/libverify/controls/VerificationController;->resetVerificationId()V

    return-void
.end method

.method protected dismissError()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getVerificationApi()Lru/mail/libverify/api/VerificationApi;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-interface {v0, v1}, Lru/mail/libverify/api/VerificationApi;->resetVerificationCodeError(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method protected getIvrTimeout()J
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getIvrInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$IvrInfo;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getIvrTimeoutDefault()J

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getIvrInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$IvrInfo;

    move-result-object v0

    iget v0, v0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$IvrInfo;->ivrTimeoutSec:I

    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v0, v0

    goto :goto_0
.end method

.method public final getIvtUnblockTimeout()J
    .locals 6

    const-wide/16 v0, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lru/mail/libverify/controls/VerificationController;->validationRequestStarted:J

    sub-long/2addr v2, v4

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getIvrTimeout()J

    move-result-wide v4

    sub-long v2, v4, v2

    cmp-long v4, v2, v0

    if-gez v4, :cond_0

    :goto_0
    return-wide v0

    :cond_0
    move-wide v0, v2

    goto :goto_0
.end method

.method public final getModifiedPhoneNumber()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getModifiedPhoneNumber()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getPhoneCheckSession()Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;
    .locals 3

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->phoneNumberCheckSession:Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getVerificationApi()Lru/mail/libverify/api/VerificationApi;

    move-result-object v1

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getVerificationService()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;-><init>(Lru/mail/libverify/api/VerificationApi;Ljava/lang/String;)V

    iput-object v0, p0, Lru/mail/libverify/controls/VerificationController;->phoneNumberCheckSession:Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->phoneNumberCheckSession:Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;

    return-object v0
.end method

.method public final getSmsCode()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getSmsCodeInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getSmsCodeInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    move-result-object v0

    iget-object v0, v0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;->receivedSmsCode:Ljava/lang/String;

    goto :goto_0
.end method

.method public final getState()Lru/mail/libverify/controls/VerificationController$State;
    .locals 1

    invoke-direct {p0}, Lru/mail/libverify/controls/VerificationController;->isOnEnterSmsCodeStage()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lru/mail/libverify/controls/VerificationController$State;->EnterSmsCode:Lru/mail/libverify/controls/VerificationController$State;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lru/mail/libverify/controls/VerificationController$State;->EnterPhone:Lru/mail/libverify/controls/VerificationController$State;

    goto :goto_0
.end method

.method public final getSuggestedPhoneNumber()Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    const/4 v3, 0x1

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->suggestedAccounts:Ljava/util/List;

    if-nez v1, :cond_3

    iget-boolean v1, p0, Lru/mail/libverify/controls/VerificationController;->suggestedAccountsRequested:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->context:Landroid/content/Context;

    const-string/jumbo v2, "android.permission.READ_PHONE_STATE"

    invoke-static {v1, v2}, Lru/mail/libverify/controls/Utils;->hasSelfPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->context:Landroid/content/Context;

    const-string/jumbo v2, "android.permission.GET_ACCOUNTS"

    invoke-static {v1, v2}, Lru/mail/libverify/controls/Utils;->hasSelfPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getVerificationApi()Lru/mail/libverify/api/VerificationApi;

    move-result-object v1

    iget-object v2, p0, Lru/mail/libverify/controls/VerificationController;->accountListener:Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchListener;

    invoke-interface {v1, v2, v3}, Lru/mail/libverify/api/VerificationApi;->searchPhoneAccounts(Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchListener;Z)V

    :cond_1
    iput-boolean v3, p0, Lru/mail/libverify/controls/VerificationController;->suggestedAccountsRequested:Z

    :cond_2
    :goto_0
    return-object v0

    :cond_3
    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->suggestedAccounts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v3, :cond_2

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->suggestedAccounts:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchItem;

    iget-object v0, v0, Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchItem;->phone:Ljava/lang/String;

    goto :goto_0
.end method

.method protected final getVerificationApi()Lru/mail/libverify/api/VerificationApi;
    .locals 3

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->verificationApi:Lru/mail/libverify/api/VerificationApi;

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->context:Landroid/content/Context;

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getLogReceiver()Lru/mail/libverify/utils/LogReceiver;

    move-result-object v1

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getExceptionListener()Lru/mail/libverify/api/UncaughtExceptionListener;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lru/mail/libverify/api/VerificationFactory;->getInstance(Landroid/content/Context;Lru/mail/libverify/utils/LogReceiver;Lru/mail/libverify/api/UncaughtExceptionListener;)Lru/mail/libverify/api/VerificationApi;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/controls/VerificationController;->verificationApi:Lru/mail/libverify/api/VerificationApi;

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->verificationApi:Lru/mail/libverify/api/VerificationApi;

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->apiListener:Lru/mail/libverify/controls/VerificationController$VerificationStateChangedListener;

    invoke-interface {v0, v1}, Lru/mail/libverify/api/VerificationApi;->addVerificationStateChangedListener(Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;)V

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->verificationApi:Lru/mail/libverify/api/VerificationApi;

    return-object v0
.end method

.method public final hasIncompletedVerification()Z
    .locals 1

    invoke-direct {p0}, Lru/mail/libverify/controls/VerificationController;->loadVerificationId()V

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isValidSmsCode(Ljava/lang/CharSequence;)Z
    .locals 3
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    move v0, v1

    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getSmsCodeInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    move-result-object v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getSmsCodeLengthDefault()I

    move-result v0

    :goto_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-eq v2, v0, :cond_3

    move v0, v1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getSmsCodeInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    move-result-object v0

    iget v0, v0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;->smsCodeLength:I

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getSmsCodeInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    move-result-object v0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->isSmsCodeNumericDefault()Z

    move-result v0

    :goto_2
    if-eqz v0, :cond_5

    invoke-static {p1}, Lru/mail/libverify/controls/VerificationController;->isNumericCode(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getSmsCodeInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    move-result-object v0

    iget-boolean v0, v0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;->isNumericSmsCode:Z

    goto :goto_2

    :cond_5
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public onCancel()Z
    .locals 1

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->cancel()Z

    move-result v0

    return v0
.end method

.method public onConfirmed()V
    .locals 0

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->complete()V

    return-void
.end method

.method public onEnterSmsCode(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0, p1}, Lru/mail/libverify/controls/VerificationController;->verifySmsCode(Ljava/lang/String;)V

    return-void
.end method

.method public onErrorDismissed()V
    .locals 0

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->dismissError()V

    return-void
.end method

.method public onRequestIvrCall()V
    .locals 0

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->requestIvrCall()V

    return-void
.end method

.method public onResendSms()V
    .locals 0

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->requestNewSmsCode()V

    return-void
.end method

.method public onStart(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0, p1}, Lru/mail/libverify/controls/VerificationController;->start(Ljava/lang/String;)V

    return-void
.end method

.method protected onStateChanged(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V
    .locals 5
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    if-eqz p2, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iput-object p2, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    sget-object v0, Lru/mail/libverify/controls/VerificationController$2;->$SwitchMap$ru$mail$libverify$api$VerificationApi$VerificationState:[I

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getState()Lru/mail/libverify/api/VerificationApi$VerificationState;

    move-result-object v1

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Handler for %s state is not defined"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {v4}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getState()Lru/mail/libverify/api/VerificationApi$VerificationState;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->onVerificationInitialStarted()V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {p0, v0}, Lru/mail/libverify/controls/VerificationController;->onVerificationSuspended(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {p0, v0}, Lru/mail/libverify/controls/VerificationController;->onVerifyingSmsCode(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {p0, v0}, Lru/mail/libverify/controls/VerificationController;->onWaitingVerificationCode(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    goto :goto_0

    :pswitch_4
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {p0, v0}, Lru/mail/libverify/controls/VerificationController;->onVerificationFailed(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    goto :goto_0

    :pswitch_5
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {p0, v0}, Lru/mail/libverify/controls/VerificationController;->onVerificationFinalized(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    goto :goto_0

    :pswitch_6
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {p0, v0}, Lru/mail/libverify/controls/VerificationController;->onVerificationSucceeded(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method protected onVerificationFailed(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V
    .locals 2
    .param p1    # Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onProgress(Z)V

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getReason()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onError(Lru/mail/libverify/api/VerificationApi$FailReason;)V

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->cancel()Z

    :cond_0
    return-void
.end method

.method protected onVerificationFinalized(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V
    .locals 3
    .param p1    # Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onProgress(Z)V

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getReason()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onError(Lru/mail/libverify/api/VerificationApi$FailReason;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getToken()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/controls/VerificationListener;->onCompleted(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected onVerificationInitialStarted()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onProgress(Z)V

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getState()Lru/mail/libverify/controls/VerificationController$State;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onStateChanged(Lru/mail/libverify/controls/VerificationController$State;)V

    :cond_0
    return-void
.end method

.method protected onVerificationSucceeded(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V
    .locals 3
    .param p1    # Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onProgress(Z)V

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getToken()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/controls/VerificationListener;->onCompleted(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method protected onVerificationSuspended(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V
    .locals 2
    .param p1    # Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onProgress(Z)V

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getState()Lru/mail/libverify/controls/VerificationController$State;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onStateChanged(Lru/mail/libverify/controls/VerificationController$State;)V

    :cond_0
    return-void
.end method

.method protected onVerifyingSmsCode(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V
    .locals 2
    .param p1    # Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onProgress(Z)V

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getState()Lru/mail/libverify/controls/VerificationController$State;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onStateChanged(Lru/mail/libverify/controls/VerificationController$State;)V

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getSmsCodeInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getSmsCodeInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    move-result-object v0

    iget-object v0, v0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;->receivedSmsCode:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getSmsCodeInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    move-result-object v1

    iget-object v1, v1, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;->receivedSmsCode:Ljava/lang/String;

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onSmsCodeReceived(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method protected onWaitingVerificationCode(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V
    .locals 2
    .param p1    # Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onProgress(Z)V

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getState()Lru/mail/libverify/controls/VerificationController$State;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onStateChanged(Lru/mail/libverify/controls/VerificationController$State;)V

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getSmsCodeInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getSmsCodeInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    move-result-object v0

    iget-object v0, v0, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;->receivedSmsCode:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getSmsCodeInfo()Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;

    move-result-object v1

    iget-object v1, v1, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor$SmsCodeInfo;->receivedSmsCode:Ljava/lang/String;

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onSmsCodeReceived(Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getReason()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v0

    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->OK:Lru/mail/libverify/api/VerificationApi$FailReason;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getReason()Lru/mail/libverify/api/VerificationApi$FailReason;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onError(Lru/mail/libverify/api/VerificationApi$FailReason;)V

    :cond_1
    return-void
.end method

.method protected requestIvrCall()V
    .locals 3

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onProgress(Z)V

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getVerificationApi()Lru/mail/libverify/api/VerificationApi;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    new-instance v2, Lru/mail/libverify/controls/VerificationController$1;

    invoke-direct {v2, p0}, Lru/mail/libverify/controls/VerificationController$1;-><init>(Lru/mail/libverify/controls/VerificationController;)V

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/VerificationApi;->requestIvrPhoneCall(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$IvrStateListener;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->GENERAL_ERROR:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onError(Lru/mail/libverify/api/VerificationApi$FailReason;)V

    goto :goto_0
.end method

.method protected requestNewSmsCode()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getVerificationApi()Lru/mail/libverify/api/VerificationApi;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-interface {v0, v1}, Lru/mail/libverify/api/VerificationApi;->requestNewSmsCode(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->GENERAL_ERROR:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onError(Lru/mail/libverify/api/VerificationApi$FailReason;)V

    goto :goto_0
.end method

.method public setApiEndpoints(Ljava/util/Map;)V
    .locals 1
    .param p1    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lru/mail/libverify/api/VerificationFactory;->setApiEndpoints(Landroid/content/Context;Ljava/util/Map;)V

    return-void
.end method

.method public setCustomLocale(Ljava/util/Locale;)V
    .locals 1
    .param p1    # Ljava/util/Locale;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lru/mail/libverify/api/VerificationFactory;->setCustomLocale(Landroid/content/Context;Ljava/util/Locale;)V

    return-void
.end method

.method public final setListener(Lru/mail/libverify/controls/VerificationListener;)V
    .locals 3
    .param p1    # Lru/mail/libverify/controls/VerificationListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lru/mail/libverify/controls/VerificationController;->loadVerificationId()V

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getVerificationApi()Lru/mail/libverify/api/VerificationApi;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    iget-object v2, p0, Lru/mail/libverify/controls/VerificationController;->apiListener:Lru/mail/libverify/controls/VerificationController$VerificationStateChangedListener;

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/api/VerificationApi;->requestVerificationState(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget-object v0, Lru/mail/libverify/controls/VerificationController$State;->EnterPhone:Lru/mail/libverify/controls/VerificationController$State;

    invoke-interface {p1, v0}, Lru/mail/libverify/controls/VerificationListener;->onStateChanged(Lru/mail/libverify/controls/VerificationController$State;)V

    goto :goto_0
.end method

.method public setLocationUsage(Z)V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lru/mail/libverify/api/VerificationFactory;->setLocationUsage(Landroid/content/Context;Z)V

    return-void
.end method

.method public signOut()V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "verification_initial_profile_check"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->context:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lru/mail/libverify/api/VerificationFactory;->signOut(Landroid/content/Context;Z)V

    return-void
.end method

.method public softSignOut()V
    .locals 2

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "verification_initial_profile_check"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->context:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/api/VerificationFactory;->softSignOut(Landroid/content/Context;)V

    return-void
.end method

.method protected start(Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getLogReceiver()Lru/mail/libverify/utils/LogReceiver;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "VerificationController"

    const-string/jumbo v2, "Previous session must be stopped properly. Please, ensure that your code calls cancel() or complete() methods."

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/utils/LogReceiver;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->cancel()Z

    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lru/mail/libverify/controls/VerificationController;->validationRequestStarted:J

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getVerificationApi()Lru/mail/libverify/api/VerificationApi;

    move-result-object v0

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getVerificationService()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getSmsCodeTemplatesDefault()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v0, v1, p1, v2, v3}, Lru/mail/libverify/api/VerificationApi;->startVerification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lru/mail/libverify/controls/VerificationController;->updateVerificationId(Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onProgress(Z)V

    :cond_2
    return-void
.end method

.method public subscribeSmsNotificationListener(Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;)V
    .locals 1
    .param p1    # Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getVerificationApi()Lru/mail/libverify/api/VerificationApi;

    move-result-object v0

    invoke-interface {v0, p1}, Lru/mail/libverify/api/VerificationApi;->addSmsCodeNotificationListener(Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;)V

    return-void
.end method

.method public unSubscribeSmsNotificationListener(Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;)V
    .locals 1
    .param p1    # Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getVerificationApi()Lru/mail/libverify/api/VerificationApi;

    move-result-object v0

    invoke-interface {v0, p1}, Lru/mail/libverify/api/VerificationApi;->removeSmsCodeNotificationListener(Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;)V

    return-void
.end method

.method protected verifySmsCode(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0, p1}, Lru/mail/libverify/controls/VerificationController;->isValidSmsCode(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {v0}, Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    invoke-virtual {p0}, Lru/mail/libverify/controls/VerificationController;->getVerificationApi()Lru/mail/libverify/api/VerificationApi;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController;->verificationId:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Lru/mail/libverify/api/VerificationApi;->verifySmsCode(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->descriptor:Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;

    invoke-virtual {p0, v0}, Lru/mail/libverify/controls/VerificationController;->onVerificationFinalized(Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController;->listener:Lru/mail/libverify/controls/VerificationListener;

    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->GENERAL_ERROR:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-interface {v0, v1}, Lru/mail/libverify/controls/VerificationListener;->onError(Lru/mail/libverify/api/VerificationApi$FailReason;)V

    goto :goto_0
.end method
