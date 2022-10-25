.class public Lcom/vkontakte/android/auth/VKAuth;
.super Ljava/lang/Object;
.source "VKAuth.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/auth/VKAuth$AuthResult;,
        Lcom/vkontakte/android/auth/VKAuth$Container;,
        Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;,
        Lcom/vkontakte/android/auth/VKAuth$AuthListener;
    }
.end annotation


# static fields
.field public static final ACCOUNT_TYPE:Ljava/lang/String; = "com.vkontakte.account"

.field public static final API_ID:I = 0x22b2d3

.field public static final API_SECRET:Ljava/lang/String; = "hHbZxrka2uZ6jB1inYsH"

.field public static final AUTH_CODE_CANCELED:I = 0x4

.field public static final AUTH_CODE_INCORRECT_LOGIN_DATA:I = 0x3

.field private static final AUTH_CODE_NEED_VALIDATION:I = 0x7

.field private static final AUTH_CODE_PRECESSING:I = 0x5

.field private static final AUTH_CODE_RETRY_WITH_CAPTCHA:I = 0x6

.field public static final AUTH_CODE_SERVER_ERROR:I = 0x0

.field public static final AUTH_CODE_USER_WAS_ADDED:I = 0x1

.field public static final AUTH_CODE_USER_WAS_AUTH:I = 0x2

.field public static final VALIDATION_TYPE_APP:I = 0x2

.field public static final VALIDATION_TYPE_LIBVERIFY:I = 0x3

.field public static final VALIDATION_TYPE_PHONE:I = 0x4

.field public static final VALIDATION_TYPE_SMS:I = 0x1

.field public static final VALIDATION_TYPE_URL:I

.field private static authHandler:Landroid/os/Handler;

.field private static callbackHandler:Landroid/os/Handler;

.field private static oauthUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 65
    sput-object v0, Lcom/vkontakte/android/auth/VKAuth;->authHandler:Landroid/os/Handler;

    .line 66
    sput-object v0, Lcom/vkontakte/android/auth/VKAuth;->callbackHandler:Landroid/os/Handler;

    .line 68
    sput-object v0, Lcom/vkontakte/android/auth/VKAuth;->oauthUrl:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static auth(Lcom/vkontakte/android/auth/VKAuthState;)Lcom/vkontakte/android/auth/VKAuth$AuthResult;
    .locals 9
    .param p0, "helper"    # Lcom/vkontakte/android/auth/VKAuthState;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 139
    :try_start_0
    invoke-virtual {p0}, Lcom/vkontakte/android/auth/VKAuthState;->canSkipAuth()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 140
    new-instance v1, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    const/4 v4, 0x0

    invoke-direct {v1, p0, v4}, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;-><init>(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$1;)V

    .line 144
    .local v1, "authAnswer":Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
    :goto_0
    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->access$100(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 146
    new-instance v0, Lcom/vkontakte/android/auth/VKAccount;

    invoke-direct {v0}, Lcom/vkontakte/android/auth/VKAccount;-><init>()V

    .line 147
    .local v0, "account":Lcom/vkontakte/android/auth/VKAccount;
    iget v4, v1, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->userId:I

    iput v4, v0, Lcom/vkontakte/android/auth/VKAccount;->uid:I

    .line 148
    iget-object v4, v1, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->accessToken:Ljava/lang/String;

    iput-object v4, v0, Lcom/vkontakte/android/auth/VKAccount;->accessToken:Ljava/lang/String;

    .line 149
    iget-object v4, v1, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->secret:Ljava/lang/String;

    iput-object v4, v0, Lcom/vkontakte/android/auth/VKAccount;->secret:Ljava/lang/String;

    .line 151
    invoke-virtual {p0}, Lcom/vkontakte/android/auth/VKAuthState;->isNeedStoreAfterAuth()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 152
    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAuth;->loadWallInfoResult(Lcom/vkontakte/android/auth/VKAccount;)Lcom/vkontakte/android/api/execute/GetWallInfo$Result;

    move-result-object v3

    .line 153
    .local v3, "result":Lcom/vkontakte/android/api/execute/GetWallInfo$Result;
    if-nez v3, :cond_1

    .line 154
    new-instance v4, Lcom/vkontakte/android/auth/VKAuth$AuthResult;

    const/4 v5, 0x0

    invoke-direct {v4, v5, v1}, Lcom/vkontakte/android/auth/VKAuth$AuthResult;-><init>(ILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V

    .line 183
    .end local v0    # "account":Lcom/vkontakte/android/auth/VKAccount;
    .end local v1    # "authAnswer":Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
    .end local v3    # "result":Lcom/vkontakte/android/api/execute/GetWallInfo$Result;
    :goto_1
    return-object v4

    .line 142
    :cond_0
    invoke-static {p0}, Lcom/vkontakte/android/auth/VKAuth;->authInternal(Lcom/vkontakte/android/auth/VKAuthState;)Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    move-result-object v1

    .restart local v1    # "authAnswer":Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
    goto :goto_0

    .line 156
    .restart local v0    # "account":Lcom/vkontakte/android/auth/VKAccount;
    .restart local v3    # "result":Lcom/vkontakte/android/api/execute/GetWallInfo$Result;
    :cond_1
    invoke-static {}, Lcom/my/tracker/MyTracker;->trackLoginEvent()V

    .line 157
    invoke-static {v0, v3}, Lcom/vkontakte/android/auth/VKAccountManager;->storeNewAccount(Lcom/vkontakte/android/auth/VKAccount;Lcom/vkontakte/android/api/execute/GetWallInfo$Result;)V

    .line 158
    invoke-static {}, Lcom/vkontakte/android/ShortcutManagerWrapper;->getInstance()Lcom/vkontakte/android/ShortcutManagerWrapper;

    move-result-object v4

    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ShortcutManagerWrapper;->respondToUserLogin(Landroid/content/Context;)V

    .line 159
    new-instance v4, Lcom/vkontakte/android/auth/VKAuth$AuthResult;

    const/4 v5, 0x1

    invoke-direct {v4, v5, v1}, Lcom/vkontakte/android/auth/VKAuth$AuthResult;-><init>(ILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_1

    .line 182
    .end local v0    # "account":Lcom/vkontakte/android/auth/VKAccount;
    .end local v1    # "authAnswer":Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
    .end local v3    # "result":Lcom/vkontakte/android/api/execute/GetWallInfo$Result;
    :catch_0
    move-exception v2

    .line 183
    .local v2, "e":Ljava/lang/Exception;
    :goto_2
    new-instance v4, Lcom/vkontakte/android/auth/VKAuth$AuthResult;

    invoke-direct {v4, v7, v8}, Lcom/vkontakte/android/auth/VKAuth$AuthResult;-><init>(ILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V

    goto :goto_1

    .line 162
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "account":Lcom/vkontakte/android/auth/VKAccount;
    .restart local v1    # "authAnswer":Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
    :cond_2
    :try_start_1
    new-instance v4, Lcom/vkontakte/android/auth/VKAuth$AuthResult;

    const/4 v5, 0x2

    invoke-direct {v4, v5, v1}, Lcom/vkontakte/android/auth/VKAuth$AuthResult;-><init>(ILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V

    goto :goto_1

    .line 182
    .end local v0    # "account":Lcom/vkontakte/android/auth/VKAccount;
    .end local v1    # "authAnswer":Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
    :catch_1
    move-exception v2

    goto :goto_2

    .line 164
    .restart local v1    # "authAnswer":Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
    :cond_3
    const-string/jumbo v4, "need_captcha"

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->access$200(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 165
    new-instance v4, Lcom/vkontakte/android/auth/VKAuth$AuthResult;

    const/4 v5, 0x6

    invoke-direct {v4, v5, v1}, Lcom/vkontakte/android/auth/VKAuth$AuthResult;-><init>(ILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V

    goto :goto_1

    .line 182
    .end local v1    # "authAnswer":Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
    :catch_2
    move-exception v2

    goto :goto_2

    .line 166
    .restart local v1    # "authAnswer":Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
    :cond_4
    const-string/jumbo v4, "need_validation"

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->access$200(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 167
    new-instance v4, Lcom/vkontakte/android/auth/VKAuth$AuthResult;

    const/4 v5, 0x7

    invoke-direct {v4, v5, v1}, Lcom/vkontakte/android/auth/VKAuth$AuthResult;-><init>(ILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V

    goto :goto_1

    .line 168
    :cond_5
    const-string/jumbo v4, "need_authcheck"

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->access$200(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 170
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string/jumbo v6, "Error need auth check"

    aput-object v6, v4, v5

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 171
    new-instance v4, Lcom/vkontakte/android/auth/VKAuth$AuthResult;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct {v4, v5, v6}, Lcom/vkontakte/android/auth/VKAuth$AuthResult;-><init>(ILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V

    goto :goto_1

    .line 172
    :cond_6
    const-string/jumbo v4, "invalid_client"

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->access$200(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 174
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string/jumbo v6, "Error need auth check"

    aput-object v6, v4, v5

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 175
    new-instance v4, Lcom/vkontakte/android/auth/VKAuth$AuthResult;

    const/4 v5, 0x3

    invoke-direct {v4, v5, v1}, Lcom/vkontakte/android/auth/VKAuth$AuthResult;-><init>(ILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V

    goto/16 :goto_1

    .line 176
    :cond_7
    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->access$300(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 177
    new-instance v4, Lcom/vkontakte/android/auth/VKAuth$AuthResult;

    const/4 v5, 0x5

    invoke-direct {v4, v5, v1}, Lcom/vkontakte/android/auth/VKAuth$AuthResult;-><init>(ILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V

    goto/16 :goto_1

    .line 180
    :cond_8
    new-instance v4, Lcom/vkontakte/android/auth/VKAuth$AuthResult;

    const/4 v5, 0x3

    invoke-direct {v4, v5, v1}, Lcom/vkontakte/android/auth/VKAuth$AuthResult;-><init>(ILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2

    goto/16 :goto_1
.end method

.method public static authAsync(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)V
    .locals 2
    .param p0, "state"    # Lcom/vkontakte/android/auth/VKAuthState;
    .param p1, "authListener"    # Lcom/vkontakte/android/auth/VKAuth$AuthListener;

    .prologue
    .line 95
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuth;->getCallbackHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lcom/vkontakte/android/auth/VKAuth$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/auth/VKAuth$AuthListener;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 96
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuth;->getAuthHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-static {p0, p1}, Lcom/vkontakte/android/auth/VKAuth$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 134
    return-void
.end method

.method private static authInternal(Lcom/vkontakte/android/auth/VKAuthState;)Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
    .locals 12
    .param p0, "helper"    # Lcom/vkontakte/android/auth/VKAuthState;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;,
            Ljava/io/UnsupportedEncodingException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 225
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuth;->getOauthUrl()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v6

    const-string/jumbo v7, "scope"

    const-string/jumbo v8, "nohttps,all"

    .line 226
    invoke-virtual {v6, v7, v8}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    const-string/jumbo v7, "client_id"

    const v8, 0x22b2d3

    .line 227
    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    const-string/jumbo v7, "client_secret"

    const-string/jumbo v8, "hHbZxrka2uZ6jB1inYsH"

    .line 228
    invoke-virtual {v6, v7, v8}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    const-string/jumbo v7, "2fa_supported"

    const-string/jumbo v8, "1"

    .line 229
    invoke-virtual {v6, v7, v8}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    .line 230
    .local v4, "uriBuilder":Landroid/net/Uri$Builder;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuth;->getTrustedHash()Ljava/lang/String;

    move-result-object v3

    .line 231
    .local v3, "trustedHash":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 232
    const-string/jumbo v6, "trusted_hash"

    invoke-virtual {v4, v6, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 234
    :cond_0
    invoke-virtual {p0, v4}, Lcom/vkontakte/android/auth/VKAuthState;->visit(Landroid/net/Uri$Builder;)V

    .line 236
    invoke-virtual {v4}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    .line 237
    .local v5, "url":Ljava/lang/String;
    new-array v6, v11, [Ljava/lang/Object;

    const-string/jumbo v7, "Auth url:"

    aput-object v7, v6, v9

    aput-object v5, v6, v10

    invoke-static {v6}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 238
    invoke-static {v5}, Lcom/vk/core/network/Network;->getURL(Ljava/lang/String;)[B

    move-result-object v1

    .line 240
    .local v1, "r":[B
    if-nez v1, :cond_1

    .line 241
    new-instance v6, Ljava/lang/RuntimeException;

    const-string/jumbo v7, "Server returned null"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 244
    :cond_1
    new-instance v2, Ljava/lang/String;

    const-string/jumbo v6, "UTF-8"

    invoke-direct {v2, v1, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 245
    .local v2, "sAnswer":Ljava/lang/String;
    new-array v6, v11, [Ljava/lang/Object;

    const-string/jumbo v7, "Auth Result:"

    aput-object v7, v6, v9

    aput-object v2, v6, v10

    invoke-static {v6}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 246
    new-instance v0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    new-instance v6, Lorg/json/JSONTokener;

    invoke-direct {v6, v2}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/json/JSONObject;

    const/4 v7, 0x0

    invoke-direct {v0, v6, v7}, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;-><init>(Lorg/json/JSONObject;Lcom/vkontakte/android/auth/VKAuth$1;)V

    .line 247
    .local v0, "authAnswer":Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->access$600(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 248
    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->access$600(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/auth/VKAuth;->storeTrustedHash(Ljava/lang/String;)V

    .line 250
    :cond_2
    return-object v0
.end method

.method public static ensureLoggedIn(Landroid/content/Context;)Z
    .locals 3
    .param p0, "act"    # Landroid/content/Context;

    .prologue
    .line 204
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 205
    const/4 v0, 0x1

    .line 210
    :goto_0
    return v0

    .line 207
    :cond_0
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080105

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080104

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080597

    invoke-static {p0}, Lcom/vkontakte/android/auth/VKAuth$$Lambda$3;->lambdaFactory$(Landroid/content/Context;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 208
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080149

    const/4 v2, 0x0

    .line 209
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 210
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static declared-synchronized getAuthHandler()Landroid/os/Handler;
    .locals 4

    .prologue
    .line 79
    const-class v2, Lcom/vkontakte/android/auth/VKAuth;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lcom/vkontakte/android/auth/VKAuth;->authHandler:Landroid/os/Handler;

    if-nez v1, :cond_0

    .line 80
    new-instance v0, Landroid/os/HandlerThread;

    const-string/jumbo v1, "Auth thread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 81
    .local v0, "handlerThread":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 82
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lcom/vkontakte/android/auth/VKAuth;->authHandler:Landroid/os/Handler;

    .line 84
    :cond_0
    sget-object v1, Lcom/vkontakte/android/auth/VKAuth;->authHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    return-object v1

    .line 79
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized getCallbackHandler()Landroid/os/Handler;
    .locals 3

    .prologue
    .line 88
    const-class v1, Lcom/vkontakte/android/auth/VKAuth;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/vkontakte/android/auth/VKAuth;->callbackHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 89
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/vkontakte/android/auth/VKAuth;->callbackHandler:Landroid/os/Handler;

    .line 91
    :cond_0
    sget-object v0, Lcom/vkontakte/android/auth/VKAuth;->callbackHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 88
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static getOauthUrl()Ljava/lang/String;
    .locals 4

    .prologue
    .line 71
    sget-object v1, Lcom/vkontakte/android/auth/VKAuth;->oauthUrl:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 72
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 73
    .local v0, "prefs":Landroid/content/SharedPreferences;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "https://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "oauthHost"

    const-string/jumbo v3, "oauth.vk.com"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/token"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/vkontakte/android/auth/VKAuth;->oauthUrl:Ljava/lang/String;

    .line 75
    :cond_0
    sget-object v1, Lcom/vkontakte/android/auth/VKAuth;->oauthUrl:Ljava/lang/String;

    return-object v1
.end method

.method private static getTrustedHash()Ljava/lang/String;
    .locals 3

    .prologue
    .line 254
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v1, "2fa"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "trusted_hash"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$authAsync$3(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)V
    .locals 12
    .param p0, "state"    # Lcom/vkontakte/android/auth/VKAuthState;
    .param p1, "authListener"    # Lcom/vkontakte/android/auth/VKAuth$AuthListener;

    .prologue
    const-wide/16 v10, 0xc8

    .line 100
    :goto_0
    invoke-static {p0}, Lcom/vkontakte/android/auth/VKAuth;->auth(Lcom/vkontakte/android/auth/VKAuthState;)Lcom/vkontakte/android/auth/VKAuth$AuthResult;

    move-result-object v3

    .line 101
    .local v3, "result":Lcom/vkontakte/android/auth/VKAuth$AuthResult;
    move-object v4, v3

    .line 102
    .local v4, "resultFinal":Lcom/vkontakte/android/auth/VKAuth$AuthResult;
    iget v5, v3, Lcom/vkontakte/android/auth/VKAuth$AuthResult;->code:I

    const/4 v6, 0x5

    if-ne v5, v6, :cond_0

    iget-object v5, v3, Lcom/vkontakte/android/auth/VKAuth$AuthResult;->authAnswer:Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    if-eqz v5, :cond_0

    .line 103
    const-wide/16 v6, 0x4e20

    iget-object v5, v3, Lcom/vkontakte/android/auth/VKAuth$AuthResult;->authAnswer:Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    invoke-static {v5}, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->access$700(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)J

    move-result-wide v8

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    invoke-static {v10, v11, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/vkontakte/android/auth/VKAuthUtils;->sleep(J)V

    goto :goto_0

    .line 104
    :cond_0
    iget v5, v3, Lcom/vkontakte/android/auth/VKAuth$AuthResult;->code:I

    const/4 v6, 0x6

    if-ne v5, v6, :cond_3

    iget-object v5, v3, Lcom/vkontakte/android/auth/VKAuth$AuthResult;->authAnswer:Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    if-eqz v5, :cond_3

    .line 105
    new-instance v2, Landroid/content/Intent;

    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-class v6, Lcom/vkontakte/android/CaptchaActivity;

    invoke-direct {v2, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 106
    .local v2, "intent":Landroid/content/Intent;
    const/high16 v5, 0x10000000

    invoke-virtual {v2, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 107
    const-string/jumbo v5, "url"

    iget-object v6, v3, Lcom/vkontakte/android/auth/VKAuth$AuthResult;->authAnswer:Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    invoke-static {v6}, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->access$800(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 108
    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v5, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 109
    :goto_1
    sget-boolean v5, Lcom/vkontakte/android/CaptchaActivity;->isReady:Z

    if-nez v5, :cond_1

    .line 110
    invoke-static {v10, v11}, Lcom/vkontakte/android/auth/VKAuthUtils;->sleep(J)V

    goto :goto_1

    .line 112
    :cond_1
    const/4 v5, 0x0

    sput-boolean v5, Lcom/vkontakte/android/CaptchaActivity;->isReady:Z

    .line 114
    iget-object v5, v3, Lcom/vkontakte/android/auth/VKAuth$AuthResult;->authAnswer:Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    invoke-static {v5}, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->access$900(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)Ljava/lang/String;

    move-result-object v1

    .line 115
    .local v1, "captchaSid":Ljava/lang/String;
    sget-object v0, Lcom/vkontakte/android/CaptchaActivity;->lastKey:Ljava/lang/String;

    .line 117
    .local v0, "captchaKey":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 118
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuth;->getCallbackHandler()Landroid/os/Handler;

    move-result-object v5

    invoke-static {p1, v4}, Lcom/vkontakte/android/auth/VKAuth$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/auth/VKAuth$AuthListener;Lcom/vkontakte/android/auth/VKAuth$AuthResult;)Ljava/lang/Runnable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 133
    .end local v0    # "captchaKey":Ljava/lang/String;
    .end local v1    # "captchaSid":Ljava/lang/String;
    .end local v2    # "intent":Landroid/content/Intent;
    :goto_2
    return-void

    .line 121
    .restart local v0    # "captchaKey":Ljava/lang/String;
    .restart local v1    # "captchaSid":Ljava/lang/String;
    .restart local v2    # "intent":Landroid/content/Intent;
    :cond_2
    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/auth/VKAuthState;->setCaptchaInfo(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAuthState;

    goto :goto_0

    .line 127
    .end local v0    # "captchaKey":Ljava/lang/String;
    .end local v1    # "captchaSid":Ljava/lang/String;
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_3
    move-object v4, v3

    .line 128
    iget v5, v3, Lcom/vkontakte/android/auth/VKAuth$AuthResult;->code:I

    const/4 v6, 0x7

    if-ne v5, v6, :cond_4

    .line 129
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuth;->getCallbackHandler()Landroid/os/Handler;

    move-result-object v5

    invoke-static {p1, p0, v4}, Lcom/vkontakte/android/auth/VKAuth$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/auth/VKAuth$AuthListener;Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthResult;)Ljava/lang/Runnable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_2

    .line 131
    :cond_4
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuth;->getCallbackHandler()Landroid/os/Handler;

    move-result-object v5

    invoke-static {p1, v4}, Lcom/vkontakte/android/auth/VKAuth$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/auth/VKAuth$AuthListener;Lcom/vkontakte/android/auth/VKAuth$AuthResult;)Ljava/lang/Runnable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_2
.end method

.method static synthetic lambda$ensureLoggedIn$4(Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .locals 2
    .param p0, "act"    # Landroid/content/Context;
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I

    .prologue
    .line 208
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/AuthActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic lambda$null$0(Lcom/vkontakte/android/auth/VKAuth$AuthListener;Lcom/vkontakte/android/auth/VKAuth$AuthResult;)V
    .locals 2
    .param p0, "authListener"    # Lcom/vkontakte/android/auth/VKAuth$AuthListener;
    .param p1, "resultFinal"    # Lcom/vkontakte/android/auth/VKAuth$AuthResult;

    .prologue
    .line 118
    const/4 v0, 0x4

    iget-object v1, p1, Lcom/vkontakte/android/auth/VKAuth$AuthResult;->authAnswer:Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    invoke-interface {p0, v0, v1}, Lcom/vkontakte/android/auth/VKAuth$AuthListener;->onAuthFinish(ILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V

    return-void
.end method

.method static synthetic lambda$null$1(Lcom/vkontakte/android/auth/VKAuth$AuthListener;Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthResult;)V
    .locals 1
    .param p0, "authListener"    # Lcom/vkontakte/android/auth/VKAuth$AuthListener;
    .param p1, "state"    # Lcom/vkontakte/android/auth/VKAuthState;
    .param p2, "resultFinal"    # Lcom/vkontakte/android/auth/VKAuth$AuthResult;

    .prologue
    .line 129
    iget-object v0, p2, Lcom/vkontakte/android/auth/VKAuth$AuthResult;->authAnswer:Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    invoke-interface {p0, p1, v0}, Lcom/vkontakte/android/auth/VKAuth$AuthListener;->onAuthNeedValidation(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V

    return-void
.end method

.method static synthetic lambda$null$2(Lcom/vkontakte/android/auth/VKAuth$AuthListener;Lcom/vkontakte/android/auth/VKAuth$AuthResult;)V
    .locals 2
    .param p0, "authListener"    # Lcom/vkontakte/android/auth/VKAuth$AuthListener;
    .param p1, "resultFinal"    # Lcom/vkontakte/android/auth/VKAuth$AuthResult;

    .prologue
    .line 131
    iget v0, p1, Lcom/vkontakte/android/auth/VKAuth$AuthResult;->code:I

    iget-object v1, p1, Lcom/vkontakte/android/auth/VKAuth$AuthResult;->authAnswer:Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    invoke-interface {p0, v0, v1}, Lcom/vkontakte/android/auth/VKAuth$AuthListener;->onAuthFinish(ILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V

    return-void
.end method

.method private static loadWallInfoResult(Lcom/vkontakte/android/auth/VKAccount;)Lcom/vkontakte/android/api/execute/GetWallInfo$Result;
    .locals 5
    .param p0, "account"    # Lcom/vkontakte/android/auth/VKAccount;

    .prologue
    .line 214
    new-instance v0, Lcom/vkontakte/android/auth/VKAuth$Container;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lcom/vkontakte/android/auth/VKAuth$Container;-><init>(Lcom/vkontakte/android/auth/VKAuth$1;)V

    .line 215
    .local v0, "container":Lcom/vkontakte/android/auth/VKAuth$Container;, "Lcom/vkontakte/android/auth/VKAuth$Container<Lcom/vkontakte/android/api/execute/GetWallInfo$Result;>;"
    new-instance v2, Lcom/vkontakte/android/api/execute/GetWallInfo;

    invoke-direct {v2}, Lcom/vkontakte/android/api/execute/GetWallInfo;-><init>()V

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/api/execute/GetWallInfo;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    const-string/jumbo v3, "access_token"

    iget-object v4, p0, Lcom/vkontakte/android/auth/VKAccount;->accessToken:Ljava/lang/String;

    .line 216
    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 217
    .local v1, "wallInfo":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lcom/vkontakte/android/api/execute/GetWallInfo$Result;>;"
    const-string/jumbo v2, "sig"

    iget-object v3, p0, Lcom/vkontakte/android/auth/VKAccount;->secret:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->getSig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/api/VKAPIRequest;->persistWithToken()Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    .line 218
    iget-object v2, v0, Lcom/vkontakte/android/auth/VKAuth$Container;->object:Ljava/lang/Object;

    check-cast v2, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;

    return-object v2
.end method

.method public static logout()Z
    .locals 7

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 188
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    .line 189
    .local v2, "vkAccount":Lcom/vkontakte/android/auth/VKAccount;
    iget-object v0, v2, Lcom/vkontakte/android/auth/VKAccount;->accessToken:Ljava/lang/String;

    .line 190
    .local v0, "accessToken":Ljava/lang/String;
    iget-object v1, v2, Lcom/vkontakte/android/auth/VKAccount;->secret:Ljava/lang/String;

    .line 192
    .local v1, "secret":Ljava/lang/String;
    invoke-static {}, Lcom/vkontakte/android/ShortcutManagerWrapper;->getInstance()Lcom/vkontakte/android/ShortcutManagerWrapper;

    move-result-object v5

    sget-object v6, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/ShortcutManagerWrapper;->respondToUserLogout(Landroid/content/Context;)V

    .line 194
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->clearCurrent()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 195
    new-array v5, v3, [Ljava/lang/Object;

    const-string/jumbo v6, "logout"

    aput-object v6, v5, v4

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 196
    invoke-static {v0, v1}, Lcom/vkontakte/android/auth/VKSession;->cleanSession(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    :goto_0
    return v3

    :cond_0
    move v3, v4

    goto :goto_0
.end method

.method private static storeTrustedHash(Ljava/lang/String;)V
    .locals 3
    .param p0, "hash"    # Ljava/lang/String;

    .prologue
    .line 258
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v1, "2fa"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "trusted_hash"

    .line 259
    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 260
    return-void
.end method
