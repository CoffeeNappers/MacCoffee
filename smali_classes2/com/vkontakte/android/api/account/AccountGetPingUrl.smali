.class public Lcom/vkontakte/android/api/account/AccountGetPingUrl;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AccountGetPingUrl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 9
    const-string/jumbo v0, "account.getPingUrl"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 10
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;
    .locals 6
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 14
    const-string/jumbo v2, "response"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 15
    .local v0, "data":Lorg/json/JSONObject;
    new-instance v1, Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;

    invoke-direct {v1}, Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;-><init>()V

    .line 16
    .local v1, "result":Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;
    const-string/jumbo v2, "is_enabled"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, v1, Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;->isEnabled:Z

    .line 17
    iget-boolean v2, v1, Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;->isEnabled:Z

    if-eqz v2, :cond_0

    .line 18
    const-string/jumbo v2, "endpoint"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;->endpointUrl:Ljava/lang/String;

    .line 19
    const-string/jumbo v2, "time_interval"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    int-to-long v2, v2

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    iput-wide v2, v1, Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;->timeInterval:J

    .line 21
    :cond_0
    return-object v1
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 6
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/account/AccountGetPingUrl;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;

    move-result-object v0

    return-object v0
.end method
