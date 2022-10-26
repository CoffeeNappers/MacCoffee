.class public Lcom/vkontakte/android/api/account/AccountChangePassword;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AccountChangePassword.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/account/AccountChangePassword$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/account/AccountChangePassword$Result;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    
    const-string v0, "account.changePassword"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string v0, "old_password"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/account/AccountChangePassword;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    const-string v0, "new_password"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/account/AccountChangePassword;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const-string v0, "account.changePassword"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string v0, "restore_sid"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/account/AccountChangePassword;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    const-string v0, "change_password_hash"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/account/AccountChangePassword;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    const-string v0, "password"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/account/AccountChangePassword;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/account/AccountChangePassword$Result;
    .locals 4

    :try_start_0
    const-string v0, "response"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    new-instance v0, Lcom/vkontakte/android/api/account/AccountChangePassword$Result;

    invoke-direct {v0}, Lcom/vkontakte/android/api/account/AccountChangePassword$Result;-><init>()V

    const-string v2, "token"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/vkontakte/android/api/account/AccountChangePassword$Result;->token:Ljava/lang/String;

    const-string v2, "secret"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/api/account/AccountChangePassword$Result;->secret:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    const/4 v3, 0x2
    return-object v0
    :catch_0
    move-exception v0

    const-string v1, "vk"

    invoke-static {v1, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    goto :goto_0
    const/4 v3, 0x3

    const/4 v1, 0x3
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v1, 0x1

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/account/AccountChangePassword;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/account/AccountChangePassword$Result;

    move-result-object v0

    return-object v0
    const/4 v1, 0x1
.end method
