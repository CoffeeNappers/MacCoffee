.class public Lcom/vkontakte/android/api/notifications/NotificationsGet;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "NotificationsGet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/notifications/NotificationsGet$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/notifications/NotificationsGet$Result;",
        ">;"
    }
.end annotation


# instance fields
.field private fromCache:Z

.field private mFoundDividers:Z

.field private updateCache:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;IZZ)V
    .locals 8
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "count"    # I
    .param p3, "fromCache"    # Z
    .param p4, "foundDividers"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 37
    const-string/jumbo v3, "execute.getNotifications"

    invoke-direct {p0, v3}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 38
    const-string/jumbo v3, "count"

    invoke-virtual {p0, v3, p2}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "start_from"

    invoke-virtual {v3, v4, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 39
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string/jumbo v4, "notifications_filter"

    const-string/jumbo v5, "wall,mentions,comments,likes,reposts,followers,friends,market,money_transfers"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 41
    .local v0, "filters":Ljava/lang/String;
    const-string/jumbo v3, "money_transfers"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 42
    const-string/jumbo v3, "money_transfers"

    const-string/jumbo v4, "money_transfer_received,money_transfer_accepted,money_transfer_declined"

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 45
    :cond_0
    const-string/jumbo v3, "filters"

    const-string/jumbo v4, ","

    new-array v5, v1, [Ljava/lang/String;

    const/16 v6, 0x7c

    const/16 v7, 0x2c

    invoke-virtual {v0, v6, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-static {v4, v5}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 46
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1

    .line 47
    const-string/jumbo v3, "filters"

    const-string/jumbo v4, "_none"

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 51
    :cond_1
    const-string/jumbo v3, "photo_sizes"

    invoke-virtual {p0, v3, v1}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 52
    const-string/jumbo v3, "fields"

    const-string/jumbo v4, "sex,online,photo_50,photo_100,photo_200,first_name_gen,last_name_gen,first_name_dat,last_name_dat"

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 54
    iput-boolean p4, p0, Lcom/vkontakte/android/api/notifications/NotificationsGet;->mFoundDividers:Z

    .line 55
    if-nez p3, :cond_3

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_3

    :cond_2
    :goto_0
    iput-boolean v1, p0, Lcom/vkontakte/android/api/notifications/NotificationsGet;->updateCache:Z

    .line 56
    iput-boolean p3, p0, Lcom/vkontakte/android/api/notifications/NotificationsGet;->fromCache:Z

    .line 57
    return-void

    :cond_3
    move v1, v2

    .line 55
    goto :goto_0
.end method

.method private parseGroups(Lorg/json/JSONArray;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseArray;)V
    .locals 7
    .param p1, "groups"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .local p2, "users":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    .local p3, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p4, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    const/high16 v6, 0x3f800000    # 1.0f

    .line 358
    if-eqz p1, :cond_2

    .line 359
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 360
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v4, "id"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 361
    .local v0, "gid":I
    neg-int v3, v0

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string/jumbo v5, "name"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p3, v3, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 362
    neg-int v4, v0

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    sget v3, Lcom/vkontakte/android/Global;->displayDensity:F

    cmpl-float v3, v3, v6

    if-lez v3, :cond_0

    const-string/jumbo v3, "photo_100"

    :goto_1
    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p4, v4, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 363
    new-instance v2, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v2}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 364
    .local v2, "p":Lcom/vkontakte/android/UserProfile;
    neg-int v3, v0

    iput v3, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 365
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v4, "name"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 366
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    sget v3, Lcom/vkontakte/android/Global;->displayDensity:F

    cmpl-float v3, v3, v6

    if-lez v3, :cond_1

    const-string/jumbo v3, "photo_100"

    :goto_2
    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 367
    neg-int v3, v0

    invoke-virtual {p2, v3, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 359
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 362
    .end local v2    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_0
    const-string/jumbo v3, "photo_50"

    goto :goto_1

    .line 366
    .restart local v2    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_1
    const-string/jumbo v3, "photo_50"

    goto :goto_2

    .line 370
    .end local v0    # "gid":I
    .end local v1    # "i":I
    .end local v2    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_2
    return-void
.end method

.method private parseProfiles(Lorg/json/JSONArray;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseArray;)V
    .locals 8
    .param p1, "profiles"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .local p2, "users":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    .local p3, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p4, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    const/4 v4, 0x1

    const/high16 v7, 0x3f800000    # 1.0f

    .line 373
    if-eqz p1, :cond_3

    .line 374
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v0, v3, :cond_3

    .line 375
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "id"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 376
    .local v2, "uid":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "first_name"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, " "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "last_name"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v2, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 377
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    sget v3, Lcom/vkontakte/android/Global;->displayDensity:F

    cmpl-float v3, v3, v7

    if-lez v3, :cond_0

    const-string/jumbo v3, "photo_100"

    :goto_1
    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p4, v2, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 378
    new-instance v1, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v1}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 379
    .local v1, "p":Lcom/vkontakte/android/UserProfile;
    iput v2, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 380
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "first_name"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 381
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "last_name"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 382
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, v1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, " "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, v1, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 384
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "sex"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v4, :cond_1

    move v3, v4

    :goto_2
    iput-boolean v3, v1, Lcom/vkontakte/android/UserProfile;->f:Z

    .line 385
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    sget v3, Lcom/vkontakte/android/Global;->displayDensity:F

    cmpl-float v3, v3, v7

    if-lez v3, :cond_2

    const-string/jumbo v3, "photo_100"

    :goto_3
    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 386
    invoke-virtual {p2, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 374
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 377
    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_0
    const-string/jumbo v3, "photo_50"

    goto :goto_1

    .line 384
    .restart local v1    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_1
    const/4 v3, 0x0

    goto :goto_2

    .line 385
    :cond_2
    const-string/jumbo v3, "photo_50"

    goto :goto_3

    .line 389
    .end local v0    # "i":I
    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v2    # "uid":I
    :cond_3
    return-void
.end method

.method private updateCache(Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 393
    :try_start_0
    const-string/jumbo v2, "v"

    iget-object v3, p0, Lcom/vkontakte/android/api/notifications/NotificationsGet;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v4, "v"

    invoke-virtual {v3, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 394
    new-instance v0, Ljava/io/File;

    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    const-string/jumbo v3, "replies"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 395
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 396
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 398
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    .line 399
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 400
    .local v1, "os":Ljava/io/FileOutputStream;
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "UTF-8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/FileOutputStream;->write([B)V

    .line 401
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 404
    .end local v0    # "f":Ljava/io/File;
    .end local v1    # "os":Ljava/io/FileOutputStream;
    :goto_0
    return-void

    .line 402
    :catch_0
    move-exception v2

    goto :goto_0
.end method


# virtual methods
.method protected doExec()Lorg/json/JSONObject;
    .locals 10

    .prologue
    const/4 v6, 0x0

    .line 60
    iget-boolean v5, p0, Lcom/vkontakte/android/api/notifications/NotificationsGet;->fromCache:Z

    if-eqz v5, :cond_2

    .line 62
    :try_start_0
    new-instance v1, Ljava/io/File;

    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v5

    const-string/jumbo v7, "replies_v3"

    invoke-direct {v1, v5, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 63
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    move-object v2, v6

    .line 79
    .end local v1    # "f":Ljava/io/File;
    :cond_0
    :goto_0
    return-object v2

    .line 66
    .restart local v1    # "f":Ljava/io/File;
    :cond_1
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 67
    .local v3, "s":Ljava/io/FileInputStream;
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v8

    long-to-int v5, v8

    new-array v0, v5, [B

    .line 68
    .local v0, "d":[B
    invoke-virtual {v3, v0}, Ljava/io/FileInputStream;->read([B)I

    .line 69
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 70
    new-instance v5, Lorg/json/JSONTokener;

    new-instance v7, Ljava/lang/String;

    const-string/jumbo v8, "UTF-8"

    invoke-direct {v7, v0, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-direct {v5, v7}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONObject;

    .line 71
    .local v2, "o":Lorg/json/JSONObject;
    iget-object v5, p0, Lcom/vkontakte/android/api/notifications/NotificationsGet;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v7, "v"

    invoke-virtual {v5, v7}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string/jumbo v7, "v"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-nez v5, :cond_0

    move-object v2, v6

    .line 72
    goto :goto_0

    .line 75
    .end local v0    # "d":[B
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "o":Lorg/json/JSONObject;
    .end local v3    # "s":Ljava/io/FileInputStream;
    :catch_0
    move-exception v4

    .line 76
    .local v4, "x":Ljava/lang/Exception;
    const-string/jumbo v5, "vk"

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .end local v4    # "x":Ljava/lang/Exception;
    :cond_2
    move-object v2, v6

    .line 79
    goto :goto_0
.end method

.method makeKosherPost(Lcom/vkontakte/android/NewsEntry;Landroid/util/SparseArray;)V
    .locals 2
    .param p1, "entry"    # Lcom/vkontakte/android/NewsEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/NewsEntry;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 84
    .local p2, "users":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    iget v1, p1, Lcom/vkontakte/android/NewsEntry;->userID:I

    if-nez v1, :cond_0

    .line 85
    iget v1, p1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iput v1, p1, Lcom/vkontakte/android/NewsEntry;->userID:I

    .line 87
    :cond_0
    iget v1, p1, Lcom/vkontakte/android/NewsEntry;->userID:I

    invoke-virtual {p2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 88
    .local v0, "profile":Lcom/vkontakte/android/UserProfile;
    if-eqz v0, :cond_1

    .line 89
    iget-object v1, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    iput-object v1, p1, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 90
    iget-object v1, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    iput-object v1, p1, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    .line 92
    :cond_1
    return-void
.end method

.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/notifications/NotificationsGet$Result;
    .locals 45
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 96
    :try_start_0
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/vkontakte/android/api/notifications/NotificationsGet;->updateCache:Z

    if-eqz v6, :cond_0

    .line 97
    invoke-direct/range {p0 .. p1}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->updateCache(Lorg/json/JSONObject;)V

    .line 100
    :cond_0
    const-string/jumbo v6, "response"

    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v38

    .line 101
    .local v38, "response":Lorg/json/JSONObject;
    const-string/jumbo v6, "items"

    move-object/from16 v0, v38

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v27

    .line 102
    .local v27, "items":Lorg/json/JSONArray;
    const-string/jumbo v6, "profiles"

    move-object/from16 v0, v38

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v36

    .line 103
    .local v36, "profiles":Lorg/json/JSONArray;
    const-string/jumbo v6, "groups"

    move-object/from16 v0, v38

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v21

    .line 104
    .local v21, "groups":Lorg/json/JSONArray;
    const-string/jumbo v6, "last_viewed"

    move-object/from16 v0, v38

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v29

    .line 105
    .local v29, "lastView":I
    new-instance v39, Ljava/util/ArrayList;

    invoke-direct/range {v39 .. v39}, Ljava/util/ArrayList;-><init>()V

    .line 107
    .local v39, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/models/Notification;>;"
    new-instance v44, Landroid/util/SparseArray;

    invoke-direct/range {v44 .. v44}, Landroid/util/SparseArray;-><init>()V

    .line 108
    .local v44, "users":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v30, Landroid/util/SparseArray;

    invoke-direct/range {v30 .. v30}, Landroid/util/SparseArray;-><init>()V

    .line 109
    .local v30, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v34, Landroid/util/SparseArray;

    invoke-direct/range {v34 .. v34}, Landroid/util/SparseArray;-><init>()V

    .line 111
    .local v34, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, v36

    move-object/from16 v2, v44

    move-object/from16 v3, v30

    move-object/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->parseProfiles(Lorg/json/JSONArray;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    .line 112
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v44

    move-object/from16 v3, v30

    move-object/from16 v4, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->parseGroups(Lorg/json/JSONArray;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    .line 114
    const/16 v24, 0x0

    .line 115
    .local v24, "id":I
    const/16 v23, 0x0

    .local v23, "i":I
    :goto_0
    invoke-virtual/range {v27 .. v27}, Lorg/json/JSONArray;->length()I

    move-result v6

    move/from16 v0, v23

    if-ge v0, v6, :cond_9

    .line 116
    move-object/from16 v0, v27

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v25

    .line 117
    .local v25, "it":Lorg/json/JSONObject;
    new-instance v16, Lcom/vkontakte/android/api/models/Notification;

    invoke-direct/range {v16 .. v16}, Lcom/vkontakte/android/api/models/Notification;-><init>()V

    .line 119
    .local v16, "e":Lcom/vkontakte/android/api/models/Notification;
    move/from16 v0, v24

    move-object/from16 v1, v16

    iput v0, v1, Lcom/vkontakte/android/api/models/Notification;->id:I

    .line 120
    const-string/jumbo v6, "date"

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    move-object/from16 v0, v16

    iput v6, v0, Lcom/vkontakte/android/api/models/Notification;->date:I

    .line 121
    const-string/jumbo v6, "type"

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/api/models/Notification$Type;->parse(Ljava/lang/String;)Lcom/vkontakte/android/api/models/Notification$Type;

    move-result-object v6

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 123
    sget-object v6, Lcom/vkontakte/android/api/notifications/NotificationsGet$1;->$SwitchMap$com$vkontakte$android$api$models$Notification$ParentType:[I

    move-object/from16 v0, v16

    iget-object v7, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    iget-object v7, v7, Lcom/vkontakte/android/api/models/Notification$Type;->parentType:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-virtual {v7}, Lcom/vkontakte/android/api/models/Notification$ParentType;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 188
    :goto_1
    sget-object v6, Lcom/vkontakte/android/api/notifications/NotificationsGet$1;->$SwitchMap$com$vkontakte$android$api$models$Notification$FeedbackType:[I

    move-object/from16 v0, v16

    iget-object v7, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    iget-object v7, v7, Lcom/vkontakte/android/api/models/Notification$Type;->feedbackType:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    invoke-virtual {v7}, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_1

    .line 257
    :cond_1
    :goto_2
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Type;->Unknown:Lcom/vkontakte/android/api/models/Notification$Type;

    if-eq v6, v7, :cond_8

    .line 258
    move-object/from16 v0, v39

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 259
    add-int/lit8 v24, v24, 0x1

    .line 115
    :cond_2
    :goto_3
    add-int/lit8 v23, v23, 0x1

    goto :goto_0

    .line 125
    :pswitch_0
    const-string/jumbo v6, "parent"

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    const-string/jumbo v7, "market"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/vkontakte/android/NewsEntry;->parseMarket(Lorg/json/JSONObject;Lcom/vkontakte/android/NewsEntry;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v6

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    .line 126
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    iget-object v6, v6, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->link:Ljava/lang/CharSequence;

    .line 127
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v0, p0

    move-object/from16 v1, v44

    invoke-virtual {v0, v6, v1}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->makeKosherPost(Lcom/vkontakte/android/NewsEntry;Landroid/util/SparseArray;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 351
    .end local v16    # "e":Lcom/vkontakte/android/api/models/Notification;
    .end local v21    # "groups":Lorg/json/JSONArray;
    .end local v23    # "i":I
    .end local v24    # "id":I
    .end local v25    # "it":Lorg/json/JSONObject;
    .end local v27    # "items":Lorg/json/JSONArray;
    .end local v29    # "lastView":I
    .end local v30    # "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v34    # "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v36    # "profiles":Lorg/json/JSONArray;
    .end local v38    # "response":Lorg/json/JSONObject;
    .end local v39    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/models/Notification;>;"
    .end local v44    # "users":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    :catch_0
    move-exception v16

    .line 352
    .local v16, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/lang/RuntimeException;

    move-object/from16 v0, v16

    invoke-direct {v6, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 131
    .local v16, "e":Lcom/vkontakte/android/api/models/Notification;
    .restart local v21    # "groups":Lorg/json/JSONArray;
    .restart local v23    # "i":I
    .restart local v24    # "id":I
    .restart local v25    # "it":Lorg/json/JSONObject;
    .restart local v27    # "items":Lorg/json/JSONArray;
    .restart local v29    # "lastView":I
    .restart local v30    # "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .restart local v34    # "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .restart local v36    # "profiles":Lorg/json/JSONArray;
    .restart local v38    # "response":Lorg/json/JSONObject;
    .restart local v39    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/models/Notification;>;"
    .restart local v44    # "users":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    :pswitch_1
    :try_start_1
    new-instance v6, Lcom/vkontakte/android/NewsEntry;

    const-string/jumbo v7, "parent"

    move-object/from16 v0, v25

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const/4 v8, 0x0

    move-object/from16 v0, v30

    move-object/from16 v1, v34

    invoke-direct {v6, v7, v8, v0, v1}, Lcom/vkontakte/android/NewsEntry;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    .line 132
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    iget-object v6, v6, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->link:Ljava/lang/CharSequence;

    .line 133
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v0, p0

    move-object/from16 v1, v44

    invoke-virtual {v0, v6, v1}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->makeKosherPost(Lcom/vkontakte/android/NewsEntry;Landroid/util/SparseArray;)V

    goto/16 :goto_1

    .line 137
    :pswitch_2
    const-string/jumbo v6, "parent"

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v33

    .line 138
    .local v33, "parent":Lorg/json/JSONObject;
    new-instance v6, Lcom/vkontakte/android/NewsEntry;

    const/4 v7, 0x0

    move-object/from16 v0, v33

    move-object/from16 v1, v30

    move-object/from16 v2, v34

    invoke-direct {v6, v0, v7, v1, v2}, Lcom/vkontakte/android/NewsEntry;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    .line 139
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v0, v16

    iget-object v7, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    iget-object v7, v7, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    const-string/jumbo v8, "<a href=\'[^\']+\'>([^<]+)</a>"

    const-string/jumbo v9, "$1"

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 140
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    iget-object v6, v6, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->link:Ljava/lang/CharSequence;

    .line 141
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v0, p0

    move-object/from16 v1, v44

    invoke-virtual {v0, v6, v1}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->makeKosherPost(Lcom/vkontakte/android/NewsEntry;Landroid/util/SparseArray;)V

    .line 143
    sget-object v6, Lcom/vkontakte/android/api/notifications/NotificationsGet$1;->$SwitchMap$com$vkontakte$android$api$models$Notification$ParentType:[I

    move-object/from16 v0, v16

    iget-object v7, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    iget-object v7, v7, Lcom/vkontakte/android/api/models/Notification$Type;->grandParentType:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-virtual {v7}, Lcom/vkontakte/android/api/models/Notification$ParentType;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_2

    goto/16 :goto_1

    .line 145
    :pswitch_3
    const-string/jumbo v6, "photo"

    move-object/from16 v0, v33

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/NewsEntry;->parsePhoto(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v6

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    .line 146
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v0, p0

    move-object/from16 v1, v44

    invoke-virtual {v0, v6, v1}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->makeKosherPost(Lcom/vkontakte/android/NewsEntry;Landroid/util/SparseArray;)V

    goto/16 :goto_1

    .line 150
    :pswitch_4
    const-string/jumbo v6, "video"

    move-object/from16 v0, v33

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/NewsEntry;->parseVideo(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v6

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    .line 151
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v0, p0

    move-object/from16 v1, v44

    invoke-virtual {v0, v6, v1}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->makeKosherPost(Lcom/vkontakte/android/NewsEntry;Landroid/util/SparseArray;)V

    goto/16 :goto_1

    .line 155
    :pswitch_5
    new-instance v6, Lcom/vkontakte/android/NewsEntry;

    const-string/jumbo v7, "post"

    move-object/from16 v0, v33

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const/4 v8, 0x0

    move-object/from16 v0, v30

    move-object/from16 v1, v34

    invoke-direct {v6, v7, v8, v0, v1}, Lcom/vkontakte/android/NewsEntry;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    .line 156
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v0, p0

    move-object/from16 v1, v44

    invoke-virtual {v0, v6, v1}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->makeKosherPost(Lcom/vkontakte/android/NewsEntry;Landroid/util/SparseArray;)V

    goto/16 :goto_1

    .line 160
    :pswitch_6
    const-string/jumbo v6, "topic"

    move-object/from16 v0, v33

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/NewsEntry;->parseTopic(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v6

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    .line 161
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v0, p0

    move-object/from16 v1, v44

    invoke-virtual {v0, v6, v1}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->makeKosherPost(Lcom/vkontakte/android/NewsEntry;Landroid/util/SparseArray;)V

    goto/16 :goto_1

    .line 165
    :pswitch_7
    const-string/jumbo v6, "market"

    move-object/from16 v0, v33

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/vkontakte/android/NewsEntry;->parseMarket(Lorg/json/JSONObject;Lcom/vkontakte/android/NewsEntry;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v6

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    .line 166
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v0, p0

    move-object/from16 v1, v44

    invoke-virtual {v0, v6, v1}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->makeKosherPost(Lcom/vkontakte/android/NewsEntry;Landroid/util/SparseArray;)V

    goto/16 :goto_1

    .line 173
    .end local v33    # "parent":Lorg/json/JSONObject;
    :pswitch_8
    const-string/jumbo v6, "parent"

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/NewsEntry;->parsePhoto(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v6

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    .line 174
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v0, p0

    move-object/from16 v1, v44

    invoke-virtual {v0, v6, v1}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->makeKosherPost(Lcom/vkontakte/android/NewsEntry;Landroid/util/SparseArray;)V

    goto/16 :goto_1

    .line 178
    :pswitch_9
    const-string/jumbo v6, "parent"

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/NewsEntry;->parseVideo(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v6

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    .line 179
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    iget-object v6, v6, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v6, v6, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v6, v6, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->link:Ljava/lang/CharSequence;

    .line 180
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v0, p0

    move-object/from16 v1, v44

    invoke-virtual {v0, v6, v1}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->makeKosherPost(Lcom/vkontakte/android/NewsEntry;Landroid/util/SparseArray;)V

    goto/16 :goto_1

    .line 184
    :pswitch_a
    const-string/jumbo v6, "parent"

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/NewsEntry;->parseTopic(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v6

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    goto/16 :goto_1

    .line 190
    :pswitch_b
    const-string/jumbo v6, "feedback"

    move-object/from16 v0, v25

    invoke-static {v0, v6}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v6

    iget-object v0, v6, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    move-object/from16 v17, v0

    .line 191
    .local v17, "fb":Lorg/json/JSONArray;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    .line 192
    const/16 v28, 0x0

    .local v28, "j":I
    :goto_4
    invoke-virtual/range {v17 .. v17}, Lorg/json/JSONArray;->length()I

    move-result v6

    move/from16 v0, v28

    if-ge v0, v6, :cond_1

    .line 193
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v0, v17

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "from_id"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    move-object/from16 v0, v44

    invoke-virtual {v0, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    add-int/lit8 v28, v28, 0x1

    goto :goto_4

    .line 198
    .end local v17    # "fb":Lorg/json/JSONArray;
    .end local v28    # "j":I
    :pswitch_c
    const-string/jumbo v6, "feedback"

    move-object/from16 v0, v25

    invoke-static {v0, v6}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v6

    iget-object v0, v6, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    move-object/from16 v17, v0

    .line 199
    .restart local v17    # "fb":Lorg/json/JSONArray;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    .line 200
    const/16 v28, 0x0

    .restart local v28    # "j":I
    :goto_5
    invoke-virtual/range {v17 .. v17}, Lorg/json/JSONArray;->length()I

    move-result v6

    move/from16 v0, v28

    if-ge v0, v6, :cond_1

    .line 201
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v0, v17

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "from_id"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    move-object/from16 v0, v44

    invoke-virtual {v0, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    add-int/lit8 v28, v28, 0x1

    goto :goto_5

    .line 206
    .end local v17    # "fb":Lorg/json/JSONArray;
    .end local v28    # "j":I
    :pswitch_d
    const-string/jumbo v6, "feedback"

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v18

    .line 207
    .local v18, "feedback":Lorg/json/JSONObject;
    const-string/jumbo v6, "attachments"

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v22

    .line 208
    .local v22, "hasAttach":Z
    const-string/jumbo v6, "from_id"

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    move-object/from16 v0, v44

    invoke-virtual {v0, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->commentUser:Lcom/vkontakte/android/UserProfile;

    .line 209
    const-string/jumbo v6, "id"

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    const-string/jumbo v6, "id"

    :goto_6
    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    move-object/from16 v0, v16

    iput v6, v0, Lcom/vkontakte/android/api/models/Notification;->commentID:I

    .line 210
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    iget-object v6, v6, Lcom/vkontakte/android/api/models/Notification$Type;->parentType:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$ParentType;->Topic:Lcom/vkontakte/android/api/models/Notification$ParentType;

    if-ne v6, v7, :cond_4

    const-string/jumbo v6, "text"

    .line 211
    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "\\[id(\\d+):bp-(\\d+)_(\\d+)\\|([^\\]]+)\\]"

    const-string/jumbo v8, "$4"

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 210
    :goto_7
    move-object/from16 v0, v16

    move/from16 v1, v22

    invoke-virtual {v0, v6, v1}, Lcom/vkontakte/android/api/models/Notification;->setText(Ljava/lang/CharSequence;Z)V

    goto/16 :goto_2

    .line 209
    :cond_3
    const-string/jumbo v6, "cid"

    goto :goto_6

    .line 211
    :cond_4
    const-string/jumbo v6, "text"

    .line 212
    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_7

    .line 216
    .end local v18    # "feedback":Lorg/json/JSONObject;
    .end local v22    # "hasAttach":Z
    :pswitch_e
    new-instance v6, Lcom/vkontakte/android/MoneyTransfer;

    const-string/jumbo v7, "feedback"

    move-object/from16 v0, v25

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/vkontakte/android/MoneyTransfer;-><init>(Lorg/json/JSONObject;)V

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    .line 218
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    iget v6, v6, Lcom/vkontakte/android/MoneyTransfer;->from_id:I

    move-object/from16 v0, v44

    invoke-virtual {v0, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/vkontakte/android/UserProfile;

    .line 219
    .local v20, "fromUser":Lcom/vkontakte/android/UserProfile;
    if-eqz v20, :cond_5

    .line 220
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    move-object/from16 v0, v20

    iput-object v0, v6, Lcom/vkontakte/android/MoneyTransfer;->fromUser:Lcom/vkontakte/android/UserProfile;

    .line 223
    :cond_5
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    iget v6, v6, Lcom/vkontakte/android/MoneyTransfer;->to_id:I

    move-object/from16 v0, v44

    invoke-virtual {v0, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v42

    check-cast v42, Lcom/vkontakte/android/UserProfile;

    .line 224
    .local v42, "toUser":Lcom/vkontakte/android/UserProfile;
    if-eqz v42, :cond_6

    .line 225
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    move-object/from16 v0, v42

    iput-object v0, v6, Lcom/vkontakte/android/MoneyTransfer;->toUser:Lcom/vkontakte/android/UserProfile;

    .line 228
    :cond_6
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    .line 229
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v6}, Lcom/vkontakte/android/MoneyTransfer;->getPeerId()I

    move-result v6

    move-object/from16 v0, v44

    invoke-virtual {v0, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v43

    check-cast v43, Lcom/vkontakte/android/UserProfile;

    .line 230
    .local v43, "up":Lcom/vkontakte/android/UserProfile;
    if-eqz v43, :cond_7

    .line 231
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v0, v16

    iget-object v7, v0, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v7}, Lcom/vkontakte/android/MoneyTransfer;->getPeerId()I

    move-result v7

    move-object/from16 v0, v44

    invoke-virtual {v0, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 234
    :cond_7
    const-string/jumbo v6, "NotificationsGet"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "No user profile for user "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v16

    iget-object v8, v0, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v8}, Lcom/vkontakte/android/MoneyTransfer;->getPeerId()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 239
    .end local v20    # "fromUser":Lcom/vkontakte/android/UserProfile;
    .end local v42    # "toUser":Lcom/vkontakte/android/UserProfile;
    .end local v43    # "up":Lcom/vkontakte/android/UserProfile;
    :pswitch_f
    new-instance v5, Lcom/vkontakte/android/NewsEntry;

    const-string/jumbo v6, "feedback"

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    const/4 v7, 0x0

    move-object/from16 v0, v30

    move-object/from16 v1, v34

    invoke-direct {v5, v6, v7, v0, v1}, Lcom/vkontakte/android/NewsEntry;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    .line 240
    .local v5, "entry":Lcom/vkontakte/android/NewsEntry;
    move-object/from16 v0, v16

    iget v6, v0, Lcom/vkontakte/android/api/models/Notification;->date:I

    iput v6, v5, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 241
    const/4 v6, 0x0

    const-string/jumbo v7, ""

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x1

    const-string/jumbo v12, ""

    const/4 v13, 0x0

    invoke-static/range {v5 .. v13}, Lcom/vkontakte/android/data/Posts;->buildItems(Lcom/vkontakte/android/NewsEntry;ZLjava/lang/String;ZZLandroid/view/View$OnClickListener;ZLjava/lang/String;I)Ljava/util/List;

    move-result-object v35

    .line 242
    .local v35, "postDisplayItems":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/ui/posts/PostDisplayItem;>;"
    const/16 v28, 0x0

    .restart local v28    # "j":I
    :goto_8
    invoke-interface/range {v35 .. v35}, Ljava/util/List;->size()I

    move-result v6

    move/from16 v0, v28

    if-ge v0, v6, :cond_2

    .line 243
    move-object/from16 v0, v35

    move/from16 v1, v28

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    .line 244
    .local v26, "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    new-instance v31, Lcom/vkontakte/android/api/models/Notification;

    invoke-direct/range {v31 .. v31}, Lcom/vkontakte/android/api/models/Notification;-><init>()V

    .line 245
    .local v31, "notification":Lcom/vkontakte/android/api/models/Notification;
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    move-object/from16 v0, v31

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 246
    move-object/from16 v0, v26

    move-object/from16 v1, v31

    iput-object v0, v1, Lcom/vkontakte/android/api/models/Notification;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    .line 247
    move-object/from16 v0, v16

    iget v6, v0, Lcom/vkontakte/android/api/models/Notification;->date:I

    move-object/from16 v0, v31

    iput v6, v0, Lcom/vkontakte/android/api/models/Notification;->date:I

    .line 248
    move-object/from16 v0, v31

    iput-object v5, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    .line 249
    move-object/from16 v0, v39

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 250
    add-int/lit8 v24, v24, 0x1

    .line 242
    add-int/lit8 v28, v28, 0x1

    goto :goto_8

    .line 261
    .end local v5    # "entry":Lcom/vkontakte/android/NewsEntry;
    .end local v26    # "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    .end local v28    # "j":I
    .end local v31    # "notification":Lcom/vkontakte/android/api/models/Notification;
    .end local v35    # "postDisplayItems":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/ui/posts/PostDisplayItem;>;"
    :cond_8
    const-string/jumbo v6, "vk"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Unknown notification type "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v16

    iget-object v8, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 266
    .end local v16    # "e":Lcom/vkontakte/android/api/models/Notification;
    .end local v25    # "it":Lorg/json/JSONObject;
    :cond_9
    new-instance v37, Lcom/vkontakte/android/api/notifications/NotificationsGet$Result;

    invoke-direct/range {v37 .. v37}, Lcom/vkontakte/android/api/notifications/NotificationsGet$Result;-><init>()V

    .line 268
    .local v37, "r":Lcom/vkontakte/android/api/notifications/NotificationsGet$Result;
    const/16 v19, 0x0

    .line 269
    .local v19, "foundNew":Z
    const/16 v23, 0x0

    :goto_9
    invoke-virtual/range {v39 .. v39}, Ljava/util/ArrayList;->size()I

    move-result v6

    move/from16 v0, v23

    if-ge v0, v6, :cond_b

    .line 270
    move-object/from16 v0, v39

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/api/models/Notification;

    .line 271
    .local v5, "entry":Lcom/vkontakte/android/api/models/Notification;
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/vkontakte/android/api/notifications/NotificationsGet;->mFoundDividers:Z

    if-nez v6, :cond_f

    .line 272
    iget v6, v5, Lcom/vkontakte/android/api/models/Notification;->date:I

    move/from16 v0, v29

    if-le v6, v0, :cond_a

    if-nez v19, :cond_a

    .line 273
    const/16 v19, 0x1

    .line 274
    new-instance v16, Lcom/vkontakte/android/api/models/Notification;

    invoke-direct/range {v16 .. v16}, Lcom/vkontakte/android/api/models/Notification;-><init>()V

    .line 275
    .restart local v16    # "e":Lcom/vkontakte/android/api/models/Notification;
    sget-object v6, Lcom/vkontakte/android/api/models/Notification$Type;->Header:Lcom/vkontakte/android/api/models/Notification$Type;

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 276
    sget-object v6, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v7, 0x7f080425

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Lcom/vkontakte/android/api/models/Notification;->setText(Ljava/lang/CharSequence;)V

    .line 277
    move-object/from16 v0, v39

    move/from16 v1, v23

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 269
    .end local v16    # "e":Lcom/vkontakte/android/api/models/Notification;
    :goto_a
    add-int/lit8 v23, v23, 0x1

    goto :goto_9

    .line 280
    :cond_a
    iget v6, v5, Lcom/vkontakte/android/api/models/Notification;->date:I

    move/from16 v0, v29

    if-ge v6, v0, :cond_f

    .line 281
    new-instance v16, Lcom/vkontakte/android/api/models/Notification;

    invoke-direct/range {v16 .. v16}, Lcom/vkontakte/android/api/models/Notification;-><init>()V

    .line 282
    .restart local v16    # "e":Lcom/vkontakte/android/api/models/Notification;
    sget-object v6, Lcom/vkontakte/android/api/models/Notification$Type;->Header:Lcom/vkontakte/android/api/models/Notification$Type;

    move-object/from16 v0, v16

    iput-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 283
    sget-object v6, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v7, 0x7f080773

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Lcom/vkontakte/android/api/models/Notification;->setText(Ljava/lang/CharSequence;)V

    .line 284
    const/4 v6, 0x1

    move-object/from16 v0, v37

    iput-boolean v6, v0, Lcom/vkontakte/android/api/notifications/NotificationsGet$Result;->foundDividers:Z

    .line 285
    move-object/from16 v0, v39

    move/from16 v1, v23

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 292
    .end local v5    # "entry":Lcom/vkontakte/android/api/models/Notification;
    .end local v16    # "e":Lcom/vkontakte/android/api/models/Notification;
    :cond_b
    new-instance v41, Ljava/util/ArrayList;

    invoke-direct/range {v41 .. v41}, Ljava/util/ArrayList;-><init>()V

    .line 293
    .local v41, "tmp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/models/Notification;>;"
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 294
    .local v14, "buf":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v15, 0x0

    .line 295
    .local v15, "curGroup":Lcom/vkontakte/android/api/models/Notification;
    const/16 v23, 0x0

    :goto_b
    invoke-virtual/range {v39 .. v39}, Ljava/util/ArrayList;->size()I

    move-result v6

    move/from16 v0, v23

    if-ge v0, v6, :cond_17

    .line 296
    move-object/from16 v0, v39

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/vkontakte/android/api/models/Notification;

    .line 297
    .restart local v16    # "e":Lcom/vkontakte/android/api/models/Notification;
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    iget-object v6, v6, Lcom/vkontakte/android/api/models/Notification$Type;->feedbackType:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Copy:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    if-eq v6, v7, :cond_10

    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    iget-object v6, v6, Lcom/vkontakte/android/api/models/Notification$Type;->feedbackType:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Users:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    if-eq v6, v7, :cond_10

    .line 298
    if-eqz v15, :cond_e

    .line 299
    iget-object v6, v15, Lcom/vkontakte/android/api/models/Notification;->group:Ljava/util/List;

    if-nez v6, :cond_c

    .line 300
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, v15, Lcom/vkontakte/android/api/models/Notification;->group:Ljava/util/List;

    .line 302
    :cond_c
    iget-object v6, v15, Lcom/vkontakte/android/api/models/Notification;->group:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_d

    .line 303
    move-object/from16 v0, v41

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 305
    :cond_d
    const/4 v15, 0x0

    .line 307
    :cond_e
    move-object/from16 v0, v41

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 295
    :goto_c
    add-int/lit8 v23, v23, 0x1

    goto :goto_b

    .line 289
    .end local v14    # "buf":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v15    # "curGroup":Lcom/vkontakte/android/api/models/Notification;
    .end local v16    # "e":Lcom/vkontakte/android/api/models/Notification;
    .end local v41    # "tmp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/models/Notification;>;"
    .restart local v5    # "entry":Lcom/vkontakte/android/api/models/Notification;
    :cond_f
    move/from16 v0, v23

    iput v0, v5, Lcom/vkontakte/android/api/models/Notification;->id:I

    goto/16 :goto_a

    .line 310
    .end local v5    # "entry":Lcom/vkontakte/android/api/models/Notification;
    .restart local v14    # "buf":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v15    # "curGroup":Lcom/vkontakte/android/api/models/Notification;
    .restart local v16    # "e":Lcom/vkontakte/android/api/models/Notification;
    .restart local v41    # "tmp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/models/Notification;>;"
    :cond_10
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x2

    if-ne v6, v7, :cond_11

    .line 311
    const/4 v6, 0x0

    invoke-virtual {v14, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 313
    :cond_11
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    iget-object v7, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    iget-object v7, v7, Lcom/vkontakte/android/api/models/Notification$Type;->feedbackType:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    invoke-virtual {v7}, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->ordinal()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v16

    iget-object v7, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    iget-object v7, v7, Lcom/vkontakte/android/api/models/Notification$Type;->activity:Lcom/vkontakte/android/api/models/Notification$Activity;

    invoke-virtual {v7}, Lcom/vkontakte/android/api/models/Notification$Activity;->ordinal()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v16

    iget-object v7, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    iget-object v7, v7, Lcom/vkontakte/android/api/models/Notification$Type;->parentType:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-virtual {v7}, Lcom/vkontakte/android/api/models/Notification$ParentType;->ordinal()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v40

    .line 314
    .local v40, "ss":Ljava/lang/String;
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    if-eqz v6, :cond_12

    .line 315
    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_d
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_12

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lcom/vkontakte/android/UserProfile;

    .line 316
    .local v32, "p":Lcom/vkontakte/android/UserProfile;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v40

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v32

    iget v8, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v40

    .line 317
    goto :goto_d

    .line 319
    .end local v32    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_12
    move-object/from16 v0, v40

    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 320
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x2

    if-ne v6, v7, :cond_14

    const/4 v6, 0x0

    invoke-virtual {v14, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const/4 v7, 0x1

    invoke-virtual {v14, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_14

    .line 321
    if-nez v15, :cond_13

    .line 322
    new-instance v15, Lcom/vkontakte/android/api/models/Notification;

    .end local v15    # "curGroup":Lcom/vkontakte/android/api/models/Notification;
    invoke-direct {v15}, Lcom/vkontakte/android/api/models/Notification;-><init>()V

    .line 323
    .restart local v15    # "curGroup":Lcom/vkontakte/android/api/models/Notification;
    sget-object v6, Lcom/vkontakte/android/api/models/Notification$Type;->Grouped:Lcom/vkontakte/android/api/models/Notification$Type;

    iput-object v6, v15, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 324
    move-object/from16 v0, v16

    iget v6, v0, Lcom/vkontakte/android/api/models/Notification;->date:I

    iput v6, v15, Lcom/vkontakte/android/api/models/Notification;->date:I

    .line 325
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, v15, Lcom/vkontakte/android/api/models/Notification;->group:Ljava/util/List;

    .line 326
    move-object/from16 v0, v41

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_c

    .line 328
    :cond_13
    iget-object v6, v15, Lcom/vkontakte/android/api/models/Notification;->group:Ljava/util/List;

    move-object/from16 v0, v16

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_c

    .line 330
    :cond_14
    if-eqz v15, :cond_16

    .line 331
    iget-object v6, v15, Lcom/vkontakte/android/api/models/Notification;->group:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_15

    .line 332
    move-object/from16 v0, v41

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 334
    :cond_15
    const/4 v15, 0x0

    .line 335
    move-object/from16 v0, v41

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_c

    .line 337
    :cond_16
    move-object/from16 v0, v41

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_c

    .line 341
    .end local v16    # "e":Lcom/vkontakte/android/api/models/Notification;
    .end local v40    # "ss":Ljava/lang/String;
    :cond_17
    if-eqz v15, :cond_18

    iget-object v6, v15, Lcom/vkontakte/android/api/models/Notification;->group:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_18

    .line 342
    move-object/from16 v0, v41

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 343
    const/4 v15, 0x0

    .line 346
    :cond_18
    move-object/from16 v39, v41

    .line 347
    move-object/from16 v0, v39

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/notifications/NotificationsGet$Result;->n:Ljava/util/List;

    .line 348
    const-string/jumbo v6, "next_from"

    move-object/from16 v0, v38

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v37

    iput-object v6, v0, Lcom/vkontakte/android/api/notifications/NotificationsGet$Result;->newFrom:Ljava/lang/String;

    .line 349
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/vkontakte/android/api/notifications/NotificationsGet;->mFoundDividers:Z

    move-object/from16 v0, v37

    iput-boolean v6, v0, Lcom/vkontakte/android/api/notifications/NotificationsGet$Result;->foundDividers:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 350
    return-object v37

    .line 123
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_9
        :pswitch_1
        :pswitch_a
        :pswitch_0
        :pswitch_2
    .end packed-switch

    .line 188
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
    .end packed-switch

    .line 143
    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/notifications/NotificationsGet$Result;

    move-result-object v0

    return-object v0
.end method
