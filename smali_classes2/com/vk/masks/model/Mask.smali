.class public Lcom/vk/masks/model/Mask;
.super Ljava/lang/Object;
.source "Mask.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/masks/model/Mask$DisableReason;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vk/masks/model/Mask;",
            ">;"
        }
    .end annotation
.end field

.field private static final deviceEngineVersion:I

.field private static final deviceVkEngineVersion:I = 0x1


# instance fields
.field public createTime:J

.field public disableReason:Lcom/vk/masks/model/Mask$DisableReason;

.field public engineVersion:I

.field public id:I

.field public isNew:Z

.field public name:Ljava/lang/String;

.field public ownerGroup:Lcom/vkontakte/android/api/Group;

.field public ownerId:I

.field public ownerProfile:Lcom/vkontakte/android/UserProfile;

.field public preview:Ljava/lang/String;

.field public sectionId:I

.field public updateTime:J

.field public url:Ljava/lang/String;

.field public userHint:Ljava/lang/String;

.field public vkEngineVersion:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    invoke-static {}, Lcom/vk/masks/MasksController;->getInstance()Lcom/vk/masks/MasksController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/masks/MasksController;->getMasksEngineVersion()I

    move-result v0

    sput v0, Lcom/vk/masks/model/Mask;->deviceEngineVersion:I

    .line 226
    new-instance v0, Lcom/vk/masks/model/Mask$1;

    invoke-direct {v0}, Lcom/vk/masks/model/Mask$1;-><init>()V

    sput-object v0, Lcom/vk/masks/model/Mask;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    const-class v0, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iput-object v0, p0, Lcom/vk/masks/model/Mask;->ownerProfile:Lcom/vkontakte/android/UserProfile;

    .line 210
    const-class v0, Lcom/vkontakte/android/api/Group;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Group;

    iput-object v0, p0, Lcom/vk/masks/model/Mask;->ownerGroup:Lcom/vkontakte/android/api/Group;

    .line 211
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/masks/model/Mask;->id:I

    .line 212
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/masks/model/Mask;->ownerId:I

    .line 213
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/masks/model/Mask;->name:Ljava/lang/String;

    .line 214
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/masks/model/Mask;->sectionId:I

    .line 215
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vk/masks/model/Mask;->updateTime:J

    .line 216
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vk/masks/model/Mask;->createTime:J

    .line 217
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/masks/model/Mask;->url:Ljava/lang/String;

    .line 218
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/masks/model/Mask;->preview:Ljava/lang/String;

    .line 219
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vk/masks/model/Mask;->isNew:Z

    .line 220
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/masks/model/Mask;->engineVersion:I

    .line 221
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/masks/model/Mask;->vkEngineVersion:I

    .line 222
    const-class v0, Lcom/vk/masks/model/Mask$DisableReason;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/masks/model/Mask$DisableReason;

    iput-object v0, p0, Lcom/vk/masks/model/Mask;->disableReason:Lcom/vk/masks/model/Mask$DisableReason;

    .line 223
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/masks/model/Mask;->userHint:Ljava/lang/String;

    .line 224
    return-void

    .line 219
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "jsonObject"    # Lorg/json/JSONObject;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const-string/jumbo v1, "id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vk/masks/model/Mask;->id:I

    .line 38
    const-string/jumbo v1, "owner_id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vk/masks/model/Mask;->ownerId:I

    .line 39
    const-string/jumbo v1, "name"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/masks/model/Mask;->name:Ljava/lang/String;

    .line 40
    const-string/jumbo v1, "section_id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vk/masks/model/Mask;->sectionId:I

    .line 41
    const-string/jumbo v1, "update_time"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vk/masks/model/Mask;->updateTime:J

    .line 42
    const-string/jumbo v1, "create_time"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vk/masks/model/Mask;->createTime:J

    .line 43
    const-string/jumbo v1, "url"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/masks/model/Mask;->url:Ljava/lang/String;

    .line 44
    const-string/jumbo v1, "preview"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "preview_300"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/masks/model/Mask;->preview:Ljava/lang/String;

    .line 45
    const-string/jumbo v1, "is_new"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vk/masks/model/Mask;->isNew:Z

    .line 46
    const-string/jumbo v1, "engine_version"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vk/masks/model/Mask;->engineVersion:I

    .line 47
    const-string/jumbo v1, "vk_engine_version"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vk/masks/model/Mask;->vkEngineVersion:I

    .line 48
    const-string/jumbo v1, "hint"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/masks/model/Mask;->userHint:Ljava/lang/String;

    .line 49
    const-string/jumbo v1, "disabled"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 50
    .local v0, "disableJson":Lorg/json/JSONObject;
    if-eqz v0, :cond_0

    .line 51
    new-instance v1, Lcom/vk/masks/model/Mask$DisableReason;

    invoke-direct {v1, v0}, Lcom/vk/masks/model/Mask$DisableReason;-><init>(Lorg/json/JSONObject;)V

    iput-object v1, p0, Lcom/vk/masks/model/Mask;->disableReason:Lcom/vk/masks/model/Mask$DisableReason;

    .line 53
    :cond_0
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 186
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 114
    if-ne p0, p1, :cond_1

    .line 119
    :cond_0
    :goto_0
    return v1

    .line 115
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

    .line 117
    check-cast v0, Lcom/vk/masks/model/Mask;

    .line 119
    .local v0, "mask":Lcom/vk/masks/model/Mask;
    iget v3, p0, Lcom/vk/masks/model/Mask;->id:I

    iget v4, v0, Lcom/vk/masks/model/Mask;->id:I

    if-eq v3, v4, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public getAuthorAvatarUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->ownerProfile:Lcom/vkontakte/android/UserProfile;

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->ownerProfile:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 69
    :goto_0
    return-object v0

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->ownerGroup:Lcom/vkontakte/android/api/Group;

    if-eqz v0, :cond_1

    .line 67
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->ownerGroup:Lcom/vkontakte/android/api/Group;

    iget-object v0, v0, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    goto :goto_0

    .line 69
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getAuthorName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->ownerProfile:Lcom/vkontakte/android/UserProfile;

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->ownerProfile:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 79
    :goto_0
    return-object v0

    .line 76
    :cond_0
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->ownerGroup:Lcom/vkontakte/android/api/Group;

    if-eqz v0, :cond_1

    .line 77
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->ownerGroup:Lcom/vkontakte/android/api/Group;

    iget-object v0, v0, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    goto :goto_0

    .line 79
    :cond_1
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public getFullId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/vk/masks/model/Mask;->ownerId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vk/masks/model/Mask;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasAuthor()Z
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->ownerProfile:Lcom/vkontakte/android/UserProfile;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/masks/model/Mask;->ownerGroup:Lcom/vkontakte/android/api/Group;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasHint()Z
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->userHint:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 124
    iget v0, p0, Lcom/vk/masks/model/Mask;->id:I

    .line 125
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/vk/masks/model/Mask;->ownerId:I

    add-int v0, v1, v2

    .line 126
    return v0
.end method

.method public isDisabled()Z
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->disableReason:Lcom/vk/masks/model/Mask$DisableReason;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSupported()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 88
    sget v1, Lcom/vk/masks/model/Mask;->deviceEngineVersion:I

    iget v2, p0, Lcom/vk/masks/model/Mask;->engineVersion:I

    if-lt v1, v2, :cond_0

    iget v1, p0, Lcom/vk/masks/model/Mask;->vkEngineVersion:I

    if-lt v0, v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toJson()Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 96
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 97
    .local v0, "jo":Lorg/json/JSONObject;
    const-string/jumbo v1, "id"

    iget v2, p0, Lcom/vk/masks/model/Mask;->id:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 98
    const-string/jumbo v1, "owner_id"

    iget v2, p0, Lcom/vk/masks/model/Mask;->ownerId:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 99
    const-string/jumbo v1, "name"

    iget-object v2, p0, Lcom/vk/masks/model/Mask;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 100
    const-string/jumbo v1, "section_id"

    iget v2, p0, Lcom/vk/masks/model/Mask;->sectionId:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 101
    const-string/jumbo v1, "update_time"

    iget-wide v2, p0, Lcom/vk/masks/model/Mask;->updateTime:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 102
    const-string/jumbo v1, "create_time"

    iget-wide v2, p0, Lcom/vk/masks/model/Mask;->createTime:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 103
    const-string/jumbo v1, "url"

    iget-object v2, p0, Lcom/vk/masks/model/Mask;->url:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 104
    const-string/jumbo v1, "preview"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string/jumbo v3, "preview_300"

    iget-object v4, p0, Lcom/vk/masks/model/Mask;->preview:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 105
    const-string/jumbo v1, "is_new"

    iget-boolean v2, p0, Lcom/vk/masks/model/Mask;->isNew:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 106
    const-string/jumbo v1, "engine_version"

    iget v2, p0, Lcom/vk/masks/model/Mask;->engineVersion:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 107
    const-string/jumbo v1, "vk_engine_version"

    iget v2, p0, Lcom/vk/masks/model/Mask;->vkEngineVersion:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 108
    const-string/jumbo v1, "hint"

    iget-object v2, p0, Lcom/vk/masks/model/Mask;->userHint:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 109
    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 191
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->ownerProfile:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 192
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->ownerGroup:Lcom/vkontakte/android/api/Group;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 193
    iget v0, p0, Lcom/vk/masks/model/Mask;->id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 194
    iget v0, p0, Lcom/vk/masks/model/Mask;->ownerId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 195
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 196
    iget v0, p0, Lcom/vk/masks/model/Mask;->sectionId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 197
    iget-wide v0, p0, Lcom/vk/masks/model/Mask;->updateTime:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 198
    iget-wide v0, p0, Lcom/vk/masks/model/Mask;->createTime:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 199
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 200
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->preview:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 201
    iget-boolean v0, p0, Lcom/vk/masks/model/Mask;->isNew:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 202
    iget v0, p0, Lcom/vk/masks/model/Mask;->engineVersion:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 203
    iget v0, p0, Lcom/vk/masks/model/Mask;->vkEngineVersion:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 204
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->disableReason:Lcom/vk/masks/model/Mask$DisableReason;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 205
    iget-object v0, p0, Lcom/vk/masks/model/Mask;->userHint:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 206
    return-void

    .line 201
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
