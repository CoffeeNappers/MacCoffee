.class public Lcom/vkontakte/android/api/wall/WallGet;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "WallGet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/wall/WallGet$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/wall/WallGet$Result;",
        ">;"
    }
.end annotation


# instance fields
.field private final listRefer:Ljava/lang/String;

.field private uid:I


# direct methods
.method public constructor <init>(IIILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "uid"    # I
    .param p2, "offset"    # I
    .param p3, "count"    # I
    .param p4, "filter"    # Ljava/lang/String;
    .param p5, "listRefer"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 59
    const-string/jumbo v0, "wall.get"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 60
    iput-object p5, p0, Lcom/vkontakte/android/api/wall/WallGet;->listRefer:Ljava/lang/String;

    .line 61
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/wall/WallGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "offset"

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "count"

    invoke-virtual {v0, v1, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "extended"

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "filter"

    invoke-virtual {v0, v1, p4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 62
    const-string/jumbo v0, "photo_sizes"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/api/wall/WallGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 63
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "photo_100,photo_50,sex,first_name_dat,last_name_dat,video_files"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/wall/WallGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 64
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;IZLjava/lang/String;)V
    .locals 5
    .param p1, "uid"    # I
    .param p2, "startFom"    # Ljava/lang/String;
    .param p3, "count"    # I
    .param p4, "owner"    # Z
    .param p5, "listRefer"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 33
    const-string/jumbo v0, "execute.wallGetWrapNew"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 34
    iput-object p5, p0, Lcom/vkontakte/android/api/wall/WallGet;->listRefer:Ljava/lang/String;

    .line 35
    const-string/jumbo v0, "photo_sizes"

    invoke-virtual {p0, v0, v4}, Lcom/vkontakte/android/api/wall/WallGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 36
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/wall/WallGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 37
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 38
    const-string/jumbo v0, "start_from"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/wall/WallGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 40
    :cond_0
    const-string/jumbo v0, "count"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/wall/WallGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 41
    const-string/jumbo v0, "extended"

    invoke-virtual {p0, v0, v4}, Lcom/vkontakte/android/api/wall/WallGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 42
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "photo_100,photo_50,sex,first_name_dat,last_name_dat,video_files"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/wall/WallGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 43
    if-eqz p4, :cond_1

    .line 44
    const-string/jumbo v0, "filter"

    const-string/jumbo v1, "owner"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/wall/WallGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 46
    :cond_1
    const-string/jumbo v0, "filters"

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, "ads_app"

    aput-object v3, v1, v2

    const-string/jumbo v2, "ads_site"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string/jumbo v3, "ads_post"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string/jumbo v3, "ads_app_slider"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string/jumbo v3, "ads_post_pretty_cards"

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/Utils;->getNewsFilterParams([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/wall/WallGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 50
    const-string/jumbo v0, "connection_type"

    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getConnectionType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/wall/WallGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 51
    const-string/jumbo v0, "connection_subtype"

    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getConnectionSubtype()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/wall/WallGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 52
    const-string/jumbo v0, "user_options"

    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getUserOptions()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/wall/WallGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 53
    const-string/jumbo v0, "device_info"

    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getDeviceInfo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/wall/WallGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 55
    iput p1, p0, Lcom/vkontakte/android/api/wall/WallGet;->uid:I

    .line 56
    return-void
.end method

.method private parseStatus(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 5
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 67
    if-nez p1, :cond_1

    .line 84
    :cond_0
    :goto_0
    return-object v0

    .line 70
    :cond_1
    const-string/jumbo v1, "audio"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 71
    new-instance v0, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-direct {v0}, Lcom/vkontakte/android/audio/MusicTrack;-><init>()V

    .line 72
    .local v0, "af":Lcom/vkontakte/android/audio/MusicTrack;
    const-string/jumbo v1, "audio"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "aid"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    .line 73
    const-string/jumbo v1, "audio"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "owner_id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    .line 74
    const-string/jumbo v1, "audio"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "duration"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    .line 75
    const-string/jumbo v1, "audio"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "artist"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    .line 76
    const-string/jumbo v1, "audio"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "title"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    .line 77
    const-string/jumbo v1, "audio"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "url"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    .line 78
    const-string/jumbo v1, "%d:%02d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget v4, v0, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    div-int/lit8 v4, v4, 0x3c

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget v4, v0, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    rem-int/lit8 v4, v4, 0x3c

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/audio/MusicTrack;->durationS:Ljava/lang/String;

    goto/16 :goto_0

    .line 81
    .end local v0    # "af":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_2
    const-string/jumbo v1, "text"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 82
    const-string/jumbo v1, "text"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/wall/WallGet$Result;
    .locals 31
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 89
    :try_start_0
    const-string/jumbo v8, "response"

    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v25

    .line 90
    .local v25, "resp":Lorg/json/JSONObject;
    if-nez v25, :cond_0

    .line 91
    const-string/jumbo v8, "execute_errors"

    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 92
    .local v7, "e":Lorg/json/JSONObject;
    new-instance v8, Lcom/vkontakte/android/api/APIException;

    const-string/jumbo v9, "error_code"

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    const-string/jumbo v10, "error_msg"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lcom/vkontakte/android/api/APIException;-><init>(ILjava/lang/String;)V

    throw v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    .end local v7    # "e":Lorg/json/JSONObject;
    .end local v25    # "resp":Lorg/json/JSONObject;
    :catch_0
    move-exception v29

    .line 185
    .local v29, "x":Ljava/lang/Exception;
    const-string/jumbo v8, "vk"

    move-object/from16 v0, v29

    invoke-static {v8, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 186
    move-object/from16 v0, v29

    instance-of v8, v0, Lcom/vkontakte/android/api/APIException;

    if-eqz v8, :cond_12

    .line 187
    new-instance v9, Lcom/vkontakte/android/api/APIException;

    move-object/from16 v8, v29

    check-cast v8, Lcom/vkontakte/android/api/APIException;

    iget v8, v8, Lcom/vkontakte/android/api/APIException;->code:I

    check-cast v29, Lcom/vkontakte/android/api/APIException;

    .end local v29    # "x":Ljava/lang/Exception;
    move-object/from16 v0, v29

    iget-object v10, v0, Lcom/vkontakte/android/api/APIException;->descr:Ljava/lang/String;

    invoke-direct {v9, v8, v10}, Lcom/vkontakte/android/api/APIException;-><init>(ILjava/lang/String;)V

    throw v9

    .line 94
    .restart local v25    # "resp":Lorg/json/JSONObject;
    :cond_0
    :try_start_1
    const-string/jumbo v8, "items"

    move-object/from16 v0, v25

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v20

    .line 95
    .local v20, "jItems":Lorg/json/JSONArray;
    const-string/jumbo v8, "profiles"

    move-object/from16 v0, v25

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v21

    .line 96
    .local v21, "profiles1":Lorg/json/JSONArray;
    const-string/jumbo v8, "groups"

    move-object/from16 v0, v25

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v22

    .line 99
    .local v22, "profiles2":Lorg/json/JSONArray;
    if-nez v20, :cond_1

    .line 100
    new-instance v23, Lcom/vkontakte/android/api/wall/WallGet$Result;

    invoke-direct/range {v23 .. v23}, Lcom/vkontakte/android/api/wall/WallGet$Result;-><init>()V

    .line 101
    .local v23, "r":Lcom/vkontakte/android/api/wall/WallGet$Result;
    new-instance v8, Lcom/vkontakte/android/data/VKList;

    invoke-direct {v8}, Lcom/vkontakte/android/data/VKList;-><init>()V

    move-object/from16 v0, v23

    iput-object v8, v0, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    .line 102
    const-string/jumbo v8, "status"

    move-object/from16 v0, v25

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/vkontakte/android/api/wall/WallGet;->parseStatus(Lorg/json/JSONObject;)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v23

    iput-object v8, v0, Lcom/vkontakte/android/api/wall/WallGet$Result;->status:Ljava/lang/Object;

    .line 190
    .end local v20    # "jItems":Lorg/json/JSONArray;
    .end local v21    # "profiles1":Lorg/json/JSONArray;
    .end local v22    # "profiles2":Lorg/json/JSONArray;
    .end local v23    # "r":Lcom/vkontakte/android/api/wall/WallGet$Result;
    .end local v25    # "resp":Lorg/json/JSONObject;
    :goto_0
    return-object v23

    .line 106
    .restart local v20    # "jItems":Lorg/json/JSONArray;
    .restart local v21    # "profiles1":Lorg/json/JSONArray;
    .restart local v22    # "profiles2":Lorg/json/JSONArray;
    .restart local v25    # "resp":Lorg/json/JSONObject;
    :cond_1
    new-instance v3, Landroid/util/SparseArray;

    invoke-direct {v3}, Landroid/util/SparseArray;-><init>()V

    .line 107
    .local v3, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    .line 108
    .local v4, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v5, Landroid/util/SparseBooleanArray;

    invoke-direct {v5}, Landroid/util/SparseBooleanArray;-><init>()V

    .line 110
    .local v5, "fs":Landroid/util/SparseBooleanArray;
    if-eqz v21, :cond_4

    .line 111
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_1
    invoke-virtual/range {v21 .. v21}, Lorg/json/JSONArray;->length()I

    move-result v8

    move/from16 v0, v18

    if-ge v0, v8, :cond_4

    .line 112
    move-object/from16 v0, v21

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v19

    .line 113
    .local v19, "item":Lorg/json/JSONObject;
    const-string/jumbo v8, "id"

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v27

    .line 114
    .local v27, "uid":I
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "first_name"

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "last_name"

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move/from16 v0, v27

    invoke-virtual {v3, v0, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 115
    sget v8, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v9, 0x3f800000    # 1.0f

    cmpl-float v8, v8, v9

    if-lez v8, :cond_2

    const-string/jumbo v8, "photo_100"

    :goto_2
    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move/from16 v0, v27

    invoke-virtual {v4, v0, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 116
    const-string/jumbo v8, "sex"

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_3

    const/4 v8, 0x1

    :goto_3
    move/from16 v0, v27

    invoke-virtual {v5, v0, v8}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 111
    add-int/lit8 v18, v18, 0x1

    goto :goto_1

    .line 115
    :cond_2
    const-string/jumbo v8, "photo_50"

    goto :goto_2

    .line 116
    :cond_3
    const/4 v8, 0x0

    goto :goto_3

    .line 120
    .end local v18    # "i":I
    .end local v19    # "item":Lorg/json/JSONObject;
    .end local v27    # "uid":I
    :cond_4
    if-eqz v22, :cond_6

    .line 121
    const/16 v18, 0x0

    .restart local v18    # "i":I
    :goto_4
    invoke-virtual/range {v22 .. v22}, Lorg/json/JSONArray;->length()I

    move-result v8

    move/from16 v0, v18

    if-ge v0, v8, :cond_6

    .line 122
    move-object/from16 v0, v22

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    const-string/jumbo v9, "id"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    neg-int v0, v8

    move/from16 v27, v0

    .line 124
    .restart local v27    # "uid":I
    move-object/from16 v0, v22

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    const-string/jumbo v9, "name"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move/from16 v0, v27

    invoke-virtual {v3, v0, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 125
    move-object/from16 v0, v22

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    sget v8, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v10, 0x3f800000    # 1.0f

    cmpl-float v8, v8, v10

    if-lez v8, :cond_5

    const-string/jumbo v8, "photo_100"

    :goto_5
    invoke-virtual {v9, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move/from16 v0, v27

    invoke-virtual {v4, v0, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 121
    add-int/lit8 v18, v18, 0x1

    goto :goto_4

    .line 125
    :cond_5
    const-string/jumbo v8, "photo_50"

    goto :goto_5

    .line 130
    .end local v18    # "i":I
    .end local v27    # "uid":I
    :cond_6
    const-string/jumbo v8, "fixed"

    move-object/from16 v0, v25

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v17

    .line 132
    .local v17, "fixed":Lorg/json/JSONObject;
    new-instance v26, Lcom/vkontakte/android/data/VKList;

    invoke-direct/range {v26 .. v26}, Lcom/vkontakte/android/data/VKList;-><init>()V

    .line 133
    .local v26, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/NewsEntry;>;"
    const-string/jumbo v8, "count"

    move-object/from16 v0, v25

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    move-object/from16 v0, v26

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/data/VKList;->setTotal(I)V

    .line 135
    new-instance v6, Ljava/util/Vector;

    invoke-direct {v6}, Ljava/util/Vector;-><init>()V

    .line 137
    .local v6, "adminGroups":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    const/16 v18, 0x0

    .restart local v18    # "i":I
    :goto_6
    invoke-virtual/range {v20 .. v20}, Lorg/json/JSONArray;->length()I

    move-result v8

    move/from16 v0, v18

    if-ge v0, v8, :cond_10

    .line 138
    move-object/from16 v0, v20

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 140
    .local v2, "jItem":Lorg/json/JSONObject;
    const-string/jumbo v8, "ads"

    const-string/jumbo v9, "type"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_b

    .line 141
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/api/wall/WallGet;->listRefer:Ljava/lang/String;

    invoke-static/range {v2 .. v7}, Lcom/vkontakte/android/NewsEntry;->parseAd(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseBooleanArray;Ljava/util/Vector;Ljava/lang/String;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v7

    .line 142
    .local v7, "e":Lcom/vkontakte/android/NewsEntry;
    if-eqz v7, :cond_c

    .line 143
    invoke-virtual/range {v26 .. v26}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v8

    if-lez v8, :cond_8

    invoke-virtual/range {v26 .. v26}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    move-object/from16 v0, v26

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/data/VKList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/NewsEntry;

    iget v8, v8, Lcom/vkontakte/android/NewsEntry;->time:I

    add-int/lit8 v8, v8, 0x1

    :goto_7
    iput v8, v7, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 144
    iget-object v8, v7, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_7
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_c

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/vkontakte/android/attachments/Attachment;

    .line 145
    .local v15, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v9, v15, Lcom/vkontakte/android/attachments/ShitAttachment;

    if-eqz v9, :cond_7

    .line 146
    move-object v0, v15

    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    move-object v14, v0

    .line 147
    .local v14, "ad":Lcom/vkontakte/android/attachments/ShitAttachment;
    const-string/jumbo v9, "load"

    invoke-virtual {v14, v9}, Lcom/vkontakte/android/attachments/ShitAttachment;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_8
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_9

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lcom/vkontakte/android/statistics/StatisticUrl;

    .line 148
    .local v28, "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    invoke-static/range {v28 .. v28}, Lcom/vkontakte/android/data/Analytics;->trackExternal(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    goto :goto_8

    .line 143
    .end local v14    # "ad":Lcom/vkontakte/android/attachments/ShitAttachment;
    .end local v15    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v28    # "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    :cond_8
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v8

    goto :goto_7

    .line 150
    .restart local v14    # "ad":Lcom/vkontakte/android/attachments/ShitAttachment;
    .restart local v15    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_9
    iget-object v9, v14, Lcom/vkontakte/android/attachments/ShitAttachment;->cards:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_a
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_7

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    .line 151
    .local v16, "card":Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    const-string/jumbo v10, "load"

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_9
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_a

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lcom/vkontakte/android/statistics/StatisticUrl;

    .line 152
    .restart local v28    # "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    invoke-static/range {v28 .. v28}, Lcom/vkontakte/android/data/Analytics;->trackExternal(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    goto :goto_9

    .line 158
    .end local v7    # "e":Lcom/vkontakte/android/NewsEntry;
    .end local v14    # "ad":Lcom/vkontakte/android/attachments/ShitAttachment;
    .end local v15    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v16    # "card":Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    .end local v28    # "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    :cond_b
    const-string/jumbo v8, "friends_recomm"

    const-string/jumbo v9, "type"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_e

    .line 159
    invoke-static {v2}, Lcom/vkontakte/android/NewsEntry;->parseFriendsRecomm(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v7

    .line 169
    .restart local v7    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_c
    :goto_a
    if-eqz v7, :cond_d

    .line 170
    move-object/from16 v0, v26

    invoke-virtual {v0, v7}, Lcom/vkontakte/android/data/VKList;->add(Ljava/lang/Object;)Z

    .line 137
    :cond_d
    add-int/lit8 v18, v18, 0x1

    goto/16 :goto_6

    .line 161
    .end local v7    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_e
    new-instance v7, Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/api/wall/WallGet;->listRefer:Ljava/lang/String;

    move-object v8, v2

    move-object v10, v3

    move-object v11, v4

    move-object v12, v5

    invoke-direct/range {v7 .. v12}, Lcom/vkontakte/android/NewsEntry;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseBooleanArray;)V

    .line 162
    .restart local v7    # "e":Lcom/vkontakte/android/NewsEntry;
    iget v8, v7, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-gez v8, :cond_f

    iget v8, v7, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v8, v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_f

    .line 163
    iget v8, v7, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v8, v8, 0x40

    iput v8, v7, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 165
    :cond_f
    move-object/from16 v0, p0

    iget v8, v0, Lcom/vkontakte/android/api/wall/WallGet;->uid:I

    if-eqz v8, :cond_c

    .line 166
    move-object/from16 v0, p0

    iget v8, v0, Lcom/vkontakte/android/api/wall/WallGet;->uid:I

    iput v8, v7, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    goto :goto_a

    .line 174
    .end local v2    # "jItem":Lorg/json/JSONObject;
    .end local v7    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_10
    if-eqz v17, :cond_11

    .line 175
    const/16 v30, 0x0

    new-instance v8, Lcom/vkontakte/android/NewsEntry;

    const/4 v10, 0x0

    const/4 v13, 0x0

    move-object/from16 v9, v17

    move-object v11, v3

    move-object v12, v4

    invoke-direct/range {v8 .. v13}, Lcom/vkontakte/android/NewsEntry;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseBooleanArray;)V

    move-object/from16 v0, v26

    move/from16 v1, v30

    invoke-virtual {v0, v1, v8}, Lcom/vkontakte/android/data/VKList;->add(ILjava/lang/Object;)V

    .line 177
    :cond_11
    new-instance v24, Lcom/vkontakte/android/api/wall/WallGet$Result;

    invoke-direct/range {v24 .. v24}, Lcom/vkontakte/android/api/wall/WallGet$Result;-><init>()V

    .line 178
    .local v24, "res":Lcom/vkontakte/android/api/wall/WallGet$Result;
    const-string/jumbo v8, "next_from"

    move-object/from16 v0, v25

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, v24

    iput-object v8, v0, Lcom/vkontakte/android/api/wall/WallGet$Result;->next_from:Ljava/lang/String;

    .line 179
    move-object/from16 v0, v26

    move-object/from16 v1, v24

    iput-object v0, v1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    .line 180
    const-string/jumbo v8, "status"

    move-object/from16 v0, v25

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/vkontakte/android/api/wall/WallGet;->parseStatus(Lorg/json/JSONObject;)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v24

    iput-object v8, v0, Lcom/vkontakte/android/api/wall/WallGet$Result;->status:Ljava/lang/Object;

    .line 181
    const-string/jumbo v8, "postponed_count"

    move-object/from16 v0, v25

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    move-object/from16 v0, v24

    iput v8, v0, Lcom/vkontakte/android/api/wall/WallGet$Result;->postponedCount:I

    .line 182
    const-string/jumbo v8, "suggested_count"

    move-object/from16 v0, v25

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    move-object/from16 v0, v24

    iput v8, v0, Lcom/vkontakte/android/api/wall/WallGet$Result;->suggestedCount:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object/from16 v23, v24

    .line 183
    goto/16 :goto_0

    .line 190
    .end local v3    # "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v4    # "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v5    # "fs":Landroid/util/SparseBooleanArray;
    .end local v6    # "adminGroups":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    .end local v17    # "fixed":Lorg/json/JSONObject;
    .end local v18    # "i":I
    .end local v20    # "jItems":Lorg/json/JSONArray;
    .end local v21    # "profiles1":Lorg/json/JSONArray;
    .end local v22    # "profiles2":Lorg/json/JSONArray;
    .end local v24    # "res":Lcom/vkontakte/android/api/wall/WallGet$Result;
    .end local v25    # "resp":Lorg/json/JSONObject;
    .end local v26    # "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/NewsEntry;>;"
    .restart local v29    # "x":Ljava/lang/Exception;
    :cond_12
    const/16 v23, 0x0

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
    .line 27
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/wall/WallGet;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/wall/WallGet$Result;

    move-result-object v0

    return-object v0
.end method
