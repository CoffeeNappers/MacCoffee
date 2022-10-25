.class public Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;
.super Lcom/vkontakte/android/upload/PhotoUploadTask;
.source "AlbumPhotoUploadTask.java"

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
            "Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private albumID:I

.field private description:Ljava/lang/String;

.field private mForSaveHash:Ljava/lang/String;

.field private mForSavePhotoList:Ljava/lang/String;

.field private mForSaveServer:Ljava/lang/String;

.field private ownerID:I

.field private result:Lcom/vkontakte/android/Photo;

.field private showNotification:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 157
    new-instance v0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask$3;

    invoke-direct {v0}, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask$3;-><init>()V

    sput-object v0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;IILjava/lang/String;Z)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "aid"    # I
    .param p4, "oid"    # I
    .param p5, "descr"    # Ljava/lang/String;
    .param p6, "notify"    # Z

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/upload/PhotoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 30
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->showNotification:Z

    .line 39
    iput p3, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->albumID:I

    .line 40
    iput p4, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->ownerID:I

    .line 41
    iput-object p5, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->description:Ljava/lang/String;

    .line 42
    iput-boolean p6, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->showNotification:Z

    .line 43
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x1

    .line 150
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/PhotoUploadTask;-><init>(Landroid/os/Parcel;)V

    .line 30
    iput-boolean v0, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->showNotification:Z

    .line 151
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->albumID:I

    .line 152
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->ownerID:I

    .line 153
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->description:Ljava/lang/String;

    .line 154
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->showNotification:Z

    .line 155
    return-void

    .line 154
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vkontakte/android/upload/AlbumPhotoUploadTask$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vkontakte/android/upload/AlbumPhotoUploadTask$1;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;Lcom/vkontakte/android/Photo;)Lcom/vkontakte/android/Photo;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;
    .param p1, "x1"    # Lcom/vkontakte/android/Photo;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->result:Lcom/vkontakte/android/Photo;

    return-object p1
.end method


# virtual methods
.method public afterUpload()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 109
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.PHOTO_ADDED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 110
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "photo"

    iget-object v2, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->result:Lcom/vkontakte/android/Photo;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 111
    const-string/jumbo v1, "aid"

    iget-object v2, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->result:Lcom/vkontakte/android/Photo;

    iget v2, v2, Lcom/vkontakte/android/Photo;->albumID:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 112
    iget-object v1, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->context:Landroid/content/Context;

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 113
    return-void
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 137
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
    .line 76
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 77
    .local v0, "jo":Lorg/json/JSONObject;
    const-string/jumbo v2, "server"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->mForSaveServer:Ljava/lang/String;

    .line 78
    const-string/jumbo v2, "photos_list"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->mForSavePhotoList:Ljava/lang/String;

    .line 79
    const-string/jumbo v2, "hash"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->mForSaveHash:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    return-void

    .line 80
    .end local v0    # "jo":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 81
    .local v1, "x":Ljava/lang/Exception;
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t parse upload response"

    invoke-direct {v2, v3, v1}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected getNotificationTitle()Ljava/lang/CharSequence;
    .locals 2

    .prologue
    .line 117
    iget-object v0, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->context:Landroid/content/Context;

    const v1, 0x7f080733

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getPostFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    const-string/jumbo v0, "file1"

    return-object v0
.end method

.method public bridge synthetic getResult()Landroid/os/Parcelable;
    .locals 1

    .prologue
    .line 24
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->getResult()Lcom/vkontakte/android/Photo;

    move-result-object v0

    return-object v0
.end method

.method public getResult()Lcom/vkontakte/android/Photo;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->result:Lcom/vkontakte/android/Photo;

    return-object v0
.end method

.method public getServer()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 52
    new-instance v2, Lcom/vkontakte/android/api/photos/PhotosGetUploadServer;

    iget v3, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->albumID:I

    iget v4, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->ownerID:I

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/api/photos/PhotosGetUploadServer;-><init>(II)V

    new-instance v3, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask$1;-><init>(Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;)V

    .line 53
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/photos/PhotosGetUploadServer;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 64
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 65
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 66
    .local v1, "result":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 67
    if-nez v1, :cond_0

    .line 68
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t get upload server"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 70
    :cond_0
    return-void
.end method

.method protected needShowNotifications()Z
    .locals 1

    .prologue
    .line 122
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->showNotification:Z

    return v0
.end method

.method public save()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 87
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosSave;

    iget v1, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->albumID:I

    iget v2, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->ownerID:I

    iget-object v3, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->mForSaveServer:Ljava/lang/String;

    iget-object v4, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->mForSavePhotoList:Ljava/lang/String;

    iget-object v5, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->mForSaveHash:Ljava/lang/String;

    iget-object v6, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->description:Ljava/lang/String;

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/api/photos/PhotosSave;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask$2;-><init>(Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;)V

    .line 88
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosSave;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    .line 96
    .local v7, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v7, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 97
    invoke-virtual {v7}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v8

    .line 98
    .local v8, "res":Z
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 99
    if-nez v8, :cond_0

    .line 100
    new-instance v0, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v1, "can\'t save photo"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 102
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->result:Lcom/vkontakte/android/Photo;

    if-nez v0, :cond_1

    .line 103
    new-instance v0, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v1, "didn\'t get photo object"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 105
    :cond_1
    return-void
.end method

.method protected statsGetMethodNameForUploadUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 132
    const-string/jumbo v0, "photos.getUploadServer"

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 142
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/upload/PhotoUploadTask;->writeToParcel(Landroid/os/Parcel;I)V

    .line 143
    iget v0, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->albumID:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 144
    iget v0, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->ownerID:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 145
    iget-object v0, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 146
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/AlbumPhotoUploadTask;->showNotification:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 147
    return-void

    .line 146
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
