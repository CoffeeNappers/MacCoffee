.class public Lcom/vkontakte/android/api/messages/MessagesGetDialogs;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "MessagesGetDialogs.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/DialogEntry;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 29
    const-string/jumbo v0, "execute.getDialogsWithProfilesNewFixGroups"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 30
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/messages/MessagesGetDialogs;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "count"

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 31
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;
    .locals 9
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/DialogEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 35
    :try_start_0
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    .line 36
    .local v4, "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v7, "response"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "p"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 37
    .local v3, "p":Lorg/json/JSONArray;
    if-eqz v3, :cond_0

    .line 38
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v2, v7, :cond_0

    .line 39
    new-instance v5, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-direct {v5, v7}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    .line 40
    .local v5, "up":Lcom/vkontakte/android/UserProfile;
    iget v7, v5, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v4, v7, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 38
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 43
    .end local v2    # "i":I
    .end local v5    # "up":Lcom/vkontakte/android/UserProfile;
    :cond_0
    const/4 v7, 0x0

    new-instance v8, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v8}, Lcom/vkontakte/android/UserProfile;-><init>()V

    invoke-virtual {v4, v7, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 45
    const-string/jumbo v7, "response"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "a"

    invoke-static {v7, v8}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v0

    .line 46
    .local v0, "aa":Lcom/vkontakte/android/api/JSONArrayWithCount;
    if-nez v0, :cond_1

    .line 47
    new-instance v1, Lcom/vkontakte/android/data/VKList;

    invoke-direct {v1}, Lcom/vkontakte/android/data/VKList;-><init>()V

    .line 127
    .end local v0    # "aa":Lcom/vkontakte/android/api/JSONArrayWithCount;
    .end local v3    # "p":Lorg/json/JSONArray;
    .end local v4    # "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    :goto_1
    return-object v1

    .line 49
    .restart local v0    # "aa":Lcom/vkontakte/android/api/JSONArrayWithCount;
    .restart local v3    # "p":Lorg/json/JSONArray;
    .restart local v4    # "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    :cond_1
    new-instance v1, Lcom/vkontakte/android/data/VKList;

    const-string/jumbo v7, "response"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "a"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    new-instance v8, Lcom/vkontakte/android/api/messages/MessagesGetDialogs$1;

    invoke-direct {v8, p0, v4}, Lcom/vkontakte/android/api/messages/MessagesGetDialogs$1;-><init>(Lcom/vkontakte/android/api/messages/MessagesGetDialogs;Landroid/util/SparseArray;)V

    invoke-direct {v1, v7, v8}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Lcom/vkontakte/android/data/Parser;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 123
    .local v1, "dlgs":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/DialogEntry;>;"
    goto :goto_1

    .line 124
    .end local v0    # "aa":Lcom/vkontakte/android/api/JSONArrayWithCount;
    .end local v1    # "dlgs":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/DialogEntry;>;"
    .end local v3    # "p":Lorg/json/JSONArray;
    .end local v4    # "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    :catch_0
    move-exception v6

    .line 125
    .local v6, "x":Ljava/lang/Exception;
    const-string/jumbo v7, "vk"

    invoke-static {v7, v6}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 127
    const/4 v1, 0x0

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
    .line 26
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/messages/MessagesGetDialogs;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;

    move-result-object v0

    return-object v0
.end method
