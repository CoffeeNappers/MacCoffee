.class public Lcom/vkontakte/android/upload/GraffitiUploadTask;
.super Lcom/vkontakte/android/upload/HTTPFileUploadTask;
.source "GraffitiUploadTask.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/upload/HTTPFileUploadTask",
        "<",
        "Lcom/vkontakte/android/attachments/GraffitiAttachment;",
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
            "Lcom/vkontakte/android/upload/GraffitiUploadTask;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mForSaveFile:Ljava/lang/String;

.field private ownerID:I

.field private result:Lcom/vkontakte/android/api/Document;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 158
    new-instance v0, Lcom/vkontakte/android/upload/GraffitiUploadTask$3;

    invoke-direct {v0}, Lcom/vkontakte/android/upload/GraffitiUploadTask$3;-><init>()V

    sput-object v0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "oid"    # I

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 28
    iput p3, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->ownerID:I

    .line 29
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 153
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;-><init>(Landroid/os/Parcel;)V

    .line 154
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->ownerID:I

    .line 155
    const-class v0, Lcom/vkontakte/android/api/Document;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Document;

    iput-object v0, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->result:Lcom/vkontakte/android/api/Document;

    .line 156
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vkontakte/android/upload/GraffitiUploadTask$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vkontakte/android/upload/GraffitiUploadTask$1;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/GraffitiUploadTask;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/upload/GraffitiUploadTask;Lcom/vkontakte/android/api/Document;)Lcom/vkontakte/android/api/Document;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/upload/GraffitiUploadTask;
    .param p1, "x1"    # Lcom/vkontakte/android/api/Document;

    .prologue
    .line 20
    iput-object p1, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->result:Lcom/vkontakte/android/api/Document;

    return-object p1
.end method


# virtual methods
.method public afterUpload()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 118
    invoke-super {p0}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->afterUpload()V

    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->file:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->file:Ljava/lang/String;

    const-string/jumbo v1, ".vkontakte/GRAF_"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 120
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->file:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    .line 122
    :cond_0
    return-void
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 136
    const/4 v0, 0x0

    return v0
.end method

.method public doUpload()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 65
    const/4 v2, 0x3

    .line 66
    .local v2, "retriesCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v3, 0x3

    if-ge v1, v3, :cond_1

    .line 68
    :try_start_0
    invoke-super {p0}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->doUpload()V
    :try_end_0
    .catch Lcom/vkontakte/android/upload/UploadException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    return-void

    .line 70
    :catch_0
    move-exception v0

    .line 71
    .local v0, "e":Lcom/vkontakte/android/upload/UploadException;
    const/4 v3, 0x2

    if-ge v1, v3, :cond_0

    .line 72
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/GraffitiUploadTask;->getServer()V

    .line 66
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 77
    .end local v0    # "e":Lcom/vkontakte/android/upload/UploadException;
    :cond_1
    new-instance v3, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v4, "can\'t upload"

    invoke-direct {v3, v4}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v3
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
    .line 83
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 84
    .local v0, "jo":Lorg/json/JSONObject;
    const-string/jumbo v2, "file"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->mForSaveFile:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    return-void

    .line 85
    .end local v0    # "jo":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 86
    .local v1, "x":Ljava/lang/Exception;
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t parse upload response"

    invoke-direct {v2, v3, v1}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected getNotificationTitle()Ljava/lang/CharSequence;
    .locals 2

    .prologue
    .line 148
    iget-object v0, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->context:Landroid/content/Context;

    const v1, 0x7f080730

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getPostFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    const-string/jumbo v0, "file"

    return-object v0
.end method

.method public bridge synthetic getResult()Landroid/os/Parcelable;
    .locals 1

    .prologue
    .line 20
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/GraffitiUploadTask;->getResult()Lcom/vkontakte/android/attachments/GraffitiAttachment;

    move-result-object v0

    return-object v0
.end method

.method public getResult()Lcom/vkontakte/android/attachments/GraffitiAttachment;
    .locals 2

    .prologue
    .line 126
    new-instance v0, Lcom/vkontakte/android/attachments/GraffitiAttachment;

    iget-object v1, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->result:Lcom/vkontakte/android/api/Document;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/attachments/GraffitiAttachment;-><init>(Lcom/vkontakte/android/api/Document;)V

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
    .line 43
    new-instance v2, Lcom/vkontakte/android/api/docs/DocsGetUploadServer;

    iget v3, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->ownerID:I

    const-string/jumbo v4, "graffiti"

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/api/docs/DocsGetUploadServer;-><init>(ILjava/lang/String;)V

    new-instance v3, Lcom/vkontakte/android/upload/GraffitiUploadTask$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/GraffitiUploadTask$1;-><init>(Lcom/vkontakte/android/upload/GraffitiUploadTask;)V

    .line 44
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/docs/DocsGetUploadServer;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 55
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 56
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 57
    .local v1, "result":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 58
    if-nez v1, :cond_0

    .line 59
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t get upload server"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 61
    :cond_0
    return-void
.end method

.method protected needShowNotifications()Z
    .locals 1

    .prologue
    .line 33
    const/4 v0, 0x0

    return v0
.end method

.method public save()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 92
    new-instance v2, Lcom/vkontakte/android/api/docs/DocsSave;

    iget-object v3, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->mForSaveFile:Ljava/lang/String;

    invoke-direct {v2, v3}, Lcom/vkontakte/android/api/docs/DocsSave;-><init>(Ljava/lang/String;)V

    new-instance v3, Lcom/vkontakte/android/upload/GraffitiUploadTask$2;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/GraffitiUploadTask$2;-><init>(Lcom/vkontakte/android/upload/GraffitiUploadTask;)V

    .line 93
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/docs/DocsSave;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 104
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 105
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 106
    .local v1, "res":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 107
    if-nez v1, :cond_0

    .line 108
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t save photo"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 110
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->result:Lcom/vkontakte/android/api/Document;

    if-nez v2, :cond_1

    .line 111
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "didn\'t get photo object"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 113
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->result:Lcom/vkontakte/android/api/Document;

    iget v2, v2, Lcom/vkontakte/android/api/Document;->did:I

    iget-object v3, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->result:Lcom/vkontakte/android/api/Document;

    iget v3, v3, Lcom/vkontakte/android/api/Document;->oid:I

    iget-object v4, p0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->file:Ljava/lang/String;

    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/attachments/GraffitiAttachment;->put(IILjava/lang/String;)V

    .line 114
    return-void
.end method

.method protected statsGetMethodNameForUploadUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 131
    const-string/jumbo v0, "docs.getUploadServer"

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 141
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->writeToParcel(Landroid/os/Parcel;I)V

    .line 142
    iget v0, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->ownerID:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 143
    iget-object v0, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask;->result:Lcom/vkontakte/android/api/Document;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 144
    return-void
.end method
