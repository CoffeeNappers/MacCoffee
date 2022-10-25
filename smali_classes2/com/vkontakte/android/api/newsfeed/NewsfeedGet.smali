.class public Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "NewsfeedGet.java"

# interfaces
.implements Lcom/vkontakte/android/data/ServerKeys;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;",
        ">;",
        "Lcom/vkontakte/android/data/ServerKeys;"
    }
.end annotation


# static fields
.field private static final FEED_TYPE_RECENT:Ljava/lang/String; = "recent"

.field private static final FEED_TYPE_TOP:Ljava/lang/String; = "top"

.field public static final LIST_ID_FRIENDS:I = -0x2

.field public static final LIST_ID_GROUPS:I = -0x3

.field public static final LIST_ID_NEWS:I = 0x0

.field public static final LIST_ID_PHOTOS:I = -0x4

.field public static final LIST_ID_RECOMMENDATION:I = -0x1

.field public static final LIST_ID_VIDEOS:I = -0x5

.field public static final LIST_PROMO_SECTION:I = -0xa

.field public static final METHOD_NAME:Ljava/lang/String; = "execute.getNewsfeedSmart"

.field private static final REFRESH_TIMEOUT_DEFAULT:J = 0x927c0L


# instance fields
.field final from:Ljava/lang/String;

.field final listRefer:Ljava/lang/String;

.field final promoList:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 12
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "count"    # I
    .param p3, "list"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v6, -0x1

    .line 68
    const/4 v10, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v5, v4

    move v7, v6

    move v8, v6

    move v9, v6

    move-object v11, v4

    invoke-direct/range {v0 .. v11}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/Boolean;IIIIZLjava/lang/String;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/Boolean;IIIIZLjava/lang/String;)V
    .locals 8
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "count"    # I
    .param p3, "list"    # I
    .param p4, "promoList"    # Ljava/lang/String;
    .param p5, "isSmartNews"    # Ljava/lang/Boolean;
    .param p6, "position"    # I
    .param p7, "lastPostOwnerId"    # I
    .param p8, "lastPostId"    # I
    .param p9, "awayTimeSec"    # I
    .param p10, "forceNotification"    # Z
    .param p11, "listRefer"    # Ljava/lang/String;

    .prologue
    .line 74
    const-string/jumbo v3, "execute.getNewsfeedSmart"

    invoke-direct {p0, v3}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 76
    iput-object p1, p0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->from:Ljava/lang/String;

    .line 77
    move-object/from16 v0, p11

    iput-object v0, p0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->listRefer:Ljava/lang/String;

    .line 79
    const-string/jumbo v3, "func_v"

    const/4 v4, 0x2

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 80
    const-string/jumbo v3, "connection_type"

    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getConnectionType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 81
    const-string/jumbo v3, "connection_subtype"

    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getConnectionSubtype()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 82
    const-string/jumbo v3, "user_options"

    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getUserOptions()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 84
    const-string/jumbo v3, "start_from"

    invoke-virtual {p0, v3, p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 85
    const-string/jumbo v3, "count"

    invoke-virtual {p0, v3, p2}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 86
    const-string/jumbo v3, "fields"

    const-string/jumbo v4, "id,first_name,first_name_dat,last_name,last_name_dat,sex,screen_name,photo_50,photo_100,online,video_files"

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 87
    if-eqz p10, :cond_0

    .line 88
    const-string/jumbo v3, "forced_notifications"

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 91
    :cond_0
    packed-switch p3, :pswitch_data_0

    .line 104
    :goto_0
    :pswitch_0
    packed-switch p3, :pswitch_data_1

    .line 112
    const-string/jumbo v3, "filters"

    const/16 v4, 0xb

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string/jumbo v6, "post"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string/jumbo v6, "photo"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string/jumbo v6, "photo_tag"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string/jumbo v6, "friends_recomm"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string/jumbo v6, "app_widget"

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-string/jumbo v6, "ads_app"

    aput-object v6, v4, v5

    const/4 v5, 0x6

    const-string/jumbo v6, "ads_site"

    aput-object v6, v4, v5

    const/4 v5, 0x7

    const-string/jumbo v6, "ads_post"

    aput-object v6, v4, v5

    const/16 v5, 0x8

    const-string/jumbo v6, "ads_app_slider"

    aput-object v6, v4, v5

    const/16 v5, 0x9

    const-string/jumbo v6, "ads_app_video"

    aput-object v6, v4, v5

    const/16 v5, 0xa

    const-string/jumbo v6, "ads_post_pretty_cards"

    aput-object v6, v4, v5

    invoke-static {v4}, Lcom/vkontakte/android/utils/Utils;->getNewsFilterParams([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 120
    :goto_1
    packed-switch p3, :pswitch_data_2

    .line 131
    if-lez p3, :cond_1

    .line 132
    const-string/jumbo v3, "source_ids"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "list"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 137
    :cond_1
    :goto_2
    if-nez p3, :cond_5

    if-eqz p5, :cond_5

    .line 138
    const-string/jumbo v3, "0"

    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_a

    .line 139
    const-string/jumbo v4, "feed_type"

    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_9

    sget-object v3, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->FEED_TYPE_TOP:Ljava/lang/String;

    :goto_3
    invoke-virtual {p0, v4, v3}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 143
    :cond_2
    :goto_4
    if-ltz p6, :cond_3

    .line 144
    const-string/jumbo v3, "update_position"

    invoke-static {p6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 146
    :cond_3
    if-ltz p8, :cond_4

    if-eqz p7, :cond_4

    .line 147
    const-string/jumbo v3, "update_post"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p8

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 149
    :cond_4
    if-ltz p9, :cond_5

    .line 150
    const-string/jumbo v3, "update_away_time"

    invoke-static/range {p9 .. p9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 154
    :cond_5
    if-eqz p3, :cond_6

    .line 155
    const-string/jumbo v3, "is_not_newsfeed"

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 158
    :cond_6
    iput-object p4, p0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->promoList:Ljava/lang/String;

    .line 159
    if-eqz p4, :cond_7

    .line 160
    const-string/jumbo v3, "feed_id"

    invoke-virtual {p0, v3, p4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 163
    :cond_7
    const-string/jumbo v3, "photo_sizes"

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 165
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string/jumbo v4, "last_get_notify_app"

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 166
    .local v2, "last":I
    if-eqz v2, :cond_8

    .line 167
    const-string/jumbo v3, "last_request_notification_sec"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    int-to-long v6, v2

    sub-long/2addr v4, v6

    long-to-int v4, v4

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 170
    :cond_8
    const-string/jumbo v3, "device_info"

    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getDeviceInfo()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 171
    const-string/jumbo v3, "app_package_id"

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 172
    return-void

    .line 93
    .end local v2    # "last":I
    :pswitch_1
    const-string/jumbo v3, "feed_type"

    const-string/jumbo v4, "recommended"

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 96
    :pswitch_2
    const-string/jumbo v3, "extended"

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 99
    :pswitch_3
    const-string/jumbo v3, "return_banned"

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 106
    :pswitch_4
    const-string/jumbo v3, "filters"

    const-string/jumbo v4, "photo,photo_tag,wall_photo"

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_1

    .line 109
    :pswitch_5
    const-string/jumbo v3, "filters"

    const-string/jumbo v4, "video"

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_1

    .line 122
    :pswitch_6
    const-string/jumbo v3, "source_ids"

    const-string/jumbo v4, "friends,following"

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_2

    .line 125
    :pswitch_7
    const-string/jumbo v3, "source_ids"

    const-string/jumbo v4, "groups,pages"

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_2

    .line 128
    :pswitch_8
    const-string/jumbo v3, "source_ids"

    const-string/jumbo v4, "friends,following"

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_2

    .line 139
    :cond_9
    sget-object v3, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->FEED_TYPE_RECENT:Ljava/lang/String;

    goto/16 :goto_3

    .line 140
    :cond_a
    invoke-static {}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->isStartFromInterestingPending()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 141
    const-string/jumbo v4, "forced_feed_type"

    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_b

    sget-object v3, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->FEED_TYPE_TOP:Ljava/lang/String;

    :goto_5
    invoke-virtual {p0, v4, v3}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_4

    :cond_b
    sget-object v3, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->FEED_TYPE_RECENT:Ljava/lang/String;

    goto :goto_5

    .line 91
    :pswitch_data_0
    .packed-switch -0x5
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 104
    :pswitch_data_1
    .packed-switch -0x5
        :pswitch_5
        :pswitch_4
    .end packed-switch

    .line 120
    :pswitch_data_2
    .packed-switch -0x4
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch
.end method

.method public static getRefreshTimeout(ZI)J
    .locals 6
    .param p0, "isTop"    # Z
    .param p1, "listId"    # I

    .prologue
    .line 212
    const-wide/32 v0, 0x927c0

    .line 213
    .local v0, "defaultValue":J
    packed-switch p1, :pswitch_data_0

    .line 218
    if-eqz p0, :cond_0

    const-string/jumbo v2, "refresh_timeout_top"

    .line 221
    .local v2, "preferenceKey":Ljava/lang/String;
    :goto_0
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 222
    invoke-interface {v3, v2, v0, v1}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    return-wide v4

    .line 215
    .end local v2    # "preferenceKey":Ljava/lang/String;
    :pswitch_0
    const-string/jumbo v2, "refresh_timeout_recommended"

    .line 216
    .restart local v2    # "preferenceKey":Ljava/lang/String;
    goto :goto_0

    .line 218
    .end local v2    # "preferenceKey":Ljava/lang/String;
    :cond_0
    const-string/jumbo v2, "refresh_timeout_recent"

    goto :goto_0

    .line 213
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
    .end packed-switch
.end method

.method private static isStartFromInterestingPending()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 175
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "start_from_interesting_pending"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private parseNotifications(Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    .locals 11
    .param p1, "newsEntries"    # Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    .param p2, "jResponse"    # Lorg/json/JSONObject;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 235
    const-string/jumbo v3, "notifications"

    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 236
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v4, 0x0

    invoke-virtual {v3, v10, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "last_get_notify_app"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    long-to-int v5, v6

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 238
    if-nez p1, :cond_0

    .line 239
    new-instance p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;

    .end local p1    # "newsEntries":Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    const-string/jumbo v3, "next_from"

    invoke-virtual {p2, v3, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p1, v3}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;-><init>(Ljava/lang/String;)V

    .line 242
    .restart local p1    # "newsEntries":Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    :cond_0
    const-string/jumbo v3, "notifications"

    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/data/UserNotification;->parse(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v2

    .line 244
    .local v2, "notifications":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/UserNotification;>;"
    if-eqz v2, :cond_1

    .line 245
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->notifications:Ljava/util/List;

    .line 246
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 247
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/data/UserNotification;

    invoke-direct {v0, v3}, Lcom/vkontakte/android/NewsEntry;-><init>(Lcom/vkontakte/android/data/UserNotification;)V

    .line 248
    .local v0, "entry":Lcom/vkontakte/android/NewsEntry;
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    sub-int v3, v1, v3

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->order_position:I

    .line 249
    iget-object v3, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->notifications:Ljava/util/List;

    invoke-interface {v3, v1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 246
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 253
    .end local v0    # "entry":Lcom/vkontakte/android/NewsEntry;
    .end local v1    # "i":I
    .end local v2    # "notifications":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/UserNotification;>;"
    :cond_1
    return-object p1
.end method

.method public static setStartFromInterestingPending(Z)V
    .locals 3
    .param p0, "b"    # Z

    .prologue
    .line 179
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "start_from_interesting_pending"

    .line 180
    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 181
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    .locals 12
    .param p1, "jObj"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 185
    :try_start_0
    const-string/jumbo v9, "response"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 187
    .local v0, "jResponse":Lorg/json/JSONObject;
    const-string/jumbo v9, "refresh_timeout_recent"

    const-wide/32 v10, 0x927c0

    invoke-virtual {v0, v9, v10, v11}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 188
    .local v2, "refresh_timeout_recent":J
    const-string/jumbo v9, "refresh_timeout_top"

    const-wide/32 v10, 0x927c0

    invoke-virtual {v0, v9, v10, v11}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v6

    .line 189
    .local v6, "refresh_timeout_top":J
    const-string/jumbo v9, "refresh_timeout_recommended"

    const-wide/32 v10, 0x927c0

    invoke-virtual {v0, v9, v10, v11}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 190
    .local v4, "refresh_timeout_recommended":J
    sget-object v9, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v9

    .line 191
    invoke-interface {v9}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    const-string/jumbo v10, "refresh_timeout_recent"

    .line 192
    invoke-interface {v9, v10, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    const-string/jumbo v10, "refresh_timeout_top"

    .line 193
    invoke-interface {v9, v10, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    const-string/jumbo v10, "refresh_timeout_recommended"

    .line 194
    invoke-interface {v9, v10, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    .line 195
    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 197
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->parseNews(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;

    move-result-object v1

    .line 198
    .local v1, "newsEntries":Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->parseLists(Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;

    move-result-object v1

    .line 199
    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->parseFeedType(Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;

    move-result-object v1

    .line 200
    invoke-direct {p0, v1, v0}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->parseNotifications(Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;

    move-result-object v1

    .line 201
    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->parseStories(Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;

    move-result-object v1

    .line 202
    const/4 v9, 0x0

    invoke-static {v9}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->setStartFromInterestingPending(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    .end local v0    # "jResponse":Lorg/json/JSONObject;
    .end local v1    # "newsEntries":Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    .end local v2    # "refresh_timeout_recent":J
    .end local v4    # "refresh_timeout_recommended":J
    .end local v6    # "refresh_timeout_top":J
    :goto_0
    return-object v1

    .line 204
    :catch_0
    move-exception v8

    .line 205
    .local v8, "x":Ljava/lang/Exception;
    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string/jumbo v11, "error"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    aput-object p1, v9, v10

    invoke-static {v9}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 207
    const/4 v1, 0x0

    goto :goto_0
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
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;

    move-result-object v0

    return-object v0
.end method

.method public parseFeedType(Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    .locals 2
    .param p1, "newsEntries"    # Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    .param p2, "jResponse"    # Lorg/json/JSONObject;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 258
    const-string/jumbo v0, "feed_type"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 259
    if-nez p1, :cond_0

    .line 260
    new-instance p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;

    .end local p1    # "newsEntries":Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    const-string/jumbo v0, "next_from"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;-><init>(Ljava/lang/String;)V

    .line 262
    .restart local p1    # "newsEntries":Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    :cond_0
    const-string/jumbo v0, "feed_type"

    const-string/jumbo v1, "recent"

    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "top"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->isSmartNews:Ljava/lang/Boolean;

    .line 264
    :cond_1
    return-object p1
.end method

.method public parseLists(Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    .locals 10
    .param p1, "newsEntries"    # Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    .param p2, "jResponse"    # Lorg/json/JSONObject;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v6, 0x1

    .line 269
    const-string/jumbo v5, "sections"

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    const-string/jumbo v5, "sections"

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 270
    if-nez p1, :cond_0

    .line 271
    new-instance p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;

    .end local p1    # "newsEntries":Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    const-string/jumbo v5, "next_from"

    invoke-virtual {p2, v5, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p1, v5}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;-><init>(Ljava/lang/String;)V

    .line 273
    .restart local p1    # "newsEntries":Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    :cond_0
    iget-object v5, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->lists:Ljava/util/List;

    if-nez v5, :cond_1

    .line 274
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->lists:Ljava/util/List;

    .line 276
    :cond_1
    const-string/jumbo v5, "sections"

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 277
    .local v3, "jsonArray":Lorg/json/JSONArray;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v0, v5, :cond_4

    .line 278
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v7, "name"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 279
    .local v4, "type":Ljava/lang/String;
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v7, "enabled"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    if-eq v5, v6, :cond_2

    .line 277
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 282
    :cond_2
    const/4 v5, -0x1

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v7

    sparse-switch v7, :sswitch_data_0

    :cond_3
    :goto_2
    packed-switch v5, :pswitch_data_0

    goto :goto_1

    .line 284
    :pswitch_0
    iget-object v5, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->lists:Ljava/util/List;

    new-instance v7, Lcom/vkontakte/android/NewsfeedList;

    const/4 v8, -0x4

    invoke-direct {v7, v8, v4}, Lcom/vkontakte/android/NewsfeedList;-><init>(ILjava/lang/String;)V

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 282
    :sswitch_0
    const-string/jumbo v7, "photos"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    const/4 v5, 0x0

    goto :goto_2

    :sswitch_1
    const-string/jumbo v7, "videos"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    move v5, v6

    goto :goto_2

    :sswitch_2
    const-string/jumbo v7, "friends"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    const/4 v5, 0x2

    goto :goto_2

    :sswitch_3
    const-string/jumbo v7, "groups"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    const/4 v5, 0x3

    goto :goto_2

    .line 287
    :pswitch_1
    iget-object v5, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->lists:Ljava/util/List;

    new-instance v7, Lcom/vkontakte/android/NewsfeedList;

    const/4 v8, -0x5

    invoke-direct {v7, v8, v4}, Lcom/vkontakte/android/NewsfeedList;-><init>(ILjava/lang/String;)V

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 290
    :pswitch_2
    iget-object v5, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->lists:Ljava/util/List;

    new-instance v7, Lcom/vkontakte/android/NewsfeedList;

    const/4 v8, -0x2

    invoke-direct {v7, v8, v4}, Lcom/vkontakte/android/NewsfeedList;-><init>(ILjava/lang/String;)V

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 293
    :pswitch_3
    iget-object v5, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->lists:Ljava/util/List;

    new-instance v7, Lcom/vkontakte/android/NewsfeedList;

    const/4 v8, -0x3

    invoke-direct {v7, v8, v4}, Lcom/vkontakte/android/NewsfeedList;-><init>(ILjava/lang/String;)V

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 298
    .end local v0    # "i":I
    .end local v3    # "jsonArray":Lorg/json/JSONArray;
    .end local v4    # "type":Ljava/lang/String;
    :cond_4
    const-string/jumbo v5, "lists"

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9

    const-string/jumbo v5, "lists"

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_9

    .line 299
    if-nez p1, :cond_5

    .line 300
    new-instance p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;

    .end local p1    # "newsEntries":Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    const-string/jumbo v5, "next_from"

    invoke-virtual {p2, v5, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p1, v5}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;-><init>(Ljava/lang/String;)V

    .line 302
    .restart local p1    # "newsEntries":Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    :cond_5
    iget-object v5, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->lists:Ljava/util/List;

    if-nez v5, :cond_6

    .line 303
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->lists:Ljava/util/List;

    .line 305
    :cond_6
    invoke-static {}, Lcom/vkontakte/android/NewsfeedList;->resetCounter()V

    .line 306
    const-string/jumbo v5, "lists"

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 307
    .restart local v3    # "jsonArray":Lorg/json/JSONArray;
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_3
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v0, v5, :cond_9

    .line 308
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 309
    .local v2, "item":Lorg/json/JSONObject;
    const-string/jumbo v5, "id"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 310
    .local v1, "id":Ljava/lang/Object;
    iget-object v5, p0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->promoList:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_7

    const-string/jumbo v5, "hidden"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_8

    const-string/jumbo v5, "is_hidden"

    .line 311
    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_8

    const-string/jumbo v5, "is_unavailable"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_8

    .line 312
    :cond_7
    iget-object v5, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->lists:Ljava/util/List;

    new-instance v6, Lcom/vkontakte/android/NewsfeedList;

    invoke-direct {v6, v2}, Lcom/vkontakte/android/NewsfeedList;-><init>(Lorg/json/JSONObject;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    :cond_8
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 316
    .end local v0    # "i":I
    .end local v1    # "id":Ljava/lang/Object;
    .end local v2    # "item":Lorg/json/JSONObject;
    .end local v3    # "jsonArray":Lorg/json/JSONArray;
    :cond_9
    return-object p1

    .line 282
    :sswitch_data_0
    .sparse-switch
        -0x49c2262c -> :sswitch_3
        -0x3af3777f -> :sswitch_0
        -0x30ad84a8 -> :sswitch_1
        -0x23c4b66b -> :sswitch_2
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public parseNews(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    .locals 26
    .param p1, "jResponse"    # Lorg/json/JSONObject;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 322
    :try_start_0
    const-string/jumbo v8, "items"

    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v19

    .line 323
    .local v19, "jItems":Lorg/json/JSONArray;
    const-string/jumbo v8, "profiles"

    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v20

    .line 324
    .local v20, "jProfiles":Lorg/json/JSONArray;
    const-string/jumbo v8, "groups"

    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v18

    .line 325
    .local v18, "jGroups":Lorg/json/JSONArray;
    new-instance v6, Ljava/util/Vector;

    invoke-direct {v6}, Ljava/util/Vector;-><init>()V

    .line 326
    .local v6, "adminGroups":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    new-instance v22, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;

    const-string/jumbo v8, "next_from"

    const/4 v9, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, v22

    invoke-direct {v0, v8}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;-><init>(Ljava/lang/String;)V

    .line 327
    .local v22, "result":Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    if-nez v19, :cond_1

    .line 398
    .end local v6    # "adminGroups":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    .end local v18    # "jGroups":Lorg/json/JSONArray;
    .end local v19    # "jItems":Lorg/json/JSONArray;
    .end local v20    # "jProfiles":Lorg/json/JSONArray;
    .end local v22    # "result":Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    :cond_0
    :goto_0
    return-object v22

    .line 331
    .restart local v6    # "adminGroups":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    .restart local v18    # "jGroups":Lorg/json/JSONArray;
    .restart local v19    # "jItems":Lorg/json/JSONArray;
    .restart local v20    # "jProfiles":Lorg/json/JSONArray;
    .restart local v22    # "result":Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    :cond_1
    new-instance v3, Landroid/util/SparseArray;

    invoke-direct {v3}, Landroid/util/SparseArray;-><init>()V

    .line 332
    .local v3, "userNames":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    .line 333
    .local v4, "userPhotos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v5, Landroid/util/SparseBooleanArray;

    invoke-direct {v5}, Landroid/util/SparseBooleanArray;-><init>()V

    .line 335
    .local v5, "userSex":Landroid/util/SparseBooleanArray;
    if-eqz v20, :cond_4

    .line 336
    invoke-virtual/range {v20 .. v20}, Lorg/json/JSONArray;->length()I

    move-result v21

    .line 337
    .local v21, "length":I
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_1
    move/from16 v0, v17

    move/from16 v1, v21

    if-ge v0, v1, :cond_4

    .line 338
    move-object/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 339
    .local v2, "jItem":Lorg/json/JSONObject;
    const-string/jumbo v8, "id"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v23

    .line 340
    .local v23, "uid":I
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "first_name"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v9, 0x20

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "last_name"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move/from16 v0, v23

    invoke-virtual {v3, v0, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 341
    sget v8, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v9, 0x3f800000    # 1.0f

    cmpl-float v8, v8, v9

    if-lez v8, :cond_2

    const-string/jumbo v8, "photo_100"

    :goto_2
    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move/from16 v0, v23

    invoke-virtual {v4, v0, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 342
    const-string/jumbo v8, "sex"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_3

    const/4 v8, 0x1

    :goto_3
    move/from16 v0, v23

    invoke-virtual {v5, v0, v8}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 337
    add-int/lit8 v17, v17, 0x1

    goto :goto_1

    .line 341
    :cond_2
    const-string/jumbo v8, "photo_50"

    goto :goto_2

    .line 342
    :cond_3
    const/4 v8, 0x0

    goto :goto_3

    .line 346
    .end local v2    # "jItem":Lorg/json/JSONObject;
    .end local v17    # "i":I
    .end local v21    # "length":I
    .end local v23    # "uid":I
    :cond_4
    if-eqz v18, :cond_7

    .line 347
    invoke-virtual/range {v18 .. v18}, Lorg/json/JSONArray;->length()I

    move-result v21

    .line 348
    .restart local v21    # "length":I
    const/16 v17, 0x0

    .restart local v17    # "i":I
    :goto_4
    move/from16 v0, v17

    move/from16 v1, v21

    if-ge v0, v1, :cond_7

    .line 349
    move-object/from16 v0, v18

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 350
    .restart local v2    # "jItem":Lorg/json/JSONObject;
    const-string/jumbo v8, "id"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v16

    .line 351
    .local v16, "gid":I
    move/from16 v0, v16

    neg-int v8, v0

    const-string/jumbo v9, "name"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v8, v9}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 352
    move/from16 v0, v16

    neg-int v9, v0

    sget v8, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v10, 0x3f800000    # 1.0f

    cmpl-float v8, v8, v10

    if-lez v8, :cond_6

    const-string/jumbo v8, "photo_100"

    :goto_5
    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v9, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 353
    const-string/jumbo v8, "is_admin"

    const/4 v9, 0x0

    invoke-virtual {v2, v8, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_5

    .line 354
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 348
    :cond_5
    add-int/lit8 v17, v17, 0x1

    goto :goto_4

    .line 352
    :cond_6
    const-string/jumbo v8, "photo_50"

    goto :goto_5

    .line 359
    .end local v2    # "jItem":Lorg/json/JSONObject;
    .end local v16    # "gid":I
    .end local v17    # "i":I
    .end local v21    # "length":I
    :cond_7
    const/16 v17, 0x0

    .restart local v17    # "i":I
    :goto_6
    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONArray;->length()I

    move-result v8

    move/from16 v0, v17

    if-ge v0, v8, :cond_0

    .line 360
    move-object/from16 v0, v19

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 362
    .restart local v2    # "jItem":Lorg/json/JSONObject;
    const-string/jumbo v8, "ads"

    const-string/jumbo v9, "type"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_c

    .line 363
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->listRefer:Ljava/lang/String;

    invoke-static/range {v2 .. v7}, Lcom/vkontakte/android/NewsEntry;->parseAd(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseBooleanArray;Ljava/util/Vector;Ljava/lang/String;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v7

    .line 364
    .local v7, "e":Lcom/vkontakte/android/NewsEntry;
    if-eqz v7, :cond_d

    .line 365
    invoke-virtual/range {v22 .. v22}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->size()I

    move-result v8

    if-lez v8, :cond_9

    invoke-virtual/range {v22 .. v22}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/NewsEntry;

    iget v8, v8, Lcom/vkontakte/android/NewsEntry;->time:I

    add-int/lit8 v8, v8, 0x1

    :goto_7
    iput v8, v7, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 366
    iget-object v8, v7, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_8
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_d

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/vkontakte/android/attachments/Attachment;

    .line 367
    .local v14, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v9, v14, Lcom/vkontakte/android/attachments/ShitAttachment;

    if-eqz v9, :cond_8

    .line 368
    move-object v0, v14

    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    move-object v13, v0

    .line 369
    .local v13, "ad":Lcom/vkontakte/android/attachments/ShitAttachment;
    const-string/jumbo v9, "load"

    invoke-virtual {v13, v9}, Lcom/vkontakte/android/attachments/ShitAttachment;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_8
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_a

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lcom/vkontakte/android/statistics/StatisticUrl;

    .line 370
    .local v24, "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    invoke-static/range {v24 .. v24}, Lcom/vkontakte/android/data/Analytics;->trackExternal(Lcom/vkontakte/android/statistics/StatisticUrl;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_8

    .line 395
    .end local v2    # "jItem":Lorg/json/JSONObject;
    .end local v3    # "userNames":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v4    # "userPhotos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v5    # "userSex":Landroid/util/SparseBooleanArray;
    .end local v6    # "adminGroups":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    .end local v7    # "e":Lcom/vkontakte/android/NewsEntry;
    .end local v13    # "ad":Lcom/vkontakte/android/attachments/ShitAttachment;
    .end local v14    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v17    # "i":I
    .end local v18    # "jGroups":Lorg/json/JSONArray;
    .end local v19    # "jItems":Lorg/json/JSONArray;
    .end local v20    # "jProfiles":Lorg/json/JSONArray;
    .end local v22    # "result":Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    .end local v24    # "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    :catch_0
    move-exception v25

    .line 396
    .local v25, "x":Ljava/lang/Exception;
    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Object;

    move-object/from16 v0, v25

    invoke-static {v0, v8}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 398
    const/16 v22, 0x0

    goto/16 :goto_0

    .line 365
    .end local v25    # "x":Ljava/lang/Exception;
    .restart local v2    # "jItem":Lorg/json/JSONObject;
    .restart local v3    # "userNames":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .restart local v4    # "userPhotos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .restart local v5    # "userSex":Landroid/util/SparseBooleanArray;
    .restart local v6    # "adminGroups":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    .restart local v7    # "e":Lcom/vkontakte/android/NewsEntry;
    .restart local v17    # "i":I
    .restart local v18    # "jGroups":Lorg/json/JSONArray;
    .restart local v19    # "jItems":Lorg/json/JSONArray;
    .restart local v20    # "jProfiles":Lorg/json/JSONArray;
    .restart local v22    # "result":Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    :cond_9
    :try_start_1
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v8

    goto :goto_7

    .line 372
    .restart local v13    # "ad":Lcom/vkontakte/android/attachments/ShitAttachment;
    .restart local v14    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_a
    iget-object v9, v13, Lcom/vkontakte/android/attachments/ShitAttachment;->cards:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_b
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_8

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    .line 373
    .local v15, "card":Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    const-string/jumbo v10, "load"

    invoke-virtual {v15, v10}, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_9
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_b

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lcom/vkontakte/android/statistics/StatisticUrl;

    .line 374
    .restart local v24    # "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    invoke-static/range {v24 .. v24}, Lcom/vkontakte/android/data/Analytics;->trackExternal(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    goto :goto_9

    .line 380
    .end local v7    # "e":Lcom/vkontakte/android/NewsEntry;
    .end local v13    # "ad":Lcom/vkontakte/android/attachments/ShitAttachment;
    .end local v14    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v15    # "card":Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    .end local v24    # "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    :cond_c
    const-string/jumbo v8, "friends_recomm"

    const-string/jumbo v9, "type"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_f

    .line 381
    invoke-static {v2}, Lcom/vkontakte/android/NewsEntry;->parseFriendsRecomm(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v7

    .line 390
    .restart local v7    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_d
    :goto_a
    if-eqz v7, :cond_e

    .line 391
    move-object/from16 v0, v22

    invoke-virtual {v0, v7}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->add(Ljava/lang/Object;)Z

    .line 359
    :cond_e
    add-int/lit8 v17, v17, 0x1

    goto/16 :goto_6

    .line 382
    .end local v7    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_f
    const-string/jumbo v8, "app_widget"

    const-string/jumbo v9, "type"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_10

    .line 383
    invoke-static {v2}, Lcom/vkontakte/android/NewsEntry;->parseWidget(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v7

    .restart local v7    # "e":Lcom/vkontakte/android/NewsEntry;
    goto :goto_a

    .line 385
    .end local v7    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_10
    new-instance v7, Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->listRefer:Ljava/lang/String;

    move-object v8, v2

    move-object v10, v3

    move-object v11, v4

    move-object v12, v5

    invoke-direct/range {v7 .. v12}, Lcom/vkontakte/android/NewsEntry;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseBooleanArray;)V

    .line 386
    .restart local v7    # "e":Lcom/vkontakte/android/NewsEntry;
    iget v8, v7, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-gez v8, :cond_d

    iget v8, v7, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v8, v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    .line 387
    iget v8, v7, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v8, v8, 0x40

    iput v8, v7, Lcom/vkontakte/android/NewsEntry;->flags:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_a
.end method

.method parseStories(Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    .locals 2
    .param p1, "newsEntries"    # Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;
    .param p2, "jResponse"    # Lorg/json/JSONObject;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 227
    const-string/jumbo v0, "stories"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 228
    new-instance v0, Lcom/vk/stories/model/GetStoriesResponse;

    const-string/jumbo v1, "stories"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/stories/model/GetStoriesResponse;-><init>(Lorg/json/JSONObject;)V

    iput-object v0, p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet$Response;->stories:Lcom/vk/stories/model/GetStoriesResponse;

    .line 230
    :cond_0
    return-object p1
.end method
