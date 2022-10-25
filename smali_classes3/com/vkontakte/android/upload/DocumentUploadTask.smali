.class public Lcom/vkontakte/android/upload/DocumentUploadTask;
.super Lcom/vkontakte/android/upload/HTTPFileUploadTask;
.source "DocumentUploadTask.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/upload/HTTPFileUploadTask",
        "<",
        "Lcom/vkontakte/android/attachments/DocumentAttachment;",
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
            "Lcom/vkontakte/android/upload/DocumentUploadTask;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mForSaveFile:Ljava/lang/String;

.field private needShowNotification:Z

.field protected final ownerID:I

.field protected result:Lcom/vkontakte/android/api/Document;

.field private wall:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 147
    new-instance v0, Lcom/vkontakte/android/upload/DocumentUploadTask$3;

    invoke-direct {v0}, Lcom/vkontakte/android/upload/DocumentUploadTask$3;-><init>()V

    sput-object v0, Lcom/vkontakte/android/upload/DocumentUploadTask;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;IZ)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "oid"    # I
    .param p4, "wall"    # Z

    .prologue
    .line 29
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/upload/DocumentUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;IZZ)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;IZZ)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "oid"    # I
    .param p4, "wall"    # Z
    .param p5, "needShowNotification"    # Z

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 34
    iput p3, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->ownerID:I

    .line 35
    iput-boolean p4, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->wall:Z

    .line 36
    iput-boolean p5, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->needShowNotification:Z

    .line 37
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 140
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;-><init>(Landroid/os/Parcel;)V

    .line 141
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->ownerID:I

    .line 142
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->wall:Z

    .line 143
    const-class v0, Lcom/vkontakte/android/api/Document;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Document;

    iput-object v0, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->result:Lcom/vkontakte/android/api/Document;

    .line 144
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    :goto_1
    iput-boolean v1, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->needShowNotification:Z

    .line 145
    return-void

    :cond_0
    move v0, v2

    .line 142
    goto :goto_0

    :cond_1
    move v1, v2

    .line 144
    goto :goto_1
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 122
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
    .line 78
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 79
    .local v0, "jo":Lorg/json/JSONObject;
    const-string/jumbo v2, "file"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->mForSaveFile:Ljava/lang/String;
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
    .line 136
    iget-object v0, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->context:Landroid/content/Context;

    const v1, 0x7f080730

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getPostFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    const-string/jumbo v0, "file"

    return-object v0
.end method

.method public bridge synthetic getResult()Landroid/os/Parcelable;
    .locals 1

    .prologue
    .line 20
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/DocumentUploadTask;->getResult()Lcom/vkontakte/android/attachments/DocumentAttachment;

    move-result-object v0

    return-object v0
.end method

.method public getResult()Lcom/vkontakte/android/attachments/DocumentAttachment;
    .locals 2

    .prologue
    .line 112
    new-instance v0, Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v1, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->result:Lcom/vkontakte/android/api/Document;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/attachments/DocumentAttachment;-><init>(Lcom/vkontakte/android/api/Document;)V

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
    .line 55
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/DocumentUploadTask;->getServerRequest()Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/upload/DocumentUploadTask$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/DocumentUploadTask$1;-><init>(Lcom/vkontakte/android/upload/DocumentUploadTask;)V

    .line 56
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 67
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 68
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 69
    .local v1, "result":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 70
    if-nez v1, :cond_0

    .line 71
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t get upload server"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 73
    :cond_0
    return-void
.end method

.method protected getServerRequest()Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    new-instance v0, Lcom/vkontakte/android/api/docs/DocsGetUploadServer;

    iget v1, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->ownerID:I

    iget-boolean v2, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->wall:Z

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/docs/DocsGetUploadServer;-><init>(IZ)V

    return-object v0
.end method

.method protected needShowNotifications()Z
    .locals 1

    .prologue
    .line 41
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->needShowNotification:Z

    return v0
.end method

.method public save()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 87
    new-instance v2, Lcom/vkontakte/android/api/docs/DocsSave;

    iget-object v3, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->mForSaveFile:Ljava/lang/String;

    invoke-direct {v2, v3}, Lcom/vkontakte/android/api/docs/DocsSave;-><init>(Ljava/lang/String;)V

    new-instance v3, Lcom/vkontakte/android/upload/DocumentUploadTask$2;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/DocumentUploadTask$2;-><init>(Lcom/vkontakte/android/upload/DocumentUploadTask;)V

    .line 88
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/docs/DocsSave;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 99
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 100
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 101
    .local v1, "res":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 102
    if-nez v1, :cond_0

    .line 103
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t save photo"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 105
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->result:Lcom/vkontakte/android/api/Document;

    if-nez v2, :cond_1

    .line 106
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "didn\'t get photo object"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 108
    :cond_1
    return-void
.end method

.method protected statsGetMethodNameForUploadUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->wall:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "docs.getWallUploadServer"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "docs.getUploadServer"

    goto :goto_0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 127
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->writeToParcel(Landroid/os/Parcel;I)V

    .line 128
    iget v0, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->ownerID:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 129
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->wall:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 130
    iget-object v0, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->result:Lcom/vkontakte/android/api/Document;

    invoke-virtual {p1, v0, v2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 131
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/DocumentUploadTask;->needShowNotification:Z

    if-eqz v0, :cond_1

    :goto_1
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    .line 132
    return-void

    :cond_0
    move v0, v2

    .line 129
    goto :goto_0

    :cond_1
    move v1, v2

    .line 131
    goto :goto_1
.end method
