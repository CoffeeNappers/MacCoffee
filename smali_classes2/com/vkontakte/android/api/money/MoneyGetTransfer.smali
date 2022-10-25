.class public Lcom/vkontakte/android/api/money/MoneyGetTransfer;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "MoneyGetTransfer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/MoneyTransfer;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(III)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "fromId"    # I
    .param p3, "toId"    # I

    .prologue
    .line 22
    const-string/jumbo v0, "execute.moneyGetTransferFull"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 23
    const-string/jumbo v0, "id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/money/MoneyGetTransfer;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 24
    const-string/jumbo v0, "from_id"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/money/MoneyGetTransfer;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 25
    const-string/jumbo v0, "to_id"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/money/MoneyGetTransfer;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 26
    const-string/jumbo v0, "func_v"

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/money/MoneyGetTransfer;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 27
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/MoneyTransfer;
    .locals 5
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 30
    const-string/jumbo v3, "response"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 31
    .local v2, "response":Lorg/json/JSONObject;
    new-instance v0, Lcom/vkontakte/android/MoneyTransfer;

    const-string/jumbo v3, "transfer"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/vkontakte/android/MoneyTransfer;-><init>(Lorg/json/JSONObject;)V

    .line 34
    .local v0, "mt":Lcom/vkontakte/android/MoneyTransfer;
    const/4 v1, 0x0

    .line 36
    .local v1, "peerUser":Lcom/vkontakte/android/UserProfile;
    const-string/jumbo v3, "isPeerGroup"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 37
    new-instance v1, Lcom/vkontakte/android/UserProfile;

    .end local v1    # "peerUser":Lcom/vkontakte/android/UserProfile;
    new-instance v3, Lcom/vkontakte/android/api/Group;

    const-string/jumbo v4, "peer"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/vkontakte/android/api/Group;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v1, v3}, Lcom/vkontakte/android/UserProfile;-><init>(Lcom/vkontakte/android/api/Group;)V

    .line 44
    .restart local v1    # "peerUser":Lcom/vkontakte/android/UserProfile;
    :goto_0
    const-string/jumbo v3, "toPeer"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 45
    iput-object v1, v0, Lcom/vkontakte/android/MoneyTransfer;->toUser:Lcom/vkontakte/android/UserProfile;

    .line 51
    :goto_1
    return-object v0

    .line 40
    :cond_0
    new-instance v1, Lcom/vkontakte/android/UserProfile;

    .end local v1    # "peerUser":Lcom/vkontakte/android/UserProfile;
    const-string/jumbo v3, "peer"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    .restart local v1    # "peerUser":Lcom/vkontakte/android/UserProfile;
    goto :goto_0

    .line 48
    :cond_1
    iput-object v1, v0, Lcom/vkontakte/android/MoneyTransfer;->fromUser:Lcom/vkontakte/android/UserProfile;

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
    .line 16
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/money/MoneyGetTransfer;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/MoneyTransfer;

    move-result-object v0

    return-object v0
.end method
