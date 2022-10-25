.class public Lcom/vkontakte/android/api/apps/AppsSendRequest;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "AppsSendRequest.java"


# direct methods
.method private constructor <init>(IILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "appId"    # I
    .param p2, "userTo"    # I
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "requestKey"    # Ljava/lang/String;

    .prologue
    .line 25
    const-string/jumbo v0, "apps.sendRequest"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 26
    const-string/jumbo v0, "app_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/apps/AppsSendRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 27
    const-string/jumbo v0, "user_id"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/apps/AppsSendRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 28
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 29
    const-string/jumbo v0, "text"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/apps/AppsSendRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 31
    :cond_0
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 32
    const-string/jumbo v0, "key"

    invoke-virtual {p0, v0, p4}, Lcom/vkontakte/android/api/apps/AppsSendRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 34
    :cond_1
    const-string/jumbo v0, "type"

    const-string/jumbo v1, "request"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/apps/AppsSendRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 36
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 20
    const-string/jumbo v0, "execute"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 21
    const-string/jumbo v0, "code"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/apps/AppsSendRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 22
    return-void
.end method

.method public static createAppInviteRequest(ILjava/util/ArrayList;)Lcom/vkontakte/android/api/apps/AppsSendRequest;
    .locals 8
    .param p0, "appId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/vkontakte/android/api/apps/AppsSendRequest;"
        }
    .end annotation

    .prologue
    .line 42
    .local p1, "userIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const-string/jumbo v0, "API.apps.sendRequest({app_id:%1$d, user_id:%2$d, type:\"invite\"});"

    .line 44
    .local v0, "executeFrmStr":Ljava/lang/String;
    const-string/jumbo v1, ""

    .line 46
    .local v1, "executeStr":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 47
    .local v2, "userId":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, " "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v0, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 48
    goto :goto_0

    .line 50
    .end local v2    # "userId":I
    :cond_0
    new-instance v3, Lcom/vkontakte/android/api/apps/AppsSendRequest;

    invoke-direct {v3, v1}, Lcom/vkontakte/android/api/apps/AppsSendRequest;-><init>(Ljava/lang/String;)V

    return-object v3
.end method

.method public static createAppRequestRequest(IILjava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/apps/AppsSendRequest;
    .locals 1
    .param p0, "appId"    # I
    .param p1, "userTo"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "requestKey"    # Ljava/lang/String;

    .prologue
    .line 59
    new-instance v0, Lcom/vkontakte/android/api/apps/AppsSendRequest;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vkontakte/android/api/apps/AppsSendRequest;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Ljava/lang/Boolean;
    .locals 1
    .param p1, "r"    # Lorg/json/JSONObject;

    .prologue
    .line 64
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/ResultlessAPIRequest;->parse(Lorg/json/JSONObject;)Ljava/lang/Boolean;

    move-result-object v0

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
    .line 16
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/apps/AppsSendRequest;->parse(Lorg/json/JSONObject;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
