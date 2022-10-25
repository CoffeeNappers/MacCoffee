.class public Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "UtilsProxiesPreferences.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;",
        ">;"
    }
.end annotation


# static fields
.field public static final TYPE_NO_PROXY:I = 0x1

.field public static final TYPE_NO_PROXY_WITH_MESSAGE:I = 0x3

.field public static final TYPE_USE_PROXY:I = 0x2

.field public static final TYPE_USE_PROXY_WITH_MESSAGE:I = 0x4


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .param p1, "uid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p2, "info":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v0, "utils.getProxiesPreferences"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 26
    const-string/jumbo v0, "user_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 27
    const-string/jumbo v0, "log_info"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 28
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;
    .locals 3
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 32
    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 33
    new-instance v0, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;

    invoke-direct {v0}, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;-><init>()V

    .line 34
    .local v0, "res":Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;
    const-string/jumbo v1, "type"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;->type:I

    .line 35
    iget v1, v0, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;->type:I

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    iget v1, v0, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;->type:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_1

    .line 37
    :cond_0
    :try_start_0
    const-string/jumbo v1, "title"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;->title:Ljava/lang/String;

    .line 38
    const-string/jumbo v1, "message"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;->message:Ljava/lang/String;

    .line 39
    const-string/jumbo v1, "button"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;->button:Ljava/lang/String;

    .line 40
    const-string/jumbo v1, "url"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;->url:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    :cond_1
    :goto_0
    return-object v0

    .line 41
    :catch_0
    move-exception v1

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
    .line 18
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/utils/UtilsProxiesPreferences$Result;

    move-result-object v0

    return-object v0
.end method
