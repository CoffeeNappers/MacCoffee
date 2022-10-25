.class public Lcom/vkontakte/android/data/GameRequest;
.super Ljava/lang/Object;
.source "GameRequest.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Lcom/vkontakte/android/data/ServerKeys;


# static fields
.field public static final COLUMNS:[Ljava/lang/String;

.field private static final COLUMN_APP_GENRE:Ljava/lang/String; = "app_genre"

.field public static final COLUMN_APP_ID:Ljava/lang/String; = "app_id"

.field private static final COLUMN_APP_PACKAGE:Ljava/lang/String; = "app_package"

.field private static final COLUMN_APP_TITLE:Ljava/lang/String; = "app_title"

.field private static final COLUMN_APP_URL:Ljava/lang/String; = "app_url"

.field private static final COLUMN_DATE:Ljava/lang/String; = "date"

.field private static final COLUMN_FROM_IDS:Ljava/lang/String; = "from_ids"

.field private static final COLUMN_KEY:Ljava/lang/String; = "key"

.field private static final COLUMN_NAME:Ljava/lang/String; = "name"

.field private static final COLUMN_TEXT:Ljava/lang/String; = "text"

.field private static final COLUMN_TYPE:Ljava/lang/String; = "type"

.field private static final COLUMN_UNREAD:Ljava/lang/String; = "unread"

.field private static final COLUMN_USER_PROFILE_IDS:Ljava/lang/String; = "user_profile_ids"

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/data/GameRequest;",
            ">;"
        }
    .end annotation
.end field

.field public static final TABLE:Ljava/lang/String; = "game_requests"

.field public static final TYPE_INVITE:I = 0x1

.field public static final TYPE_REQUEST:I = 0x2


# instance fields
.field public apiApplication:Lcom/vkontakte/android/data/ApiApplication;

.field public appGenre:Ljava/lang/String;

.field public appId:I

.field public appPackage:Ljava/lang/String;

.field public appTitle:Ljava/lang/String;

.field public appUrl:Ljava/lang/String;

.field public fromDb:Z

.field public fromIds:[I

.field public id:J

.field public key:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field private tag:Ljava/lang/Object;

.field public text:Ljava/lang/String;

.field public time:I

.field public type:I

.field public unread:Z

.field public userProfiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field public userProfilesId:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 41
    const/16 v0, 0xe

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "type"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "text"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "name"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "unread"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "app_id"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "app_genre"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "app_title"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "app_url"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string/jumbo v2, "app_package"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string/jumbo v2, "key"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string/jumbo v2, "from_ids"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string/jumbo v2, "user_profile_ids"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string/jumbo v2, "date"

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/data/GameRequest;->COLUMNS:[Ljava/lang/String;

    .line 236
    new-instance v0, Lcom/vkontakte/android/data/GameRequest$1;

    invoke-direct {v0}, Lcom/vkontakte/android/data/GameRequest$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/GameRequest;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/data/GameRequest;->id:J

    .line 63
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/data/GameRequest;->fromDb:Z

    .line 85
    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 4
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 248
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/vkontakte/android/data/GameRequest;->id:J

    .line 63
    iput-boolean v0, p0, Lcom/vkontakte/android/data/GameRequest;->fromDb:Z

    .line 249
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vkontakte/android/data/GameRequest;->id:J

    .line 250
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/data/GameRequest;->type:I

    .line 251
    const/4 v2, 0x2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->text:Ljava/lang/String;

    .line 252
    const/4 v2, 0x3

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->name:Ljava/lang/String;

    .line 253
    const/4 v2, 0x4

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    if-eqz v2, :cond_0

    move v0, v1

    :cond_0
    iput-boolean v0, p0, Lcom/vkontakte/android/data/GameRequest;->unread:Z

    .line 254
    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/GameRequest;->appId:I

    .line 255
    const/4 v0, 0x6

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->appGenre:Ljava/lang/String;

    .line 256
    const/4 v0, 0x7

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->appTitle:Ljava/lang/String;

    .line 257
    const/16 v0, 0x8

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->appUrl:Ljava/lang/String;

    .line 258
    const/16 v0, 0x9

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->appPackage:Ljava/lang/String;

    .line 259
    const/16 v0, 0xa

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->key:Ljava/lang/String;

    .line 260
    const/16 v0, 0xb

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/data/GameRequest;->stringToIntArray(Ljava/lang/String;)[I

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->fromIds:[I

    .line 261
    const/16 v0, 0xc

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/data/GameRequest;->stringToIntArray(Ljava/lang/String;)[I

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->userProfilesId:[I

    .line 262
    const/16 v0, 0xd

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/GameRequest;->time:I

    .line 263
    iput-boolean v1, p0, Lcom/vkontakte/android/data/GameRequest;->fromDb:Z

    .line 264
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 6
    .param p1, "parcel"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lcom/vkontakte/android/data/GameRequest;->id:J

    .line 63
    iput-boolean v2, p0, Lcom/vkontakte/android/data/GameRequest;->fromDb:Z

    .line 185
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/GameRequest;->type:I

    .line 186
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->text:Ljava/lang/String;

    .line 187
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->name:Ljava/lang/String;

    .line 188
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/data/GameRequest;->unread:Z

    .line 190
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/GameRequest;->appId:I

    .line 191
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->appGenre:Ljava/lang/String;

    .line 192
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->appTitle:Ljava/lang/String;

    .line 193
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->appUrl:Ljava/lang/String;

    .line 194
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->appPackage:Ljava/lang/String;

    .line 196
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->fromIds:[I

    .line 197
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->key:Ljava/lang/String;

    .line 198
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->userProfilesId:[I

    .line 200
    sget-object v0, Lcom/vkontakte/android/UserProfile;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->userProfiles:Ljava/util/ArrayList;

    .line 202
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    :goto_1
    iput-boolean v1, p0, Lcom/vkontakte/android/data/GameRequest;->fromDb:Z

    .line 203
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/GameRequest;->time:I

    .line 204
    const-class v0, Lcom/vkontakte/android/data/ApiApplication;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/ApiApplication;

    iput-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    .line 205
    return-void

    :cond_0
    move v0, v2

    .line 188
    goto :goto_0

    :cond_1
    move v1, v2

    .line 202
    goto :goto_1
.end method

.method public constructor <init>(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;)V
    .locals 10
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 87
    .local p2, "users":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    .local p3, "apps":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/data/ApiApplication;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    const-wide/16 v8, 0x0

    iput-wide v8, p0, Lcom/vkontakte/android/data/GameRequest;->id:J

    .line 63
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/vkontakte/android/data/GameRequest;->fromDb:Z

    .line 89
    :try_start_0
    const-string/jumbo v8, "app_id"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/data/GameRequest;->appId:I

    .line 90
    iget v8, p0, Lcom/vkontakte/android/data/GameRequest;->appId:I

    invoke-virtual {p3, v8}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/data/ApiApplication;

    iput-object v8, p0, Lcom/vkontakte/android/data/GameRequest;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    .line 91
    iget-object v8, p0, Lcom/vkontakte/android/data/GameRequest;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v8, v8, Lcom/vkontakte/android/data/ApiApplication;->title:Ljava/lang/String;

    iput-object v8, p0, Lcom/vkontakte/android/data/GameRequest;->appTitle:Ljava/lang/String;

    .line 92
    iget-object v8, p0, Lcom/vkontakte/android/data/GameRequest;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v8, v8, Lcom/vkontakte/android/data/ApiApplication;->genre:Ljava/lang/String;

    iput-object v8, p0, Lcom/vkontakte/android/data/GameRequest;->appGenre:Ljava/lang/String;

    .line 93
    iget-object v8, p0, Lcom/vkontakte/android/data/GameRequest;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v8, v8, Lcom/vkontakte/android/data/ApiApplication;->icon:Lcom/vkontakte/android/Photo;

    const/high16 v9, 0x42400000    # 48.0f

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/Photo;->getImageByWidth(I)Lcom/vkontakte/android/Photo$Image;

    move-result-object v8

    iget-object v8, v8, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    iput-object v8, p0, Lcom/vkontakte/android/data/GameRequest;->appUrl:Ljava/lang/String;

    .line 94
    iget-object v8, p0, Lcom/vkontakte/android/data/GameRequest;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v8, v8, Lcom/vkontakte/android/data/ApiApplication;->packageName:Ljava/lang/String;

    iput-object v8, p0, Lcom/vkontakte/android/data/GameRequest;->appPackage:Ljava/lang/String;

    .line 96
    const-string/jumbo v8, "text"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/vkontakte/android/data/GameRequest;->text:Ljava/lang/String;

    .line 97
    const-string/jumbo v8, "type"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 98
    .local v5, "tp":Ljava/lang/String;
    const-string/jumbo v8, "request"

    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 99
    const/4 v8, 0x2

    iput v8, p0, Lcom/vkontakte/android/data/GameRequest;->type:I

    .line 104
    :cond_0
    :goto_0
    const-string/jumbo v8, "from"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 105
    .local v1, "fromJson":Lorg/json/JSONArray;
    if-eqz v1, :cond_4

    .line 106
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    .line 107
    .local v4, "length":I
    new-array v8, v4, [I

    iput-object v8, p0, Lcom/vkontakte/android/data/GameRequest;->fromIds:[I

    .line 108
    new-array v8, v4, [I

    iput-object v8, p0, Lcom/vkontakte/android/data/GameRequest;->userProfilesId:[I

    .line 109
    new-array v2, v4, [I

    .line 110
    .local v2, "fromTimes":[I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v4, :cond_3

    .line 111
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 112
    .local v0, "from":Lorg/json/JSONObject;
    iget-object v8, p0, Lcom/vkontakte/android/data/GameRequest;->fromIds:[I

    const-string/jumbo v9, "id"

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    aput v9, v8, v3

    .line 113
    if-nez v3, :cond_1

    .line 114
    const-string/jumbo v8, "key"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/vkontakte/android/data/GameRequest;->key:Ljava/lang/String;

    .line 116
    :cond_1
    const-string/jumbo v8, "from_id"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    .line 117
    .local v6, "userId":I
    iget-object v8, p0, Lcom/vkontakte/android/data/GameRequest;->userProfilesId:[I

    aput v6, v8, v3

    .line 118
    const-string/jumbo v8, "date"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    aput v8, v2, v3

    .line 110
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 100
    .end local v0    # "from":Lorg/json/JSONObject;
    .end local v1    # "fromJson":Lorg/json/JSONArray;
    .end local v2    # "fromTimes":[I
    .end local v3    # "i":I
    .end local v4    # "length":I
    .end local v6    # "userId":I
    :cond_2
    const-string/jumbo v8, "invite"

    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 101
    const/4 v8, 0x1

    iput v8, p0, Lcom/vkontakte/android/data/GameRequest;->type:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 125
    .end local v5    # "tp":Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 126
    .local v7, "x":Ljava/lang/Exception;
    const-string/jumbo v8, "vk"

    invoke-static {v8, v7}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 128
    .end local v7    # "x":Ljava/lang/Exception;
    :goto_2
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/data/GameRequest;->fillUserProfiles(Landroid/util/SparseArray;)V

    .line 129
    return-void

    .line 120
    .restart local v1    # "fromJson":Lorg/json/JSONArray;
    .restart local v2    # "fromTimes":[I
    .restart local v3    # "i":I
    .restart local v4    # "length":I
    .restart local v5    # "tp":Ljava/lang/String;
    :cond_3
    :try_start_1
    invoke-static {v2}, Lcom/vkontakte/android/data/GameRequest;->getElderDate([I)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/data/GameRequest;->time:I

    .line 123
    .end local v2    # "fromTimes":[I
    .end local v3    # "i":I
    .end local v4    # "length":I
    :cond_4
    const-string/jumbo v8, "name"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/vkontakte/android/data/GameRequest;->name:Ljava/lang/String;

    .line 124
    const-string/jumbo v8, "unread"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_5

    const/4 v8, 0x1

    :goto_3
    iput-boolean v8, p0, Lcom/vkontakte/android/data/GameRequest;->unread:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :cond_5
    const/4 v8, 0x0

    goto :goto_3
.end method

.method public static createSql()Ljava/lang/String;
    .locals 2

    .prologue
    .line 288
    new-instance v0, Lcom/vkontakte/android/data/db/Table;

    const-string/jumbo v1, "game_requests"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/data/db/Table;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "_id"

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table;->withIntegerColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/db/Table$Column;->setPrimaryKey()Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/db/Table$Column;->setAutoincrement()Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "type"

    .line 289
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withIntegerColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "text"

    .line 290
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withTextColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "name"

    .line 291
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withTextColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "unread"

    .line 292
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withIntegerColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "app_id"

    .line 293
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withIntegerColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "app_genre"

    .line 294
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withTextColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "app_title"

    .line 295
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withTextColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "app_url"

    .line 296
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withTextColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "app_package"

    .line 297
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withTextColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "key"

    .line 298
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withTextColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "from_ids"

    .line 299
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withTextColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "user_profile_ids"

    .line 300
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withTextColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "date"

    .line 301
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withIntegerColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    .line 302
    invoke-virtual {v0}, Lcom/vkontakte/android/data/db/Table$Column;->createSql()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getElderDate([I)I
    .locals 4
    .param p0, "fromTimes"    # [I

    .prologue
    .line 173
    const/4 v1, 0x0

    .line 174
    .local v1, "time":I
    if-eqz p0, :cond_1

    .line 175
    array-length v3, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_1

    aget v0, p0, v2

    .line 176
    .local v0, "l":I
    if-le v0, v1, :cond_0

    move v1, v0

    .line 175
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 179
    .end local v0    # "l":I
    :cond_1
    return v1
.end method

.method private hashArray([I)I
    .locals 4
    .param p1, "ids"    # [I

    .prologue
    const/4 v2, 0x0

    .line 161
    if-nez p1, :cond_1

    move v1, v2

    .line 168
    :cond_0
    return v1

    .line 164
    :cond_1
    const/4 v1, 0x0

    .line 165
    .local v1, "ret":I
    array-length v3, p1

    :goto_0
    if-ge v2, v3, :cond_0

    aget v0, p1, v2

    .line 166
    .local v0, "i":I
    add-int/2addr v1, v0

    .line 165
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private static intArrayToString([I)Ljava/lang/String;
    .locals 3
    .param p0, "array"    # [I

    .prologue
    .line 308
    if-nez p0, :cond_0

    .line 309
    const/4 v2, 0x0

    .line 319
    :goto_0
    return-object v2

    .line 310
    :cond_0
    array-length v2, p0

    if-nez v2, :cond_1

    .line 311
    const-string/jumbo v2, ""

    goto :goto_0

    .line 313
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    array-length v2, p0

    mul-int/lit8 v2, v2, 0x6

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 314
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    aget v2, p0, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 315
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_2

    .line 316
    const-string/jumbo v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    aget v2, p0, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 315
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 319
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private static stringToIntArray(Ljava/lang/String;)[I
    .locals 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 323
    if-nez p0, :cond_1

    .line 324
    const/4 v1, 0x0

    .line 333
    :cond_0
    :goto_0
    return-object v1

    .line 325
    :cond_1
    const-string/jumbo v3, ""

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 326
    const/4 v3, 0x0

    new-array v1, v3, [I

    goto :goto_0

    .line 328
    :cond_2
    const-string/jumbo v3, ","

    invoke-virtual {p0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 329
    .local v2, "strings":[Ljava/lang/String;
    array-length v3, v2

    new-array v1, v3, [I

    .line 330
    .local v1, "ret":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v3, v2

    if-ge v0, v3, :cond_0

    .line 331
    aget-object v3, v2, v0

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    aput v3, v1, v0

    .line 330
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 233
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 143
    instance-of v2, p1, Lcom/vkontakte/android/data/GameRequest;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 144
    check-cast v0, Lcom/vkontakte/android/data/GameRequest;

    .line 145
    .local v0, "r":Lcom/vkontakte/android/data/GameRequest;
    iget v2, p0, Lcom/vkontakte/android/data/GameRequest;->type:I

    iget v3, v0, Lcom/vkontakte/android/data/GameRequest;->type:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lcom/vkontakte/android/data/GameRequest;->appId:I

    iget v3, v0, Lcom/vkontakte/android/data/GameRequest;->appId:I

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->text:Ljava/lang/String;

    iget-object v3, v0, Lcom/vkontakte/android/data/GameRequest;->text:Ljava/lang/String;

    .line 147
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->name:Ljava/lang/String;

    iget-object v3, v0, Lcom/vkontakte/android/data/GameRequest;->name:Ljava/lang/String;

    .line 148
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->fromIds:[I

    iget-object v3, v0, Lcom/vkontakte/android/data/GameRequest;->fromIds:[I

    .line 149
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 151
    .end local v0    # "r":Lcom/vkontakte/android/data/GameRequest;
    :cond_0
    return v1
.end method

.method public fillUserProfiles(Landroid/util/SparseArray;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 132
    .local p1, "users":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->userProfiles:Ljava/util/ArrayList;

    .line 134
    iget-object v3, p0, Lcom/vkontakte/android/data/GameRequest;->userProfilesId:[I

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_1

    aget v0, v3, v2

    .line 135
    .local v0, "i":I
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .local v1, "userProfile":Lcom/vkontakte/android/UserProfile;
    if-eqz v1, :cond_0

    .line 136
    iget-object v5, p0, Lcom/vkontakte/android/data/GameRequest;->userProfiles:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 139
    .end local v0    # "i":I
    .end local v1    # "userProfile":Lcom/vkontakte/android/UserProfile;
    :cond_1
    return-void
.end method

.method public getTag()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->tag:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 157
    iget v0, p0, Lcom/vkontakte/android/data/GameRequest;->type:I

    iget v1, p0, Lcom/vkontakte/android/data/GameRequest;->appId:I

    mul-int/lit8 v1, v1, 0x3

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/vkontakte/android/data/GameRequest;->fromIds:[I

    invoke-direct {p0, v1}, Lcom/vkontakte/android/data/GameRequest;->hashArray([I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public setTag(Ljava/lang/Object;)V
    .locals 0
    .param p1, "tag"    # Ljava/lang/Object;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/vkontakte/android/data/GameRequest;->tag:Ljava/lang/Object;

    .line 82
    return-void
.end method

.method public toContentValues()Landroid/content/ContentValues;
    .locals 6

    .prologue
    .line 267
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 268
    .local v0, "cv":Landroid/content/ContentValues;
    iget-wide v2, p0, Lcom/vkontakte/android/data/GameRequest;->id:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    .line 269
    const-string/jumbo v1, "_id"

    iget-wide v2, p0, Lcom/vkontakte/android/data/GameRequest;->id:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 271
    :cond_0
    const-string/jumbo v1, "type"

    iget v2, p0, Lcom/vkontakte/android/data/GameRequest;->type:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 272
    const-string/jumbo v1, "text"

    iget-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->text:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    const-string/jumbo v1, "name"

    iget-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    const-string/jumbo v2, "unread"

    iget-boolean v1, p0, Lcom/vkontakte/android/data/GameRequest;->unread:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 275
    const-string/jumbo v1, "app_id"

    iget v2, p0, Lcom/vkontakte/android/data/GameRequest;->appId:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 276
    const-string/jumbo v1, "app_genre"

    iget-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->appGenre:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    const-string/jumbo v1, "app_title"

    iget-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->appTitle:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    const-string/jumbo v1, "app_url"

    iget-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->appUrl:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    const-string/jumbo v1, "app_package"

    iget-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->appPackage:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    const-string/jumbo v1, "key"

    iget-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->key:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    const-string/jumbo v1, "from_ids"

    iget-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->fromIds:[I

    invoke-static {v2}, Lcom/vkontakte/android/data/GameRequest;->intArrayToString([I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    const-string/jumbo v1, "user_profile_ids"

    iget-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->userProfilesId:[I

    invoke-static {v2}, Lcom/vkontakte/android/data/GameRequest;->intArrayToString([I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    const-string/jumbo v1, "date"

    iget v2, p0, Lcom/vkontakte/android/data/GameRequest;->time:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 284
    return-object v0

    .line 274
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "parcel"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 209
    iget v0, p0, Lcom/vkontakte/android/data/GameRequest;->type:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 210
    iget-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->text:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 211
    iget-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 212
    iget-boolean v0, p0, Lcom/vkontakte/android/data/GameRequest;->unread:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 214
    iget v0, p0, Lcom/vkontakte/android/data/GameRequest;->appId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 215
    iget-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->appGenre:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 216
    iget-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->appTitle:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 217
    iget-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->appUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 218
    iget-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->appPackage:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 220
    iget-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->fromIds:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 221
    iget-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->key:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 222
    iget-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->userProfilesId:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 224
    iget-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->userProfiles:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 226
    iget-boolean v0, p0, Lcom/vkontakte/android/data/GameRequest;->fromDb:Z

    if-eqz v0, :cond_1

    :goto_1
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    .line 227
    iget v0, p0, Lcom/vkontakte/android/data/GameRequest;->time:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 228
    iget-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 229
    return-void

    :cond_0
    move v0, v2

    .line 212
    goto :goto_0

    :cond_1
    move v1, v2

    .line 226
    goto :goto_1
.end method
