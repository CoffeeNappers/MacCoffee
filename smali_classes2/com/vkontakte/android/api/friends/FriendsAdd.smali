.class public Lcom/vkontakte/android/api/friends/FriendsAdd;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "FriendsAdd.java"


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
.method public constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "uid"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 16
    const-string/jumbo v0, "friends.add"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 17
    const-string/jumbo v0, "user_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/friends/FriendsAdd;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 18
    if-eqz p2, :cond_0

    .line 19
    const-string/jumbo v0, "text"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/friends/FriendsAdd;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 21
    :cond_0
    return-void
.end method

.method public static createFriendsAddAndSendAllStats(ILjava/lang/String;)Lcom/vkontakte/android/api/friends/FriendsAdd;
    .locals 1
    .param p0, "uid"    # I
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 11
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->sendAnalyticsNow()V

    .line 12
    new-instance v0, Lcom/vkontakte/android/api/friends/FriendsAdd;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/api/friends/FriendsAdd;-><init>(ILjava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Ljava/lang/Integer;
    .locals 1
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 25
    :try_start_0
    const-string/jumbo v0, "response"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 28
    :goto_0
    return-object v0

    .line 26
    :catch_0
    move-exception v0

    .line 28
    const/4 v0, 0x0

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
    .line 8
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/friends/FriendsAdd;->parse(Lorg/json/JSONObject;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
