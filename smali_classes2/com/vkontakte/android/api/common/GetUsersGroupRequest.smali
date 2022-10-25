.class public Lcom/vkontakte/android/api/common/GetUsersGroupRequest;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "GetUsersGroupRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 26
    const-string/jumbo v0, "extended"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/common/GetUsersGroupRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "fields"

    const-string/jumbo v2, "photo_50,photo_100,photo_200"

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 28
    return-void
.end method

.method public static getNewsfeedBanned()Lcom/vkontakte/android/api/common/GetUsersGroupRequest;
    .locals 2

    .prologue
    .line 17
    new-instance v0, Lcom/vkontakte/android/api/common/GetUsersGroupRequest;

    const-string/jumbo v1, "newsfeed.getBanned"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/common/GetUsersGroupRequest;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static getStoriesBanned()Lcom/vkontakte/android/api/common/GetUsersGroupRequest;
    .locals 2

    .prologue
    .line 21
    new-instance v0, Lcom/vkontakte/android/api/common/GetUsersGroupRequest;

    const-string/jumbo v1, "stories.getBanned"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/common/GetUsersGroupRequest;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;
    .locals 11
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 32
    :try_start_0
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .local v7, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .local v0, "groups":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v9, "response"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    const-string/jumbo v10, "profiles"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 34
    .local v3, "ju":Lorg/json/JSONArray;
    const-string/jumbo v9, "response"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    const-string/jumbo v10, "groups"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 35
    .local v2, "jg":Lorg/json/JSONArray;
    if-eqz v3, :cond_0

    .line 36
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v1, v9, :cond_0

    .line 37
    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 38
    .local v6, "u":Lorg/json/JSONObject;
    new-instance v4, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v4, v6}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    .line 39
    .local v4, "p":Lcom/vkontakte/android/UserProfile;
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 42
    .end local v1    # "i":I
    .end local v4    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v6    # "u":Lorg/json/JSONObject;
    :cond_0
    if-eqz v2, :cond_4

    .line 43
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v1, v9, :cond_4

    .line 44
    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 45
    .restart local v6    # "u":Lorg/json/JSONObject;
    new-instance v4, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v4}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 46
    .restart local v4    # "p":Lcom/vkontakte/android/UserProfile;
    const-string/jumbo v9, "id"

    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    neg-int v9, v9

    iput v9, v4, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 47
    const-string/jumbo v9, "name"

    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 48
    sget v9, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v10, 0x40000000    # 2.0f

    cmpl-float v9, v9, v10

    if-gez v9, :cond_1

    invoke-static {}, Lcom/vk/core/util/Screen;->isTablet()Z

    move-result v9

    if-eqz v9, :cond_2

    :cond_1
    const-string/jumbo v9, "photo_200"

    :goto_2
    const-string/jumbo v10, "photo_100"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v4, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 49
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 48
    :cond_2
    sget v9, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v10, 0x3f800000    # 1.0f

    cmpl-float v9, v9, v10

    if-lez v9, :cond_3

    const-string/jumbo v9, "photo_100"

    goto :goto_2

    :cond_3
    const-string/jumbo v9, "photo_50"

    goto :goto_2

    .line 52
    .end local v1    # "i":I
    .end local v4    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v6    # "u":Lorg/json/JSONObject;
    :cond_4
    new-instance v5, Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;

    invoke-direct {v5}, Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;-><init>()V

    .line 53
    .local v5, "r":Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;
    iput-object v7, v5, Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;->users:Ljava/util/ArrayList;

    .line 54
    iput-object v0, v5, Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;->groups:Ljava/util/ArrayList;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .end local v0    # "groups":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    .end local v2    # "jg":Lorg/json/JSONArray;
    .end local v3    # "ju":Lorg/json/JSONArray;
    .end local v5    # "r":Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;
    .end local v7    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :goto_3
    return-object v5

    .line 56
    :catch_0
    move-exception v8

    .line 57
    .local v8, "x":Ljava/lang/Exception;
    const-string/jumbo v9, "vk"

    invoke-static {v9, v8}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 59
    const/4 v5, 0x0

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
    .line 14
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/common/GetUsersGroupRequest;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;

    move-result-object v0

    return-object v0
.end method
