.class public Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;
.super Lru/mail/libverify/controls/VerificationController;
.source "VerificationControllerImpl.java"


# static fields
.field private static final DEFAULT_IVR_CALL_TIMEOUT:J

.field private static final VERIFICATION_CODE_DEFAULT_IS_NUMERIC:Z = true

.field private static final VERIFICATION_CODE_DEFAULT_LENGTH:I = 0x4


# instance fields
.field private sharedPreferences:Landroid/content/SharedPreferences;

.field private final verificationService:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 23
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x3c

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->DEFAULT_IVR_CALL_TIMEOUT:J

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "verificationService"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lru/mail/libverify/controls/VerificationController;-><init>(Landroid/content/Context;)V

    .line 43
    iput-object p2, p0, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->verificationService:Ljava/lang/String;

    .line 45
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "mytrackerLocationCrapEnabled"

    const/4 v2, 0x1

    .line 46
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 45
    invoke-static {p1, v0}, Lru/mail/libverify/api/VerificationFactory;->setLocationUsage(Landroid/content/Context;Z)V

    .line 47
    return-void
.end method

.method public static auth(Landroid/content/Context;)Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 38
    new-instance v0, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    const-string/jumbo v1, "vk_otp_auth"

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object v0
.end method

.method public static registration(Landroid/content/Context;)Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 30
    new-instance v0, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    const-string/jumbo v1, "vk_registration"

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object v0
.end method

.method public static restore(Landroid/content/Context;)Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 34
    new-instance v0, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    const-string/jumbo v1, "vk_fast_restore"

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getAlreadyExistingProfileDataJson()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 128
    const/4 v0, 0x0

    return-object v0
.end method

.method public getExceptionListener()Lru/mail/libverify/api/UncaughtExceptionListener;
    .locals 1

    .prologue
    .line 87
    new-instance v0, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl$2;-><init>(Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;)V

    return-object v0
.end method

.method public getIvrTimeoutDefault()J
    .locals 2

    .prologue
    .line 111
    sget-wide v0, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->DEFAULT_IVR_CALL_TIMEOUT:J

    return-wide v0
.end method

.method public getLogReceiver()Lru/mail/libverify/utils/LogReceiver;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 52
    new-instance v0, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl$1;-><init>(Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;)V

    return-object v0
.end method

.method public getPreferences()Landroid/content/SharedPreferences;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 98
    iget-object v0, p0, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->sharedPreferences:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->context:Landroid/content/Context;

    const-string/jumbo v1, "libverify"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->sharedPreferences:Landroid/content/SharedPreferences;

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->sharedPreferences:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method public getSmsCodeLengthDefault()I
    .locals 1

    .prologue
    .line 106
    const/4 v0, 0x4

    return v0
.end method

.method public getSmsCodeTemplatesDefault()Ljava/util/Map;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

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

    .prologue
    .line 134
    const/4 v0, 0x0

    return-object v0
.end method

.method public getVerificationService()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 122
    iget-object v0, p0, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->verificationService:Ljava/lang/String;

    return-object v0
.end method

.method public isSmsCodeNumericDefault()Z
    .locals 1

    .prologue
    .line 116
    const/4 v0, 0x1

    return v0
.end method
