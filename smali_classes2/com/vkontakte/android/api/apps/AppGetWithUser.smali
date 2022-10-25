.class public Lcom/vkontakte/android/api/apps/AppGetWithUser;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AppGetWithUser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(II)V
    .locals 5
    .param p1, "appId"    # I
    .param p2, "userId"    # I

    .prologue
    .line 21
    const-string/jumbo v2, "execute"

    invoke-direct {p0, v2}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 23
    const-string/jumbo v1, "return {app:API.apps.get({app_id:%1$d}), user:API.users.get({user_ids:%2$d})[0]};"

    .line 25
    .local v1, "executeStrFrm":Ljava/lang/String;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 27
    .local v0, "executeStr":Ljava/lang/String;
    const-string/jumbo v2, "code"

    invoke-virtual {p0, v2, v0}, Lcom/vkontakte/android/api/apps/AppGetWithUser;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 28
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;
    .locals 4
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 32
    new-instance v0, Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;

    invoke-direct {v0}, Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;-><init>()V

    .line 34
    .local v0, "respObj":Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;
    new-instance v1, Lcom/vkontakte/android/data/ApiApplication;

    const-string/jumbo v2, "response"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string/jumbo v3, "app"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string/jumbo v3, "items"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/data/ApiApplication;-><init>(Lorg/json/JSONObject;)V

    iput-object v1, v0, Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    .line 35
    new-instance v1, Lcom/vkontakte/android/UserProfile;

    const-string/jumbo v2, "response"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string/jumbo v3, "user"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    iput-object v1, v0, Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;->user:Lcom/vkontakte/android/UserProfile;

    .line 37
    return-object v0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 13
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/apps/AppGetWithUser;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;

    move-result-object v0

    return-object v0
.end method
