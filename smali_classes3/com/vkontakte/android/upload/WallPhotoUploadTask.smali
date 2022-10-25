.class public Lcom/vkontakte/android/upload/WallPhotoUploadTask;
.super Lcom/vkontakte/android/upload/PhotoUploadTask;
.source "WallPhotoUploadTask.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/upload/PhotoUploadTask",
        "<",
        "Lcom/vkontakte/android/attachments/PhotoAttachment;",
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
            "Lcom/vkontakte/android/upload/WallPhotoUploadTask;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mForSaveHash:Ljava/lang/String;

.field private mForSavePhoto:Ljava/lang/String;

.field private mForSaveServer:Ljava/lang/String;

.field private ownerID:I

.field private result:Lcom/vkontakte/android/attachments/PhotoAttachment;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 117
    new-instance v0, Lcom/vkontakte/android/upload/WallPhotoUploadTask$3;

    invoke-direct {v0}, Lcom/vkontakte/android/upload/WallPhotoUploadTask$3;-><init>()V

    sput-object v0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "oid"    # I

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/upload/PhotoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 29
    iput p3, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->ownerID:I

    .line 30
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 113
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/PhotoUploadTask;-><init>(Landroid/os/Parcel;)V

    .line 114
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->ownerID:I

    .line 115
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vkontakte/android/upload/WallPhotoUploadTask$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vkontakte/android/upload/WallPhotoUploadTask$1;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/WallPhotoUploadTask;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/upload/WallPhotoUploadTask;Lcom/vkontakte/android/attachments/PhotoAttachment;)Lcom/vkontakte/android/attachments/PhotoAttachment;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/upload/WallPhotoUploadTask;
    .param p1, "x1"    # Lcom/vkontakte/android/attachments/PhotoAttachment;

    .prologue
    .line 19
    iput-object p1, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->result:Lcom/vkontakte/android/attachments/PhotoAttachment;

    return-object p1
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 103
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
    .line 62
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 63
    .local v0, "jo":Lorg/json/JSONObject;
    const-string/jumbo v2, "server"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->mForSaveServer:Ljava/lang/String;

    .line 64
    const-string/jumbo v2, "photo"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->mForSavePhoto:Ljava/lang/String;

    .line 65
    const-string/jumbo v2, "hash"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->mForSaveHash:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    return-void

    .line 66
    .end local v0    # "jo":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 67
    .local v1, "x":Ljava/lang/Exception;
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t parse upload response"

    invoke-direct {v2, v3, v1}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected getPostFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    const-string/jumbo v0, "photo"

    return-object v0
.end method

.method public bridge synthetic getResult()Landroid/os/Parcelable;
    .locals 1

    .prologue
    .line 19
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->getResult()Lcom/vkontakte/android/attachments/PhotoAttachment;

    move-result-object v0

    return-object v0
.end method

.method public getResult()Lcom/vkontakte/android/attachments/PhotoAttachment;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->result:Lcom/vkontakte/android/attachments/PhotoAttachment;

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
    .line 39
    new-instance v2, Lcom/vkontakte/android/api/photos/PhotosGetWallUploadServer;

    iget v3, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->ownerID:I

    invoke-direct {v2, v3}, Lcom/vkontakte/android/api/photos/PhotosGetWallUploadServer;-><init>(I)V

    new-instance v3, Lcom/vkontakte/android/upload/WallPhotoUploadTask$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/WallPhotoUploadTask$1;-><init>(Lcom/vkontakte/android/upload/WallPhotoUploadTask;)V

    .line 40
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/photos/PhotosGetWallUploadServer;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 51
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 52
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 53
    .local v1, "result":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 54
    if-nez v1, :cond_0

    .line 55
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t get upload server"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 57
    :cond_0
    return-void
.end method

.method public save()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 73
    new-instance v2, Lcom/vkontakte/android/api/photos/PhotosSaveWallPhoto;

    iget v3, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->ownerID:I

    iget-object v4, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->mForSaveServer:Ljava/lang/String;

    iget-object v5, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->mForSavePhoto:Ljava/lang/String;

    iget-object v6, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->mForSaveHash:Ljava/lang/String;

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/vkontakte/android/api/photos/PhotosSaveWallPhoto;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Lcom/vkontakte/android/upload/WallPhotoUploadTask$2;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/WallPhotoUploadTask$2;-><init>(Lcom/vkontakte/android/upload/WallPhotoUploadTask;)V

    .line 74
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/photos/PhotosSaveWallPhoto;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 80
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 81
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 82
    .local v1, "res":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 83
    if-nez v1, :cond_0

    .line 84
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t save photo"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 86
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->result:Lcom/vkontakte/android/attachments/PhotoAttachment;

    if-nez v2, :cond_1

    .line 87
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "didn\'t get photo object"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 89
    :cond_1
    return-void
.end method

.method protected statsGetMethodNameForUploadUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 98
    const-string/jumbo v0, "photos.getWallUploadServer"

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 108
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/upload/PhotoUploadTask;->writeToParcel(Landroid/os/Parcel;I)V

    .line 109
    iget v0, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->ownerID:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 110
    return-void
.end method
