.class public Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;
.super Lcom/vkontakte/android/upload/PhotoUploadTask;
.source "MessagesPhotoUploadTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/upload/PhotoUploadTask",
        "<",
        "Lcom/vkontakte/android/attachments/PhotoAttachment;",
        ">;"
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mForSaveHash:Ljava/lang/String;

.field private mForSavePhoto:Ljava/lang/String;

.field private mForSaveServer:Ljava/lang/String;

.field private result:Lcom/vkontakte/android/attachments/PhotoAttachment;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 116
    new-instance v0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask$3;

    invoke-direct {v0}, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask$3;-><init>()V

    sput-object v0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "id"    # I

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/upload/PhotoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 30
    iput p3, p0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->id:I

    .line 31
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 0
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 113
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/PhotoUploadTask;-><init>(Landroid/os/Parcel;)V

    .line 114
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vkontakte/android/upload/MessagesPhotoUploadTask$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vkontakte/android/upload/MessagesPhotoUploadTask$1;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;Lcom/vkontakte/android/attachments/PhotoAttachment;)Lcom/vkontakte/android/attachments/PhotoAttachment;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;
    .param p1, "x1"    # Lcom/vkontakte/android/attachments/PhotoAttachment;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->result:Lcom/vkontakte/android/attachments/PhotoAttachment;

    return-object p1
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 104
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
    .line 63
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 64
    .local v0, "jo":Lorg/json/JSONObject;
    const-string/jumbo v2, "server"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->mForSaveServer:Ljava/lang/String;

    .line 65
    const-string/jumbo v2, "photo"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->mForSavePhoto:Ljava/lang/String;

    .line 66
    const-string/jumbo v2, "hash"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->mForSaveHash:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    return-void

    .line 67
    .end local v0    # "jo":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 68
    .local v1, "x":Lorg/json/JSONException;
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t parse upload response"

    invoke-direct {v2, v3, v1}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected getPostFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    const-string/jumbo v0, "photo"

    return-object v0
.end method

.method public bridge synthetic getResult()Landroid/os/Parcelable;
    .locals 1

    .prologue
    .line 21
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->getResult()Lcom/vkontakte/android/attachments/PhotoAttachment;

    move-result-object v0

    return-object v0
.end method

.method public getResult()Lcom/vkontakte/android/attachments/PhotoAttachment;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->result:Lcom/vkontakte/android/attachments/PhotoAttachment;

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
    .line 40
    new-instance v2, Lcom/vkontakte/android/api/photos/PhotosGetMessagesUploadServer;

    invoke-direct {v2}, Lcom/vkontakte/android/api/photos/PhotosGetMessagesUploadServer;-><init>()V

    new-instance v3, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask$1;-><init>(Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;)V

    .line 41
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/photos/PhotosGetMessagesUploadServer;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 52
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 53
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 54
    .local v1, "result":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 55
    if-nez v1, :cond_0

    .line 56
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t get upload server"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 58
    :cond_0
    return-void
.end method

.method public save()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 74
    new-instance v2, Lcom/vkontakte/android/api/photos/PhotosSaveMessagesPhoto;

    iget-object v3, p0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->mForSaveServer:Ljava/lang/String;

    iget-object v4, p0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->mForSavePhoto:Ljava/lang/String;

    iget-object v5, p0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->mForSaveHash:Ljava/lang/String;

    invoke-direct {v2, v3, v4, v5}, Lcom/vkontakte/android/api/photos/PhotosSaveMessagesPhoto;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask$2;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask$2;-><init>(Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;)V

    .line 75
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/photos/PhotosSaveMessagesPhoto;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 81
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 82
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 83
    .local v1, "res":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 84
    if-nez v1, :cond_0

    .line 85
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t save photo"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 87
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->result:Lcom/vkontakte/android/attachments/PhotoAttachment;

    if-nez v2, :cond_1

    .line 88
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "didn\'t get photo object"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 90
    :cond_1
    return-void
.end method

.method protected statsGetMethodNameForUploadUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 99
    const-string/jumbo v0, "photos.getMessagesUploadServer"

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 109
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/upload/PhotoUploadTask;->writeToParcel(Landroid/os/Parcel;I)V

    .line 110
    return-void
.end method
