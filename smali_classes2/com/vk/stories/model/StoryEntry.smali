.class public Lcom/vk/stories/model/StoryEntry;
.super Ljava/lang/Object;
.source "StoryEntry.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vk/stories/model/StoryEntry;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public accessKey:Ljava/lang/String;

.field public canComment:Z

.field public canShare:Z

.field public date:J

.field public expired:Z

.field private fullFile:Ljava/io/File;

.field public id:I

.field public isPrivate:Z

.field public isPromo:Z

.field public local:Z

.field private localPreview:Ljava/io/File;

.field public openUrl:Ljava/lang/String;

.field public ownerId:I

.field public ownerName:Ljava/lang/String;

.field public ownerPhoto:Ljava/lang/String;

.field public photo:Lcom/vkontakte/android/Photo;

.field public preview:Ljava/lang/String;

.field public seen:Z

.field public type:Ljava/lang/String;

.field public video:Lcom/vkontakte/android/api/VideoFile;

.field public viewsCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 348
    new-instance v0, Lcom/vk/stories/model/StoryEntry$1;

    invoke-direct {v0}, Lcom/vk/stories/model/StoryEntry$1;-><init>()V

    sput-object v0, Lcom/vk/stories/model/StoryEntry;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 6
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 325
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 326
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->local:Z

    .line 327
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    .line 328
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    .line 329
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->type:Ljava/lang/String;

    .line 330
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/vk/stories/model/StoryEntry;->date:J

    .line 331
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->seen:Z

    .line 332
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_2

    move v0, v1

    :goto_2
    iput-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->expired:Z

    .line 333
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->preview:Ljava/lang/String;

    .line 334
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/stories/model/StoryEntry;->viewsCount:I

    .line 335
    const-class v0, Lcom/vkontakte/android/Photo;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Photo;

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->photo:Lcom/vkontakte/android/Photo;

    .line 336
    const-class v0, Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/VideoFile;

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    .line 337
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->localPreview:Ljava/io/File;

    .line 338
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->accessKey:Ljava/lang/String;

    .line 339
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_3

    move v0, v1

    :goto_3
    iput-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->isPrivate:Z

    .line 340
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_4

    move v0, v1

    :goto_4
    iput-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->canShare:Z

    .line 341
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_5

    move v0, v1

    :goto_5
    iput-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->canComment:Z

    .line 342
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_6

    :goto_6
    iput-boolean v1, p0, Lcom/vk/stories/model/StoryEntry;->isPromo:Z

    .line 343
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->openUrl:Ljava/lang/String;

    .line 344
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->ownerPhoto:Ljava/lang/String;

    .line 345
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->ownerName:Ljava/lang/String;

    .line 346
    return-void

    :cond_0
    move v0, v2

    .line 326
    goto/16 :goto_0

    :cond_1
    move v0, v2

    .line 331
    goto :goto_1

    :cond_2
    move v0, v2

    .line 332
    goto :goto_2

    :cond_3
    move v0, v2

    .line 339
    goto :goto_3

    :cond_4
    move v0, v2

    .line 340
    goto :goto_4

    :cond_5
    move v0, v2

    .line 341
    goto :goto_5

    :cond_6
    move v1, v2

    .line 342
    goto :goto_6
.end method

.method public constructor <init>(Lcom/vk/stories/StoriesController$StoryUpload;)V
    .locals 4
    .param p1, "upload"    # Lcom/vk/stories/StoriesController$StoryUpload;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-boolean v3, p0, Lcom/vk/stories/model/StoryEntry;->local:Z

    .line 88
    invoke-virtual {p1}, Lcom/vk/stories/StoriesController$StoryUpload;->localId()I

    move-result v0

    iput v0, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    .line 89
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    iput v0, p0, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    .line 90
    invoke-virtual {p1}, Lcom/vk/stories/StoriesController$StoryUpload;->type()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->type:Ljava/lang/String;

    .line 91
    invoke-virtual {p1}, Lcom/vk/stories/StoriesController$StoryUpload;->date()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vk/stories/model/StoryEntry;->date:J

    .line 92
    iput-object v2, p0, Lcom/vk/stories/model/StoryEntry;->photo:Lcom/vkontakte/android/Photo;

    .line 93
    iput-object v2, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    .line 94
    invoke-virtual {p1}, Lcom/vk/stories/StoriesController$StoryUpload;->previewFile()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->localPreview:Ljava/io/File;

    .line 95
    invoke-virtual {p1}, Lcom/vk/stories/StoriesController$StoryUpload;->fullFile()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->fullFile:Ljava/io/File;

    .line 96
    iput-boolean v3, p0, Lcom/vk/stories/model/StoryEntry;->canShare:Z

    .line 97
    iput-boolean v3, p0, Lcom/vk/stories/model/StoryEntry;->canComment:Z

    .line 98
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->isPromo:Z

    .line 99
    iput-object v2, p0, Lcom/vk/stories/model/StoryEntry;->openUrl:Ljava/lang/String;

    .line 100
    iput-object v2, p0, Lcom/vk/stories/model/StoryEntry;->ownerPhoto:Ljava/lang/String;

    .line 101
    iput-object v2, p0, Lcom/vk/stories/model/StoryEntry;->ownerName:Ljava/lang/String;

    .line 102
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 9
    .param p1, "jsonObject"    # Lorg/json/JSONObject;

    .prologue
    const/4 v8, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-boolean v4, p0, Lcom/vk/stories/model/StoryEntry;->local:Z

    .line 46
    const-string/jumbo v2, "id"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    .line 47
    const-string/jumbo v2, "owner_id"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    .line 48
    const-string/jumbo v2, "type"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/model/StoryEntry;->type:Ljava/lang/String;

    .line 49
    const-string/jumbo v2, "preview"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/model/StoryEntry;->preview:Ljava/lang/String;

    .line 50
    iget-object v2, p0, Lcom/vk/stories/model/StoryEntry;->preview:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 51
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "data:mime/type;base64,"

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/vk/stories/model/StoryEntry;->preview:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/model/StoryEntry;->preview:Ljava/lang/String;

    .line 55
    :goto_0
    const-string/jumbo v2, "date"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v6

    iput-wide v6, p0, Lcom/vk/stories/model/StoryEntry;->date:J

    .line 56
    const-string/jumbo v2, "seen"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_1

    move v2, v3

    :goto_1
    iput-boolean v2, p0, Lcom/vk/stories/model/StoryEntry;->seen:Z

    .line 57
    const-string/jumbo v2, "views"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/vk/stories/model/StoryEntry;->viewsCount:I

    .line 58
    const-string/jumbo v2, "expired"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_2

    move v2, v3

    :goto_2
    iput-boolean v2, p0, Lcom/vk/stories/model/StoryEntry;->expired:Z

    .line 60
    const-string/jumbo v2, "photo"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 61
    .local v0, "photoJson":Lorg/json/JSONObject;
    if-eqz v0, :cond_3

    .line 62
    new-instance v2, Lcom/vkontakte/android/Photo;

    invoke-direct {v2, v0}, Lcom/vkontakte/android/Photo;-><init>(Lorg/json/JSONObject;)V

    iput-object v2, p0, Lcom/vk/stories/model/StoryEntry;->photo:Lcom/vkontakte/android/Photo;

    .line 67
    :goto_3
    const-string/jumbo v2, "video"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 68
    .local v1, "videoJson":Lorg/json/JSONObject;
    if-eqz v1, :cond_4

    .line 69
    new-instance v2, Lcom/vkontakte/android/api/VideoFile;

    invoke-direct {v2, v1}, Lcom/vkontakte/android/api/VideoFile;-><init>(Lorg/json/JSONObject;)V

    iput-object v2, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    .line 74
    :goto_4
    const-string/jumbo v2, "access_key"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/model/StoryEntry;->accessKey:Ljava/lang/String;

    .line 75
    const-string/jumbo v2, "is_private"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_5

    move v2, v3

    :goto_5
    iput-boolean v2, p0, Lcom/vk/stories/model/StoryEntry;->isPrivate:Z

    .line 76
    const-string/jumbo v2, "can_share"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_6

    move v2, v3

    :goto_6
    iput-boolean v2, p0, Lcom/vk/stories/model/StoryEntry;->canShare:Z

    .line 77
    const-string/jumbo v2, "can_comment"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_7

    move v2, v3

    :goto_7
    iput-boolean v2, p0, Lcom/vk/stories/model/StoryEntry;->canComment:Z

    .line 80
    const-string/jumbo v2, "is_promo"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_8

    :goto_8
    iput-boolean v3, p0, Lcom/vk/stories/model/StoryEntry;->isPromo:Z

    .line 81
    const-string/jumbo v2, "url"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/model/StoryEntry;->openUrl:Ljava/lang/String;

    .line 82
    const-string/jumbo v2, "owner_photo"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/model/StoryEntry;->ownerPhoto:Ljava/lang/String;

    .line 83
    const-string/jumbo v2, "owner_name"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/stories/model/StoryEntry;->ownerName:Ljava/lang/String;

    .line 84
    return-void

    .line 53
    .end local v0    # "photoJson":Lorg/json/JSONObject;
    .end local v1    # "videoJson":Lorg/json/JSONObject;
    :cond_0
    iput-object v8, p0, Lcom/vk/stories/model/StoryEntry;->preview:Ljava/lang/String;

    goto/16 :goto_0

    :cond_1
    move v2, v4

    .line 56
    goto/16 :goto_1

    :cond_2
    move v2, v4

    .line 58
    goto :goto_2

    .line 64
    .restart local v0    # "photoJson":Lorg/json/JSONObject;
    :cond_3
    iput-object v8, p0, Lcom/vk/stories/model/StoryEntry;->photo:Lcom/vkontakte/android/Photo;

    goto :goto_3

    .line 71
    .restart local v1    # "videoJson":Lorg/json/JSONObject;
    :cond_4
    iput-object v8, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    goto :goto_4

    :cond_5
    move v2, v4

    .line 75
    goto :goto_5

    :cond_6
    move v2, v4

    .line 76
    goto :goto_6

    :cond_7
    move v2, v4

    .line 77
    goto :goto_7

    :cond_8
    move v3, v4

    .line 80
    goto :goto_8
.end method

.method private getLocalFullFilePath()Ljava/lang/String;
    .locals 2

    .prologue
    .line 369
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->fullFile:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 370
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "file://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/model/StoryEntry;->fullFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 372
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getLocalPreviewPath()Ljava/lang/String;
    .locals 2

    .prologue
    .line 361
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->localPreview:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 362
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "file://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/model/StoryEntry;->localPreview:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 364
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static photoSizeByName(Ljava/util/ArrayList;C)Ljava/lang/String;
    .locals 3
    .param p1, "c"    # C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Photo$Image;",
            ">;C)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 377
    .local p0, "sizes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo$Image;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 378
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/Photo$Image;

    .line 379
    .local v1, "image":Lcom/vkontakte/android/Photo$Image;
    iget-char v2, v1, Lcom/vkontakte/android/Photo$Image;->type:C

    if-ne v2, p1, :cond_0

    .line 380
    iget-object v2, v1, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .line 383
    .end local v1    # "image":Lcom/vkontakte/android/Photo$Image;
    :goto_1
    return-object v2

    .line 377
    .restart local v1    # "image":Lcom/vkontakte/android/Photo$Image;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 383
    .end local v1    # "image":Lcom/vkontakte/android/Photo$Image;
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 297
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 277
    if-ne p0, p1, :cond_1

    .line 283
    :cond_0
    :goto_0
    return v1

    .line 278
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 280
    check-cast v0, Lcom/vk/stories/model/StoryEntry;

    .line 282
    .local v0, "that":Lcom/vk/stories/model/StoryEntry;
    iget v3, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    iget v4, v0, Lcom/vk/stories/model/StoryEntry;->id:I

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_0

    .line 283
    :cond_4
    iget v3, p0, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    iget v4, v0, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    if-eq v3, v4, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public getImageBig()Ljava/lang/String;
    .locals 1

    .prologue
    .line 191
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->localPreview:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 192
    invoke-direct {p0}, Lcom/vk/stories/model/StoryEntry;->getLocalPreviewPath()Ljava/lang/String;

    move-result-object v0

    .line 195
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/vk/stories/model/StoryEntry;->getServerImageUrl()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getImageSmall(Z)Ljava/lang/String;
    .locals 4
    .param p1, "realPreview"    # Z

    .prologue
    const/4 v2, 0x0

    .line 154
    iget-object v3, p0, Lcom/vk/stories/model/StoryEntry;->localPreview:Ljava/io/File;

    if-eqz v3, :cond_1

    .line 155
    invoke-direct {p0}, Lcom/vk/stories/model/StoryEntry;->getLocalPreviewPath()Ljava/lang/String;

    move-result-object v0

    .line 186
    :cond_0
    :goto_0
    return-object v0

    .line 158
    :cond_1
    if-nez p1, :cond_2

    iget-object v3, p0, Lcom/vk/stories/model/StoryEntry;->preview:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 159
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->preview:Ljava/lang/String;

    goto :goto_0

    .line 161
    :cond_2
    iget-object v3, p0, Lcom/vk/stories/model/StoryEntry;->photo:Lcom/vkontakte/android/Photo;

    if-eqz v3, :cond_4

    .line 162
    iget-object v3, p0, Lcom/vk/stories/model/StoryEntry;->photo:Lcom/vkontakte/android/Photo;

    iget-object v1, v3, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    .line 165
    .local v1, "sizes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo$Image;>;"
    const/16 v3, 0x6a

    invoke-static {v1, v3}, Lcom/vk/stories/model/StoryEntry;->photoSizeByName(Ljava/util/ArrayList;C)Ljava/lang/String;

    move-result-object v0

    .local v0, "res":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 166
    const/16 v3, 0x78

    invoke-static {v1, v3}, Lcom/vk/stories/model/StoryEntry;->photoSizeByName(Ljava/util/ArrayList;C)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 167
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_3

    .line 168
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/Photo$Image;

    iget-object v0, v2, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    goto :goto_0

    :cond_3
    move-object v0, v2

    .line 170
    goto :goto_0

    .line 173
    .end local v0    # "res":Ljava/lang/String;
    .end local v1    # "sizes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo$Image;>;"
    :cond_4
    iget-object v3, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    if-eqz v3, :cond_8

    .line 174
    iget-object v3, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, v3, Lcom/vkontakte/android/api/VideoFile;->firstFrame320:Ljava/lang/String;

    if-eqz v3, :cond_5

    .line 175
    iget-object v2, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v2, Lcom/vkontakte/android/api/VideoFile;->firstFrame320:Ljava/lang/String;

    goto :goto_0

    .line 177
    :cond_5
    iget-object v3, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, v3, Lcom/vkontakte/android/api/VideoFile;->firstFrame130:Ljava/lang/String;

    if-eqz v3, :cond_6

    .line 178
    iget-object v2, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v2, Lcom/vkontakte/android/api/VideoFile;->firstFrame130:Ljava/lang/String;

    goto :goto_0

    .line 180
    :cond_6
    iget-object v3, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, v3, Lcom/vkontakte/android/api/VideoFile;->firstFrame800:Ljava/lang/String;

    if-eqz v3, :cond_7

    .line 181
    iget-object v2, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v2, Lcom/vkontakte/android/api/VideoFile;->firstFrame800:Ljava/lang/String;

    goto :goto_0

    :cond_7
    move-object v0, v2

    .line 183
    goto :goto_0

    :cond_8
    move-object v0, v2

    .line 186
    goto :goto_0
.end method

.method public getServerImageUrl()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 211
    iget-object v3, p0, Lcom/vk/stories/model/StoryEntry;->photo:Lcom/vkontakte/android/Photo;

    if-eqz v3, :cond_3

    .line 212
    iget-object v3, p0, Lcom/vk/stories/model/StoryEntry;->photo:Lcom/vkontakte/android/Photo;

    iget-object v1, v3, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    .line 215
    .local v1, "sizes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo$Image;>;"
    const/16 v3, 0x77

    invoke-static {v1, v3}, Lcom/vk/stories/model/StoryEntry;->photoSizeByName(Ljava/util/ArrayList;C)Ljava/lang/String;

    move-result-object v0

    .local v0, "res":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 242
    .end local v0    # "res":Ljava/lang/String;
    .end local v1    # "sizes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo$Image;>;"
    :cond_0
    :goto_0
    return-object v0

    .line 216
    .restart local v0    # "res":Ljava/lang/String;
    .restart local v1    # "sizes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo$Image;>;"
    :cond_1
    const/16 v3, 0x7a

    invoke-static {v1, v3}, Lcom/vk/stories/model/StoryEntry;->photoSizeByName(Ljava/util/ArrayList;C)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 217
    const/16 v3, 0x79

    invoke-static {v1, v3}, Lcom/vk/stories/model/StoryEntry;->photoSizeByName(Ljava/util/ArrayList;C)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 218
    const/16 v3, 0x78

    invoke-static {v1, v3}, Lcom/vk/stories/model/StoryEntry;->photoSizeByName(Ljava/util/ArrayList;C)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 219
    const/16 v3, 0x6a

    invoke-static {v1, v3}, Lcom/vk/stories/model/StoryEntry;->photoSizeByName(Ljava/util/ArrayList;C)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 220
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_2

    .line 221
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/Photo$Image;

    iget-object v0, v2, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    goto :goto_0

    :cond_2
    move-object v0, v2

    .line 223
    goto :goto_0

    .line 226
    .end local v0    # "res":Ljava/lang/String;
    .end local v1    # "sizes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo$Image;>;"
    :cond_3
    iget-object v3, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    if-eqz v3, :cond_7

    .line 227
    iget-object v3, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, v3, Lcom/vkontakte/android/api/VideoFile;->firstFrame800:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 228
    iget-object v2, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v2, Lcom/vkontakte/android/api/VideoFile;->firstFrame800:Ljava/lang/String;

    goto :goto_0

    .line 230
    :cond_4
    iget-object v3, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, v3, Lcom/vkontakte/android/api/VideoFile;->firstFrame320:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 231
    iget-object v2, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v2, Lcom/vkontakte/android/api/VideoFile;->firstFrame320:Ljava/lang/String;

    goto :goto_0

    .line 233
    :cond_5
    iget-object v3, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, v3, Lcom/vkontakte/android/api/VideoFile;->firstFrame130:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 234
    iget-object v2, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v2, Lcom/vkontakte/android/api/VideoFile;->firstFrame130:Ljava/lang/String;

    goto :goto_0

    :cond_6
    move-object v0, v2

    .line 236
    goto :goto_0

    .line 238
    :cond_7
    iget-object v3, p0, Lcom/vk/stories/model/StoryEntry;->preview:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 239
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->preview:Ljava/lang/String;

    goto :goto_0

    :cond_8
    move-object v0, v2

    .line 242
    goto :goto_0
.end method

.method public getServerVideoUrl()Ljava/lang/String;
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 247
    iget-object v1, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    if-eqz v1, :cond_0

    .line 248
    iget-object v1, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v1, v1, Lcom/vkontakte/android/api/VideoFile;->url1080:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 249
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->url1080:Ljava/lang/String;

    .line 267
    :cond_0
    :goto_0
    return-object v0

    .line 251
    :cond_1
    iget-object v1, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v1, v1, Lcom/vkontakte/android/api/VideoFile;->url720:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 252
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->url720:Ljava/lang/String;

    goto :goto_0

    .line 254
    :cond_2
    iget-object v1, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v1, v1, Lcom/vkontakte/android/api/VideoFile;->url480:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 255
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->url480:Ljava/lang/String;

    goto :goto_0

    .line 257
    :cond_3
    iget-object v1, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v1, v1, Lcom/vkontakte/android/api/VideoFile;->url360:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 258
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->url360:Ljava/lang/String;

    goto :goto_0

    .line 260
    :cond_4
    iget-object v1, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v1, v1, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 261
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    goto :goto_0
.end method

.method public getVideoUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 203
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->fullFile:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 204
    invoke-direct {p0}, Lcom/vk/stories/model/StoryEntry;->getLocalFullFilePath()Ljava/lang/String;

    move-result-object v0

    .line 207
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/vk/stories/model/StoryEntry;->getServerVideoUrl()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 289
    iget v1, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    iget v2, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    ushr-int/lit8 v2, v2, 0x20

    xor-int v0, v1, v2

    .line 290
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    add-int v0, v1, v2

    .line 291
    return v0
.end method

.method public isMyStory()Z
    .locals 2

    .prologue
    .line 142
    iget v0, p0, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPhotoStory()Z
    .locals 2

    .prologue
    .line 146
    const-string/jumbo v0, "photo"

    iget-object v1, p0, Lcom/vk/stories/model/StoryEntry;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isVideoStory()Z
    .locals 2

    .prologue
    .line 150
    const-string/jumbo v0, "video"

    iget-object v1, p0, Lcom/vk/stories/model/StoryEntry;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public link()Ljava/lang/String;
    .locals 2

    .prologue
    .line 272
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "https://vk.com/story"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public localVideoPath()Z
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->fullFile:Ljava/io/File;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setFullFile(Ljava/io/File;)V
    .locals 0
    .param p1, "fullFile"    # Ljava/io/File;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/vk/stories/model/StoryEntry;->fullFile:Ljava/io/File;

    .line 106
    return-void
.end method

.method public setStory(Lcom/vk/stories/model/StoryEntry;)V
    .locals 2
    .param p1, "s"    # Lcom/vk/stories/model/StoryEntry;

    .prologue
    .line 109
    iget-boolean v0, p1, Lcom/vk/stories/model/StoryEntry;->local:Z

    iput-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->local:Z

    .line 110
    iget v0, p1, Lcom/vk/stories/model/StoryEntry;->id:I

    iput v0, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    .line 111
    iget v0, p1, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    iput v0, p0, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    .line 112
    iget-object v0, p1, Lcom/vk/stories/model/StoryEntry;->type:Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->type:Ljava/lang/String;

    .line 113
    iget-wide v0, p1, Lcom/vk/stories/model/StoryEntry;->date:J

    iput-wide v0, p0, Lcom/vk/stories/model/StoryEntry;->date:J

    .line 114
    iget-boolean v0, p1, Lcom/vk/stories/model/StoryEntry;->seen:Z

    iput-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->seen:Z

    .line 115
    iget v0, p1, Lcom/vk/stories/model/StoryEntry;->viewsCount:I

    iput v0, p0, Lcom/vk/stories/model/StoryEntry;->viewsCount:I

    .line 116
    iget-boolean v0, p1, Lcom/vk/stories/model/StoryEntry;->expired:Z

    iput-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->expired:Z

    .line 117
    iget-object v0, p1, Lcom/vk/stories/model/StoryEntry;->preview:Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->preview:Ljava/lang/String;

    .line 118
    iget-object v0, p1, Lcom/vk/stories/model/StoryEntry;->photo:Lcom/vkontakte/android/Photo;

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->photo:Lcom/vkontakte/android/Photo;

    .line 119
    iget-object v0, p1, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    .line 120
    iget-object v0, p1, Lcom/vk/stories/model/StoryEntry;->accessKey:Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->accessKey:Ljava/lang/String;

    .line 121
    iget-boolean v0, p1, Lcom/vk/stories/model/StoryEntry;->isPrivate:Z

    iput-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->isPrivate:Z

    .line 122
    iget-boolean v0, p1, Lcom/vk/stories/model/StoryEntry;->canShare:Z

    iput-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->canShare:Z

    .line 123
    iget-boolean v0, p1, Lcom/vk/stories/model/StoryEntry;->canComment:Z

    iput-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->canComment:Z

    .line 125
    iget-boolean v0, p1, Lcom/vk/stories/model/StoryEntry;->isPromo:Z

    iput-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->isPromo:Z

    .line 126
    iget-object v0, p1, Lcom/vk/stories/model/StoryEntry;->openUrl:Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->openUrl:Ljava/lang/String;

    .line 127
    iget-object v0, p1, Lcom/vk/stories/model/StoryEntry;->ownerPhoto:Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->ownerPhoto:Ljava/lang/String;

    .line 128
    iget-object v0, p1, Lcom/vk/stories/model/StoryEntry;->ownerName:Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/stories/model/StoryEntry;->ownerName:Ljava/lang/String;

    .line 131
    return-void
.end method

.method public stringId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->accessKey:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/model/StoryEntry;->accessKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 137
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 6
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 302
    iget-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->local:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 303
    iget v0, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 304
    iget v0, p0, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 305
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->type:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 306
    iget-wide v4, p0, Lcom/vk/stories/model/StoryEntry;->date:J

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    .line 307
    iget-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->seen:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 308
    iget-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->expired:Z

    if-eqz v0, :cond_2

    move v0, v1

    :goto_2
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 309
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->preview:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 310
    iget v0, p0, Lcom/vk/stories/model/StoryEntry;->viewsCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 311
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->photo:Lcom/vkontakte/android/Photo;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 312
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 313
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->localPreview:Ljava/io/File;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 314
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->accessKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 315
    iget-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->isPrivate:Z

    if-eqz v0, :cond_3

    move v0, v1

    :goto_3
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 316
    iget-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->canShare:Z

    if-eqz v0, :cond_4

    move v0, v1

    :goto_4
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 317
    iget-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->canComment:Z

    if-eqz v0, :cond_5

    move v0, v1

    :goto_5
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 319
    iget-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->isPromo:Z

    if-eqz v0, :cond_6

    :goto_6
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    .line 320
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->openUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 321
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->ownerPhoto:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 322
    iget-object v0, p0, Lcom/vk/stories/model/StoryEntry;->ownerName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 323
    return-void

    :cond_0
    move v0, v2

    .line 302
    goto :goto_0

    :cond_1
    move v0, v2

    .line 307
    goto :goto_1

    :cond_2
    move v0, v2

    .line 308
    goto :goto_2

    :cond_3
    move v0, v2

    .line 315
    goto :goto_3

    :cond_4
    move v0, v2

    .line 316
    goto :goto_4

    :cond_5
    move v0, v2

    .line 317
    goto :goto_5

    :cond_6
    move v1, v2

    .line 319
    goto :goto_6
.end method
