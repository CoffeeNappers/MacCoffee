.class public Lcom/vkontakte/android/api/execute/GetWallInfo;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "GetWallInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/execute/GetWallInfo$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/execute/GetWallInfo$Result;",
        ">;"
    }
.end annotation


# static fields
.field private static final INFO_FIELDS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 15
    const/16 v0, 0x17

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "audio_ads"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "audio_background_limit"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "country"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "debug_available"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "gif_autoplay"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "https_required"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "intro"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "lang"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "money_clubs_p2p"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string/jumbo v2, "money_p2p"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string/jumbo v2, "money_p2p_params"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string/jumbo v2, "music_intro"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string/jumbo v2, "audio_restrictions"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string/jumbo v2, "profiler_settings"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string/jumbo v2, "raise_to_record_enabled"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string/jumbo v2, "stories"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string/jumbo v2, "masks"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string/jumbo v2, "subscriptions"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string/jumbo v2, "support_url"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string/jumbo v2, "video_autoplay"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string/jumbo v2, "video_player"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string/jumbo v2, "vklive_app"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string/jumbo v2, "community_comments"

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/api/execute/GetWallInfo;->INFO_FIELDS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 42
    const-string/jumbo v0, "execute.getUserInfo"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 43
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "photo_100,photo_50,exports,country,sex,status,bdate,first_name_gen,last_name_gen,verified"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/execute/GetWallInfo;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 44
    const-string/jumbo v0, "info_fields"

    const-string/jumbo v1, ","

    sget-object v2, Lcom/vkontakte/android/api/execute/GetWallInfo;->INFO_FIELDS:[Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/execute/GetWallInfo;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 47
    const-string/jumbo v0, "androidVersion"

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/execute/GetWallInfo;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 48
    const-string/jumbo v0, "androidManufacturer"

    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/execute/GetWallInfo;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 49
    const-string/jumbo v0, "androidModel"

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/execute/GetWallInfo;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 51
    const-string/jumbo v0, "func_v"

    const/16 v1, 0x9

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/execute/GetWallInfo;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 52
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/execute/GetWallInfo$Result;
    .locals 7
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    const/4 v4, 0x1

    .line 56
    :try_start_0
    const-string/jumbo v5, "response"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 57
    const-string/jumbo v5, "profile"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 58
    .local v1, "jp":Lorg/json/JSONObject;
    const-string/jumbo v5, "info"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 60
    .local v0, "info":Lorg/json/JSONObject;
    new-instance v2, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;

    invoke-direct {v2}, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;-><init>()V

    .line 61
    .local v2, "res":Lcom/vkontakte/android/api/execute/GetWallInfo$Result;
    invoke-static {p1}, Lcom/vkontakte/android/auth/VKAuthUtils;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    iput-object v5, v2, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;->vkAccount:Lcom/vkontakte/android/auth/VKAccount;

    .line 62
    const-string/jumbo v5, "time"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v2, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;->time:I

    .line 63
    new-instance v5, Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;

    const-string/jumbo v6, "has_new_items"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;-><init>(Lorg/json/JSONObject;)V

    iput-object v5, v2, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;->hasNewItemsResponse:Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;

    .line 64
    const-string/jumbo v5, "bdate"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v2, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;->bdate:Ljava/lang/String;

    .line 65
    const-string/jumbo v5, "google_now"

    const/4 v6, 0x1

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v5

    if-nez v5, :cond_0

    :goto_0
    iput-boolean v4, v2, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;->needUpdateGoogleNow:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .end local v0    # "info":Lorg/json/JSONObject;
    .end local v1    # "jp":Lorg/json/JSONObject;
    .end local v2    # "res":Lcom/vkontakte/android/api/execute/GetWallInfo$Result;
    :goto_1
    return-object v2

    .line 65
    .restart local v0    # "info":Lorg/json/JSONObject;
    .restart local v1    # "jp":Lorg/json/JSONObject;
    .restart local v2    # "res":Lcom/vkontakte/android/api/execute/GetWallInfo$Result;
    :cond_0
    const/4 v4, 0x0

    goto :goto_0

    .line 68
    .end local v0    # "info":Lorg/json/JSONObject;
    .end local v1    # "jp":Lorg/json/JSONObject;
    .end local v2    # "res":Lcom/vkontakte/android/api/execute/GetWallInfo$Result;
    :catch_0
    move-exception v3

    .line 69
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    invoke-static {v4, v3}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 71
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 13
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/execute/GetWallInfo;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/execute/GetWallInfo$Result;

    move-result-object v0

    return-object v0
.end method
