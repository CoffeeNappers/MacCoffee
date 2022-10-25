.class public Lcom/vkontakte/android/data/ApiApplication;
.super Ljava/lang/Object;
.source "ApiApplication.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Lcom/vkontakte/android/data/ServerKeys;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;"
        }
    .end annotation
.end field

.field private static final ICON_SIZES:[I

.field public static final LEADERBOARD_TYPE_LEVEL:I = 0x1

.field public static final LEADERBOARD_TYPE_NOT_SUPPORTED:I = 0x0

.field public static final LEADERBOARD_TYPE_POINTS:I = 0x2

.field public static final SCREEN_ORIENTATION_BOTH:I = 0x0

.field public static final SCREEN_ORIENTATION_LANDSCAPE:I = 0x1

.field public static final SCREEN_ORIENTATION_PORTRAIT:I = 0x2


# instance fields
.field public author_group:I

.field public banner:Ljava/lang/String;

.field public bannerBig:Ljava/lang/String;

.field public catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

.field public description:Ljava/lang/String;

.field public friends:I

.field public friendsPhotos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public genre:Ljava/lang/String;

.field public icon:Lcom/vkontakte/android/Photo;

.field public id:I

.field public installed:Z

.field public installedOnDevice:Z

.field public isHtml5App:Z

.field public isInCatalog:Z

.field public isNew:Z

.field public leaderboardType:I

.field public members:I

.field public notificationCount:I

.field public notificationsEnabled:Z

.field public packageName:Ljava/lang/String;

.field public screenOrientation:I

.field public screenshot:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;"
        }
    .end annotation
.end field

.field public shortDescription:Ljava/lang/String;

.field public title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const/4 v0, 0x6

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vkontakte/android/data/ApiApplication;->ICON_SIZES:[I

    .line 206
    new-instance v0, Lcom/vkontakte/android/data/ApiApplication$1;

    invoke-direct {v0}, Lcom/vkontakte/android/data/ApiApplication$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/ApiApplication;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void

    .line 18
    :array_0
    .array-data 4
        0x4b
        0x8b
        0x96
        0x116
        0x230
        0x460
    .end array-data
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/data/ApiApplication;->isNew:Z

    .line 40
    iput-object v2, p0, Lcom/vkontakte/android/data/ApiApplication;->screenshot:Ljava/util/ArrayList;

    .line 41
    iput v1, p0, Lcom/vkontakte/android/data/ApiApplication;->author_group:I

    .line 42
    iput-boolean v1, p0, Lcom/vkontakte/android/data/ApiApplication;->installed:Z

    .line 43
    iput-boolean v1, p0, Lcom/vkontakte/android/data/ApiApplication;->installedOnDevice:Z

    .line 44
    iput-boolean v1, p0, Lcom/vkontakte/android/data/ApiApplication;->isInCatalog:Z

    .line 45
    iput-boolean v1, p0, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    .line 46
    iput v1, p0, Lcom/vkontakte/android/data/ApiApplication;->notificationCount:I

    .line 52
    iput-object v2, p0, Lcom/vkontakte/android/data/ApiApplication;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->friendsPhotos:Ljava/util/ArrayList;

    .line 59
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-boolean v1, p0, Lcom/vkontakte/android/data/ApiApplication;->isNew:Z

    .line 40
    iput-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->screenshot:Ljava/util/ArrayList;

    .line 41
    iput v2, p0, Lcom/vkontakte/android/data/ApiApplication;->author_group:I

    .line 42
    iput-boolean v2, p0, Lcom/vkontakte/android/data/ApiApplication;->installed:Z

    .line 43
    iput-boolean v2, p0, Lcom/vkontakte/android/data/ApiApplication;->installedOnDevice:Z

    .line 44
    iput-boolean v2, p0, Lcom/vkontakte/android/data/ApiApplication;->isInCatalog:Z

    .line 45
    iput-boolean v2, p0, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    .line 46
    iput v2, p0, Lcom/vkontakte/android/data/ApiApplication;->notificationCount:I

    .line 52
    iput-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->friendsPhotos:Ljava/util/ArrayList;

    .line 181
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/ApiApplication;->id:I

    .line 182
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->title:Ljava/lang/String;

    .line 183
    const-class v0, Lcom/vkontakte/android/Photo;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Photo;

    iput-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->icon:Lcom/vkontakte/android/Photo;

    .line 184
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->banner:Ljava/lang/String;

    .line 185
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->bannerBig:Ljava/lang/String;

    .line 186
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->description:Ljava/lang/String;

    .line 187
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->shortDescription:Ljava/lang/String;

    .line 188
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/ApiApplication;->members:I

    .line 189
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/ApiApplication;->friends:I

    .line 190
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->packageName:Ljava/lang/String;

    .line 191
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->genre:Ljava/lang/String;

    .line 192
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/data/ApiApplication;->isNew:Z

    .line 193
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/vkontakte/android/data/ApiApplication;->notificationsEnabled:Z

    .line 194
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/ApiApplication;->notificationCount:I

    .line 195
    sget-object v0, Lcom/vkontakte/android/Photo;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->screenshot:Ljava/util/ArrayList;

    .line 196
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/ApiApplication;->author_group:I

    .line 197
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_2

    move v0, v1

    :goto_2
    iput-boolean v0, p0, Lcom/vkontakte/android/data/ApiApplication;->installed:Z

    .line 198
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_3

    move v0, v1

    :goto_3
    iput-boolean v0, p0, Lcom/vkontakte/android/data/ApiApplication;->installedOnDevice:Z

    .line 199
    const-class v0, Lcom/vkontakte/android/data/CatalogInfo;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/CatalogInfo;

    iput-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    .line 200
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_4

    move v0, v1

    :goto_4
    iput-boolean v0, p0, Lcom/vkontakte/android/data/ApiApplication;->isInCatalog:Z

    .line 201
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_5

    :goto_5
    iput-boolean v1, p0, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    .line 202
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/ApiApplication;->screenOrientation:I

    .line 203
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/ApiApplication;->leaderboardType:I

    .line 204
    return-void

    :cond_0
    move v0, v2

    .line 192
    goto :goto_0

    :cond_1
    move v0, v2

    .line 193
    goto :goto_1

    :cond_2
    move v0, v2

    .line 197
    goto :goto_2

    :cond_3
    move v0, v2

    .line 198
    goto :goto_3

    :cond_4
    move v0, v2

    .line 200
    goto :goto_4

    :cond_5
    move v1, v2

    .line 201
    goto :goto_5
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vkontakte/android/data/ApiApplication$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vkontakte/android/data/ApiApplication$1;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/vkontakte/android/data/ApiApplication;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 12
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    const/4 v7, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-boolean v5, p0, Lcom/vkontakte/android/data/ApiApplication;->isNew:Z

    .line 40
    iput-object v7, p0, Lcom/vkontakte/android/data/ApiApplication;->screenshot:Ljava/util/ArrayList;

    .line 41
    iput v6, p0, Lcom/vkontakte/android/data/ApiApplication;->author_group:I

    .line 42
    iput-boolean v6, p0, Lcom/vkontakte/android/data/ApiApplication;->installed:Z

    .line 43
    iput-boolean v6, p0, Lcom/vkontakte/android/data/ApiApplication;->installedOnDevice:Z

    .line 44
    iput-boolean v6, p0, Lcom/vkontakte/android/data/ApiApplication;->isInCatalog:Z

    .line 45
    iput-boolean v6, p0, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    .line 46
    iput v6, p0, Lcom/vkontakte/android/data/ApiApplication;->notificationCount:I

    .line 52
    iput-object v7, p0, Lcom/vkontakte/android/data/ApiApplication;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    .line 54
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/vkontakte/android/data/ApiApplication;->friendsPhotos:Ljava/util/ArrayList;

    .line 63
    :try_start_0
    const-string/jumbo v7, "id"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/data/ApiApplication;->id:I

    .line 64
    const-string/jumbo v7, "title"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/data/ApiApplication;->title:Ljava/lang/String;

    .line 65
    const-string/jumbo v7, "description"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/data/ApiApplication;->description:Ljava/lang/String;

    .line 66
    iget-object v7, p0, Lcom/vkontakte/android/data/ApiApplication;->description:Ljava/lang/String;

    invoke-static {v7}, Lcom/vkontakte/android/data/ApiApplication;->generateShortDescription(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/data/ApiApplication;->shortDescription:Ljava/lang/String;

    .line 67
    new-instance v7, Lcom/vkontakte/android/Photo;

    invoke-direct {v7}, Lcom/vkontakte/android/Photo;-><init>()V

    iput-object v7, p0, Lcom/vkontakte/android/data/ApiApplication;->icon:Lcom/vkontakte/android/Photo;

    .line 68
    sget-object v8, Lcom/vkontakte/android/data/ApiApplication;->ICON_SIZES:[I

    array-length v9, v8

    move v7, v6

    :goto_0
    if-ge v7, v9, :cond_0

    aget v0, v8, v7

    .line 69
    .local v0, "ICON_SIZE":I
    new-instance v2, Lcom/vkontakte/android/Photo$Image;

    invoke-direct {v2}, Lcom/vkontakte/android/Photo$Image;-><init>()V

    .line 70
    .local v2, "image":Lcom/vkontakte/android/Photo$Image;
    iget-object v10, p0, Lcom/vkontakte/android/data/ApiApplication;->icon:Lcom/vkontakte/android/Photo;

    iget-object v10, v10, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    iput v0, v2, Lcom/vkontakte/android/Photo$Image;->height:I

    .line 72
    iput v0, v2, Lcom/vkontakte/android/Photo$Image;->width:I

    .line 73
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "icon_"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p1, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v2, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .line 68
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 76
    .end local v0    # "ICON_SIZE":I
    .end local v2    # "image":Lcom/vkontakte/android/Photo$Image;
    :cond_0
    const-string/jumbo v7, "platform_id"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/data/ApiApplication;->packageName:Ljava/lang/String;

    .line 77
    const-string/jumbo v7, "new"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    if-ne v7, v5, :cond_2

    move v7, v5

    :goto_1
    iput-boolean v7, p0, Lcom/vkontakte/android/data/ApiApplication;->isNew:Z

    .line 78
    const-string/jumbo v7, "members_count"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/data/ApiApplication;->members:I

    .line 79
    const-string/jumbo v7, "banner_560"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/data/ApiApplication;->banner:Ljava/lang/String;

    .line 80
    const-string/jumbo v7, "banner_1120"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/data/ApiApplication;->bannerBig:Ljava/lang/String;

    .line 81
    const-string/jumbo v7, "genre"

    const-string/jumbo v8, "No Genre"

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/data/ApiApplication;->genre:Ljava/lang/String;

    .line 82
    const-string/jumbo v7, "push_enabled"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    if-ne v7, v5, :cond_3

    move v7, v5

    :goto_2
    iput-boolean v7, p0, Lcom/vkontakte/android/data/ApiApplication;->notificationsEnabled:Z

    .line 83
    const-string/jumbo v7, "friends"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 84
    const-string/jumbo v7, "friends"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/data/ApiApplication;->friends:I

    .line 86
    :cond_1
    const-string/jumbo v7, "screenshots"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 87
    .local v3, "jsonArray":Lorg/json/JSONArray;
    if-eqz v3, :cond_4

    .line 88
    new-instance v7, Ljava/util/ArrayList;

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v8

    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v7, p0, Lcom/vkontakte/android/data/ApiApplication;->screenshot:Ljava/util/ArrayList;

    .line 89
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v1, v7, :cond_4

    .line 90
    iget-object v7, p0, Lcom/vkontakte/android/data/ApiApplication;->screenshot:Ljava/util/ArrayList;

    new-instance v8, Lcom/vkontakte/android/Photo;

    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/vkontakte/android/Photo;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .end local v1    # "i":I
    .end local v3    # "jsonArray":Lorg/json/JSONArray;
    :cond_2
    move v7, v6

    .line 77
    goto :goto_1

    :cond_3
    move v7, v6

    .line 82
    goto :goto_2

    .line 93
    .restart local v3    # "jsonArray":Lorg/json/JSONArray;
    :cond_4
    const-string/jumbo v7, "author_group"

    const/4 v8, 0x0

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/data/ApiApplication;->author_group:I

    .line 94
    const-string/jumbo v7, "installed"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/vkontakte/android/data/ApiApplication;->installed:Z

    .line 95
    iget-object v7, p0, Lcom/vkontakte/android/data/ApiApplication;->packageName:Ljava/lang/String;

    sget-object v8, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v7, v8}, Lcom/vkontakte/android/data/Games;->isAppInstalledOnDevice(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/vkontakte/android/data/ApiApplication;->installedOnDevice:Z

    .line 96
    const-string/jumbo v7, "is_in_catalog"

    const/4 v8, 0x0

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    if-eqz v7, :cond_5

    move v7, v5

    :goto_4
    iput-boolean v7, p0, Lcom/vkontakte/android/data/ApiApplication;->isInCatalog:Z

    .line 97
    const-string/jumbo v7, "is_html5_app"

    const/4 v8, 0x0

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    if-eqz v7, :cond_6

    :goto_5
    iput-boolean v5, p0, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    .line 98
    const-string/jumbo v5, "screen_orientation"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/vkontakte/android/data/ApiApplication;->screenOrientation:I

    .line 99
    const-string/jumbo v5, "leaderboard_type"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/vkontakte/android/data/ApiApplication;->leaderboardType:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    .end local v3    # "jsonArray":Lorg/json/JSONArray;
    :goto_6
    return-void

    .restart local v3    # "jsonArray":Lorg/json/JSONArray;
    :cond_5
    move v7, v6

    .line 96
    goto :goto_4

    :cond_6
    move v5, v6

    .line 97
    goto :goto_5

    .line 100
    .end local v3    # "jsonArray":Lorg/json/JSONArray;
    :catch_0
    move-exception v4

    .line 101
    .local v4, "x":Ljava/lang/Exception;
    const-string/jumbo v5, "vk"

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6
.end method

.method private static generateShortDescription(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "description"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v5, 0x0

    .line 106
    if-nez p0, :cond_1

    .line 107
    const/4 p0, 0x0

    .line 122
    .end local p0    # "description":Ljava/lang/String;
    .local v1, "chars":[C
    .local v2, "count":I
    .local v3, "i":I
    :cond_0
    :goto_0
    return-object p0

    .line 109
    .end local v1    # "chars":[C
    .end local v2    # "count":I
    .end local v3    # "i":I
    .restart local p0    # "description":Ljava/lang/String;
    :cond_1
    const/4 v4, 0x4

    new-array v1, v4, [C

    fill-array-data v1, :array_0

    .line 110
    .restart local v1    # "chars":[C
    const/4 v2, 0x0

    .line 111
    .restart local v2    # "count":I
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 112
    array-length v6, v1

    move v4, v5

    :goto_2
    if-ge v4, v6, :cond_2

    aget-char v0, v1, v4

    .line 113
    .local v0, "aChar":C
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v0, v7, :cond_3

    .line 114
    add-int/lit8 v2, v2, 0x1

    .line 118
    .end local v0    # "aChar":C
    :cond_2
    const/4 v4, 0x1

    if-lt v2, v4, :cond_4

    .line 119
    add-int/lit8 v4, v3, 0x1

    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 112
    .restart local v0    # "aChar":C
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 111
    .end local v0    # "aChar":C
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 109
    nop

    :array_0
    .array-data 2
        0x2es
        0x21s
        0x3fs
        0x3bs
    .end array-data
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 150
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 128
    instance-of v0, p1, Lcom/vkontakte/android/data/ApiApplication;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/data/ApiApplication;->id:I

    check-cast p1, Lcom/vkontakte/android/data/ApiApplication;

    .end local p1    # "o":Ljava/lang/Object;
    iget v1, p1, Lcom/vkontakte/android/data/ApiApplication;->id:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 133
    iget v0, p0, Lcom/vkontakte/android/data/ApiApplication;->id:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x27

    .line 138
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ApiApplication_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/data/ApiApplication;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", title=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/data/ApiApplication;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", description=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/data/ApiApplication;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", packageName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/data/ApiApplication;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", members="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/data/ApiApplication;->members:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 155
    iget v0, p0, Lcom/vkontakte/android/data/ApiApplication;->id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 156
    iget-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 157
    iget-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->icon:Lcom/vkontakte/android/Photo;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 158
    iget-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->banner:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 159
    iget-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->bannerBig:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 160
    iget-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->shortDescription:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 162
    iget v0, p0, Lcom/vkontakte/android/data/ApiApplication;->members:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 163
    iget v0, p0, Lcom/vkontakte/android/data/ApiApplication;->friends:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->packageName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 165
    iget-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->genre:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 166
    iget-boolean v0, p0, Lcom/vkontakte/android/data/ApiApplication;->isNew:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 167
    iget-boolean v0, p0, Lcom/vkontakte/android/data/ApiApplication;->notificationsEnabled:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 168
    iget v0, p0, Lcom/vkontakte/android/data/ApiApplication;->notificationCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 169
    iget-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->screenshot:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 170
    iget v0, p0, Lcom/vkontakte/android/data/ApiApplication;->author_group:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 171
    iget-boolean v0, p0, Lcom/vkontakte/android/data/ApiApplication;->installed:Z

    if-eqz v0, :cond_2

    move v0, v1

    :goto_2
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 172
    iget-boolean v0, p0, Lcom/vkontakte/android/data/ApiApplication;->installedOnDevice:Z

    if-eqz v0, :cond_3

    move v0, v1

    :goto_3
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 173
    iget-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 174
    iget-boolean v0, p0, Lcom/vkontakte/android/data/ApiApplication;->isInCatalog:Z

    if-eqz v0, :cond_4

    move v0, v1

    :goto_4
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 175
    iget-boolean v0, p0, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    if-eqz v0, :cond_5

    :goto_5
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    .line 176
    iget v0, p0, Lcom/vkontakte/android/data/ApiApplication;->screenOrientation:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 177
    iget v0, p0, Lcom/vkontakte/android/data/ApiApplication;->leaderboardType:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 178
    return-void

    :cond_0
    move v0, v2

    .line 166
    goto :goto_0

    :cond_1
    move v0, v2

    .line 167
    goto :goto_1

    :cond_2
    move v0, v2

    .line 171
    goto :goto_2

    :cond_3
    move v0, v2

    .line 172
    goto :goto_3

    :cond_4
    move v0, v2

    .line 174
    goto :goto_4

    :cond_5
    move v1, v2

    .line 175
    goto :goto_5
.end method
