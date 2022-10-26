.class public Lcom/vkontakte/android/api/account/AccountGetProfileInfo;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AccountGetProfileInfo.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Landroid/os/Bundle;",
        ">;"
    }
.end annotation


# static fields
.field public static final MIN_AGE:I = 0xe

.field public static final MIN_BDATE_YEAR:I = 0x76d


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 17
    const-string/jumbo v0, "account.getProfileInfo"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 18
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "photo_50"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/account/AccountGetProfileInfo;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 19
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Landroid/os/Bundle;
    .locals 14
    .param p1, "jsonObject"    # Lorg/json/JSONObject;

    .prologue
    const/4 v7, 0x0

    const/4 v10, 0x1

    .line 23
    :try_start_0
    const-string/jumbo v11, "response"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 24
    .local v5, "jsonObject2":Lorg/json/JSONObject;
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 25
    .local v6, "res":Landroid/os/Bundle;
    const-string/jumbo v11, "first_name"

    const-string/jumbo v12, "first_name"

    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v11, v12}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    const-string/jumbo v11, "last_name"

    const-string/jumbo v12, "last_name"

    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v11, v12}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    const-string/jumbo v11, "gender"

    const-string/jumbo v12, "sex"

    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v6, v11, v12}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 28
    const-string/jumbo v11, "relation"

    const-string/jumbo v12, "relation"

    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v6, v11, v12}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 29
    const-string/jumbo v11, "relation_partner"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 30
    const-string/jumbo v11, "relation_partner"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 31
    .local v3, "ju":Lorg/json/JSONObject;
    new-instance v8, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v8}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 32
    .local v8, "user":Lcom/vkontakte/android/UserProfile;
    const-string/jumbo v11, "id"

    invoke-virtual {v3, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    iput v11, v8, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 33
    const-string/jumbo v11, "first_name"

    invoke-virtual {v3, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v8, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 34
    const-string/jumbo v11, "last_name"

    invoke-virtual {v3, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v8, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 35
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v12, v8, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, v8, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, v8, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 36
    const-string/jumbo v11, "photo_50"

    invoke-virtual {v3, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v8, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 37
    const-string/jumbo v11, "relation_partner"

    invoke-virtual {v6, v11, v8}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 39
    .end local v3    # "ju":Lorg/json/JSONObject;
    .end local v8    # "user":Lcom/vkontakte/android/UserProfile;
    :cond_0
    const-string/jumbo v11, "bdate"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 41
    .local v1, "bdate":Ljava/lang/String;
    :try_start_1
    const-string/jumbo v11, "\\."

    invoke-virtual {v1, v11}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 42
    .local v0, "bd":[Ljava/lang/String;
    const-string/jumbo v11, "bday"

    const/4 v12, 0x0

    aget-object v12, v0, v12

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v6, v11, v12}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 43
    const-string/jumbo v11, "bmonth"

    const/4 v12, 0x1

    aget-object v12, v0, v12

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v6, v11, v12}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 44
    const-string/jumbo v11, "byear"

    const/4 v12, 0x2

    aget-object v12, v0, v12

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    const/16 v13, 0x76d

    invoke-static {v12, v13}, Ljava/lang/Math;->max(II)I

    move-result v12

    invoke-virtual {v6, v11, v12}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 47
    .end local v0    # "bd":[Ljava/lang/String;
    :goto_0
    :try_start_2
    const-string/jumbo v11, "bdate_vis"

    const-string/jumbo v12, "bdate_visibility"

    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v6, v11, v12}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 48
    const-string/jumbo v11, "country"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 49
    const-string/jumbo v11, "country"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 50
    .local v2, "jc":Lorg/json/JSONObject;
    const-string/jumbo v11, "country_id"

    const-string/jumbo v12, "id"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v6, v11, v12}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 51
    const-string/jumbo v11, "country_name"

    const-string/jumbo v12, "title"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v11, v12}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .end local v2    # "jc":Lorg/json/JSONObject;
    :cond_1
    const-string/jumbo v11, "city"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 54
    const-string/jumbo v11, "city"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 55
    .restart local v2    # "jc":Lorg/json/JSONObject;
    const-string/jumbo v11, "city_id"

    const-string/jumbo v12, "id"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v6, v11, v12}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 56
    const-string/jumbo v11, "city_name"

    const-string/jumbo v12, "title"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v11, v12}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .end local v2    # "jc":Lorg/json/JSONObject;
    :cond_2
    const-string/jumbo v11, "name_request"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 59
    const-string/jumbo v11, "name_request"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 60
    .local v4, "nr":Lorg/json/JSONObject;
    const-string/jumbo v11, "status"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "processing"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3

    move v7, v10

    .line 61
    .local v7, "status":I
    :cond_3
    const-string/jumbo v11, "name_req_status"

    invoke-virtual {v6, v11, v7}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 62
    if-ne v7, v10, :cond_4

    .line 63
    const-string/jumbo v10, "name_req_id"

    const-string/jumbo v11, "id"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    invoke-virtual {v6, v10, v11}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 65
    :cond_4
    const-string/jumbo v10, "name_req_name"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "first_name"

    invoke-virtual {v4, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, "last_name"

    invoke-virtual {v4, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 71
    .end local v1    # "bdate":Ljava/lang/String;
    .end local v4    # "nr":Lorg/json/JSONObject;
    .end local v5    # "r":Lorg/json/JSONObject;
    .end local v6    # "res":Landroid/os/Bundle;
    .end local v7    # "status":I
    :cond_5
    :goto_1
    return-object v6

    .line 68
    :catch_0
    move-exception v9

    .line 69
    .local v9, "x":Ljava/lang/Exception;
    const-string/jumbo v10, "vk"

    invoke-static {v10, v9}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 71
    const/4 v6, 0x0

    goto :goto_1

    .line 45
    .end local v9    # "x":Ljava/lang/Exception;
    .restart local v1    # "bdate":Ljava/lang/String;
    .restart local v5    # "r":Lorg/json/JSONObject;
    .restart local v6    # "res":Landroid/os/Bundle;
    :catch_1
    move-exception v11

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
    .line 11
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/account/AccountGetProfileInfo;->parse(Lorg/json/JSONObject;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method
