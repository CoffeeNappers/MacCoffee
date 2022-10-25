.class public Lcom/vkontakte/android/api/apps/AppsGet;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AppsGet.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/data/ApiApplication;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "appId"    # I

    .prologue
    .line 18
    const-string/jumbo v0, "apps.get"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 19
    const-string/jumbo v0, "app_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/apps/AppsGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 20
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/ApiApplication;
    .locals 3
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 24
    new-instance v1, Lcom/vkontakte/android/data/ApiApplication;

    const-string/jumbo v0, "response"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string/jumbo v2, "items"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/data/ApiApplication;-><init>(Lorg/json/JSONObject;)V

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
    .line 15
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/apps/AppsGet;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/ApiApplication;

    move-result-object v0

    return-object v0
.end method
