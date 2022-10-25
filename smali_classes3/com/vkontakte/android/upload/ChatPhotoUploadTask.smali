.class public Lcom/vkontakte/android/upload/ChatPhotoUploadTask;
.super Lcom/vkontakte/android/upload/PhotoUploadTask;
.source "ChatPhotoUploadTask.java"

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
            "Lcom/vkontakte/android/upload/ChatPhotoUploadTask;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private chatID:I

.field private mForSaveFile:Ljava/lang/String;

.field private result:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 140
    new-instance v0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask$3;

    invoke-direct {v0}, Lcom/vkontakte/android/upload/ChatPhotoUploadTask$3;-><init>()V

    sput-object v0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "oid"    # I

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/upload/PhotoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 32
    iput p3, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->chatID:I

    .line 33
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 136
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/PhotoUploadTask;-><init>(Landroid/os/Parcel;)V

    .line 137
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->chatID:I

    .line 138
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vkontakte/android/upload/ChatPhotoUploadTask$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vkontakte/android/upload/ChatPhotoUploadTask$1;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/upload/ChatPhotoUploadTask;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/upload/ChatPhotoUploadTask;

    .prologue
    .line 24
    iget v0, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->chatID:I

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
    .line 85
    new-instance v3, Lcom/vkontakte/android/api/VKAPIRequest;

    iget v2, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->chatID:I

    if-lez v2, :cond_0

    const-string/jumbo v2, "getProfiles"

    :goto_0
    invoke-direct {v3, v2}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->chatID:I

    if-lez v2, :cond_1

    const-string/jumbo v2, "user_ids"

    :goto_1
    iget v4, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->chatID:I

    .line 86
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

    .line 87
    :goto_2
    invoke-virtual {v3, v4, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/upload/ChatPhotoUploadTask$2;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/ChatPhotoUploadTask$2;-><init>(Lcom/vkontakte/android/upload/ChatPhotoUploadTask;)V

    .line 88
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 110
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 111
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 112
    .local v1, "res":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 113
    if-nez v1, :cond_3

    .line 114
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t get photo"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 85
    .end local v0    # "req":Lcom/vkontakte/android/api/VKAPIRequest;
    .end local v1    # "res":Z
    :cond_0
    const-string/jumbo v2, "groups.getById"

    goto :goto_0

    :cond_1
    const-string/jumbo v2, "group_ids"

    goto :goto_1

    .line 86
    :cond_2
    const-string/jumbo v2, "photo_50"

    goto :goto_2

    .line 117
    .restart local v0    # "req":Lcom/vkontakte/android/api/VKAPIRequest;
    .restart local v1    # "res":Z
    :cond_3
    return-void
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 126
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
    .line 64
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 65
    .local v0, "jo":Lorg/json/JSONObject;
    const-string/jumbo v2, "response"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->mForSaveFile:Ljava/lang/String;
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
    .line 37
    const-string/jumbo v0, "file"

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
    .line 41
    new-instance v2, Lcom/vkontakte/android/api/photos/PhotosGetChatUploadServer;

    iget v3, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->chatID:I

    invoke-direct {v2, v3}, Lcom/vkontakte/android/api/photos/PhotosGetChatUploadServer;-><init>(I)V

    new-instance v3, Lcom/vkontakte/android/upload/ChatPhotoUploadTask$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/ChatPhotoUploadTask$1;-><init>(Lcom/vkontakte/android/upload/ChatPhotoUploadTask;)V

    .line 42
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/photos/PhotosGetChatUploadServer;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 53
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 54
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 55
    .local v1, "result":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 56
    if-nez v1, :cond_0

    .line 57
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t get upload server"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 59
    :cond_0
    return-void
.end method

.method public save()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 73
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesSetChatPhoto;

    iget v2, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->chatID:I

    iget-object v3, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->mForSaveFile:Ljava/lang/String;

    invoke-direct {v0, v2, v3}, Lcom/vkontakte/android/api/messages/MessagesSetChatPhoto;-><init>(ILjava/lang/String;)V

    .line 74
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 75
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 76
    .local v1, "res":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 77
    if-nez v1, :cond_0

    .line 78
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t save photo"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 80
    :cond_0
    return-void
.end method

.method protected statsGetMethodNameForUploadUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 121
    const-string/jumbo v0, "photos.getChatUploadServer"

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 131
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/upload/PhotoUploadTask;->writeToParcel(Landroid/os/Parcel;I)V

    .line 132
    iget v0, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->chatID:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 133
    return-void
.end method
