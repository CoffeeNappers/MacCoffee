.class public Lcom/vkontakte/android/api/friends/FriendsGetRequests;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "FriendsGetRequests.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;",
        ">;"
    }
.end annotation


# static fields
.field public static final CACHE_FILE_NAME:Ljava/lang/String; = "friends_requests"

.field public static final FILE_PREFIX_IN:Ljava/lang/String; = "_in"

.field public static final FILE_PREFIX_SUGGEST:Ljava/lang/String; = "_suggest"


# instance fields
.field private final fromCache:Z

.field private hasCache:Z

.field private final offset:I

.field private final out:Z

.field private final suggested:Z


# direct methods
.method public constructor <init>(IIZZ)V
    .locals 6
    .param p1, "offset"    # I
    .param p2, "count"    # I
    .param p3, "suggests"    # Z
    .param p4, "out"    # Z

    .prologue
    .line 34
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;-><init>(IIZZZ)V

    .line 35
    return-void
.end method

.method public constructor <init>(IIZZZ)V
    .locals 3
    .param p1, "offset"    # I
    .param p2, "count"    # I
    .param p3, "suggests"    # Z
    .param p4, "out"    # Z
    .param p5, "fromCache"    # Z

    .prologue
    const/4 v2, 0x1

    .line 38
    const-string/jumbo v0, "execute.getFriendRequestsMaterial"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 39
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 40
    const-string/jumbo v0, "func_v"

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 41
    const-string/jumbo v0, "count"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 42
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "online,photo_50,photo_100,photo_200"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 43
    if-eqz p3, :cond_0

    .line 44
    const-string/jumbo v0, "suggested"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 46
    :cond_0
    if-eqz p4, :cond_1

    .line 47
    const-string/jumbo v0, "out"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 50
    :cond_1
    iput-boolean p5, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->fromCache:Z

    .line 51
    iput-boolean p3, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->suggested:Z

    .line 52
    iput p1, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->offset:I

    .line 53
    iput-boolean p4, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->out:Z

    .line 54
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/api/friends/FriendsGetRequests;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/api/friends/FriendsGetRequests;

    .prologue
    .line 23
    iget-boolean v0, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->suggested:Z

    return v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/api/friends/FriendsGetRequests;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/api/friends/FriendsGetRequests;

    .prologue
    .line 23
    iget-boolean v0, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->out:Z

    return v0
.end method

.method private updateCache(Lorg/json/JSONObject;Z)V
    .locals 6
    .param p1, "o"    # Lorg/json/JSONObject;
    .param p2, "suggested"    # Z

    .prologue
    .line 172
    :try_start_0
    const-string/jumbo v3, "v"

    iget-object v4, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v5, "v"

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 173
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "friends_requests"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz p2, :cond_1

    const-string/jumbo v3, "_suggest"

    :goto_0
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 174
    .local v1, "file":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v3

    invoke-direct {v0, v3, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 175
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 176
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 178
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    .line 179
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 180
    .local v2, "os":Ljava/io/FileOutputStream;
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/FileOutputStream;->write([B)V

    .line 181
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 185
    .end local v0    # "f":Ljava/io/File;
    .end local v1    # "file":Ljava/lang/String;
    .end local v2    # "os":Ljava/io/FileOutputStream;
    :goto_1
    return-void

    .line 173
    :cond_1
    const-string/jumbo v3, "_in"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 182
    :catch_0
    move-exception v3

    goto :goto_1
.end method


# virtual methods
.method protected doExec()Lorg/json/JSONObject;
    .locals 12

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    const/4 v7, 0x0

    .line 145
    iput-boolean v10, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->hasCache:Z

    .line 146
    iget-boolean v6, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->fromCache:Z

    if-eqz v6, :cond_3

    .line 148
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "friends_requests"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v6, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->suggested:Z

    if-eqz v6, :cond_0

    const-string/jumbo v6, "_suggest"

    :goto_0
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 149
    .local v2, "file":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    sget-object v6, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v6

    invoke-direct {v1, v6, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 150
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_1

    move-object v3, v7

    .line 167
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "file":Ljava/lang/String;
    :goto_1
    return-object v3

    .line 148
    :cond_0
    const-string/jumbo v6, "_in"

    goto :goto_0

    .line 153
    .restart local v1    # "f":Ljava/io/File;
    .restart local v2    # "file":Ljava/lang/String;
    :cond_1
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 154
    .local v4, "s":Ljava/io/FileInputStream;
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v8

    long-to-int v6, v8

    new-array v0, v6, [B

    .line 155
    .local v0, "d":[B
    invoke-virtual {v4, v0}, Ljava/io/FileInputStream;->read([B)I

    .line 156
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V

    .line 157
    new-instance v6, Lorg/json/JSONTokener;

    new-instance v8, Ljava/lang/String;

    const-string/jumbo v9, "UTF-8"

    invoke-direct {v8, v0, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-direct {v6, v8}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    .line 158
    .local v3, "o":Lorg/json/JSONObject;
    iget-object v6, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v8, "v"

    invoke-virtual {v6, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const-string/jumbo v8, "v"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    move-object v3, v7

    .line 159
    goto :goto_1

    .line 161
    :cond_2
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->hasCache:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 163
    .end local v0    # "d":[B
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "file":Ljava/lang/String;
    .end local v3    # "o":Lorg/json/JSONObject;
    .end local v4    # "s":Ljava/io/FileInputStream;
    :catch_0
    move-exception v5

    .line 164
    .local v5, "x":Ljava/lang/Exception;
    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const-string/jumbo v8, "vk"

    aput-object v8, v6, v10

    aput-object v5, v6, v11

    invoke-static {v6}, Lcom/vkontakte/android/utils/L;->w([Ljava/lang/Object;)V

    .end local v5    # "x":Ljava/lang/Exception;
    :cond_3
    move-object v3, v7

    .line 167
    goto :goto_1
.end method

.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;
    .locals 19
    .param p1, "r"    # Lorg/json/JSONObject;

    .prologue
    .line 59
    :try_start_0
    move-object/from16 v0, p0

    iget v14, v0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->offset:I

    if-nez v14, :cond_1

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->out:Z

    if-nez v14, :cond_1

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->fromCache:Z

    if-eqz v14, :cond_0

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->hasCache:Z

    if-nez v14, :cond_1

    .line 60
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->suggested:Z

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v14}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->updateCache(Lorg/json/JSONObject;Z)V

    .line 63
    :cond_1
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .local v7, "myFriends":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    invoke-static {v7}, Lcom/vkontakte/android/data/Friends;->getFriends(Ljava/util/ArrayList;)V

    .line 65
    const-string/jumbo v14, "response"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    .line 66
    .local v11, "response":Lorg/json/JSONObject;
    const-string/jumbo v14, "profiles"

    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    .line 67
    .local v10, "profiles":Lorg/json/JSONArray;
    const-string/jumbo v14, "s_from"

    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 68
    .local v3, "fnames":Lorg/json/JSONArray;
    new-instance v12, Landroid/util/SparseArray;

    invoke-direct {v12}, Landroid/util/SparseArray;-><init>()V

    .line 69
    .local v12, "users":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    .line 70
    .local v4, "fromNames":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    const-string/jumbo v14, "count"

    const/4 v15, 0x0

    invoke-virtual {v11, v14, v15}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    .line 71
    .local v2, "count":I
    if-eqz v10, :cond_5

    .line 72
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v5, v14, :cond_5

    .line 73
    invoke-virtual {v10, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 74
    .local v6, "jp":Lorg/json/JSONObject;
    new-instance v9, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v9, v6}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    .line 75
    .local v9, "p":Lcom/vkontakte/android/UserProfile;
    const-string/jumbo v14, "country"

    const/4 v15, 0x0

    invoke-virtual {v6, v14, v15}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v14

    iput v14, v9, Lcom/vkontakte/android/UserProfile;->country:I

    .line 76
    const-string/jumbo v14, "city"

    const/4 v15, 0x0

    invoke-virtual {v6, v14, v15}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v14

    iput v14, v9, Lcom/vkontakte/android/UserProfile;->city:I

    .line 77
    const-string/jumbo v14, "university_name"

    const-string/jumbo v15, ""

    invoke-virtual {v6, v14, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    if-lez v14, :cond_3

    .line 78
    const-string/jumbo v14, "university_name"

    invoke-virtual {v6, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, "\r\n"

    const-string/jumbo v16, ""

    invoke-virtual/range {v14 .. v16}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    iput-object v14, v9, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    .line 79
    const-string/jumbo v14, "graduation"

    const/4 v15, 0x0

    invoke-virtual {v6, v14, v15}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v14

    if-lez v14, :cond_2

    .line 80
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v9, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, " \'%02d"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    const-string/jumbo v18, "graduation"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v18

    rem-int/lit8 v18, v18, 0x64

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    iput-object v14, v9, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    .line 90
    :cond_2
    :goto_1
    iget v14, v9, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v12, v14, v9}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 72
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 82
    :cond_3
    const-string/jumbo v14, "country"

    invoke-virtual {v6, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 83
    const-string/jumbo v14, "country"

    invoke-virtual {v6, v14}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v14

    const-string/jumbo v15, "title"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v9, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    .line 84
    const-string/jumbo v14, "city"

    invoke-virtual {v6, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 85
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v9, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ", "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "city"

    invoke-virtual {v6, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    const-string/jumbo v16, "title"

    invoke-virtual/range {v15 .. v16}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    iput-object v14, v9, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 136
    .end local v2    # "count":I
    .end local v3    # "fnames":Lorg/json/JSONArray;
    .end local v4    # "fromNames":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v5    # "i":I
    .end local v6    # "jp":Lorg/json/JSONObject;
    .end local v7    # "myFriends":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    .end local v9    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v10    # "profiles":Lorg/json/JSONArray;
    .end local v11    # "response":Lorg/json/JSONObject;
    .end local v12    # "users":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    :catch_0
    move-exception v13

    .line 137
    .local v13, "x":Ljava/lang/Exception;
    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const-string/jumbo v16, "vk"

    aput-object v16, v14, v15

    const/4 v15, 0x1

    aput-object v13, v14, v15

    invoke-static {v14}, Lcom/vkontakte/android/utils/L;->w([Ljava/lang/Object;)V

    .line 139
    const/4 v14, 0x0

    .end local v13    # "x":Ljava/lang/Exception;
    :goto_2
    return-object v14

    .line 88
    .restart local v2    # "count":I
    .restart local v3    # "fnames":Lorg/json/JSONArray;
    .restart local v4    # "fromNames":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .restart local v5    # "i":I
    .restart local v6    # "jp":Lorg/json/JSONObject;
    .restart local v7    # "myFriends":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    .restart local v9    # "p":Lcom/vkontakte/android/UserProfile;
    .restart local v10    # "profiles":Lorg/json/JSONArray;
    .restart local v11    # "response":Lorg/json/JSONObject;
    .restart local v12    # "users":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    :cond_4
    const/4 v14, 0x0

    :try_start_1
    iput-object v14, v9, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    goto :goto_1

    .line 94
    .end local v5    # "i":I
    .end local v6    # "jp":Lorg/json/JSONObject;
    .end local v9    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_5
    if-eqz v3, :cond_6

    .line 95
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_3
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v5, v14, :cond_6

    .line 96
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 97
    .local v8, "oo":Lorg/json/JSONObject;
    const-string/jumbo v14, "id"

    invoke-virtual {v8, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "first_name"

    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, " "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, "last_name"

    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v4, v14, v15}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 95
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 101
    .end local v5    # "i":I
    .end local v8    # "oo":Lorg/json/JSONObject;
    :cond_6
    new-instance v14, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;

    new-instance v15, Lcom/vkontakte/android/data/VKList;

    const-string/jumbo v16, "response"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v16

    new-instance v17, Lcom/vkontakte/android/api/friends/FriendsGetRequests$1;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v12, v4, v7}, Lcom/vkontakte/android/api/friends/FriendsGetRequests$1;-><init>(Lcom/vkontakte/android/api/friends/FriendsGetRequests;Landroid/util/SparseArray;Landroid/util/SparseArray;Ljava/util/ArrayList;)V

    invoke-direct/range {v15 .. v17}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Lcom/vkontakte/android/data/Parser;)V

    invoke-direct {v14, v15, v2}, Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;-><init>(Lcom/vkontakte/android/data/VKList;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

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
    .line 23
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;

    move-result-object v0

    return-object v0
.end method
