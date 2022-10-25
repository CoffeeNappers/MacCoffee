.class public Lcom/vkontakte/android/api/messages/MessagesGetLastActivity;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "MessagesGetLastActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "uid"    # I

    .prologue
    .line 13
    const-string/jumbo v0, "users.get"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 14
    const-string/jumbo v0, "user_ids"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 15
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "online,sex,last_seen"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 16
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;
    .locals 7
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 20
    :try_start_0
    const-string/jumbo v5, "response"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p1

    .line 21
    const-string/jumbo v5, "last_seen"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string/jumbo v5, "last_seen"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "platform"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 22
    .local v0, "platform":I
    :goto_0
    new-instance v1, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;

    invoke-direct {v1}, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;-><init>()V

    .line 23
    .local v1, "result":Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;
    const-string/jumbo v5, "last_seen"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    const-string/jumbo v5, "last_seen"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "time"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    :goto_1
    iput v5, v1, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;->time:I

    .line 24
    invoke-static {p1}, Lcom/vkontakte/android/Global;->getUserOnlineStatus(Lorg/json/JSONObject;)I

    move-result v5

    iput v5, v1, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;->online:I

    .line 25
    const-string/jumbo v5, "sex"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v4, :cond_4

    move v5, v4

    :goto_2
    iput-boolean v5, v1, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;->f:Z

    .line 26
    if-eq v0, v4, :cond_0

    const/4 v5, 0x2

    if-eq v0, v5, :cond_0

    const/4 v5, 0x3

    if-eq v0, v5, :cond_0

    const/4 v5, 0x4

    if-eq v0, v5, :cond_0

    const/4 v5, 0x5

    if-ne v0, v5, :cond_1

    :cond_0
    move v3, v4

    :cond_1
    iput-boolean v3, v1, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;->mobile:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .end local v0    # "platform":I
    .end local v1    # "result":Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;
    :goto_3
    return-object v1

    :cond_2
    move v0, v3

    .line 21
    goto :goto_0

    .restart local v0    # "platform":I
    .restart local v1    # "result":Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;
    :cond_3
    move v5, v3

    .line 23
    goto :goto_1

    :cond_4
    move v5, v3

    .line 25
    goto :goto_2

    .line 28
    .end local v0    # "platform":I
    .end local v1    # "result":Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;
    :catch_0
    move-exception v2

    .line 29
    .local v2, "x":Ljava/lang/Exception;
    const-string/jumbo v3, "vk"

    invoke-static {v3, v2}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 31
    const/4 v1, 0x0

    goto :goto_3
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
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;

    move-result-object v0

    return-object v0
.end method
