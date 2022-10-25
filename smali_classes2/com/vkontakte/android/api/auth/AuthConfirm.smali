.class public Lcom/vkontakte/android/api/auth/AuthConfirm;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AuthConfirm.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "phone"    # Ljava/lang/String;
    .param p2, "pass"    # Ljava/lang/String;

    .prologue
    .line 25
    const-string/jumbo v0, "auth.confirm"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 26
    const-string/jumbo v0, "phone"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/auth/AuthConfirm;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 27
    if-eqz p2, :cond_0

    .line 28
    const-string/jumbo v0, "password"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/auth/AuthConfirm;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 30
    :cond_0
    const-string/jumbo v0, "client_id"

    const v1, 0x22b2d3

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/auth/AuthConfirm;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 31
    const-string/jumbo v0, "client_secret"

    const-string/jumbo v1, "hHbZxrka2uZ6jB1inYsH"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/auth/AuthConfirm;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 32
    const-string/jumbo v0, "intro"

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/auth/AuthConfirm;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "phone"    # Ljava/lang/String;
    .param p2, "code"    # Ljava/lang/String;
    .param p3, "pass"    # Ljava/lang/String;

    .prologue
    .line 20
    invoke-direct {p0, p1, p3}, Lcom/vkontakte/android/api/auth/AuthConfirm;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    const-string/jumbo v0, "code"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/auth/AuthConfirm;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 22
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "phone"    # Ljava/lang/String;
    .param p2, "pass"    # Ljava/lang/String;
    .param p3, "sid"    # Ljava/lang/String;
    .param p4, "session"    # Ljava/lang/String;
    .param p5, "token"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/api/auth/AuthConfirm;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    const-string/jumbo v0, "sid"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/auth/AuthConfirm;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 15
    const-string/jumbo v0, "validate_session"

    invoke-virtual {p0, v0, p4}, Lcom/vkontakte/android/api/auth/AuthConfirm;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 16
    const-string/jumbo v0, "validate_token"

    invoke-virtual {p0, v0, p5}, Lcom/vkontakte/android/api/auth/AuthConfirm;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 17
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Ljava/lang/Integer;
    .locals 3
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 37
    :try_start_0
    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "user_id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 41
    :goto_0
    return-object v1

    .line 38
    :catch_0
    move-exception v0

    .line 39
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 41
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 10
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/auth/AuthConfirm;->parse(Lorg/json/JSONObject;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
