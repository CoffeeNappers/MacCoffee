.class public Lcom/vkontakte/android/api/execute/SetSubscriptionStatus;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "SetSubscriptionStatus.java"


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
.method public constructor <init>(IZ)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "subscribe"    # Z

    .prologue
    .line 17
    const-string/jumbo v0, "execute.setSubscriptionStatus"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 18
    const-string/jumbo v0, "id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/execute/SetSubscriptionStatus;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 19
    const-string/jumbo v1, "subscribe"

    if-eqz p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/api/execute/SetSubscriptionStatus;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 20
    return-void

    .line 19
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static createSetSubscriptionStatusAndSendAllStats(IZ)Lcom/vkontakte/android/api/execute/SetSubscriptionStatus;
    .locals 1
    .param p0, "id"    # I
    .param p1, "subscribe"    # Z

    .prologue
    .line 12
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->sendAnalyticsNow()V

    .line 13
    new-instance v0, Lcom/vkontakte/android/api/execute/SetSubscriptionStatus;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/api/execute/SetSubscriptionStatus;-><init>(IZ)V

    return-object v0
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Ljava/lang/Integer;
    .locals 1
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 24
    :try_start_0
    const-string/jumbo v0, "response"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 27
    :goto_0
    return-object v0

    .line 25
    :catch_0
    move-exception v0

    .line 27
    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

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
    .line 9
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/execute/SetSubscriptionStatus;->parse(Lorg/json/JSONObject;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
