.class public interface abstract Lru/mail/libverify/api/VerificationApi;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/api/VerificationApi$VerificationStateDescriptor;,
        Lru/mail/libverify/api/VerificationApi$AccountCheckResult;,
        Lru/mail/libverify/api/VerificationApi$AccountCheckListener;,
        Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchListener;,
        Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchItem;,
        Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;,
        Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;,
        Lru/mail/libverify/api/VerificationApi$PhoneCheckListener;,
        Lru/mail/libverify/api/VerificationApi$IvrStateListener;,
        Lru/mail/libverify/api/VerificationApi$FailReason;,
        Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;,
        Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;,
        Lru/mail/libverify/api/VerificationApi$VerificationSource;,
        Lru/mail/libverify/api/VerificationApi$VerificationState;,
        Lru/mail/libverify/api/VerificationApi$VerificationStatesHandler;
    }
.end annotation


# virtual methods
.method public abstract addSmsCodeNotificationListener(Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;)V
    .param p1    # Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract addVerificationStateChangedListener(Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;)V
    .param p1    # Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract cancelVerification(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract checkAccountVerification(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract checkAccountVerificationBySms(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$AccountCheckListener;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/VerificationApi$AccountCheckListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract checkPhoneNumber(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLru/mail/libverify/api/VerificationApi$PhoneCheckListener;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lru/mail/libverify/api/VerificationApi$PhoneCheckListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract completeVerification(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract removeSmsCodeNotificationListener(Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;)V
    .param p1    # Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract removeVerificationStateChangedListener(Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;)V
    .param p1    # Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract reportNetworkStateChange(Z)V
.end method

.method public abstract requestIvrPhoneCall(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$IvrStateListener;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract requestNewSmsCode(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract requestVerificationState(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/VerificationApi$VerificationStateChangedListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract requestVerificationStates(Lru/mail/libverify/api/VerificationApi$VerificationStatesHandler;)V
    .param p1    # Lru/mail/libverify/api/VerificationApi$VerificationStatesHandler;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract reset()V
.end method

.method public abstract resetVerificationCodeError(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract searchPhoneAccounts(Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchListener;Z)V
    .param p1    # Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RequiresPermission;
        allOf = {
            "android.permission.GET_ACCOUNTS",
            "android.permission.READ_PHONE_STATE"
        }
    .end annotation
.end method

.method public abstract setAllowedPermissions([Ljava/lang/String;)V
    .param p1    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract setApiEndpoints(Ljava/util/Map;)V
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
.end method

.method public abstract setCustomLocale(Ljava/util/Locale;)V
    .param p1    # Ljava/util/Locale;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract setLocationUsage(Z)V
.end method

.method public abstract signOut(Z)V
.end method

.method public abstract softSignOut()V
.end method

.method public abstract startVerification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation
.end method

.method public abstract verifySmsCode(Ljava/lang/String;Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
