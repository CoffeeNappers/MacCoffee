.class public Lcom/vkontakte/android/api/wall/WallGetComments;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "WallGetComments.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/wall/WallGetComments$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/wall/WallGetComments$Result;",
        ">;"
    }
.end annotation


# instance fields
.field needToReverseComments:Z

.field type:I


# direct methods
.method public constructor <init>(IIIIIZLjava/lang/String;ZLjava/lang/String;)V
    .locals 2
    .param p1, "ownerID"    # I
    .param p2, "postID"    # I
    .param p3, "offset"    # I
    .param p4, "count"    # I
    .param p5, "type"    # I
    .param p6, "needLikes"    # Z
    .param p7, "accessKey"    # Ljava/lang/String;
    .param p8, "desc"    # Z
    .param p9, "trackCode"    # Ljava/lang/String;

    .prologue
    .line 30
    const-string/jumbo v0, "execute.getCommentsNew"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 32
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/wall/WallGetComments;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 33
    const-string/jumbo v0, "item_id"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/wall/WallGetComments;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 34
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/wall/WallGetComments;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 35
    const-string/jumbo v0, "count"

    invoke-virtual {p0, v0, p4}, Lcom/vkontakte/android/api/wall/WallGetComments;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 37
    sparse-switch p5, :sswitch_data_0

    .line 49
    const-string/jumbo v0, "type"

    const-string/jumbo v1, "post"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/wall/WallGetComments;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 52
    :goto_0
    if-eqz p6, :cond_0

    .line 53
    const-string/jumbo v0, "need_likes"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/wall/WallGetComments;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 55
    :cond_0
    if-eqz p7, :cond_1

    .line 56
    const-string/jumbo v0, "access_key"

    invoke-virtual {p0, v0, p7}, Lcom/vkontakte/android/api/wall/WallGetComments;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 59
    :cond_1
    const-string/jumbo v1, "sort"

    if-eqz p8, :cond_3

    const-string/jumbo v0, "desc"

    :goto_1
    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/api/wall/WallGetComments;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 61
    invoke-static {p9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 62
    const-string/jumbo v0, "track_code"

    invoke-virtual {p0, v0, p9}, Lcom/vkontakte/android/api/wall/WallGetComments;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 67
    :cond_2
    iput-boolean p8, p0, Lcom/vkontakte/android/api/wall/WallGetComments;->needToReverseComments:Z

    .line 69
    const-string/jumbo v0, "func_v"

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/wall/WallGetComments;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 71
    iput p5, p0, Lcom/vkontakte/android/api/wall/WallGetComments;->type:I

    .line 72
    return-void

    .line 39
    :sswitch_0
    const-string/jumbo v0, "type"

    const-string/jumbo v1, "post_ads"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/wall/WallGetComments;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 42
    :sswitch_1
    const-string/jumbo v0, "type"

    const-string/jumbo v1, "photo"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/wall/WallGetComments;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 45
    :sswitch_2
    const-string/jumbo v0, "type"

    const-string/jumbo v1, "video"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/wall/WallGetComments;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 59
    :cond_3
    const-string/jumbo v0, "asc"

    goto :goto_1

    .line 37
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0xc -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/wall/WallGetComments$Result;
    .locals 18
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 76
    :try_start_0
    new-instance v3, Landroid/util/SparseArray;

    invoke-direct {v3}, Landroid/util/SparseArray;-><init>()V

    .line 77
    .local v3, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v5, Landroid/util/SparseArray;

    invoke-direct {v5}, Landroid/util/SparseArray;-><init>()V

    .line 78
    .local v5, "names_dat":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    .line 80
    .local v4, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .local v6, "verifiedList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const-string/jumbo v1, "response"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    .line 82
    .local v13, "resp":Lorg/json/JSONObject;
    const-string/jumbo v1, "c"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    .line 83
    .local v9, "jcc":Lorg/json/JSONObject;
    const-string/jumbo v1, "p1"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    .line 84
    .local v10, "jprofiles":Lorg/json/JSONArray;
    const-string/jumbo v1, "p2u"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v14

    .line 85
    .local v14, "uids_dat":Lorg/json/JSONArray;
    const-string/jumbo v1, "p2n"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 86
    .local v11, "ndat":Lorg/json/JSONArray;
    const-string/jumbo v1, "groups"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    .line 89
    .local v7, "groups":Lorg/json/JSONArray;
    new-instance v12, Lcom/vkontakte/android/api/wall/WallGetComments$Result;

    invoke-direct {v12}, Lcom/vkontakte/android/api/wall/WallGetComments$Result;-><init>()V

    .line 91
    .local v12, "r":Lcom/vkontakte/android/api/wall/WallGetComments$Result;
    const-string/jumbo v1, "likes_count"

    const/4 v2, -0x1

    invoke-virtual {v13, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, v12, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->totalLikes:I

    .line 92
    const-string/jumbo v1, "views_count"

    const/4 v2, -0x1

    invoke-virtual {v13, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, v12, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->totalViews:I

    .line 93
    const-string/jumbo v1, "reposts_count"

    const/4 v2, -0x1

    invoke-virtual {v13, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, v12, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->totalReposts:I

    .line 94
    const-string/jumbo v1, "liked"

    const/4 v2, 0x0

    invoke-virtual {v13, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    :goto_0
    iput-boolean v1, v12, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->liked:Z

    .line 95
    const-string/jumbo v1, "reposted"

    const/4 v2, 0x0

    invoke-virtual {v13, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    const/4 v1, 0x1

    :goto_1
    iput-boolean v1, v12, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->reposted:Z

    .line 96
    const-string/jumbo v1, "likes"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    iput-object v1, v12, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->likes:Lorg/json/JSONArray;

    .line 97
    const-string/jumbo v1, "can_like"

    const/4 v2, 0x1

    invoke-virtual {v13, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    const/4 v1, 0x1

    :goto_2
    iput-boolean v1, v12, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->canLike:Z

    .line 98
    const-string/jumbo v1, "can_repost"

    const/4 v2, 0x1

    invoke-virtual {v13, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_3

    const/4 v1, 0x1

    :goto_3
    iput-boolean v1, v12, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->canRepost:Z

    .line 100
    if-nez v9, :cond_4

    .line 101
    new-instance v1, Lcom/vkontakte/android/data/VKList;

    invoke-direct {v1}, Lcom/vkontakte/android/data/VKList;-><init>()V

    iput-object v1, v12, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->comments:Lcom/vkontakte/android/data/VKList;

    .line 102
    const/4 v1, 0x0

    iput-boolean v1, v12, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->canComment:Z

    .line 149
    .end local v3    # "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v4    # "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v5    # "names_dat":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v6    # "verifiedList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v7    # "groups":Lorg/json/JSONArray;
    .end local v9    # "jcc":Lorg/json/JSONObject;
    .end local v10    # "jprofiles":Lorg/json/JSONArray;
    .end local v11    # "ndat":Lorg/json/JSONArray;
    .end local v12    # "r":Lcom/vkontakte/android/api/wall/WallGetComments$Result;
    .end local v13    # "resp":Lorg/json/JSONObject;
    .end local v14    # "uids_dat":Lorg/json/JSONArray;
    :goto_4
    return-object v12

    .line 94
    .restart local v3    # "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .restart local v4    # "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .restart local v5    # "names_dat":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .restart local v6    # "verifiedList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .restart local v7    # "groups":Lorg/json/JSONArray;
    .restart local v9    # "jcc":Lorg/json/JSONObject;
    .restart local v10    # "jprofiles":Lorg/json/JSONArray;
    .restart local v11    # "ndat":Lorg/json/JSONArray;
    .restart local v12    # "r":Lcom/vkontakte/android/api/wall/WallGetComments$Result;
    .restart local v13    # "resp":Lorg/json/JSONObject;
    .restart local v14    # "uids_dat":Lorg/json/JSONArray;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 95
    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 97
    :cond_2
    const/4 v1, 0x0

    goto :goto_2

    .line 98
    :cond_3
    const/4 v1, 0x0

    goto :goto_3

    .line 106
    :cond_4
    if-eqz v10, :cond_7

    .line 107
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_5
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v8, v1, :cond_7

    .line 108
    invoke-virtual {v10, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "verified"

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_5

    .line 109
    invoke-virtual {v10, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 112
    :cond_5
    invoke-virtual {v10, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v16

    const-string/jumbo v17, "first_name"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v16, 0x20

    move/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 113
    invoke-virtual {v10, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v16

    const-string/jumbo v17, "last_name"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 112
    invoke-virtual {v3, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 114
    invoke-virtual {v10, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v10, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v16

    sget v1, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v17, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v17

    if-lez v1, :cond_6

    const-string/jumbo v1, "photo_medium_rec"

    :goto_6
    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 107
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_5

    .line 114
    :cond_6
    const-string/jumbo v1, "photo_rec"

    goto :goto_6

    .line 117
    .end local v8    # "i":I
    :cond_7
    if-eqz v7, :cond_a

    .line 118
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_7
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v8, v1, :cond_a

    .line 119
    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "verified"

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_8

    .line 120
    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    neg-int v1, v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    :cond_8
    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    neg-int v1, v1

    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string/jumbo v16, "name"

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 123
    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    neg-int v2, v1

    .line 124
    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v16

    sget v1, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v17, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v17

    if-lez v1, :cond_9

    const-string/jumbo v1, "photo_100"

    :goto_8
    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 123
    invoke-virtual {v4, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 118
    add-int/lit8 v8, v8, 0x1

    goto :goto_7

    .line 124
    :cond_9
    const-string/jumbo v1, "photo_50"

    goto :goto_8

    .line 127
    .end local v8    # "i":I
    :cond_a
    if-eqz v11, :cond_b

    .line 128
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_9
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v8, v1, :cond_b

    .line 129
    invoke-virtual {v14, v8}, Lorg/json/JSONArray;->getInt(I)I

    move-result v1

    invoke-virtual {v11, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 128
    add-int/lit8 v8, v8, 0x1

    goto :goto_9

    .line 133
    .end local v8    # "i":I
    :cond_b
    new-instance v16, Lcom/vkontakte/android/data/VKList;

    new-instance v1, Lcom/vkontakte/android/api/wall/WallGetComments$1;

    move-object/from16 v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/vkontakte/android/api/wall/WallGetComments$1;-><init>(Lcom/vkontakte/android/api/wall/WallGetComments;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseArray;Ljava/util/ArrayList;)V

    move-object/from16 v0, v16

    invoke-direct {v0, v9, v1}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Lcom/vkontakte/android/data/Parser;)V

    move-object/from16 v0, v16

    iput-object v0, v12, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->comments:Lcom/vkontakte/android/data/VKList;

    .line 140
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/vkontakte/android/api/wall/WallGetComments;->needToReverseComments:Z

    if-eqz v1, :cond_c

    .line 141
    iget-object v1, v12, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->comments:Lcom/vkontakte/android/data/VKList;

    invoke-static {v1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 143
    :cond_c
    const/4 v1, 0x1

    iput-boolean v1, v12, Lcom/vkontakte/android/api/wall/WallGetComments$Result;->canComment:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_4

    .line 146
    .end local v3    # "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v4    # "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v5    # "names_dat":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v6    # "verifiedList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v7    # "groups":Lorg/json/JSONArray;
    .end local v9    # "jcc":Lorg/json/JSONObject;
    .end local v10    # "jprofiles":Lorg/json/JSONArray;
    .end local v11    # "ndat":Lorg/json/JSONArray;
    .end local v12    # "r":Lcom/vkontakte/android/api/wall/WallGetComments$Result;
    .end local v13    # "resp":Lorg/json/JSONObject;
    .end local v14    # "uids_dat":Lorg/json/JSONArray;
    :catch_0
    move-exception v15

    .line 147
    .local v15, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    invoke-static {v1, v15}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 149
    const/4 v12, 0x0

    goto/16 :goto_4
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 21
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/wall/WallGetComments;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/wall/WallGetComments$Result;

    move-result-object v0

    return-object v0
.end method
