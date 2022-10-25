.class public Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "ExecuteGetAccountSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    const-string/jumbo v0, "execute.getAccountSettings"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 16
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;
    .locals 4
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 20
    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 21
    new-instance v0, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    invoke-direct {v0}, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;-><init>()V

    .line 22
    .local v0, "res":Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;
    const-string/jumbo v1, "email"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->email:Ljava/lang/String;

    .line 23
    const-string/jumbo v1, "change_email_url"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->emailLink:Ljava/lang/String;

    .line 24
    const-string/jumbo v1, "phone"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->phone:Ljava/lang/String;

    .line 25
    const-string/jumbo v1, "change_phone_url"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->phoneLink:Ljava/lang/String;

    .line 26
    const-string/jumbo v1, "own_posts_default"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    if-ne v1, v2, :cond_0

    move v1, v2

    :goto_0
    iput-boolean v1, v0, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->ownPostsDefault:Z

    .line 27
    const-string/jumbo v1, "no_wall_replies"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    if-ne v1, v2, :cond_1

    :goto_1
    iput-boolean v2, v0, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->noWallReplies:Z

    .line 28
    const-string/jumbo v1, "news_banned_count"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->newsBannedCount:I

    .line 29
    const-string/jumbo v1, "domain"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;->domain:Ljava/lang/String;

    .line 30
    return-object v0

    :cond_0
    move v1, v3

    .line 26
    goto :goto_0

    :cond_1
    move v2, v3

    .line 27
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
    .line 12
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    move-result-object v0

    return-object v0
.end method
