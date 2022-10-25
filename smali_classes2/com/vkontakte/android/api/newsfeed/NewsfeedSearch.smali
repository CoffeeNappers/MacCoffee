.class public Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "NewsfeedSearch.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List",
        "<",
        "Lcom/vkontakte/android/NewsEntry;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final query:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;III)V
    .locals 3
    .param p1, "q"    # Ljava/lang/String;
    .param p2, "owner"    # I
    .param p3, "offset"    # I
    .param p4, "count"    # I

    .prologue
    const/4 v2, 0x1

    .line 49
    const-string/jumbo v0, "wall.search"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 50
    const-string/jumbo v0, "query"

    iput-object p1, p0, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->query:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 51
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 52
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 53
    const-string/jumbo v0, "count"

    invoke-virtual {p0, v0, p4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 54
    const-string/jumbo v0, "extended"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "photo_sizes"

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 55
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "photo_100,photo_50,sex,video_files"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 3
    .param p1, "q"    # Ljava/lang/String;
    .param p2, "from"    # Ljava/lang/String;
    .param p3, "count"    # I

    .prologue
    const/4 v2, 0x1

    .line 31
    const-string/jumbo v0, "newsfeed.search"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 32
    const-string/jumbo v0, "q"

    iput-object p1, p0, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->query:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 33
    const-string/jumbo v0, "count"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "start_from"

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 34
    const-string/jumbo v0, "extended"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "photo_sizes"

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 35
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "photo_100,photo_50,sex,video_files"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 36
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 3
    .param p1, "q"    # Ljava/lang/String;
    .param p2, "domain"    # Ljava/lang/String;
    .param p3, "offset"    # I
    .param p4, "count"    # I

    .prologue
    const/4 v2, 0x1

    .line 39
    const-string/jumbo v0, "wall.search"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 40
    const-string/jumbo v0, "query"

    iput-object p1, p0, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->query:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 41
    const-string/jumbo v0, "domain"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 42
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 43
    const-string/jumbo v0, "count"

    invoke-virtual {p0, v0, p4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 44
    const-string/jumbo v0, "extended"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "photo_sizes"

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 45
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "photo_100,photo_50,sex,video_files"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 46
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List;
    .locals 18
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 60
    :try_start_0
    const-string/jumbo v2, "response"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string/jumbo v3, "items"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 61
    .local v11, "items":Lorg/json/JSONArray;
    const-string/jumbo v2, "response"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string/jumbo v3, "profiles"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v12

    .line 62
    .local v12, "profiles":Lorg/json/JSONArray;
    const-string/jumbo v2, "response"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string/jumbo v3, "groups"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    .line 63
    .local v9, "groups":Lorg/json/JSONArray;
    new-instance v7, Ljava/util/Vector;

    invoke-direct {v7}, Ljava/util/Vector;-><init>()V

    .line 64
    .local v7, "adminGroups":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    new-instance v13, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List;

    const-string/jumbo v2, "response"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string/jumbo v3, "next_from"

    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->query:Ljava/lang/String;

    invoke-direct {v13, v2, v3}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .local v13, "result":Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List;, "Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List<Lcom/vkontakte/android/NewsEntry;>;"
    if-nez v11, :cond_1

    .line 105
    .end local v7    # "adminGroups":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    .end local v9    # "groups":Lorg/json/JSONArray;
    .end local v11    # "items":Lorg/json/JSONArray;
    .end local v12    # "profiles":Lorg/json/JSONArray;
    .end local v13    # "result":Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List;, "Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List<Lcom/vkontakte/android/NewsEntry;>;"
    :cond_0
    :goto_0
    return-object v13

    .line 69
    .restart local v7    # "adminGroups":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    .restart local v9    # "groups":Lorg/json/JSONArray;
    .restart local v11    # "items":Lorg/json/JSONArray;
    .restart local v12    # "profiles":Lorg/json/JSONArray;
    .restart local v13    # "result":Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List;, "Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List<Lcom/vkontakte/android/NewsEntry;>;"
    :cond_1
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    .line 70
    .local v4, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v5, Landroid/util/SparseArray;

    invoke-direct {v5}, Landroid/util/SparseArray;-><init>()V

    .line 71
    .local v5, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v6, Landroid/util/SparseBooleanArray;

    invoke-direct {v6}, Landroid/util/SparseBooleanArray;-><init>()V

    .line 73
    .local v6, "f":Landroid/util/SparseBooleanArray;
    if-eqz v12, :cond_4

    .line 74
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v10, v2, :cond_4

    .line 75
    invoke-virtual {v12, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string/jumbo v3, "id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14

    .line 76
    .local v14, "uid":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v16, "first_name"

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v12, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v16, "last_name"

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v14, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 77
    invoke-virtual {v12, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    sget v2, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v16, 0x3f800000    # 1.0f

    cmpl-float v2, v2, v16

    if-lez v2, :cond_2

    const-string/jumbo v2, "photo_100"

    :goto_2
    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v14, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 78
    invoke-virtual {v12, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string/jumbo v3, "sex"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    const/4 v2, 0x1

    :goto_3
    invoke-virtual {v6, v14, v2}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 74
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 77
    :cond_2
    const-string/jumbo v2, "photo_50"

    goto :goto_2

    .line 78
    :cond_3
    const/4 v2, 0x0

    goto :goto_3

    .line 82
    .end local v10    # "i":I
    .end local v14    # "uid":I
    :cond_4
    if-eqz v9, :cond_7

    .line 83
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_4
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v10, v2, :cond_7

    .line 84
    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string/jumbo v3, "id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    .line 85
    .local v8, "gid":I
    neg-int v2, v8

    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v16, "name"

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 86
    neg-int v3, v8

    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v16

    sget v2, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v17, 0x3f800000    # 1.0f

    cmpl-float v2, v2, v17

    if-lez v2, :cond_6

    const-string/jumbo v2, "photo_100"

    :goto_5
    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v3, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 87
    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string/jumbo v3, "is_admin"

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_5

    .line 88
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 83
    :cond_5
    add-int/lit8 v10, v10, 0x1

    goto :goto_4

    .line 86
    :cond_6
    const-string/jumbo v2, "photo_50"

    goto :goto_5

    .line 93
    .end local v8    # "gid":I
    .end local v10    # "i":I
    :cond_7
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_6
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v10, v2, :cond_0

    .line 94
    new-instance v1, Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v11, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct/range {v1 .. v6}, Lcom/vkontakte/android/NewsEntry;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseBooleanArray;)V

    .line 95
    .local v1, "e":Lcom/vkontakte/android/NewsEntry;
    iget v2, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-gez v2, :cond_8

    iget v2, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v2, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 96
    iget v2, v1, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v2, v2, 0x40

    iput v2, v1, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 98
    :cond_8
    invoke-virtual {v13, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    add-int/lit8 v10, v10, 0x1

    goto :goto_6

    .line 102
    .end local v1    # "e":Lcom/vkontakte/android/NewsEntry;
    .end local v4    # "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v5    # "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v6    # "f":Landroid/util/SparseBooleanArray;
    .end local v7    # "adminGroups":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    .end local v9    # "groups":Lorg/json/JSONArray;
    .end local v10    # "i":I
    .end local v11    # "items":Lorg/json/JSONArray;
    .end local v12    # "profiles":Lorg/json/JSONArray;
    .end local v13    # "result":Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List;, "Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List<Lcom/vkontakte/android/NewsEntry;>;"
    :catch_0
    move-exception v15

    .line 103
    .local v15, "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    invoke-static {v2, v15}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 105
    const/4 v13, 0x0

    goto/16 :goto_0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 17
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List;

    move-result-object v0

    return-object v0
.end method
