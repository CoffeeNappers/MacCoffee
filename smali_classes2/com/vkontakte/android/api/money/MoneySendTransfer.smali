.class public Lcom/vkontakte/android/api/money/MoneySendTransfer;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "MoneySendTransfer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(IILjava/lang/String;)V
    .locals 2
    .param p1, "receiverId"    # I
    .param p2, "amount"    # I
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 19
    const-string/jumbo v1, "money.sendTransfer"

    invoke-direct {p0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 21
    const-string/jumbo v1, "receiver_id"

    invoke-virtual {p0, v1, p1}, Lcom/vkontakte/android/api/money/MoneySendTransfer;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 22
    const-string/jumbo v1, "amount"

    invoke-virtual {p0, v1, p2}, Lcom/vkontakte/android/api/money/MoneySendTransfer;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 23
    const-string/jumbo v1, "message"

    invoke-virtual {p0, v1, p3}, Lcom/vkontakte/android/api/money/MoneySendTransfer;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 25
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    iget-object v0, v1, Lcom/vkontakte/android/auth/VKAccount;->monetTransfersCurrency:Ljava/lang/String;

    .line 26
    .local v0, "currency":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 27
    const-string/jumbo v1, "currency"

    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/api/money/MoneySendTransfer;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 29
    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 13
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/money/MoneySendTransfer;->parse(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 3
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 34
    :try_start_0
    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "redirect_uri"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 37
    :goto_0
    return-object v1

    .line 35
    :catch_0
    move-exception v0

    .line 36
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 37
    const/4 v1, 0x0

    goto :goto_0
.end method
