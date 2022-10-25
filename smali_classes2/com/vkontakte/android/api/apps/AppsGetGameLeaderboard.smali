.class public Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AppsGetGameLeaderboard.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "appId"    # I

    .prologue
    .line 81
    const-string/jumbo v0, "execute.getGameLeaderboard"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 82
    const-string/jumbo v0, "app_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 83
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "online,photo_100,photo_50,photo_200,sex"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 84
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;
    .locals 17
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 88
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .local v10, "leaderboards":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameLeaderboard;>;"
    new-instance v11, Landroid/util/SparseArray;

    invoke-direct {v11}, Landroid/util/SparseArray;-><init>()V

    .line 92
    .local v11, "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v15, "response"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    .line 94
    .local v12, "response":Lorg/json/JSONObject;
    const/4 v14, 0x0

    .line 95
    .local v14, "userLevelOrPointsMax":I
    const-string/jumbo v15, "level"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15, v14}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v14

    .line 96
    const-string/jumbo v15, "points"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15, v14}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v14

    .line 98
    new-instance v1, Lcom/vkontakte/android/data/ApiApplication;

    const-string/jumbo v15, "app"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    invoke-direct {v1, v15}, Lcom/vkontakte/android/data/ApiApplication;-><init>(Lorg/json/JSONObject;)V

    .line 100
    .local v1, "apiApplication":Lcom/vkontakte/android/data/ApiApplication;
    const-string/jumbo v15, "leaderboard"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 102
    .local v6, "jsonLeaderboard":Lorg/json/JSONObject;
    const-string/jumbo v15, "profiles"

    invoke-virtual {v6, v15}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    .line 104
    .local v8, "jsonProfiles":Lorg/json/JSONArray;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-ge v5, v15, :cond_0

    .line 105
    new-instance v13, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v8, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v15

    invoke-direct {v13, v15}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    .line 106
    .local v13, "up":Lcom/vkontakte/android/UserProfile;
    iget v15, v13, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v11, v15, v13}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 104
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 109
    .end local v13    # "up":Lcom/vkontakte/android/UserProfile;
    :cond_0
    new-instance v2, Lcom/vkontakte/android/UserProfile;

    const-string/jumbo v15, "user"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    invoke-direct {v2, v15}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    .line 110
    .local v2, "currentUser":Lcom/vkontakte/android/UserProfile;
    const-string/jumbo v15, "items"

    invoke-virtual {v6, v15}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    .line 111
    .local v7, "jsonLeaderboardItems":Lorg/json/JSONArray;
    const/4 v4, 0x0

    .line 112
    .local v4, "haveCurrentUserInLeaderboard":Z
    const/4 v5, 0x0

    :goto_1
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-ge v5, v15, :cond_2

    .line 113
    new-instance v3, Lcom/vkontakte/android/data/GameLeaderboard;

    invoke-virtual {v7, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v15

    invoke-direct {v3, v15, v11}, Lcom/vkontakte/android/data/GameLeaderboard;-><init>(Lorg/json/JSONObject;Landroid/util/SparseArray;)V

    .line 115
    .local v3, "glToAdd":Lcom/vkontakte/android/data/GameLeaderboard;
    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    add-int/lit8 v15, v5, 0x1

    iput v15, v3, Lcom/vkontakte/android/data/GameLeaderboard;->place:I

    .line 120
    iget v15, v3, Lcom/vkontakte/android/data/GameLeaderboard;->userId:I

    invoke-static {v15}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 121
    const/4 v4, 0x1

    .line 112
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 125
    .end local v3    # "glToAdd":Lcom/vkontakte/android/data/GameLeaderboard;
    :cond_2
    if-nez v4, :cond_3

    .line 128
    if-lez v14, :cond_3

    .line 130
    new-instance v9, Lcom/vkontakte/android/data/GameLeaderboard;

    iget v15, v1, Lcom/vkontakte/android/data/ApiApplication;->leaderboardType:I

    const/16 v16, 0x2

    move/from16 v0, v16

    if-ne v15, v0, :cond_4

    const/4 v15, 0x1

    :goto_2
    invoke-direct {v9, v2, v14, v15}, Lcom/vkontakte/android/data/GameLeaderboard;-><init>(Lcom/vkontakte/android/UserProfile;IZ)V

    .line 134
    .local v9, "leaderboardOfCurrentUser":Lcom/vkontakte/android/data/GameLeaderboard;
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v15

    add-int/lit8 v15, v15, 0x1

    iput v15, v9, Lcom/vkontakte/android/data/GameLeaderboard;->place:I

    .line 136
    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 140
    .end local v9    # "leaderboardOfCurrentUser":Lcom/vkontakte/android/data/GameLeaderboard;
    :cond_3
    new-instance v15, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;

    invoke-direct {v15, v1, v10, v14, v4}, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;-><init>(Lcom/vkontakte/android/data/ApiApplication;Ljava/util/ArrayList;IZ)V

    return-object v15

    .line 130
    :cond_4
    const/4 v15, 0x0

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
    .line 22
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;

    move-result-object v0

    return-object v0
.end method
