.class public Lcom/vkontakte/android/auth/configs/ProfilerConfig;
.super Ljava/lang/Object;
.source "ProfilerConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;
    }
.end annotation


# instance fields
.field private final apiRequests:Z

.field private final downloadPatterns:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 18
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/vkontakte/android/auth/configs/ProfilerConfig;-><init>(Lorg/json/JSONObject;)V

    .line 19
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "obj"    # Lorg/json/JSONObject;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig;->downloadPatterns:Ljava/util/List;

    .line 22
    const-string/jumbo v3, "api_requests"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig;->apiRequests:Z

    .line 24
    const-string/jumbo v3, "download_patterns"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 25
    .local v2, "patterns":Lorg/json/JSONArray;
    if-eqz v2, :cond_1

    .line 26
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 27
    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 28
    .local v1, "pattern":Lorg/json/JSONObject;
    if-eqz v1, :cond_0

    .line 29
    iget-object v3, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig;->downloadPatterns:Ljava/util/List;

    new-instance v4, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;

    invoke-direct {v4, v1}, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;-><init>(Lorg/json/JSONObject;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 33
    .end local v0    # "i":I
    .end local v1    # "pattern":Lorg/json/JSONObject;
    :cond_1
    return-void
.end method


# virtual methods
.method public getDownloadPatterns()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;",
            ">;"
        }
    .end annotation

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig;->downloadPatterns:Ljava/util/List;

    return-object v0
.end method

.method public isApiRequests()Z
    .locals 1

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig;->apiRequests:Z

    return v0
.end method

.method public toJSONString()Ljava/lang/String;
    .locals 9

    .prologue
    .line 45
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 46
    .local v4, "result":Lorg/json/JSONObject;
    const-string/jumbo v5, "api_requests"

    iget-boolean v6, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig;->apiRequests:Z

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 47
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 48
    .local v0, "array":Lorg/json/JSONArray;
    iget-object v5, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig;->downloadPatterns:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;

    .line 49
    .local v3, "pattern":Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;
    invoke-virtual {v3}, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->toJSON()Lorg/json/JSONObject;

    move-result-object v2

    .line 50
    .local v2, "item":Lorg/json/JSONObject;
    if-eqz v2, :cond_0

    .line 51
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 56
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v2    # "item":Lorg/json/JSONObject;
    .end local v3    # "pattern":Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;
    .end local v4    # "result":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 57
    .local v1, "e":Ljava/lang/Exception;
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string/jumbo v7, "ProfilerConfig"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "JSON build error "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 58
    const/4 v5, 0x0

    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    return-object v5

    .line 54
    .restart local v0    # "array":Lorg/json/JSONArray;
    .restart local v4    # "result":Lorg/json/JSONObject;
    :cond_1
    :try_start_1
    const-string/jumbo v5, "download_patterns"

    invoke-virtual {v4, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 55
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v5

    goto :goto_1
.end method
