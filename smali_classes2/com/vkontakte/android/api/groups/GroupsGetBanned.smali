.class public Lcom/vkontakte/android/api/groups/GroupsGetBanned;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "GroupsGetBanned.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(II)V
    .locals 2
    .param p1, "gid"    # I
    .param p2, "uid"    # I

    .prologue
    .line 28
    const-string/jumbo v0, "execute.getGroupBannedUsers"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 29
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "photo_100,photo_200,photo_50,first_name_acc,last_name_acc,sex"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/groups/GroupsGetBanned;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 30
    const-string/jumbo v0, "group_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/groups/GroupsGetBanned;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "user_id"

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 31
    return-void
.end method

.method public constructor <init>(III)V
    .locals 2
    .param p1, "gid"    # I
    .param p2, "offset"    # I
    .param p3, "count"    # I

    .prologue
    .line 22
    const-string/jumbo v0, "execute.getGroupBannedUsers"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 23
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "photo_100,photo_200,photo_50,first_name_acc,last_name_acc,sex"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/groups/GroupsGetBanned;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 24
    const-string/jumbo v0, "group_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/groups/GroupsGetBanned;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "offset"

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "count"

    invoke-virtual {v0, v1, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 25
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;
    .locals 11
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 35
    :try_start_0
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 36
    .local v0, "admins":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v7, "response"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "admins"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 37
    .local v2, "jadmins":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v1, v7, :cond_0

    .line 38
    new-instance v3, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-direct {v3, v7}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    .line 39
    .local v3, "p":Lcom/vkontakte/android/UserProfile;
    iget v7, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v0, v7, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 37
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 41
    .end local v3    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_0
    new-instance v4, Lcom/vkontakte/android/data/VKList;

    const-string/jumbo v7, "response"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    new-instance v8, Lcom/vkontakte/android/api/groups/GroupsGetBanned$1;

    invoke-direct {v8, p0, v0}, Lcom/vkontakte/android/api/groups/GroupsGetBanned$1;-><init>(Lcom/vkontakte/android/api/groups/GroupsGetBanned;Landroid/util/SparseArray;)V

    invoke-direct {v4, v7, v8}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Lcom/vkontakte/android/data/Parser;)V

    .line 58
    .local v4, "res":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual {v4}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v7

    if-nez v7, :cond_1

    const-string/jumbo v7, "response"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "is_member"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 59
    new-instance v3, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v3}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 60
    .restart local v3    # "p":Lcom/vkontakte/android/UserProfile;
    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    iput-object v7, v3, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 61
    iget-object v7, v3, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v8, "is_group_member"

    const-string/jumbo v9, "response"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    const-string/jumbo v10, "is_member"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    if-ne v9, v6, :cond_2

    :goto_1
    invoke-virtual {v7, v8, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 62
    invoke-virtual {v4, v3}, Lcom/vkontakte/android/data/VKList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .end local v0    # "admins":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    .end local v1    # "i":I
    .end local v2    # "jadmins":Lorg/json/JSONArray;
    .end local v3    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v4    # "res":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_1
    :goto_2
    return-object v4

    .line 61
    .restart local v0    # "admins":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    .restart local v1    # "i":I
    .restart local v2    # "jadmins":Lorg/json/JSONArray;
    .restart local v3    # "p":Lcom/vkontakte/android/UserProfile;
    .restart local v4    # "res":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_2
    const/4 v6, 0x0

    goto :goto_1

    .line 65
    .end local v0    # "admins":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    .end local v1    # "i":I
    .end local v2    # "jadmins":Lorg/json/JSONArray;
    .end local v3    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v4    # "res":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/UserProfile;>;"
    :catch_0
    move-exception v5

    .line 66
    .local v5, "x":Ljava/lang/Exception;
    const-string/jumbo v6, "vk"

    invoke-static {v6, v5}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 68
    const/4 v4, 0x0

    goto :goto_2
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/groups/GroupsGetBanned;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;

    move-result-object v0

    return-object v0
.end method
