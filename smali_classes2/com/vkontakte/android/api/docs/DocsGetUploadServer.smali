.class public Lcom/vkontakte/android/api/docs/DocsGetUploadServer;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "DocsGetUploadServer.java"


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
.method public constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "ownerID"    # I
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 17
    const-string/jumbo v0, "docs.getUploadServer"

    invoke-direct {p0, p1, v0, p2}, Lcom/vkontakte/android/api/docs/DocsGetUploadServer;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 18
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "ownerID"    # I
    .param p2, "method"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 22
    if-gez p1, :cond_0

    .line 23
    const-string/jumbo v0, "group_id"

    neg-int v1, p1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/docs/DocsGetUploadServer;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 25
    :cond_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 26
    const-string/jumbo v0, "type"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/docs/DocsGetUploadServer;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 28
    :cond_1
    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 2
    .param p1, "ownerID"    # I
    .param p2, "wall"    # Z

    .prologue
    .line 13
    if-eqz p2, :cond_0

    const-string/jumbo v0, "docs.getWallUploadServer"

    :goto_0
    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/vkontakte/android/api/docs/DocsGetUploadServer;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 14
    return-void

    .line 13
    :cond_0
    const-string/jumbo v0, "docs.getUploadServer"

    goto :goto_0
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
    .line 10
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/docs/DocsGetUploadServer;->parse(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 32
    :try_start_0
    const-string/jumbo v0, "response"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string/jumbo v1, "upload_url"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 35
    :goto_0
    return-object v0

    .line 33
    :catch_0
    move-exception v0

    .line 35
    const/4 v0, 0x0

    goto :goto_0
.end method
