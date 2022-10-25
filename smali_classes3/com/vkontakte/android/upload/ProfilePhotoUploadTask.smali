.class public Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;
.super Lcom/vkontakte/android/upload/PhotoUploadTask;
.source "ProfilePhotoUploadTask.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/upload/PhotoUploadTask",
        "<",
        "Lcom/vkontakte/android/Photo;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mForSaveHash:Ljava/lang/String;

.field private mForSavePhoto:Ljava/lang/String;

.field private mForSaveServer:Ljava/lang/String;

.field private mThumbBottom:F

.field private mThumbLeft:F

.field private mThumbRight:F

.field private mThumbTop:F

.field private notify:Z

.field private ownerID:I

.field private result:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 228
    new-instance v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$3;

    invoke-direct {v0}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$3;-><init>()V

    sput-object v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;IZ)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "oid"    # I
    .param p4, "showNotification"    # Z

    .prologue
    const/high16 v5, -0x40800000    # -1.0f

    .line 62
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v6, v5

    move v7, v5

    move v8, v5

    invoke-direct/range {v0 .. v8}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;IZFFFF)V

    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;IZFFFF)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "oid"    # I
    .param p4, "showNotification"    # Z
    .param p5, "thumbLeft"    # F
    .param p6, "thumbTop"    # F
    .param p7, "thumbRight"    # F
    .param p8, "thumbBottom"    # F

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/upload/PhotoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 49
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->setDisableDownscale(Z)V

    .line 50
    iput p3, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->ownerID:I

    .line 51
    iput-boolean p4, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->notify:Z

    .line 52
    const v0, 0x7f0804ac

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f0804ad

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-instance v3, Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.action.VIEW"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "vkontakte://profile/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->ownerID:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/4 v4, 0x0

    invoke-static {p1, v2, v3, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->setDoneNotification(Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)V

    .line 53
    iput p5, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbLeft:F

    .line 54
    iput p6, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbTop:F

    .line 55
    iput p7, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbRight:F

    .line 56
    iput p8, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbBottom:F

    .line 57
    const-string/jumbo v0, "Upload"

    const-string/jumbo v1, "%fx%f, %f,%f"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget v4, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbLeft:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget v4, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbTop:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget v4, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbRight:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    iget v4, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbBottom:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 219
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/PhotoUploadTask;-><init>(Landroid/os/Parcel;)V

    .line 220
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->ownerID:I

    .line 221
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->notify:Z

    .line 222
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbLeft:F

    .line 223
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbTop:F

    .line 224
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbRight:F

    .line 225
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbBottom:F

    .line 226
    return-void

    .line 221
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    .prologue
    .line 33
    iget v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbLeft:F

    return v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    .prologue
    .line 33
    iget v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbTop:F

    return v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    .prologue
    .line 33
    iget v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbRight:F

    return v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    .prologue
    .line 33
    iget v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbBottom:F

    return v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    .prologue
    .line 33
    iget v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->ownerID:I

    return v0
.end method


# virtual methods
.method public afterUpload()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 153
    new-instance v3, Lcom/vkontakte/android/api/VKAPIRequest;

    iget v2, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->ownerID:I

    if-lez v2, :cond_0

    const-string/jumbo v2, "getProfiles"

    :goto_0
    invoke-direct {v3, v2}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->ownerID:I

    if-lez v2, :cond_1

    const-string/jumbo v2, "user_ids"

    :goto_1
    iget v4, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->ownerID:I

    .line 154
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    invoke-virtual {v3, v2, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "fields"

    sget v2, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v5, 0x3f800000    # 1.0f

    cmpl-float v2, v2, v5

    if-lez v2, :cond_2

    const-string/jumbo v2, "photo_100"

    .line 155
    :goto_2
    invoke-virtual {v3, v4, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$2;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$2;-><init>(Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;)V

    .line 156
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 178
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lorg/json/JSONObject;>;"
    iput-object v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 179
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 180
    .local v1, "res":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 181
    if-nez v1, :cond_3

    .line 182
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t get photo"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 153
    .end local v0    # "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lorg/json/JSONObject;>;"
    .end local v1    # "res":Z
    :cond_0
    const-string/jumbo v2, "groups.getById"

    goto :goto_0

    :cond_1
    const-string/jumbo v2, "group_ids"

    goto :goto_1

    .line 154
    :cond_2
    const-string/jumbo v2, "photo_50"

    goto :goto_2

    .line 185
    .restart local v0    # "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lorg/json/JSONObject;>;"
    .restart local v1    # "res":Z
    :cond_3
    return-void
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 204
    const/4 v0, 0x0

    return v0
.end method

.method protected extractArgsForSaveFromUploadResponse(Ljava/lang/String;)V
    .locals 4
    .param p1, "response"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 130
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 131
    .local v0, "jo":Lorg/json/JSONObject;
    const-string/jumbo v2, "server"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mForSaveServer:Ljava/lang/String;

    .line 132
    const-string/jumbo v2, "photo"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mForSavePhoto:Ljava/lang/String;

    .line 133
    const-string/jumbo v2, "hash"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mForSaveHash:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    return-void

    .line 134
    .end local v0    # "jo":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 135
    .local v1, "x":Ljava/lang/Exception;
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t parse upload response"

    invoke-direct {v2, v3, v1}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected getNotificationTitle()Ljava/lang/CharSequence;
    .locals 2

    .prologue
    .line 194
    iget-object v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->context:Landroid/content/Context;

    const v1, 0x7f080733

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getPostFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    const-string/jumbo v0, "photo"

    return-object v0
.end method

.method public getServer()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 71
    new-instance v2, Lcom/vkontakte/android/api/photos/PhotosGetOwnerPhotoUploadServer;

    iget v3, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->ownerID:I

    invoke-direct {v2, v3}, Lcom/vkontakte/android/api/photos/PhotosGetOwnerPhotoUploadServer;-><init>(I)V

    new-instance v3, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;-><init>(Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;)V

    .line 72
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/photos/PhotosGetOwnerPhotoUploadServer;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 119
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 120
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 121
    .local v1, "result":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 122
    if-nez v1, :cond_0

    .line 123
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t get upload server"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 125
    :cond_0
    return-void
.end method

.method protected needShowNotifications()Z
    .locals 1

    .prologue
    .line 189
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->notify:Z

    return v0
.end method

.method public save()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 141
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosSaveOwnerPhoto;

    iget v2, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->ownerID:I

    iget-object v3, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mForSaveServer:Ljava/lang/String;

    iget-object v4, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mForSavePhoto:Ljava/lang/String;

    iget-object v5, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mForSaveHash:Ljava/lang/String;

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/api/photos/PhotosSaveOwnerPhoto;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 143
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 144
    .local v1, "res":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 145
    if-nez v1, :cond_0

    .line 146
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t save photo"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 148
    :cond_0
    return-void
.end method

.method protected statsGetMethodNameForUploadUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 199
    const-string/jumbo v0, "photos.getOwnerPhotoUploadServer"

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 209
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/upload/PhotoUploadTask;->writeToParcel(Landroid/os/Parcel;I)V

    .line 210
    iget v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->ownerID:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 211
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->notify:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 212
    iget v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbLeft:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 213
    iget v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbTop:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 214
    iget v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbRight:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 215
    iget v0, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->mThumbBottom:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 216
    return-void

    .line 211
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
