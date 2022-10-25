.class public Lcom/vkontakte/android/auth/VKAuthState;
.super Ljava/lang/Object;
.source "VKAuthState.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/auth/VKAuthState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field accessToken:Ljava/lang/String;

.field private isNeedStoreAfterAuth:Z

.field private final map:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field secret:Ljava/lang/String;

.field userId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 160
    new-instance v0, Lcom/vkontakte/android/auth/VKAuthState$1;

    invoke-direct {v0}, Lcom/vkontakte/android/auth/VKAuthState$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/auth/VKAuthState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .prologue
    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAuthState;->isNeedStoreAfterAuth:Z

    .line 124
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    .line 125
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v1, "lang"

    invoke-static {}, Lcom/vkontakte/android/Global;->getDeviceLang()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/auth/VKAuthState$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/auth/VKAuthState$1;

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/vkontakte/android/auth/VKAuthState;-><init>()V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .param p1, "accessToken"    # Ljava/lang/String;
    .param p2, "secret"    # Ljava/lang/String;
    .param p3, "userId"    # I

    .prologue
    .line 129
    invoke-direct {p0}, Lcom/vkontakte/android/auth/VKAuthState;-><init>()V

    .line 130
    iput-object p1, p0, Lcom/vkontakte/android/auth/VKAuthState;->accessToken:Ljava/lang/String;

    .line 131
    iput-object p2, p0, Lcom/vkontakte/android/auth/VKAuthState;->secret:Ljava/lang/String;

    .line 132
    iput p3, p0, Lcom/vkontakte/android/auth/VKAuthState;->userId:I

    .line 133
    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/auth/VKAuthState;)Ljava/util/LinkedHashMap;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/auth/VKAuthState;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    return-object v0
.end method

.method public static byAuthData(Ljava/lang/String;Ljava/lang/String;I)Lcom/vkontakte/android/auth/VKAuthState;
    .locals 1
    .param p0, "accessToken"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "secret"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "userId"    # I

    .prologue
    .line 79
    new-instance v0, Lcom/vkontakte/android/auth/VKAuthState;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/auth/VKAuthState;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0
.end method

.method public static byExternalService(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAuthState;
    .locals 4
    .param p0, "service"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "token"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 51
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuthState;->newState()Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v0

    .line 52
    .local v0, "helper":Lcom/vkontakte/android/auth/VKAuthState;
    iget-object v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v2, "grant_type"

    const-string/jumbo v3, "vk_external_auth"

    invoke-virtual {v1, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    iget-object v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v2, "vk_external_token"

    invoke-virtual {v1, v2, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    iget-object v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v2, "vk_service"

    invoke-virtual {v1, v2, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    return-object v0
.end method

.method public static byLoginPassword(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAuthState;
    .locals 4
    .param p0, "login"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "password"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 43
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuthState;->newState()Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v0

    .line 44
    .local v0, "helper":Lcom/vkontakte/android/auth/VKAuthState;
    iget-object v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v2, "grant_type"

    const-string/jumbo v3, "password"

    invoke-virtual {v1, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    iget-object v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v2, "username"

    invoke-virtual {v1, v2, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    iget-object v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v2, "password"

    invoke-virtual {v1, v2, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    return-object v0
.end method

.method private mapIsEmpty(Ljava/util/Map;)Z
    .locals 6
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
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 108
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :pswitch_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 109
    .local v0, "s":Ljava/lang/String;
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v2, -0x1

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    :cond_0
    :goto_0
    packed-switch v2, :pswitch_data_1

    .line 116
    .end local v0    # "s":Ljava/lang/String;
    :goto_1
    return v1

    .line 109
    .restart local v0    # "s":Ljava/lang/String;
    :pswitch_1
    const-string/jumbo v5, "lang"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v2, v1

    goto :goto_0

    .line 116
    .end local v0    # "s":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x1

    goto :goto_1

    .line 109
    :pswitch_data_0
    .packed-switch 0x3291ee
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method private static newState()Lcom/vkontakte/android/auth/VKAuthState;
    .locals 5

    .prologue
    .line 37
    new-instance v0, Lcom/vkontakte/android/auth/VKAuthState;

    invoke-direct {v0}, Lcom/vkontakte/android/auth/VKAuthState;-><init>()V

    .line 38
    .local v0, "state":Lcom/vkontakte/android/auth/VKAuthState;
    iget-object v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v2, "device_id"

    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string/jumbo v4, "android_id"

    invoke-static {v3, v4}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    return-object v0
.end method

.method public static restoreWithCode(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAuthState;
    .locals 4
    .param p0, "sid"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "code"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 59
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuthState;->newState()Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v0

    .line 60
    .local v0, "helper":Lcom/vkontakte/android/auth/VKAuthState;
    iget-object v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v2, "grant_type"

    const-string/jumbo v3, "restore_code"

    invoke-virtual {v1, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    iget-object v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v2, "sid"

    invoke-virtual {v1, v2, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    iget-object v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v2, "code"

    invoke-virtual {v1, v2, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->isNeedStoreAfterAuth:Z

    .line 64
    return-object v0
.end method

.method public static restoreWithLibverifyToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAuthState;
    .locals 4
    .param p0, "sid"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "session"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "token"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 68
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuthState;->newState()Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v0

    .line 69
    .local v0, "helper":Lcom/vkontakte/android/auth/VKAuthState;
    iget-object v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v2, "grant_type"

    const-string/jumbo v3, "restore_code"

    invoke-virtual {v1, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    iget-object v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v2, "sid"

    invoke-virtual {v1, v2, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    iget-object v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v2, "validate_session"

    invoke-virtual {v1, v2, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    iget-object v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v2, "validate_token"

    invoke-virtual {v1, v2, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    iget-object v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v2, "libverify_support"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/vkontakte/android/auth/VKAuthState;->isNeedStoreAfterAuth:Z

    .line 75
    return-object v0
.end method


# virtual methods
.method canSkipAuth()Z
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuthState;->accessToken:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuthState;->secret:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/auth/VKAuthState;->userId:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/auth/VKAuthState;->mapIsEmpty(Ljava/util/Map;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 145
    const/4 v0, 0x0

    return v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v1, "username"

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method isNeedStoreAfterAuth()Z
    .locals 1

    .prologue
    .line 120
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAuthState;->isNeedStoreAfterAuth:Z

    return v0
.end method

.method public libverifySupport()Lcom/vkontakte/android/auth/VKAuthState;
    .locals 3

    .prologue
    .line 28
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v1, "libverify_support"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    return-object p0
.end method

.method setCaptchaInfo(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAuthState;
    .locals 2
    .param p1, "captchaSid"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "captchaKey"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 83
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v1, "captcha_sid"

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v1, "captcha_key"

    invoke-virtual {v0, v1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    :cond_0
    return-object p0
.end method

.method setLibverifyToken(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAuthState;
    .locals 2
    .param p1, "session"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "token"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 98
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v1, "validate_session"

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v1, "validate_token"

    invoke-virtual {v0, v1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    return-object p0
.end method

.method setValidateCode(Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAuthState;
    .locals 2
    .param p1, "code"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 91
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 92
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    const-string/jumbo v1, "code"

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    :cond_0
    return-object p0
.end method

.method visit(Landroid/net/Uri$Builder;)V
    .locals 4
    .param p1, "uriBuilder"    # Landroid/net/Uri$Builder;

    .prologue
    .line 136
    iget-object v1, p0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 137
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_0

    .line 139
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "parcel"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 150
    iget-object v1, p0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->size()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 151
    iget-object v1, p0, Lcom/vkontakte/android/auth/VKAuthState;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 152
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 153
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_0

    .line 155
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/auth/VKAuthState;->accessToken:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 156
    iget-object v1, p0, Lcom/vkontakte/android/auth/VKAuthState;->secret:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 157
    iget v1, p0, Lcom/vkontakte/android/auth/VKAuthState;->userId:I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 158
    return-void
.end method
