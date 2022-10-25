.class public Lcom/vkontakte/android/api/auth/AuthRestore;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AuthRestore.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/auth/AuthRestore$AuthRestoreAnswer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Landroid/util/Pair",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Boolean;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 2
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "sid"    # Ljava/lang/String;
    .param p3, "voice"    # Z
    .param p4, "libverify"    # Z

    .prologue
    const/4 v1, 0x1

    .line 23
    const-string/jumbo v0, "auth.restore"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 24
    const-string/jumbo v0, "phone"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/auth/AuthRestore;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 25
    const-string/jumbo v0, "sid"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/auth/AuthRestore;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 26
    if-eqz p3, :cond_0

    .line 27
    const-string/jumbo v0, "voice"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/auth/AuthRestore;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 29
    :cond_0
    if-eqz p4, :cond_1

    .line 30
    const-string/jumbo v0, "libverify_support"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/auth/AuthRestore;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 32
    :cond_1
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Landroid/util/Pair;
    .locals 7
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 36
    :try_start_0
    const-string/jumbo v2, "response"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 37
    .local v0, "response":Lorg/json/JSONObject;
    new-instance v2, Landroid/util/Pair;

    const-string/jumbo v3, "sid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v3, "libverify_support"

    const/4 v6, 0x0

    invoke-virtual {v0, v3, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    :goto_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-direct {v2, v5, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .end local v0    # "response":Lorg/json/JSONObject;
    :goto_1
    return-object v2

    .restart local v0    # "response":Lorg/json/JSONObject;
    :cond_0
    move v3, v4

    .line 37
    goto :goto_0

    .line 38
    .end local v0    # "response":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 39
    .local v1, "x":Ljava/lang/Exception;
    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 40
    const/4 v2, 0x0

    goto :goto_1
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
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/auth/AuthRestore;->parse(Lorg/json/JSONObject;)Landroid/util/Pair;

    move-result-object v0

    return-object v0
.end method
