.class public Lcom/vkontakte/android/api/users/GetFullProfile;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "GetFullProfile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/users/GetFullProfile$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/users/GetFullProfile$Result;",
        ">;"
    }
.end annotation


# instance fields
.field uid:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 3
    .param p1, "uid"    # I
    .param p2, "photoCount"    # I
    .param p3, "giftCount"    # I
    .param p4, "goodsCount"    # I

    .prologue
    const/4 v2, 0x1

    .line 43
    if-lez p1, :cond_0

    const-string/jumbo v0, "execute.getFullProfileNewNew"

    :goto_0
    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 44
    if-lez p1, :cond_1

    .line 45
    const-string/jumbo v0, "user_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/users/GetFullProfile;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 46
    const-string/jumbo v0, "func_v"

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/users/GetFullProfile;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 52
    :goto_1
    iput p1, p0, Lcom/vkontakte/android/api/users/GetFullProfile;->uid:I

    .line 53
    const-string/jumbo v0, "photo_count"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/users/GetFullProfile;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 54
    const-string/jumbo v0, "gift_count"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/users/GetFullProfile;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 55
    const-string/jumbo v0, "photo_sizes"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/api/users/GetFullProfile;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 56
    const-string/jumbo v0, "skip_hidden"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/api/users/GetFullProfile;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 57
    return-void

    .line 43
    :cond_0
    const-string/jumbo v0, "execute.getFullGroupNewNew"

    goto :goto_0

    .line 48
    :cond_1
    const-string/jumbo v0, "group_id"

    neg-int v1, p1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/users/GetFullProfile;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 49
    const-string/jumbo v0, "func_v"

    const/4 v1, 0x5

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/users/GetFullProfile;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 50
    const-string/jumbo v0, "good_count"

    invoke-virtual {p0, v0, p4}, Lcom/vkontakte/android/api/users/GetFullProfile;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_1
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/users/GetFullProfile$Result;
    .locals 118
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 61
    :try_start_0
    const-string/jumbo v109, "response"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 62
    if-nez p1, :cond_0

    .line 63
    new-instance v93, Lcom/vkontakte/android/api/users/GetFullProfile$Result;

    invoke-direct/range {v93 .. v93}, Lcom/vkontakte/android/api/users/GetFullProfile$Result;-><init>()V

    .line 686
    :goto_0
    return-object v93

    .line 65
    :cond_0
    new-instance v37, Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-direct/range {v37 .. v37}, Lcom/vkontakte/android/api/ExtendedUserProfile;-><init>()V

    .line 67
    .local v37, "ep":Lcom/vkontakte/android/api/ExtendedUserProfile;
    const-string/jumbo v109, "app_button"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v70

    .line 68
    .local v70, "oButton":Lorg/json/JSONObject;
    if-eqz v70, :cond_1

    .line 69
    const-string/jumbo v109, "app_id"

    move-object/from16 v0, v70

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->buttonAppId:I

    .line 70
    const-string/jumbo v109, "title"

    move-object/from16 v0, v70

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->buttonTitle:Ljava/lang/String;

    .line 73
    :cond_1
    const-string/jumbo v109, "cover"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    .line 74
    .local v15, "cover":Lorg/json/JSONObject;
    if-eqz v15, :cond_3

    .line 75
    const-string/jumbo v109, "images"

    move-object/from16 v0, v109

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v17

    .line 76
    .local v17, "coverSizes":Lorg/json/JSONArray;
    if-eqz v17, :cond_3

    invoke-virtual/range {v17 .. v17}, Lorg/json/JSONArray;->length()I

    move-result v109

    if-lez v109, :cond_3

    .line 77
    const-string/jumbo v109, "enabled"

    const/16 v110, 0x0

    move-object/from16 v0, v109

    move/from16 v1, v110

    invoke-virtual {v15, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v109

    if-eqz v109, :cond_2

    const/16 v109, 0x1

    :goto_1
    move-object/from16 v0, v37

    move/from16 v1, v109

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/ExtendedUserProfile;->setHasCover(Z)V

    .line 78
    new-instance v109, Lcom/vkontakte/android/Photo;

    invoke-direct/range {v109 .. v109}, Lcom/vkontakte/android/Photo;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->coverPhoto:Lcom/vkontakte/android/Photo;

    .line 79
    const/16 v44, 0x0

    .local v44, "i":I
    :goto_2
    invoke-virtual/range {v17 .. v17}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_3

    .line 80
    move-object/from16 v0, v17

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v16

    .line 82
    .local v16, "coverItem":Lorg/json/JSONObject;
    new-instance v45, Lcom/vkontakte/android/Photo$Image;

    invoke-direct/range {v45 .. v45}, Lcom/vkontakte/android/Photo$Image;-><init>()V

    .line 83
    .local v45, "image":Lcom/vkontakte/android/Photo$Image;
    const-string/jumbo v109, "height"

    move-object/from16 v0, v16

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v45

    iput v0, v1, Lcom/vkontakte/android/Photo$Image;->height:I

    .line 84
    const-string/jumbo v109, "width"

    move-object/from16 v0, v16

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v45

    iput v0, v1, Lcom/vkontakte/android/Photo$Image;->width:I

    .line 85
    const-string/jumbo v109, "url"

    move-object/from16 v0, v16

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v45

    iput-object v0, v1, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .line 87
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->coverPhoto:Lcom/vkontakte/android/Photo;

    move-object/from16 v109, v0

    move-object/from16 v0, v109

    iget-object v0, v0, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    move-object/from16 v0, v109

    move-object/from16 v1, v45

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    add-int/lit8 v44, v44, 0x1

    goto :goto_2

    .line 77
    .end local v16    # "coverItem":Lorg/json/JSONObject;
    .end local v44    # "i":I
    .end local v45    # "image":Lcom/vkontakte/android/Photo$Image;
    :cond_2
    const/16 v109, 0x0

    goto :goto_1

    .line 92
    .end local v17    # "coverSizes":Lorg/json/JSONArray;
    :cond_3
    new-instance v109, Lcom/vkontakte/android/UserProfile;

    invoke-direct/range {v109 .. v109}, Lcom/vkontakte/android/UserProfile;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    .line 93
    const-string/jumbo v109, "screen_name"

    new-instance v110, Ljava/lang/StringBuilder;

    invoke-direct/range {v110 .. v110}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v111, "id"

    invoke-virtual/range {v110 .. v111}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v110

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/api/users/GetFullProfile;->uid:I

    move/from16 v111, v0

    invoke-virtual/range {v110 .. v111}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v110

    invoke-virtual/range {v110 .. v110}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v110

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->screenName:Ljava/lang/String;

    .line 94
    const-string/jumbo v109, "is_favorite"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_5

    const/16 v109, 0x1

    :goto_3
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->isFavorite:Z

    .line 95
    const-string/jumbo v109, "is_subscribed"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_6

    const/16 v109, 0x1

    :goto_4
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->isSubscribed:Z

    .line 96
    const-string/jumbo v109, "can_send_friend_request"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_7

    const/16 v109, 0x1

    :goto_5
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->canSendFriendRequest:Z

    .line 97
    const-string/jumbo v109, "can_upload_video"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_8

    const/16 v109, 0x1

    :goto_6
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->canUploadVideo:Z

    .line 98
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/api/users/GetFullProfile;->uid:I

    move/from16 v109, v0

    if-lez v109, :cond_41

    .line 99
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v109, v0

    const-string/jumbo v110, "id"

    move-object/from16 v0, p1

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v110

    move/from16 v0, v110

    move-object/from16 v1, v109

    iput v0, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 100
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v109, v0

    const-string/jumbo v110, "first_name"

    move-object/from16 v0, p1

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v110

    move-object/from16 v0, v110

    move-object/from16 v1, v109

    iput-object v0, v1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 101
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v109, v0

    const-string/jumbo v110, "last_name"

    move-object/from16 v0, p1

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v110

    move-object/from16 v0, v110

    move-object/from16 v1, v109

    iput-object v0, v1, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 102
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v109, v0

    new-instance v110, Ljava/lang/StringBuilder;

    invoke-direct/range {v110 .. v110}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v111, v0

    move-object/from16 v0, v111

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    move-object/from16 v111, v0

    invoke-virtual/range {v110 .. v111}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v110

    const-string/jumbo v111, " "

    invoke-virtual/range {v110 .. v111}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v110

    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v111, v0

    move-object/from16 v0, v111

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    move-object/from16 v111, v0

    invoke-virtual/range {v110 .. v111}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v110

    invoke-virtual/range {v110 .. v110}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v110

    move-object/from16 v0, v110

    move-object/from16 v1, v109

    iput-object v0, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 103
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v110, v0

    sget v109, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v111, 0x3f800000    # 1.0f

    cmpl-float v109, v109, v111

    if-lez v109, :cond_9

    const-string/jumbo v109, "photo_medium_rec"

    :goto_7
    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v110

    iput-object v0, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 104
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v110, v0

    const-string/jumbo v109, "friend_status"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v109

    const/16 v111, 0x3

    move/from16 v0, v109

    move/from16 v1, v111

    if-ne v0, v1, :cond_a

    const/16 v109, 0x1

    :goto_8
    move/from16 v0, v109

    move-object/from16 v1, v110

    iput-boolean v0, v1, Lcom/vkontakte/android/UserProfile;->isFriend:Z

    .line 106
    const-string/jumbo v109, "photo_max"

    const-string/jumbo v110, "photo_medium_rec"

    move-object/from16 v0, p1

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v110

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->bigPhoto:Ljava/lang/String;

    .line 107
    const-string/jumbo v109, "activity"

    const-string/jumbo v110, ""

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->activity:Ljava/lang/String;

    .line 108
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v110, v0

    const-string/jumbo v109, "sex"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v109

    const/16 v111, 0x1

    move/from16 v0, v109

    move/from16 v1, v111

    if-ne v0, v1, :cond_b

    const/16 v109, 0x1

    :goto_9
    move/from16 v0, v109

    move-object/from16 v1, v110

    iput-boolean v0, v1, Lcom/vkontakte/android/UserProfile;->f:Z

    .line 109
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v109, v0

    invoke-static/range {p1 .. p1}, Lcom/vkontakte/android/Global;->getUserOnlineStatus(Lorg/json/JSONObject;)I

    move-result v110

    move/from16 v0, v110

    move-object/from16 v1, v109

    iput v0, v1, Lcom/vkontakte/android/UserProfile;->online:I

    .line 110
    const-string/jumbo v109, "crop_photo"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_4

    .line 111
    new-instance v109, Lcom/vkontakte/android/Photo;

    const-string/jumbo v110, "crop_photo"

    move-object/from16 v0, p1

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v110

    const-string/jumbo v111, "photo"

    invoke-virtual/range {v110 .. v111}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v110

    invoke-direct/range {v109 .. v110}, Lcom/vkontakte/android/Photo;-><init>(Lorg/json/JSONObject;)V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->photo:Lcom/vkontakte/android/Photo;

    .line 112
    const-string/jumbo v109, "crop_photo"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v109

    const-string/jumbo v110, "rect"

    invoke-virtual/range {v109 .. v110}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v78

    .line 113
    .local v78, "rect":Lorg/json/JSONObject;
    const-string/jumbo v109, "crop_photo"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v109

    const-string/jumbo v110, "crop"

    invoke-virtual/range {v109 .. v110}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v18

    .line 114
    .local v18, "crop":Lorg/json/JSONObject;
    const-string/jumbo v109, "x"

    move-object/from16 v0, v18

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v24

    .local v24, "cropX1":D
    const-string/jumbo v109, "x2"

    move-object/from16 v0, v18

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v26

    .local v26, "cropX2":D
    const-string/jumbo v109, "y"

    move-object/from16 v0, v18

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v28

    .local v28, "cropY1":D
    const-string/jumbo v109, "y2"

    move-object/from16 v0, v18

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v30

    .line 115
    .local v30, "cropY2":D
    const-string/jumbo v109, "x"

    move-object/from16 v0, v78

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v84

    .local v84, "rectX1":D
    const-string/jumbo v109, "x2"

    move-object/from16 v0, v78

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v86

    .local v86, "rectX2":D
    const-string/jumbo v109, "y"

    move-object/from16 v0, v78

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v88

    .local v88, "rectY1":D
    const-string/jumbo v109, "y2"

    move-object/from16 v0, v78

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v90

    .line 116
    .local v90, "rectY2":D
    sub-double v110, v26, v24

    const-wide/high16 v112, 0x4059000000000000L    # 100.0

    div-double v22, v110, v112

    .line 117
    .local v22, "cropW":D
    sub-double v110, v30, v28

    const-wide/high16 v112, 0x4059000000000000L    # 100.0

    div-double v20, v110, v112

    .line 118
    .local v20, "cropH":D
    sub-double v110, v86, v84

    const-wide/high16 v112, 0x4059000000000000L    # 100.0

    div-double v82, v110, v112

    .line 119
    .local v82, "rectW":D
    sub-double v110, v90, v88

    const-wide/high16 v112, 0x4059000000000000L    # 100.0

    div-double v80, v110, v112

    .line 120
    .local v80, "rectH":D
    mul-double v34, v82, v22

    .line 121
    .local v34, "destW":D
    mul-double v32, v80, v20

    .line 122
    .local v32, "destH":D
    new-instance v109, Landroid/graphics/RectF;

    const-wide/high16 v110, 0x4059000000000000L    # 100.0

    div-double v110, v24, v110

    const-wide/high16 v112, 0x4059000000000000L    # 100.0

    div-double v112, v84, v112

    mul-double v112, v112, v22

    add-double v110, v110, v112

    move-wide/from16 v0, v110

    double-to-float v0, v0

    move/from16 v110, v0

    const-wide/high16 v112, 0x4059000000000000L    # 100.0

    div-double v112, v28, v112

    const-wide/high16 v114, 0x4059000000000000L    # 100.0

    div-double v114, v88, v114

    mul-double v114, v114, v20

    add-double v112, v112, v114

    move-wide/from16 v0, v112

    double-to-float v0, v0

    move/from16 v111, v0

    const-wide/high16 v112, 0x4059000000000000L    # 100.0

    div-double v112, v24, v112

    const-wide/high16 v114, 0x4059000000000000L    # 100.0

    div-double v114, v84, v114

    mul-double v114, v114, v22

    add-double v112, v112, v114

    add-double v112, v112, v34

    move-wide/from16 v0, v112

    double-to-float v0, v0

    move/from16 v112, v0

    const-wide/high16 v114, 0x4059000000000000L    # 100.0

    div-double v114, v28, v114

    const-wide/high16 v116, 0x4059000000000000L    # 100.0

    div-double v116, v88, v116

    mul-double v116, v116, v20

    add-double v114, v114, v116

    add-double v114, v114, v32

    move-wide/from16 v0, v114

    double-to-float v0, v0

    move/from16 v113, v0

    invoke-direct/range {v109 .. v113}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->photoRect:Landroid/graphics/RectF;

    .line 125
    .end local v18    # "crop":Lorg/json/JSONObject;
    .end local v20    # "cropH":D
    .end local v22    # "cropW":D
    .end local v24    # "cropX1":D
    .end local v26    # "cropX2":D
    .end local v28    # "cropY1":D
    .end local v30    # "cropY2":D
    .end local v32    # "destH":D
    .end local v34    # "destW":D
    .end local v78    # "rect":Lorg/json/JSONObject;
    .end local v80    # "rectH":D
    .end local v82    # "rectW":D
    .end local v84    # "rectX1":D
    .end local v86    # "rectX2":D
    .end local v88    # "rectY1":D
    .end local v90    # "rectY2":D
    :cond_4
    new-instance v9, Landroid/util/SparseArray;

    invoke-direct {v9}, Landroid/util/SparseArray;-><init>()V

    .line 126
    .local v9, "cities":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    const-string/jumbo v109, "cities"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v48

    .line 127
    .local v48, "jcities":Lorg/json/JSONArray;
    const/16 v44, 0x0

    .restart local v44    # "i":I
    :goto_a
    invoke-virtual/range {v48 .. v48}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_c

    .line 128
    move-object/from16 v0, v48

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    .line 129
    .local v10, "city":Lorg/json/JSONObject;
    const-string/jumbo v109, "id"

    move-object/from16 v0, v109

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v109

    const-string/jumbo v110, "title"

    move-object/from16 v0, v110

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v110

    move/from16 v0, v109

    move-object/from16 v1, v110

    invoke-virtual {v9, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 127
    add-int/lit8 v44, v44, 0x1

    goto :goto_a

    .line 94
    .end local v9    # "cities":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v10    # "city":Lorg/json/JSONObject;
    .end local v44    # "i":I
    .end local v48    # "jcities":Lorg/json/JSONArray;
    :cond_5
    const/16 v109, 0x0

    goto/16 :goto_3

    .line 95
    :cond_6
    const/16 v109, 0x0

    goto/16 :goto_4

    .line 96
    :cond_7
    const/16 v109, 0x0

    goto/16 :goto_5

    .line 97
    :cond_8
    const/16 v109, 0x0

    goto/16 :goto_6

    .line 103
    :cond_9
    const-string/jumbo v109, "photo_rec"

    goto/16 :goto_7

    .line 104
    :cond_a
    const/16 v109, 0x0

    goto/16 :goto_8

    .line 108
    :cond_b
    const/16 v109, 0x0

    goto/16 :goto_9

    .line 131
    .restart local v9    # "cities":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .restart local v44    # "i":I
    .restart local v48    # "jcities":Lorg/json/JSONArray;
    :cond_c
    new-instance v13, Landroid/util/SparseArray;

    invoke-direct {v13}, Landroid/util/SparseArray;-><init>()V

    .line 132
    .local v13, "countries":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    const-string/jumbo v109, "cities"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v49

    .line 133
    .local v49, "jcountries":Lorg/json/JSONArray;
    const/16 v44, 0x0

    :goto_b
    invoke-virtual/range {v49 .. v49}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_d

    .line 134
    move-object/from16 v0, v49

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v14

    .line 135
    .local v14, "country":Lorg/json/JSONObject;
    const-string/jumbo v109, "id"

    move-object/from16 v0, v109

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v109

    const-string/jumbo v110, "title"

    move-object/from16 v0, v110

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v110

    move/from16 v0, v109

    move-object/from16 v1, v110

    invoke-virtual {v13, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 133
    add-int/lit8 v44, v44, 0x1

    goto :goto_b

    .line 138
    .end local v14    # "country":Lorg/json/JSONObject;
    :cond_d
    const-string/jumbo v109, "can_write_private_message"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_19

    const/16 v109, 0x1

    :goto_c
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->canWrite:Z

    .line 139
    const-string/jumbo v109, "can_post"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_1a

    const/16 v109, 0x1

    :goto_d
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->canPost:Z

    .line 140
    const-string/jumbo v109, "can_see_all_posts"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_1b

    const/16 v109, 0x1

    :goto_e
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->canSeeAllPosts:Z

    .line 141
    const-string/jumbo v109, "all"

    const-string/jumbo v110, "wall_default"

    move-object/from16 v0, p1

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v110

    invoke-virtual/range {v109 .. v110}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->showAllPosts:Z

    .line 142
    const-string/jumbo v109, "can_call"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_1c

    const/16 v109, 0x1

    :goto_f
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->canCall:Z

    .line 143
    const-string/jumbo v109, "blacklisted_by_me"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_1d

    const/16 v109, 0x1

    :goto_10
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->blacklisted:Z

    .line 145
    const-string/jumbo v109, "blacklisted"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_e

    .line 146
    new-instance v109, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    invoke-direct/range {v109 .. v109}, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    .line 149
    :cond_e
    const-string/jumbo v109, "relation"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->relation:I

    .line 150
    const-string/jumbo v109, "relation_partner"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_f

    .line 151
    const-string/jumbo v109, "relation_partner"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v109

    const-string/jumbo v110, "id"

    invoke-virtual/range {v109 .. v110}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->relationPartner:I

    .line 152
    new-instance v109, Ljava/lang/StringBuilder;

    invoke-direct/range {v109 .. v109}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v110, "relation_partner"

    move-object/from16 v0, p1

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v110

    const-string/jumbo v111, "first_name"

    invoke-virtual/range {v110 .. v111}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v110

    invoke-virtual/range {v109 .. v110}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v109

    const-string/jumbo v110, " "

    invoke-virtual/range {v109 .. v110}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v109

    const-string/jumbo v110, "relation_partner"

    move-object/from16 v0, p1

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v110

    const-string/jumbo v111, "last_name"

    invoke-virtual/range {v110 .. v111}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v110

    invoke-virtual/range {v109 .. v110}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->relationPartnerName:Ljava/lang/String;

    .line 155
    :cond_f
    const-string/jumbo v109, "bdate"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_10

    .line 156
    const-string/jumbo v109, "bdate"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    const-string/jumbo v110, "\\."

    invoke-virtual/range {v109 .. v110}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 157
    .local v5, "bd":[Ljava/lang/String;
    const/16 v109, 0x0

    aget-object v109, v5, v109

    invoke-static/range {v109 .. v109}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->bDay:I

    .line 158
    const/16 v109, 0x1

    aget-object v109, v5, v109

    invoke-static/range {v109 .. v109}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->bMonth:I

    .line 159
    array-length v0, v5

    move/from16 v109, v0

    const/16 v110, 0x2

    move/from16 v0, v109

    move/from16 v1, v110

    if-le v0, v1, :cond_10

    .line 160
    const/16 v109, 0x2

    aget-object v109, v5, v109

    invoke-static/range {v109 .. v109}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->bYear:I

    .line 164
    .end local v5    # "bd":[Ljava/lang/String;
    :cond_10
    const-string/jumbo v109, "first_name_dat"

    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v110, v0

    move-object/from16 v0, v110

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    move-object/from16 v110, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameDat:Ljava/lang/String;

    .line 165
    const-string/jumbo v109, "first_name_gen"

    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v110, v0

    move-object/from16 v0, v110

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    move-object/from16 v110, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameGen:Ljava/lang/String;

    .line 166
    const-string/jumbo v109, "first_name_ins"

    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v110, v0

    move-object/from16 v0, v110

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    move-object/from16 v110, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameIns:Ljava/lang/String;

    .line 167
    const-string/jumbo v109, "first_name_acc"

    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v110, v0

    move-object/from16 v0, v110

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    move-object/from16 v110, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameAcc:Ljava/lang/String;

    .line 168
    const-string/jumbo v109, "last_name_dat"

    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v110, v0

    move-object/from16 v0, v110

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    move-object/from16 v110, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->lastNameDat:Ljava/lang/String;

    .line 169
    const-string/jumbo v109, "last_name_gen"

    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v110, v0

    move-object/from16 v0, v110

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    move-object/from16 v110, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->lastNameGen:Ljava/lang/String;

    .line 170
    const-string/jumbo v109, "last_name_ins"

    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v110, v0

    move-object/from16 v0, v110

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    move-object/from16 v110, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->lastNameIns:Ljava/lang/String;

    .line 171
    const-string/jumbo v109, "last_name_acc"

    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v110, v0

    move-object/from16 v0, v110

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    move-object/from16 v110, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->lastNameAcc:Ljava/lang/String;

    .line 173
    const-string/jumbo v109, "city"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_11

    const-string/jumbo v109, "country"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_11

    .line 174
    const-string/jumbo v109, "city"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v109

    const-string/jumbo v110, "title"

    invoke-virtual/range {v109 .. v110}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->city:Ljava/lang/String;

    .line 175
    const-string/jumbo v109, "country"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v109

    const-string/jumbo v110, "title"

    invoke-virtual/range {v109 .. v110}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->country:Ljava/lang/String;

    .line 178
    :cond_11
    const-string/jumbo v109, "mobile_phone"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_12

    const-string/jumbo v109, "mobile_phone"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->length()I

    move-result v109

    if-lez v109, :cond_12

    .line 179
    const-string/jumbo v109, "mobile_phone"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->mobilePhone:Ljava/lang/String;

    .line 181
    :cond_12
    const-string/jumbo v109, "home_phone"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_13

    const-string/jumbo v109, "home_phone"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->length()I

    move-result v109

    if-lez v109, :cond_13

    .line 182
    const-string/jumbo v109, "home_phone"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->homePhone:Ljava/lang/String;

    .line 184
    :cond_13
    const-string/jumbo v109, "skype"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_14

    .line 185
    const-string/jumbo v109, "skype"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->skype:Ljava/lang/String;

    .line 187
    :cond_14
    const-string/jumbo v109, "twitter"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_15

    .line 188
    const-string/jumbo v109, "twitter"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->twitter:Ljava/lang/String;

    .line 190
    :cond_15
    const-string/jumbo v109, "livejournal"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_16

    .line 191
    const-string/jumbo v109, "livejournal"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->livejournal:Ljava/lang/String;

    .line 193
    :cond_16
    const-string/jumbo v109, "facebook"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_17

    const-string/jumbo v109, "facebook"

    const-wide/16 v110, -0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    move-wide/from16 v2, v110

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v110

    const-wide/16 v112, -0x1

    cmp-long v109, v110, v112

    if-eqz v109, :cond_17

    .line 194
    const-string/jumbo v109, "facebook"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v110

    move-wide/from16 v0, v110

    move-object/from16 v2, v37

    iput-wide v0, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->facebookId:J

    .line 195
    const-string/jumbo v109, "facebook_name"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->facebookName:Ljava/lang/String;

    .line 197
    :cond_17
    const-string/jumbo v109, "instagram"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_18

    .line 198
    const-string/jumbo v109, "instagram"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->instagram:Ljava/lang/String;

    .line 201
    :cond_18
    const-string/jumbo v109, "friend_status"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    .line 203
    const-string/jumbo v109, "schools"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v95

    .line 204
    .local v95, "schools":Lorg/json/JSONArray;
    new-instance v109, Ljava/util/ArrayList;

    invoke-direct/range {v109 .. v109}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->schools:Ljava/util/ArrayList;

    .line 205
    if-eqz v95, :cond_1e

    .line 206
    const/16 v44, 0x0

    :goto_11
    invoke-virtual/range {v95 .. v95}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_1e

    .line 207
    new-instance v94, Lcom/vkontakte/android/api/ExtendedUserProfile$School;

    invoke-direct/range {v94 .. v94}, Lcom/vkontakte/android/api/ExtendedUserProfile$School;-><init>()V

    .line 208
    .local v94, "s":Lcom/vkontakte/android/api/ExtendedUserProfile$School;
    move-object/from16 v0, v95

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v60

    .line 209
    .local v60, "js":Lorg/json/JSONObject;
    const-string/jumbo v109, "city"

    move-object/from16 v0, v60

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    invoke-virtual {v9, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v109

    check-cast v109, Ljava/lang/String;

    move-object/from16 v0, v109

    move-object/from16 v1, v94

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->city:Ljava/lang/String;

    .line 210
    const-string/jumbo v109, "name"

    const-string/jumbo v110, "???"

    move-object/from16 v0, v60

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v94

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->name:Ljava/lang/String;

    .line 211
    const-string/jumbo v109, "year_from"

    move-object/from16 v0, v60

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v94

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->from:I

    .line 212
    const-string/jumbo v109, "year_to"

    move-object/from16 v0, v60

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v94

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->to:I

    .line 213
    const-string/jumbo v109, "year_graduated"

    move-object/from16 v0, v60

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v94

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->graduation:I

    .line 214
    const-string/jumbo v109, "class"

    const/16 v110, 0x0

    move-object/from16 v0, v60

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v94

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->className:Ljava/lang/String;

    .line 215
    const-string/jumbo v109, "speciality"

    const/16 v110, 0x0

    move-object/from16 v0, v60

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v94

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->speciality:Ljava/lang/String;

    .line 216
    const-string/jumbo v109, "type_str"

    sget-object v110, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual/range {v110 .. v110}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v110

    const v111, 0x7f08057a

    invoke-virtual/range {v110 .. v111}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v110

    move-object/from16 v0, v60

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v94

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->type:Ljava/lang/String;

    .line 217
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->schools:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    move-object/from16 v0, v109

    move-object/from16 v1, v94

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 206
    add-int/lit8 v44, v44, 0x1

    goto/16 :goto_11

    .line 138
    .end local v60    # "js":Lorg/json/JSONObject;
    .end local v94    # "s":Lcom/vkontakte/android/api/ExtendedUserProfile$School;
    .end local v95    # "schools":Lorg/json/JSONArray;
    :cond_19
    const/16 v109, 0x0

    goto/16 :goto_c

    .line 139
    :cond_1a
    const/16 v109, 0x0

    goto/16 :goto_d

    .line 140
    :cond_1b
    const/16 v109, 0x0

    goto/16 :goto_e

    .line 142
    :cond_1c
    const/16 v109, 0x0

    goto/16 :goto_f

    .line 143
    :cond_1d
    const/16 v109, 0x0

    goto/16 :goto_10

    .line 220
    .restart local v95    # "schools":Lorg/json/JSONArray;
    :cond_1e
    new-instance v109, Ljava/util/ArrayList;

    invoke-direct/range {v109 .. v109}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->universities:Ljava/util/ArrayList;

    .line 221
    const-string/jumbo v109, "universities"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v103

    .line 222
    .local v103, "univers":Lorg/json/JSONArray;
    if-eqz v103, :cond_21

    .line 223
    const/16 v44, 0x0

    :goto_12
    invoke-virtual/range {v103 .. v103}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_21

    .line 224
    new-instance v100, Lcom/vkontakte/android/api/ExtendedUserProfile$University;

    invoke-direct/range {v100 .. v100}, Lcom/vkontakte/android/api/ExtendedUserProfile$University;-><init>()V

    .line 225
    .local v100, "u":Lcom/vkontakte/android/api/ExtendedUserProfile$University;
    move-object/from16 v0, v103

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v63

    .line 226
    .local v63, "ju":Lorg/json/JSONObject;
    const-string/jumbo v109, "city"

    move-object/from16 v0, v63

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    invoke-virtual {v9, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v109

    check-cast v109, Ljava/lang/String;

    move-object/from16 v0, v109

    move-object/from16 v1, v100

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$University;->city:Ljava/lang/String;

    .line 227
    const-string/jumbo v109, "name"

    move-object/from16 v0, v63

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v100

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$University;->name:Ljava/lang/String;

    .line 228
    const-string/jumbo v109, "faculty_name"

    move-object/from16 v0, v63

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_1f

    .line 229
    const-string/jumbo v109, "faculty_name"

    move-object/from16 v0, v63

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v100

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$University;->faculty:Ljava/lang/String;

    .line 231
    :cond_1f
    const-string/jumbo v109, "chair_name"

    move-object/from16 v0, v63

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_20

    .line 232
    const-string/jumbo v109, "chair_name"

    move-object/from16 v0, v63

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v100

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$University;->chair:Ljava/lang/String;

    .line 234
    :cond_20
    const-string/jumbo v109, "graduation"

    move-object/from16 v0, v63

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v100

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$University;->graduation:I

    .line 235
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->universities:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    move-object/from16 v0, v109

    move-object/from16 v1, v100

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 223
    add-int/lit8 v44, v44, 0x1

    goto/16 :goto_12

    .line 239
    .end local v63    # "ju":Lorg/json/JSONObject;
    .end local v100    # "u":Lcom/vkontakte/android/api/ExtendedUserProfile$University;
    :cond_21
    const-string/jumbo v109, "interests"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_22

    const-string/jumbo v109, "interests"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->length()I

    move-result v109

    if-lez v109, :cond_22

    .line 240
    const-string/jumbo v109, "interests"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->interests:Ljava/lang/String;

    .line 242
    :cond_22
    const-string/jumbo v109, "movies"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_23

    const-string/jumbo v109, "movies"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->length()I

    move-result v109

    if-lez v109, :cond_23

    .line 243
    const-string/jumbo v109, "movies"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->movies:Ljava/lang/String;

    .line 245
    :cond_23
    const-string/jumbo v109, "music"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_24

    const-string/jumbo v109, "music"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->length()I

    move-result v109

    if-lez v109, :cond_24

    .line 246
    const-string/jumbo v109, "music"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->music:Ljava/lang/String;

    .line 248
    :cond_24
    const-string/jumbo v109, "tv"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_25

    const-string/jumbo v109, "tv"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->length()I

    move-result v109

    if-lez v109, :cond_25

    .line 249
    const-string/jumbo v109, "tv"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->tv:Ljava/lang/String;

    .line 251
    :cond_25
    const-string/jumbo v109, "books"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_26

    const-string/jumbo v109, "books"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->length()I

    move-result v109

    if-lez v109, :cond_26

    .line 252
    const-string/jumbo v109, "books"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->books:Ljava/lang/String;

    .line 254
    :cond_26
    const-string/jumbo v109, "games"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_27

    const-string/jumbo v109, "games"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->length()I

    move-result v109

    if-lez v109, :cond_27

    .line 255
    const-string/jumbo v109, "games"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->games:Ljava/lang/String;

    .line 257
    :cond_27
    const-string/jumbo v109, "about"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_28

    const-string/jumbo v109, "about"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->length()I

    move-result v109

    if-lez v109, :cond_28

    .line 258
    const-string/jumbo v109, "about"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->about:Ljava/lang/String;

    .line 260
    :cond_28
    const-string/jumbo v109, "quotes"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_29

    const-string/jumbo v109, "quotes"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->length()I

    move-result v109

    if-lez v109, :cond_29

    .line 261
    const-string/jumbo v109, "quotes"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->quotations:Ljava/lang/String;

    .line 263
    :cond_29
    const-string/jumbo v109, "activities"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_2a

    const-string/jumbo v109, "activities"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->length()I

    move-result v109

    if-lez v109, :cond_2a

    .line 264
    const-string/jumbo v109, "activities"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->activities:Ljava/lang/String;

    .line 266
    :cond_2a
    const-string/jumbo v109, "home_town"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_2b

    const-string/jumbo v109, "home_town"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->length()I

    move-result v109

    if-lez v109, :cond_2b

    .line 267
    const-string/jumbo v109, "home_town"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->hometown:Ljava/lang/String;

    .line 269
    :cond_2b
    const-string/jumbo v109, "site"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_2c

    const-string/jumbo v109, "site"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->length()I

    move-result v109

    if-lez v109, :cond_2c

    .line 270
    const-string/jumbo v109, "site"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->website:Ljava/lang/String;

    .line 273
    :cond_2c
    const-string/jumbo v109, "verified"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_2d

    const/16 v109, 0x1

    :goto_13
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->verified:Z

    .line 275
    const-string/jumbo v109, "personal"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v74

    .line 276
    .local v74, "personal":Lorg/json/JSONObject;
    if-eqz v74, :cond_30

    .line 277
    const-string/jumbo v109, "langs"

    move-object/from16 v0, v74

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v67

    .line 278
    .local v67, "langs":Lorg/json/JSONArray;
    if-eqz v67, :cond_2f

    .line 279
    new-instance v98, Ljava/util/ArrayList;

    invoke-direct/range {v98 .. v98}, Ljava/util/ArrayList;-><init>()V

    .line 280
    .local v98, "sl":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/16 v44, 0x0

    :goto_14
    invoke-virtual/range {v67 .. v67}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_2e

    .line 281
    move-object/from16 v0, v67

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v98

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 280
    add-int/lit8 v44, v44, 0x1

    goto :goto_14

    .line 273
    .end local v67    # "langs":Lorg/json/JSONArray;
    .end local v74    # "personal":Lorg/json/JSONObject;
    .end local v98    # "sl":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2d
    const/16 v109, 0x0

    goto :goto_13

    .line 283
    .restart local v67    # "langs":Lorg/json/JSONArray;
    .restart local v74    # "personal":Lorg/json/JSONObject;
    .restart local v98    # "sl":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2e
    const-string/jumbo v109, ", "

    move-object/from16 v0, v109

    move-object/from16 v1, v98

    invoke-static {v0, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->langs:Ljava/lang/String;

    .line 285
    .end local v98    # "sl":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2f
    const-string/jumbo v109, "political"

    move-object/from16 v0, v74

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->political:I

    .line 286
    const-string/jumbo v109, "religion"

    move-object/from16 v0, v74

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->religion:Ljava/lang/String;

    .line 287
    const-string/jumbo v109, "life_main"

    move-object/from16 v0, v74

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->lifeMain:I

    .line 288
    const-string/jumbo v109, "people_main"

    move-object/from16 v0, v74

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->peopleMain:I

    .line 289
    const-string/jumbo v109, "inspired_by"

    move-object/from16 v0, v74

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->inspiredBy:Ljava/lang/String;

    .line 290
    const-string/jumbo v109, "smoking"

    move-object/from16 v0, v74

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->smoking:I

    .line 291
    const-string/jumbo v109, "alcohol"

    move-object/from16 v0, v74

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->alcohol:I

    .line 294
    .end local v67    # "langs":Lorg/json/JSONArray;
    :cond_30
    new-instance v79, Landroid/util/SparseArray;

    invoke-direct/range {v79 .. v79}, Landroid/util/SparseArray;-><init>()V

    .line 295
    .local v79, "relatives":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v109, "relatives_profiles"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v59

    .line 296
    .local v59, "jrelprofiles":Lorg/json/JSONArray;
    if-eqz v59, :cond_31

    .line 297
    const/16 v44, 0x0

    :goto_15
    invoke-virtual/range {v59 .. v59}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_31

    .line 298
    move-object/from16 v0, v59

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v55

    .line 299
    .local v55, "jp":Lorg/json/JSONObject;
    new-instance v71, Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v71

    move-object/from16 v1, v55

    invoke-direct {v0, v1}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    .line 300
    .local v71, "p":Lcom/vkontakte/android/UserProfile;
    move-object/from16 v0, v71

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    move/from16 v109, v0

    move-object/from16 v0, v79

    move/from16 v1, v109

    move-object/from16 v2, v71

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 297
    add-int/lit8 v44, v44, 0x1

    goto :goto_15

    .line 304
    .end local v55    # "jp":Lorg/json/JSONObject;
    .end local v71    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_31
    const-string/jumbo v109, "relatives"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v92

    .line 305
    .local v92, "rels":Lorg/json/JSONArray;
    if-eqz v92, :cond_35

    .line 306
    const/16 v73, 0x0

    .local v73, "parents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const/16 v96, 0x0

    .local v96, "siblings":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v8, 0x0

    .line 307
    .local v8, "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const/16 v43, 0x0

    .local v43, "grandparents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const/16 v42, 0x0

    .line 309
    .local v42, "grandchildren":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const/16 v44, 0x0

    :goto_16
    invoke-virtual/range {v92 .. v92}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_34

    .line 310
    move-object/from16 v0, v92

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v58

    .line 311
    .local v58, "jr":Lorg/json/JSONObject;
    const-string/jumbo v109, "id"

    move-object/from16 v0, v58

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v101

    .line 312
    .local v101, "uid":I
    move-object/from16 v0, v79

    move/from16 v1, v101

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v109

    if-nez v109, :cond_32

    .line 309
    :goto_17
    add-int/lit8 v44, v44, 0x1

    goto :goto_16

    .line 316
    :cond_32
    const-string/jumbo v109, "type"

    move-object/from16 v0, v58

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-static/range {v109 .. v109}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v110

    const/16 v109, -0x1

    invoke-virtual/range {v110 .. v110}, Ljava/lang/String;->hashCode()I

    move-result v111

    sparse-switch v111, :sswitch_data_0

    :cond_33
    :goto_18
    packed-switch v109, :pswitch_data_0

    goto :goto_17

    .line 318
    :pswitch_0
    move-object/from16 v0, v79

    move/from16 v1, v101

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v109

    move-object/from16 v0, v42

    move-object/from16 v1, v109

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/Utils;->addAndInitIfNeed(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v42

    .line 319
    goto :goto_17

    .line 316
    :sswitch_0
    const-string/jumbo v111, "grandchild"

    invoke-virtual/range {v110 .. v111}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v110

    if-eqz v110, :cond_33

    const/16 v109, 0x0

    goto :goto_18

    :sswitch_1
    const-string/jumbo v111, "grandparent"

    invoke-virtual/range {v110 .. v111}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v110

    if-eqz v110, :cond_33

    const/16 v109, 0x1

    goto :goto_18

    :sswitch_2
    const-string/jumbo v111, "child"

    invoke-virtual/range {v110 .. v111}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v110

    if-eqz v110, :cond_33

    const/16 v109, 0x2

    goto :goto_18

    :sswitch_3
    const-string/jumbo v111, "sibling"

    invoke-virtual/range {v110 .. v111}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v110

    if-eqz v110, :cond_33

    const/16 v109, 0x3

    goto :goto_18

    :sswitch_4
    const-string/jumbo v111, "parent"

    invoke-virtual/range {v110 .. v111}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v110

    if-eqz v110, :cond_33

    const/16 v109, 0x4

    goto :goto_18

    .line 321
    :pswitch_1
    move-object/from16 v0, v79

    move/from16 v1, v101

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v109

    move-object/from16 v0, v43

    move-object/from16 v1, v109

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/Utils;->addAndInitIfNeed(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v43

    .line 322
    goto :goto_17

    .line 324
    :pswitch_2
    move-object/from16 v0, v79

    move/from16 v1, v101

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v109

    move-object/from16 v0, v109

    invoke-static {v8, v0}, Lcom/vkontakte/android/utils/Utils;->addAndInitIfNeed(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v8

    .line 325
    goto/16 :goto_17

    .line 327
    :pswitch_3
    move-object/from16 v0, v79

    move/from16 v1, v101

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v109

    move-object/from16 v0, v96

    move-object/from16 v1, v109

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/Utils;->addAndInitIfNeed(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v96

    .line 328
    goto/16 :goto_17

    .line 330
    :pswitch_4
    move-object/from16 v0, v79

    move/from16 v1, v101

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v109

    move-object/from16 v0, v73

    move-object/from16 v1, v109

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/Utils;->addAndInitIfNeed(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v73

    goto/16 :goto_17

    .line 334
    .end local v58    # "jr":Lorg/json/JSONObject;
    .end local v101    # "uid":I
    :cond_34
    sget-object v109, Lcom/vkontakte/android/UserProfile;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    move-object/from16 v0, v73

    move-object/from16 v1, v109

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/Utils;->arrayListToArray(Ljava/util/ArrayList;Landroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v109

    check-cast v109, [Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesParents:[Lcom/vkontakte/android/UserProfile;

    .line 335
    sget-object v109, Lcom/vkontakte/android/UserProfile;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    move-object/from16 v0, v96

    move-object/from16 v1, v109

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/Utils;->arrayListToArray(Ljava/util/ArrayList;Landroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v109

    check-cast v109, [Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesSibling:[Lcom/vkontakte/android/UserProfile;

    .line 336
    sget-object v109, Lcom/vkontakte/android/UserProfile;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    move-object/from16 v0, v109

    invoke-static {v8, v0}, Lcom/vkontakte/android/utils/Utils;->arrayListToArray(Ljava/util/ArrayList;Landroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v109

    check-cast v109, [Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesChild:[Lcom/vkontakte/android/UserProfile;

    .line 337
    sget-object v109, Lcom/vkontakte/android/UserProfile;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    move-object/from16 v0, v43

    move-object/from16 v1, v109

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/Utils;->arrayListToArray(Ljava/util/ArrayList;Landroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v109

    check-cast v109, [Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesGrandparent:[Lcom/vkontakte/android/UserProfile;

    .line 338
    sget-object v109, Lcom/vkontakte/android/UserProfile;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    move-object/from16 v0, v42

    move-object/from16 v1, v109

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/Utils;->arrayListToArray(Ljava/util/ArrayList;Landroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v109

    check-cast v109, [Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesGrandchild:[Lcom/vkontakte/android/UserProfile;

    .line 341
    .end local v8    # "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    .end local v42    # "grandchildren":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    .end local v43    # "grandparents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    .end local v73    # "parents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    .end local v96    # "siblings":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_35
    const-string/jumbo v109, "last_seen"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_37

    .line 342
    const-string/jumbo v109, "last_seen"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v109

    const-string/jumbo v110, "time"

    invoke-virtual/range {v109 .. v110}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->lastSeen:I

    .line 343
    const-string/jumbo v109, "last_seen"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v109

    const-string/jumbo v110, "platform"

    invoke-virtual/range {v109 .. v110}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v75

    .line 344
    .local v75, "platform":I
    const/16 v109, 0x1

    move/from16 v0, v75

    move/from16 v1, v109

    if-eq v0, v1, :cond_36

    const/16 v109, 0x2

    move/from16 v0, v75

    move/from16 v1, v109

    if-eq v0, v1, :cond_36

    const/16 v109, 0x3

    move/from16 v0, v75

    move/from16 v1, v109

    if-eq v0, v1, :cond_36

    const/16 v109, 0x4

    move/from16 v0, v75

    move/from16 v1, v109

    if-eq v0, v1, :cond_36

    const/16 v109, 0x5

    move/from16 v0, v75

    move/from16 v1, v109

    if-ne v0, v1, :cond_39

    :cond_36
    const/16 v109, 0x1

    :goto_19
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->lastSeenMobile:Z

    .line 347
    .end local v75    # "platform":I
    :cond_37
    const-string/jumbo v109, "deactivated"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-static/range {v109 .. v109}, Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;->parse(Ljava/lang/String;)Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->deactivated:Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;

    .line 349
    const-string/jumbo v109, "gifts"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v41

    .line 350
    .local v41, "gifts":Lorg/json/JSONObject;
    if-eqz v41, :cond_38

    .line 351
    new-instance v109, Lcom/vkontakte/android/data/VKList;

    const-class v110, Lcom/vkontakte/android/api/models/GiftItem;

    move-object/from16 v0, v109

    move-object/from16 v1, v41

    move-object/from16 v2, v110

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Ljava/lang/Class;)V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->gifts:Lcom/vkontakte/android/data/VKList;

    .line 353
    :cond_38
    const-string/jumbo v109, "friends"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_3a

    .line 354
    const-string/jumbo v109, "friends"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v39

    .line 355
    .local v39, "friends":Lorg/json/JSONArray;
    new-instance v109, Ljava/util/ArrayList;

    invoke-direct/range {v109 .. v109}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->friends:Ljava/util/ArrayList;

    .line 356
    const/16 v44, 0x0

    :goto_1a
    invoke-virtual/range {v39 .. v39}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_3a

    .line 357
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->friends:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    new-instance v110, Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v39

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v111

    invoke-direct/range {v110 .. v111}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual/range {v109 .. v110}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 356
    add-int/lit8 v44, v44, 0x1

    goto :goto_1a

    .line 344
    .end local v39    # "friends":Lorg/json/JSONArray;
    .end local v41    # "gifts":Lorg/json/JSONObject;
    .restart local v75    # "platform":I
    :cond_39
    const/16 v109, 0x0

    goto/16 :goto_19

    .line 360
    .end local v75    # "platform":I
    .restart local v41    # "gifts":Lorg/json/JSONObject;
    :cond_3a
    const-string/jumbo v109, "career"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_3d

    .line 361
    new-instance v109, Ljava/util/ArrayList;

    invoke-direct/range {v109 .. v109}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->career:Ljava/util/ArrayList;

    .line 362
    const-string/jumbo v109, "career"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    .line 363
    .local v7, "career":Lorg/json/JSONArray;
    const/16 v44, 0x0

    :goto_1b
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_3d

    .line 364
    move/from16 v0, v44

    invoke-virtual {v7, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v47

    .line 365
    .local v47, "jc":Lorg/json/JSONObject;
    new-instance v36, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;

    invoke-direct/range {v36 .. v36}, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;-><init>()V

    .line 366
    .local v36, "e":Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;
    const-string/jumbo v109, "group"

    move-object/from16 v0, v47

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_3c

    .line 367
    new-instance v109, Lcom/vkontakte/android/api/Group;

    const-string/jumbo v110, "group"

    move-object/from16 v0, v47

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v110

    invoke-direct/range {v109 .. v110}, Lcom/vkontakte/android/api/Group;-><init>(Lorg/json/JSONObject;)V

    move-object/from16 v0, v109

    move-object/from16 v1, v36

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->group:Lcom/vkontakte/android/api/Group;

    .line 371
    :goto_1c
    const-string/jumbo v109, "from"

    move-object/from16 v0, v47

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v36

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->yearFrom:I

    .line 372
    const-string/jumbo v109, "until"

    move-object/from16 v0, v47

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v36

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->yearTo:I

    .line 373
    const-string/jumbo v109, "position"

    move-object/from16 v0, v47

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v36

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->position:Ljava/lang/String;

    .line 374
    const-string/jumbo v109, "city_id"

    move-object/from16 v0, v47

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_3b

    .line 375
    const-string/jumbo v109, "city_id"

    move-object/from16 v0, v47

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    invoke-virtual {v9, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v109

    check-cast v109, Ljava/lang/String;

    move-object/from16 v0, v109

    move-object/from16 v1, v36

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->city:Ljava/lang/String;

    .line 377
    :cond_3b
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->career:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    move-object/from16 v0, v109

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 363
    add-int/lit8 v44, v44, 0x1

    goto/16 :goto_1b

    .line 369
    :cond_3c
    const-string/jumbo v109, "company"

    move-object/from16 v0, v47

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v36

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->title:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1c

    .line 683
    .end local v7    # "career":Lorg/json/JSONArray;
    .end local v9    # "cities":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v13    # "countries":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v15    # "cover":Lorg/json/JSONObject;
    .end local v36    # "e":Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;
    .end local v37    # "ep":Lcom/vkontakte/android/api/ExtendedUserProfile;
    .end local v41    # "gifts":Lorg/json/JSONObject;
    .end local v44    # "i":I
    .end local v47    # "jc":Lorg/json/JSONObject;
    .end local v48    # "jcities":Lorg/json/JSONArray;
    .end local v49    # "jcountries":Lorg/json/JSONArray;
    .end local v59    # "jrelprofiles":Lorg/json/JSONArray;
    .end local v70    # "oButton":Lorg/json/JSONObject;
    .end local v74    # "personal":Lorg/json/JSONObject;
    .end local v79    # "relatives":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    .end local v92    # "rels":Lorg/json/JSONArray;
    .end local v95    # "schools":Lorg/json/JSONArray;
    .end local v103    # "univers":Lorg/json/JSONArray;
    :catch_0
    move-exception v108

    .line 684
    .local v108, "x":Ljava/lang/Exception;
    const-string/jumbo v109, "vk"

    move-object/from16 v0, v109

    move-object/from16 v1, v108

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 686
    const/16 v93, 0x0

    goto/16 :goto_0

    .line 380
    .end local v108    # "x":Ljava/lang/Exception;
    .restart local v9    # "cities":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .restart local v13    # "countries":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .restart local v15    # "cover":Lorg/json/JSONObject;
    .restart local v37    # "ep":Lcom/vkontakte/android/api/ExtendedUserProfile;
    .restart local v41    # "gifts":Lorg/json/JSONObject;
    .restart local v44    # "i":I
    .restart local v48    # "jcities":Lorg/json/JSONArray;
    .restart local v49    # "jcountries":Lorg/json/JSONArray;
    .restart local v59    # "jrelprofiles":Lorg/json/JSONArray;
    .restart local v70    # "oButton":Lorg/json/JSONObject;
    .restart local v74    # "personal":Lorg/json/JSONObject;
    .restart local v79    # "relatives":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    .restart local v92    # "rels":Lorg/json/JSONArray;
    .restart local v95    # "schools":Lorg/json/JSONArray;
    .restart local v103    # "univers":Lorg/json/JSONArray;
    :cond_3d
    :try_start_1
    const-string/jumbo v109, "display_fields"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_3e

    .line 381
    const-string/jumbo v109, "display_fields"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v19

    .line 382
    .local v19, "df":Lorg/json/JSONArray;
    new-instance v109, Ljava/util/ArrayList;

    invoke-direct/range {v109 .. v109}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->displayFields:Ljava/util/ArrayList;

    .line 383
    const/16 v44, 0x0

    :goto_1d
    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_3e

    .line 384
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->displayFields:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    move-object/from16 v0, v19

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v110

    invoke-virtual/range {v109 .. v110}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 383
    add-int/lit8 v44, v44, 0x1

    goto :goto_1d

    .line 388
    .end local v19    # "df":Lorg/json/JSONArray;
    :cond_3e
    const-string/jumbo v109, "all_photos_are_hidden"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->allPhotosAreHidden:Z

    .line 525
    .end local v9    # "cities":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v13    # "countries":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v41    # "gifts":Lorg/json/JSONObject;
    .end local v44    # "i":I
    .end local v48    # "jcities":Lorg/json/JSONArray;
    .end local v49    # "jcountries":Lorg/json/JSONArray;
    .end local v59    # "jrelprofiles":Lorg/json/JSONArray;
    .end local v74    # "personal":Lorg/json/JSONObject;
    .end local v79    # "relatives":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    .end local v92    # "rels":Lorg/json/JSONArray;
    .end local v95    # "schools":Lorg/json/JSONArray;
    .end local v103    # "univers":Lorg/json/JSONArray;
    :cond_3f
    :goto_1e
    const-string/jumbo v109, "video_live"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_40

    const-string/jumbo v109, "video_live"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v109

    if-nez v109, :cond_40

    .line 526
    const-string/jumbo v109, "video_live"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v106

    .line 527
    .local v106, "videoLive":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/api/users/GetFullProfile;->uid:I

    move/from16 v109, v0

    if-gez v109, :cond_62

    .line 528
    const-string/jumbo v109, "enabled"

    const/16 v110, 0x0

    move-object/from16 v0, v106

    move-object/from16 v1, v109

    move/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v109

    if-eqz v109, :cond_61

    const/16 v109, 0x1

    :goto_1f
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->isLiveEnabled:Z

    .line 534
    :goto_20
    const-string/jumbo v109, "is_notifications_blocked"

    const/16 v110, 0x0

    move-object/from16 v0, v106

    move-object/from16 v1, v109

    move/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v109

    if-nez v109, :cond_65

    const/16 v109, 0x1

    :goto_21
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->isLiveSubscribed:Z

    .line 537
    .end local v106    # "videoLive":Lorg/json/JSONObject;
    :cond_40
    const-string/jumbo v109, "is_hidden_from_feed"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_66

    const/16 v109, 0x1

    :goto_22
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->isHiddenFromFeed:Z

    .line 538
    const-string/jumbo v109, "has_photo"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_67

    const/16 v109, 0x1

    :goto_23
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasPhoto:Z

    .line 540
    new-instance v109, Ljava/util/HashMap;

    invoke-direct/range {v109 .. v109}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    .line 541
    const-string/jumbo v109, "counters"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    .line 542
    .local v12, "counters":Lorg/json/JSONObject;
    if-eqz v12, :cond_68

    .line 543
    invoke-virtual {v12}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v65

    .line 544
    .local v65, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_24
    invoke-interface/range {v65 .. v65}, Ljava/util/Iterator;->hasNext()Z

    move-result v109

    if-eqz v109, :cond_68

    .line 545
    invoke-interface/range {v65 .. v65}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v64

    check-cast v64, Ljava/lang/String;

    .line 546
    .local v64, "k":Ljava/lang/String;
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    move-object/from16 v109, v0

    move-object/from16 v0, v64

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v110

    invoke-static/range {v110 .. v110}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v110

    move-object/from16 v0, v109

    move-object/from16 v1, v64

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_24

    .line 391
    .end local v12    # "counters":Lorg/json/JSONObject;
    .end local v64    # "k":Ljava/lang/String;
    .end local v65    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_41
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v109, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/api/users/GetFullProfile;->uid:I

    move/from16 v110, v0

    move/from16 v0, v110

    move-object/from16 v1, v109

    iput v0, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 392
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v109, v0

    const-string/jumbo v110, "name"

    move-object/from16 v0, p1

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v110

    move-object/from16 v0, v110

    move-object/from16 v1, v109

    iput-object v0, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 393
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v110, v0

    sget v109, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v111, 0x3f800000    # 1.0f

    cmpl-float v109, v109, v111

    if-lez v109, :cond_50

    const-string/jumbo v109, "photo_100"

    :goto_25
    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v110

    iput-object v0, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 394
    const-string/jumbo v109, "photo_200"

    const-string/jumbo v110, "photo_100"

    move-object/from16 v0, p1

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v110

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->bigPhoto:Ljava/lang/String;

    .line 395
    const-string/jumbo v109, "activity"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->infoLine:Ljava/lang/String;

    .line 396
    const-string/jumbo v109, "status"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v109

    const-string/jumbo v110, "text"

    invoke-virtual/range {v109 .. v110}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->activity:Ljava/lang/String;

    .line 397
    const-string/jumbo v109, "description"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->about:Ljava/lang/String;

    .line 398
    const-string/jumbo v109, "start_date"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->eventStartTime:I

    .line 399
    const-string/jumbo v109, "end_date"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->eventEndTime:I

    .line 400
    const-string/jumbo v109, "site"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->website:Ljava/lang/String;

    .line 401
    const-string/jumbo v109, "admin_level"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->adminLevel:I

    .line 403
    const-string/jumbo v109, "verified"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_51

    const/16 v109, 0x1

    :goto_26
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->verified:Z

    .line 404
    const-string/jumbo v109, "can_message"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_52

    const/16 v109, 0x1

    :goto_27
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->canWrite:Z

    .line 406
    const-string/jumbo v109, "deactivated"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    invoke-static/range {v109 .. v109}, Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;->parse(Ljava/lang/String;)Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->deactivated:Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;

    .line 407
    const-string/jumbo v109, "ban_info"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_42

    .line 408
    const-string/jumbo v109, "ban_info"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 409
    .local v4, "ban":Lorg/json/JSONObject;
    new-instance v109, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    invoke-direct/range {v109 .. v109}, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    .line 410
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    move-object/from16 v109, v0

    const-string/jumbo v110, "comment"

    move-object/from16 v0, v110

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v110

    move-object/from16 v0, v110

    move-object/from16 v1, v109

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;->comment:Ljava/lang/String;

    .line 411
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    move-object/from16 v109, v0

    const-string/jumbo v110, "reason"

    move-object/from16 v0, v110

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v110

    move/from16 v0, v110

    move-object/from16 v1, v109

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;->reason:I

    .line 412
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    move-object/from16 v109, v0

    const-string/jumbo v110, "end_date"

    move-object/from16 v0, v110

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v110

    move/from16 v0, v110

    move-object/from16 v1, v109

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;->endTime:I

    .line 415
    .end local v4    # "ban":Lorg/json/JSONObject;
    :cond_42
    const-string/jumbo v109, "invited_by"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_43

    .line 416
    new-instance v109, Lcom/vkontakte/android/UserProfile;

    const-string/jumbo v110, "invited_by"

    move-object/from16 v0, p1

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v110

    invoke-direct/range {v109 .. v110}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->invitedBy:Lcom/vkontakte/android/UserProfile;

    .line 419
    :cond_43
    const-string/jumbo v109, "country_name"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v109

    if-nez v109, :cond_47

    const-string/jumbo v109, "city_name"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v109

    if-nez v109, :cond_47

    .line 420
    new-instance v99, Ljava/util/ArrayList;

    invoke-direct/range {v99 .. v99}, Ljava/util/ArrayList;-><init>()V

    .line 421
    .local v99, "ss":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v109, "country_name"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_44

    .line 422
    const-string/jumbo v109, "country_name"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v99

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 424
    :cond_44
    const-string/jumbo v109, "city_name"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_45

    .line 425
    const/16 v109, 0x0

    const-string/jumbo v110, "city_name"

    move-object/from16 v0, p1

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v110

    move-object/from16 v0, v99

    move/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 427
    :cond_45
    const-string/jumbo v109, "place"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_53

    .line 428
    const-string/jumbo v109, "place"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v55

    .line 429
    .restart local v55    # "jp":Lorg/json/JSONObject;
    const-string/jumbo v109, "address"

    move-object/from16 v0, v55

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_46

    .line 430
    const/16 v109, 0x0

    const-string/jumbo v110, "address"

    move-object/from16 v0, v55

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v110

    move-object/from16 v0, v99

    move/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 432
    :cond_46
    const-string/jumbo v109, "latitude"

    const-wide v110, -0x3f3e6c0000000000L    # -9000.0

    move-object/from16 v0, v55

    move-object/from16 v1, v109

    move-wide/from16 v2, v110

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v110

    move-wide/from16 v0, v110

    move-object/from16 v2, v37

    iput-wide v0, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->lat:D

    .line 433
    const-string/jumbo v109, "longitude"

    const-wide v110, -0x3f3e6c0000000000L    # -9000.0

    move-object/from16 v0, v55

    move-object/from16 v1, v109

    move-wide/from16 v2, v110

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v110

    move-wide/from16 v0, v110

    move-object/from16 v2, v37

    iput-wide v0, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->lon:D

    .line 437
    .end local v55    # "jp":Lorg/json/JSONObject;
    :goto_28
    const-string/jumbo v109, ", "

    move-object/from16 v0, v109

    move-object/from16 v1, v99

    invoke-static {v0, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->city:Ljava/lang/String;

    .line 439
    .end local v99    # "ss":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_47
    const-string/jumbo v109, "is_member"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    .line 440
    const-string/jumbo v109, "is_closed"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupAccess:I

    .line 441
    const-string/jumbo v109, "can_see_all_posts"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_54

    const/16 v109, 0x1

    :goto_29
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->canSeeAllPosts:Z

    .line 442
    const-string/jumbo v109, "member_status"

    move-object/from16 v0, v37

    iget v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    move/from16 v110, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    move/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    .line 443
    move-object/from16 v0, v37

    iget v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    move/from16 v109, v0

    const/16 v110, 0x3

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_48

    .line 444
    const/16 v109, 0x0

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    .line 446
    :cond_48
    const-string/jumbo v109, "group"

    const-string/jumbo v110, "type"

    move-object/from16 v0, p1

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v110

    invoke-virtual/range {v109 .. v110}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v109

    if-eqz v109, :cond_49

    .line 447
    const/16 v109, 0x0

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    .line 449
    :cond_49
    const-string/jumbo v109, "event"

    const-string/jumbo v110, "type"

    move-object/from16 v0, p1

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v110

    invoke-virtual/range {v109 .. v110}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v109

    if-eqz v109, :cond_4a

    .line 450
    const/16 v109, 0x1

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    .line 452
    :cond_4a
    const-string/jumbo v109, "page"

    const-string/jumbo v110, "type"

    move-object/from16 v0, p1

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v110

    invoke-virtual/range {v109 .. v110}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v109

    if-eqz v109, :cond_4b

    .line 453
    const/16 v109, 0x2

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    .line 455
    :cond_4b
    const-string/jumbo v109, "can_post"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_55

    const/16 v109, 0x1

    :goto_2a
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->canPost:Z

    .line 456
    const-string/jumbo v109, "wiki_page"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_4c

    .line 457
    const-string/jumbo v109, "wiki_page"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->mobilePhone:Ljava/lang/String;

    .line 460
    :cond_4c
    const-string/jumbo v109, "links"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_59

    .line 461
    const-string/jumbo v109, "links"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v68

    .line 462
    .local v68, "links":Lorg/json/JSONArray;
    new-instance v109, Ljava/util/ArrayList;

    invoke-direct/range {v109 .. v109}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->links:Ljava/util/ArrayList;

    .line 463
    const/16 v44, 0x0

    .restart local v44    # "i":I
    :goto_2b
    invoke-virtual/range {v68 .. v68}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_59

    .line 464
    move-object/from16 v0, v68

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v54

    .line 465
    .local v54, "jl":Lorg/json/JSONObject;
    new-instance v66, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;

    invoke-direct/range {v66 .. v66}, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;-><init>()V

    .line 466
    .local v66, "l":Lcom/vkontakte/android/api/ExtendedUserProfile$Link;
    const-string/jumbo v109, "url"

    move-object/from16 v0, v54

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v66

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;->url:Ljava/lang/String;

    .line 467
    const-string/jumbo v109, "name"

    move-object/from16 v0, v54

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v66

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;->title:Ljava/lang/String;

    .line 468
    move-object/from16 v0, v66

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;->title:Ljava/lang/String;

    move-object/from16 v109, v0

    if-eqz v109, :cond_4d

    move-object/from16 v0, v66

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;->title:Ljava/lang/String;

    move-object/from16 v109, v0

    invoke-virtual/range {v109 .. v109}, Ljava/lang/String;->length()I

    move-result v109

    if-nez v109, :cond_4e

    .line 469
    :cond_4d
    move-object/from16 v0, v66

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;->url:Ljava/lang/String;

    move-object/from16 v109, v0

    move-object/from16 v0, v109

    move-object/from16 v1, v66

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;->title:Ljava/lang/String;

    .line 471
    :cond_4e
    const-string/jumbo v109, "desc"

    const-string/jumbo v110, ""

    move-object/from16 v0, v54

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v66

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;->subtitle:Ljava/lang/String;

    .line 472
    sget v109, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v110, 0x3f800000    # 1.0f

    cmpl-float v109, v109, v110

    if-lez v109, :cond_56

    const-string/jumbo v109, "photo_100"

    :goto_2c
    const/16 v110, 0x0

    move-object/from16 v0, v54

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v66

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;->photo:Ljava/lang/String;

    .line 473
    move-object/from16 v0, v66

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;->photo:Ljava/lang/String;

    move-object/from16 v109, v0

    if-nez v109, :cond_4f

    .line 474
    sget v109, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v110, 0x3f800000    # 1.0f

    cmpl-float v109, v109, v110

    if-lez v109, :cond_57

    const/16 v97, 0x64

    .line 475
    .local v97, "size":I
    :goto_2d
    move-object/from16 v0, v66

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;->url:Ljava/lang/String;

    move-object/from16 v109, v0

    const-string/jumbo v110, "//vk.com/"

    invoke-virtual/range {v109 .. v110}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v109

    if-eqz v109, :cond_58

    new-instance v109, Ljava/lang/StringBuilder;

    invoke-direct/range {v109 .. v109}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v110, "http://vk.com/images/lnkinner"

    invoke-virtual/range {v109 .. v110}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v109

    move-object/from16 v0, v109

    move/from16 v1, v97

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v109

    const-string/jumbo v110, ".gif"

    invoke-virtual/range {v109 .. v110}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v109

    :goto_2e
    move-object/from16 v0, v109

    move-object/from16 v1, v66

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;->photo:Ljava/lang/String;

    .line 477
    .end local v97    # "size":I
    :cond_4f
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->links:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    move-object/from16 v0, v109

    move-object/from16 v1, v66

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 463
    add-int/lit8 v44, v44, 0x1

    goto/16 :goto_2b

    .line 393
    .end local v44    # "i":I
    .end local v54    # "jl":Lorg/json/JSONObject;
    .end local v66    # "l":Lcom/vkontakte/android/api/ExtendedUserProfile$Link;
    .end local v68    # "links":Lorg/json/JSONArray;
    :cond_50
    const-string/jumbo v109, "photo_50"

    goto/16 :goto_25

    .line 403
    :cond_51
    const/16 v109, 0x0

    goto/16 :goto_26

    .line 404
    :cond_52
    const/16 v109, 0x0

    goto/16 :goto_27

    .line 435
    .restart local v99    # "ss":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_53
    const-wide v110, -0x3f3e6c0000000000L    # -9000.0

    move-wide/from16 v0, v110

    move-object/from16 v2, v37

    iput-wide v0, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->lon:D

    move-wide/from16 v0, v110

    move-object/from16 v2, v37

    iput-wide v0, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->lat:D

    goto/16 :goto_28

    .line 441
    .end local v99    # "ss":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_54
    const/16 v109, 0x0

    goto/16 :goto_29

    .line 455
    :cond_55
    const/16 v109, 0x0

    goto/16 :goto_2a

    .line 472
    .restart local v44    # "i":I
    .restart local v54    # "jl":Lorg/json/JSONObject;
    .restart local v66    # "l":Lcom/vkontakte/android/api/ExtendedUserProfile$Link;
    .restart local v68    # "links":Lorg/json/JSONArray;
    :cond_56
    const-string/jumbo v109, "photo_50"

    goto/16 :goto_2c

    .line 474
    :cond_57
    const/16 v97, 0x32

    goto :goto_2d

    .line 475
    .restart local v97    # "size":I
    :cond_58
    new-instance v109, Ljava/lang/StringBuilder;

    invoke-direct/range {v109 .. v109}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v110, "http://vk.com/images/lnkouter"

    invoke-virtual/range {v109 .. v110}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v109

    move-object/from16 v0, v109

    move/from16 v1, v97

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v109

    const-string/jumbo v110, ".gif"

    invoke-virtual/range {v109 .. v110}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v109

    goto :goto_2e

    .line 481
    .end local v44    # "i":I
    .end local v54    # "jl":Lorg/json/JSONObject;
    .end local v66    # "l":Lcom/vkontakte/android/api/ExtendedUserProfile$Link;
    .end local v68    # "links":Lorg/json/JSONArray;
    .end local v97    # "size":I
    :cond_59
    const-string/jumbo v109, "contacts"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_5e

    .line 482
    new-instance v109, Ljava/util/ArrayList;

    invoke-direct/range {v109 .. v109}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->contacts:Ljava/util/ArrayList;

    .line 483
    const-string/jumbo v109, "contacts_profiles"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v104

    .line 484
    .local v104, "users":Lorg/json/JSONArray;
    new-instance v76, Landroid/util/SparseArray;

    invoke-direct/range {v76 .. v76}, Landroid/util/SparseArray;-><init>()V

    .line 485
    .local v76, "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    if-eqz v104, :cond_5a

    .line 486
    const/16 v44, 0x0

    .restart local v44    # "i":I
    :goto_2f
    invoke-virtual/range {v104 .. v104}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_5a

    .line 487
    new-instance v71, Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v104

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v109

    move-object/from16 v0, v71

    move-object/from16 v1, v109

    invoke-direct {v0, v1}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    .line 488
    .restart local v71    # "p":Lcom/vkontakte/android/UserProfile;
    move-object/from16 v0, v71

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    move/from16 v109, v0

    move-object/from16 v0, v76

    move/from16 v1, v109

    move-object/from16 v2, v71

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 486
    add-int/lit8 v44, v44, 0x1

    goto :goto_2f

    .line 491
    .end local v44    # "i":I
    .end local v71    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_5a
    const-string/jumbo v109, "contacts"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 492
    .local v11, "contacts":Lorg/json/JSONArray;
    const/16 v44, 0x0

    .restart local v44    # "i":I
    :goto_30
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_5e

    .line 493
    move/from16 v0, v44

    invoke-virtual {v11, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v47

    .line 494
    .restart local v47    # "jc":Lorg/json/JSONObject;
    new-instance v6, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;

    invoke-direct {v6}, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;-><init>()V

    .line 495
    .local v6, "c":Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;
    const-string/jumbo v109, "desc"

    const-string/jumbo v110, ""

    move-object/from16 v0, v47

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    iput-object v0, v6, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->title:Ljava/lang/String;

    .line 496
    const-string/jumbo v109, "user_id"

    move-object/from16 v0, v47

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_5b

    .line 497
    const-string/jumbo v109, "user_id"

    move-object/from16 v0, v47

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v109

    move-object/from16 v0, v76

    move/from16 v1, v109

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v109

    check-cast v109, Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v109

    iput-object v0, v6, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->user:Lcom/vkontakte/android/UserProfile;

    .line 499
    :cond_5b
    const-string/jumbo v109, "email"

    const/16 v110, 0x0

    move-object/from16 v0, v47

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    iput-object v0, v6, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->email:Ljava/lang/String;

    .line 500
    const-string/jumbo v109, "phone"

    const/16 v110, 0x0

    move-object/from16 v0, v47

    move-object/from16 v1, v109

    move-object/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    iput-object v0, v6, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->phone:Ljava/lang/String;

    .line 501
    iget-object v0, v6, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->user:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v109, v0

    if-nez v109, :cond_5c

    iget-object v0, v6, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->email:Ljava/lang/String;

    move-object/from16 v109, v0

    if-nez v109, :cond_5c

    iget-object v0, v6, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->phone:Ljava/lang/String;

    move-object/from16 v109, v0

    if-eqz v109, :cond_5d

    .line 502
    :cond_5c
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->contacts:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    move-object/from16 v0, v109

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 492
    :cond_5d
    add-int/lit8 v44, v44, 0x1

    goto/16 :goto_30

    .line 506
    .end local v6    # "c":Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;
    .end local v11    # "contacts":Lorg/json/JSONArray;
    .end local v44    # "i":I
    .end local v47    # "jc":Lorg/json/JSONObject;
    .end local v76    # "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    .end local v104    # "users":Lorg/json/JSONArray;
    :cond_5e
    const-string/jumbo v109, "members"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_5f

    .line 507
    const-string/jumbo v109, "members"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v39

    .line 508
    .restart local v39    # "friends":Lorg/json/JSONArray;
    new-instance v109, Ljava/util/ArrayList;

    invoke-direct/range {v109 .. v109}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->friends:Ljava/util/ArrayList;

    .line 509
    const/16 v44, 0x0

    .restart local v44    # "i":I
    :goto_31
    invoke-virtual/range {v39 .. v39}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_5f

    .line 510
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->friends:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    new-instance v110, Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v39

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v111

    invoke-direct/range {v110 .. v111}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual/range {v109 .. v110}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 509
    add-int/lit8 v44, v44, 0x1

    goto :goto_31

    .line 514
    .end local v39    # "friends":Lorg/json/JSONArray;
    .end local v44    # "i":I
    :cond_5f
    const-string/jumbo v109, "main_album"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_60

    const-string/jumbo v109, "main_album"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v109

    if-nez v109, :cond_60

    .line 515
    new-instance v109, Lcom/vkontakte/android/api/PhotoAlbum;

    const-string/jumbo v110, "main_album"

    move-object/from16 v0, p1

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v110

    invoke-direct/range {v109 .. v110}, Lcom/vkontakte/android/api/PhotoAlbum;-><init>(Lorg/json/JSONObject;)V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->mainAlbum:Lcom/vkontakte/android/api/PhotoAlbum;

    .line 517
    :cond_60
    const-string/jumbo v109, "main_section"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->mainSection:I

    .line 519
    const-string/jumbo v109, "widget"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v107

    .line 520
    .local v107, "widget":Lorg/json/JSONObject;
    if-eqz v107, :cond_3f

    const-string/jumbo v109, "type"

    const/16 v110, -0x1

    move-object/from16 v0, v107

    move-object/from16 v1, v109

    move/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v109

    const/16 v110, -0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-eq v0, v1, :cond_3f

    .line 521
    invoke-static/range {v107 .. v107}, Lcom/vkontakte/android/api/widget/Widget;->create(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/widget/Widget;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->widget:Lcom/vkontakte/android/api/widget/Widget;

    goto/16 :goto_1e

    .line 528
    .end local v107    # "widget":Lorg/json/JSONObject;
    .restart local v106    # "videoLive":Lorg/json/JSONObject;
    :cond_61
    const/16 v109, 0x0

    goto/16 :goto_1f

    .line 530
    :cond_62
    const-string/jumbo v109, "enabled"

    const/16 v110, 0x0

    move-object/from16 v0, v106

    move-object/from16 v1, v109

    move/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v109

    if-eqz v109, :cond_64

    move-object/from16 v0, v37

    iget v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    move/from16 v109, v0

    const/16 v110, 0x3

    move/from16 v0, v109

    move/from16 v1, v110

    if-eq v0, v1, :cond_63

    move-object/from16 v0, v37

    iget v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    move/from16 v109, v0

    const/16 v110, 0x1

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_64

    :cond_63
    const/16 v109, 0x1

    :goto_32
    move/from16 v0, v109

    move-object/from16 v1, v37

    iput-boolean v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->isLiveEnabled:Z

    goto/16 :goto_20

    :cond_64
    const/16 v109, 0x0

    goto :goto_32

    .line 534
    :cond_65
    const/16 v109, 0x0

    goto/16 :goto_21

    .line 537
    .end local v106    # "videoLive":Lorg/json/JSONObject;
    :cond_66
    const/16 v109, 0x0

    goto/16 :goto_22

    .line 538
    :cond_67
    const/16 v109, 0x0

    goto/16 :goto_23

    .line 549
    .restart local v12    # "counters":Lorg/json/JSONObject;
    :cond_68
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/api/users/GetFullProfile;->uid:I

    move/from16 v109, v0

    if-gez v109, :cond_6a

    .line 550
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    move-object/from16 v109, v0

    const-string/jumbo v110, "members"

    const-string/jumbo v111, "members_count"

    move-object/from16 v0, p1

    move-object/from16 v1, v111

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v111

    invoke-static/range {v111 .. v111}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v111

    invoke-virtual/range {v109 .. v111}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 551
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    move-object/from16 v109, v0

    const-string/jumbo v110, "friends_members"

    const-string/jumbo v111, "friends_members_count"

    move-object/from16 v0, p1

    move-object/from16 v1, v111

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v111

    invoke-static/range {v111 .. v111}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v111

    invoke-virtual/range {v109 .. v111}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 557
    :cond_69
    :goto_33
    new-instance v109, Ljava/util/ArrayList;

    invoke-direct/range {v109 .. v109}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->groups:Ljava/util/ArrayList;

    .line 558
    const-string/jumbo v109, "groups"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_6b

    const-string/jumbo v109, "groups"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v109

    if-eqz v109, :cond_6b

    .line 559
    const-string/jumbo v109, "groups"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v52

    .line 560
    .local v52, "jg":Lorg/json/JSONArray;
    const/16 v44, 0x0

    .restart local v44    # "i":I
    :goto_34
    invoke-virtual/range {v52 .. v52}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_6b

    .line 561
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->groups:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    new-instance v110, Lcom/vkontakte/android/api/Group;

    move-object/from16 v0, v52

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v111

    invoke-direct/range {v110 .. v111}, Lcom/vkontakte/android/api/Group;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual/range {v109 .. v110}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 560
    add-int/lit8 v44, v44, 0x1

    goto :goto_34

    .line 552
    .end local v44    # "i":I
    .end local v52    # "jg":Lorg/json/JSONArray;
    :cond_6a
    if-eqz v12, :cond_69

    .line 553
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    move-object/from16 v109, v0

    const-string/jumbo v110, "_subscriptions"

    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    move-object/from16 v111, v0

    const-string/jumbo v112, "subscriptions"

    invoke-virtual/range {v111 .. v112}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v111

    invoke-virtual/range {v109 .. v111}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 554
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    move-object/from16 v109, v0

    const-string/jumbo v110, "subscriptions"

    const-string/jumbo v111, "pages"

    move-object/from16 v0, v111

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v111

    const-string/jumbo v112, "subscriptions"

    move-object/from16 v0, v112

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v112

    add-int v111, v111, v112

    invoke-static/range {v111 .. v111}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v111

    invoke-virtual/range {v109 .. v111}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_33

    .line 565
    :cond_6b
    new-instance v109, Lcom/vkontakte/android/data/VKList;

    invoke-direct/range {v109 .. v109}, Lcom/vkontakte/android/data/VKList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->photos:Lcom/vkontakte/android/data/VKList;

    .line 566
    const-string/jumbo v109, "photos"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_6c

    const-string/jumbo v109, "photos"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v109

    if-eqz v109, :cond_6c

    .line 567
    const-string/jumbo v109, "photos"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-static {v0, v1}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v109

    move-object/from16 v0, v109

    iget-object v0, v0, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    move-object/from16 v56, v0

    .line 568
    .local v56, "jphotos":Lorg/json/JSONArray;
    if-eqz v56, :cond_6c

    .line 569
    const/16 v44, 0x0

    .restart local v44    # "i":I
    :goto_35
    invoke-virtual/range {v56 .. v56}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_6c

    .line 570
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->photos:Lcom/vkontakte/android/data/VKList;

    move-object/from16 v109, v0

    new-instance v110, Lcom/vkontakte/android/Photo;

    move-object/from16 v0, v56

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v111

    invoke-direct/range {v110 .. v111}, Lcom/vkontakte/android/Photo;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual/range {v109 .. v110}, Lcom/vkontakte/android/data/VKList;->add(Ljava/lang/Object;)Z

    .line 569
    add-int/lit8 v44, v44, 0x1

    goto :goto_35

    .line 575
    .end local v44    # "i":I
    .end local v56    # "jphotos":Lorg/json/JSONArray;
    :cond_6c
    const-string/jumbo v109, "market"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_6e

    const-string/jumbo v109, "market"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v109

    if-nez v109, :cond_6e

    .line 576
    const-string/jumbo v109, "market"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v69

    .line 577
    .local v69, "market":Lorg/json/JSONObject;
    const-string/jumbo v109, "wiki"

    move-object/from16 v0, v69

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_6d

    const-string/jumbo v109, "wiki"

    move-object/from16 v0, v69

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v109

    if-nez v109, :cond_6d

    .line 578
    new-instance v109, Lcom/vkontakte/android/data/Wiki;

    const-string/jumbo v110, "wiki"

    move-object/from16 v0, v69

    move-object/from16 v1, v110

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v110

    invoke-direct/range {v109 .. v110}, Lcom/vkontakte/android/data/Wiki;-><init>(Lorg/json/JSONObject;)V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->marketWiki:Lcom/vkontakte/android/data/Wiki;

    .line 580
    :cond_6d
    const-string/jumbo v109, "main_album_id"

    const/16 v110, -0x1

    move-object/from16 v0, v69

    move-object/from16 v1, v109

    move/from16 v2, v110

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v109

    move/from16 v0, v109

    move-object/from16 v1, v37

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->marketMainAlbumId:I

    .line 583
    .end local v69    # "market":Lorg/json/JSONObject;
    :cond_6e
    new-instance v109, Lcom/vkontakte/android/data/VKList;

    invoke-direct/range {v109 .. v109}, Lcom/vkontakte/android/data/VKList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->goods:Lcom/vkontakte/android/data/VKList;

    .line 584
    const-string/jumbo v109, "goods"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_6f

    const-string/jumbo v109, "goods"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v109

    if-eqz v109, :cond_6f

    .line 585
    const-string/jumbo v109, "goods"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-static {v0, v1}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v109

    move-object/from16 v0, v109

    iget-object v0, v0, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    move-object/from16 v53, v0

    .line 586
    .local v53, "jgoods":Lorg/json/JSONArray;
    if-eqz v53, :cond_6f

    .line 587
    const/16 v44, 0x0

    .restart local v44    # "i":I
    :goto_36
    invoke-virtual/range {v53 .. v53}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_6f

    .line 588
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->goods:Lcom/vkontakte/android/data/VKList;

    move-object/from16 v109, v0

    new-instance v110, Lcom/vkontakte/android/data/Good;

    move-object/from16 v0, v53

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v111

    invoke-direct/range {v110 .. v111}, Lcom/vkontakte/android/data/Good;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual/range {v109 .. v110}, Lcom/vkontakte/android/data/VKList;->add(Ljava/lang/Object;)Z

    .line 587
    add-int/lit8 v44, v44, 0x1

    goto :goto_36

    .line 593
    .end local v44    # "i":I
    .end local v53    # "jgoods":Lorg/json/JSONArray;
    :cond_6f
    new-instance v109, Ljava/util/ArrayList;

    invoke-direct/range {v109 .. v109}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->audios:Ljava/util/ArrayList;

    .line 594
    const-string/jumbo v109, "audios"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v109

    if-eqz v109, :cond_70

    .line 595
    const-string/jumbo v109, "audios"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v46

    .line 596
    .local v46, "jaudios":Lorg/json/JSONArray;
    const/16 v44, 0x0

    .restart local v44    # "i":I
    :goto_37
    invoke-virtual/range {v46 .. v46}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_70

    .line 597
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->audios:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    new-instance v110, Lcom/vkontakte/android/audio/MusicTrack;

    move-object/from16 v0, v46

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v111

    invoke-direct/range {v110 .. v111}, Lcom/vkontakte/android/audio/MusicTrack;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual/range {v109 .. v110}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 596
    add-int/lit8 v44, v44, 0x1

    goto :goto_37

    .line 600
    .end local v44    # "i":I
    .end local v46    # "jaudios":Lorg/json/JSONArray;
    :cond_70
    new-instance v109, Ljava/util/ArrayList;

    invoke-direct/range {v109 .. v109}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->playlists:Ljava/util/ArrayList;

    .line 601
    const-string/jumbo v109, "playlists"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v109

    if-eqz v109, :cond_71

    .line 602
    const-string/jumbo v109, "playlists"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v57

    .line 603
    .local v57, "jplaylists":Lorg/json/JSONArray;
    const/16 v44, 0x0

    .restart local v44    # "i":I
    :goto_38
    invoke-virtual/range {v57 .. v57}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_71

    .line 604
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->playlists:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    new-instance v110, Lcom/vk/music/dto/Playlist;

    move-object/from16 v0, v57

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v111

    invoke-direct/range {v110 .. v111}, Lcom/vk/music/dto/Playlist;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual/range {v109 .. v110}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 603
    add-int/lit8 v44, v44, 0x1

    goto :goto_38

    .line 608
    .end local v44    # "i":I
    .end local v57    # "jplaylists":Lorg/json/JSONArray;
    :cond_71
    new-instance v109, Ljava/util/ArrayList;

    invoke-direct/range {v109 .. v109}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->videos:Ljava/util/ArrayList;

    .line 609
    const-string/jumbo v109, "videos"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_77

    const-string/jumbo v109, "videos"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v109

    if-eqz v109, :cond_77

    .line 610
    const-string/jumbo v109, "videos"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v46

    .line 611
    .restart local v46    # "jaudios":Lorg/json/JSONArray;
    new-instance v102, Ljava/util/ArrayList;

    invoke-direct/range {v102 .. v102}, Ljava/util/ArrayList;-><init>()V

    .line 612
    .local v102, "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/16 v44, 0x0

    .restart local v44    # "i":I
    :goto_39
    invoke-virtual/range {v46 .. v46}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_74

    .line 613
    new-instance v105, Lcom/vkontakte/android/api/VideoFile;

    move-object/from16 v0, v46

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v109

    move-object/from16 v0, v105

    move-object/from16 v1, v109

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/VideoFile;-><init>(Lorg/json/JSONObject;)V

    .line 614
    .local v105, "v":Lcom/vkontakte/android/api/VideoFile;
    move-object/from16 v0, v105

    iget v0, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    move/from16 v109, v0

    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v110, v0

    move-object/from16 v0, v110

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    move/from16 v110, v0

    move/from16 v0, v109

    move/from16 v1, v110

    if-ne v0, v1, :cond_73

    .line 615
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v109, v0

    move-object/from16 v0, v109

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v109, v0

    move-object/from16 v0, v109

    move-object/from16 v1, v105

    iput-object v0, v1, Lcom/vkontakte/android/api/VideoFile;->ownerName:Ljava/lang/String;

    .line 616
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v109, v0

    move-object/from16 v0, v109

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    move-object/from16 v109, v0

    move-object/from16 v0, v109

    move-object/from16 v1, v105

    iput-object v0, v1, Lcom/vkontakte/android/api/VideoFile;->ownerPhoto:Ljava/lang/String;

    .line 620
    :cond_72
    :goto_3a
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->videos:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    move-object/from16 v0, v109

    move-object/from16 v1, v105

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 612
    add-int/lit8 v44, v44, 0x1

    goto :goto_39

    .line 617
    :cond_73
    move-object/from16 v0, v105

    iget v0, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    move/from16 v109, v0

    invoke-static/range {v109 .. v109}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v109

    move-object/from16 v0, v102

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v109

    if-nez v109, :cond_72

    .line 618
    move-object/from16 v0, v105

    iget v0, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    move/from16 v109, v0

    invoke-static/range {v109 .. v109}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v109

    move-object/from16 v0, v102

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3a

    .line 622
    .end local v105    # "v":Lcom/vkontakte/android/api/VideoFile;
    :cond_74
    invoke-virtual/range {v102 .. v102}, Ljava/util/ArrayList;->size()I

    move-result v109

    if-lez v109, :cond_77

    .line 623
    invoke-static/range {v102 .. v102}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v77

    .line 624
    .local v77, "profiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v72, Landroid/util/SparseArray;

    invoke-direct/range {v72 .. v72}, Landroid/util/SparseArray;-><init>()V

    .line 625
    .local v72, "p":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual/range {v77 .. v77}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v109

    :goto_3b
    invoke-interface/range {v109 .. v109}, Ljava/util/Iterator;->hasNext()Z

    move-result v110

    if-eqz v110, :cond_75

    invoke-interface/range {v109 .. v109}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v100

    check-cast v100, Lcom/vkontakte/android/UserProfile;

    .line 626
    .local v100, "u":Lcom/vkontakte/android/UserProfile;
    move-object/from16 v0, v100

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    move/from16 v110, v0

    move-object/from16 v0, v72

    move/from16 v1, v110

    move-object/from16 v2, v100

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_3b

    .line 628
    .end local v100    # "u":Lcom/vkontakte/android/UserProfile;
    :cond_75
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->videos:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    invoke-virtual/range {v109 .. v109}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v109

    :cond_76
    :goto_3c
    invoke-interface/range {v109 .. v109}, Ljava/util/Iterator;->hasNext()Z

    move-result v110

    if-eqz v110, :cond_77

    invoke-interface/range {v109 .. v109}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v105

    check-cast v105, Lcom/vkontakte/android/api/VideoFile;

    .line 629
    .restart local v105    # "v":Lcom/vkontakte/android/api/VideoFile;
    move-object/from16 v0, v105

    iget v0, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    move/from16 v110, v0

    move-object/from16 v0, v72

    move/from16 v1, v110

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v110

    if-eqz v110, :cond_76

    .line 630
    move-object/from16 v0, v105

    iget v0, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    move/from16 v110, v0

    move-object/from16 v0, v72

    move/from16 v1, v110

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v100

    check-cast v100, Lcom/vkontakte/android/UserProfile;

    .line 631
    .restart local v100    # "u":Lcom/vkontakte/android/UserProfile;
    move-object/from16 v0, v100

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v110, v0

    move-object/from16 v0, v110

    move-object/from16 v1, v105

    iput-object v0, v1, Lcom/vkontakte/android/api/VideoFile;->ownerName:Ljava/lang/String;

    .line 632
    move-object/from16 v0, v100

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    move-object/from16 v110, v0

    move-object/from16 v0, v110

    move-object/from16 v1, v105

    iput-object v0, v1, Lcom/vkontakte/android/api/VideoFile;->ownerPhoto:Ljava/lang/String;

    goto :goto_3c

    .line 638
    .end local v44    # "i":I
    .end local v46    # "jaudios":Lorg/json/JSONArray;
    .end local v72    # "p":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    .end local v77    # "profiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    .end local v100    # "u":Lcom/vkontakte/android/UserProfile;
    .end local v102    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v105    # "v":Lcom/vkontakte/android/api/VideoFile;
    :cond_77
    new-instance v109, Ljava/util/ArrayList;

    invoke-direct/range {v109 .. v109}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->docs:Ljava/util/ArrayList;

    .line 639
    const-string/jumbo v109, "docs"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_78

    const-string/jumbo v109, "docs"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v109

    if-eqz v109, :cond_78

    .line 640
    const-string/jumbo v109, "docs"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v50

    .line 641
    .local v50, "jdocs":Lorg/json/JSONArray;
    const/16 v44, 0x0

    .restart local v44    # "i":I
    :goto_3d
    invoke-virtual/range {v50 .. v50}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_78

    .line 642
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->docs:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    new-instance v110, Lcom/vkontakte/android/api/Document;

    move-object/from16 v0, v50

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v111

    invoke-direct/range {v110 .. v111}, Lcom/vkontakte/android/api/Document;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual/range {v109 .. v110}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 641
    add-int/lit8 v44, v44, 0x1

    goto :goto_3d

    .line 646
    .end local v44    # "i":I
    .end local v50    # "jdocs":Lorg/json/JSONArray;
    :cond_78
    new-instance v109, Ljava/util/ArrayList;

    invoke-direct/range {v109 .. v109}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->topics:Ljava/util/ArrayList;

    .line 647
    const-string/jumbo v109, "topics"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_79

    const-string/jumbo v109, "topics"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v109

    if-eqz v109, :cond_79

    .line 648
    const-string/jumbo v109, "topics"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v62

    .line 649
    .local v62, "jtopics":Lorg/json/JSONArray;
    const/16 v44, 0x0

    .restart local v44    # "i":I
    :goto_3e
    invoke-virtual/range {v62 .. v62}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_79

    .line 650
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->topics:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    new-instance v110, Lcom/vkontakte/android/api/BoardTopic;

    move-object/from16 v0, v62

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v111

    invoke-direct/range {v110 .. v111}, Lcom/vkontakte/android/api/BoardTopic;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual/range {v109 .. v110}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 649
    add-int/lit8 v44, v44, 0x1

    goto :goto_3e

    .line 654
    .end local v44    # "i":I
    .end local v62    # "jtopics":Lorg/json/JSONArray;
    :cond_79
    new-instance v109, Ljava/util/ArrayList;

    invoke-direct/range {v109 .. v109}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->subscriptions:Ljava/util/ArrayList;

    .line 655
    const-string/jumbo v109, "subscriptions"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_7b

    const-string/jumbo v109, "subscriptions"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v109

    if-eqz v109, :cond_7b

    .line 656
    const-string/jumbo v109, "subscriptions"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v61

    .line 657
    .local v61, "jsubs":Lorg/json/JSONArray;
    const/16 v44, 0x0

    .restart local v44    # "i":I
    :goto_3f
    invoke-virtual/range {v61 .. v61}, Lorg/json/JSONArray;->length()I

    move-result v109

    move/from16 v0, v44

    move/from16 v1, v109

    if-ge v0, v1, :cond_7b

    .line 658
    move-object/from16 v0, v61

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v109

    const-string/jumbo v110, "type"

    invoke-virtual/range {v109 .. v110}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v109

    const-string/jumbo v110, "profile"

    invoke-virtual/range {v109 .. v110}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v109

    if-eqz v109, :cond_7a

    .line 659
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->subscriptions:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    new-instance v110, Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v61

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v111

    invoke-direct/range {v110 .. v111}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual/range {v109 .. v110}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 657
    :goto_40
    add-int/lit8 v44, v44, 0x1

    goto :goto_3f

    .line 661
    :cond_7a
    move-object/from16 v0, v37

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->subscriptions:Ljava/util/ArrayList;

    move-object/from16 v109, v0

    new-instance v110, Lcom/vkontakte/android/UserProfile;

    new-instance v111, Lcom/vkontakte/android/api/Group;

    move-object/from16 v0, v61

    move/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v112

    invoke-direct/range {v111 .. v112}, Lcom/vkontakte/android/api/Group;-><init>(Lorg/json/JSONObject;)V

    invoke-direct/range {v110 .. v111}, Lcom/vkontakte/android/UserProfile;-><init>(Lcom/vkontakte/android/api/Group;)V

    invoke-virtual/range {v109 .. v110}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_40

    .line 666
    .end local v44    # "i":I
    .end local v61    # "jsubs":Lorg/json/JSONArray;
    :cond_7b
    const-string/jumbo v109, "status"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v109

    const-string/jumbo v110, "audio"

    invoke-virtual/range {v109 .. v110}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_7c

    .line 667
    const-string/jumbo v109, "status"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v109

    const-string/jumbo v110, "audio"

    invoke-virtual/range {v109 .. v110}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v51

    .line 668
    .local v51, "jf":Lorg/json/JSONObject;
    new-instance v38, Lcom/vkontakte/android/audio/MusicTrack;

    move-object/from16 v0, v38

    move-object/from16 v1, v51

    invoke-direct {v0, v1}, Lcom/vkontakte/android/audio/MusicTrack;-><init>(Lorg/json/JSONObject;)V

    .line 669
    .local v38, "file":Lcom/vkontakte/android/audio/MusicTrack;
    move-object/from16 v0, v38

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->audioStatus:Lcom/vkontakte/android/audio/MusicTrack;

    .line 670
    new-instance v109, Ljava/lang/StringBuilder;

    invoke-direct/range {v109 .. v109}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v38

    iget-object v0, v0, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    move-object/from16 v110, v0

    invoke-virtual/range {v109 .. v110}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v109

    const-string/jumbo v110, " - "

    invoke-virtual/range {v109 .. v110}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v109

    move-object/from16 v0, v38

    iget-object v0, v0, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    move-object/from16 v110, v0

    invoke-virtual/range {v109 .. v110}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v109

    invoke-virtual/range {v109 .. v109}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v109

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->activity:Ljava/lang/String;

    .line 673
    .end local v38    # "file":Lcom/vkontakte/android/audio/MusicTrack;
    .end local v51    # "jf":Lorg/json/JSONObject;
    :cond_7c
    const-string/jumbo v109, "stories"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v109

    if-eqz v109, :cond_7d

    .line 674
    const-string/jumbo v109, "stories"

    move-object/from16 v0, p1

    move-object/from16 v1, v109

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v40

    .line 675
    .local v40, "getStoriesJson":Lorg/json/JSONObject;
    if-eqz v40, :cond_7d

    .line 676
    new-instance v109, Lcom/vk/stories/model/GetStoriesResponse;

    move-object/from16 v0, v109

    move-object/from16 v1, v40

    invoke-direct {v0, v1}, Lcom/vk/stories/model/GetStoriesResponse;-><init>(Lorg/json/JSONObject;)V

    move-object/from16 v0, v109

    move-object/from16 v1, v37

    iput-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->storiesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    .line 680
    .end local v40    # "getStoriesJson":Lorg/json/JSONObject;
    :cond_7d
    new-instance v93, Lcom/vkontakte/android/api/users/GetFullProfile$Result;

    invoke-direct/range {v93 .. v93}, Lcom/vkontakte/android/api/users/GetFullProfile$Result;-><init>()V

    .line 681
    .local v93, "res":Lcom/vkontakte/android/api/users/GetFullProfile$Result;
    move-object/from16 v0, v37

    move-object/from16 v1, v93

    iput-object v0, v1, Lcom/vkontakte/android/api/users/GetFullProfile$Result;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 316
    nop

    :sswitch_data_0
    .sparse-switch
        -0x3b54f756 -> :sswitch_4
        -0xffe2f4a -> :sswitch_1
        0x5a3f51c -> :sswitch_2
        0x178dfb90 -> :sswitch_0
        0x7c3126c2 -> :sswitch_3
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
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
    .line 39
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/users/GetFullProfile;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/users/GetFullProfile$Result;

    move-result-object v0

    return-object v0
.end method
