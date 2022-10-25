.class public Lcom/vkontakte/android/upload/AudioUploadTask;
.super Lcom/vkontakte/android/upload/HTTPFileUploadTask;
.source "AudioUploadTask.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/upload/HTTPFileUploadTask",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
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
            "Lcom/vkontakte/android/upload/AudioUploadTask;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mForSaveAudio:Ljava/lang/String;

.field private mForSaveHash:Ljava/lang/String;

.field private mForSaveServer:Ljava/lang/String;

.field private needShowNotification:Z

.field private result:Lcom/vkontakte/android/audio/MusicTrack;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 136
    new-instance v0, Lcom/vkontakte/android/upload/AudioUploadTask$3;

    invoke-direct {v0}, Lcom/vkontakte/android/upload/AudioUploadTask$3;-><init>()V

    sput-object v0, Lcom/vkontakte/android/upload/AudioUploadTask;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;

    .prologue
    .line 30
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/upload/AudioUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "needShowNotification"    # Z

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 35
    iput-boolean p3, p0, Lcom/vkontakte/android/upload/AudioUploadTask;->needShowNotification:Z

    .line 36
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 0
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 133
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;-><init>(Landroid/os/Parcel;)V

    .line 134
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vkontakte/android/upload/AudioUploadTask$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vkontakte/android/upload/AudioUploadTask$1;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/AudioUploadTask;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/upload/AudioUploadTask;Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vkontakte/android/audio/MusicTrack;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/upload/AudioUploadTask;
    .param p1, "x1"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 19
    iput-object p1, p0, Lcom/vkontakte/android/upload/AudioUploadTask;->result:Lcom/vkontakte/android/audio/MusicTrack;

    return-object p1
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 114
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
    .line 68
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 69
    .local v0, "jo":Lorg/json/JSONObject;
    const-string/jumbo v2, "server"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/AudioUploadTask;->mForSaveServer:Ljava/lang/String;

    .line 70
    const-string/jumbo v2, "audio"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/AudioUploadTask;->mForSaveAudio:Ljava/lang/String;

    .line 71
    const-string/jumbo v2, "hash"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/AudioUploadTask;->mForSaveHash:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    return-void

    .line 72
    .end local v0    # "jo":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 73
    .local v1, "x":Ljava/lang/Exception;
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t parse upload response"

    invoke-direct {v2, v3, v1}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected getNotificationTitle()Ljava/lang/CharSequence;
    .locals 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/upload/AudioUploadTask;->context:Landroid/content/Context;

    const v1, 0x7f08072d

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getPostFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    const-string/jumbo v0, "file"

    return-object v0
.end method

.method public bridge synthetic getResult()Landroid/os/Parcelable;
    .locals 1

    .prologue
    .line 19
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/AudioUploadTask;->getResult()Lcom/vkontakte/android/audio/MusicTrack;

    move-result-object v0

    return-object v0
.end method

.method public getResult()Lcom/vkontakte/android/audio/MusicTrack;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/upload/AudioUploadTask;->result:Lcom/vkontakte/android/audio/MusicTrack;

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
    .line 45
    new-instance v2, Lcom/vkontakte/android/api/audio/AudioGetUploadServer;

    invoke-direct {v2}, Lcom/vkontakte/android/api/audio/AudioGetUploadServer;-><init>()V

    new-instance v3, Lcom/vkontakte/android/upload/AudioUploadTask$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/AudioUploadTask$1;-><init>(Lcom/vkontakte/android/upload/AudioUploadTask;)V

    .line 46
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioGetUploadServer;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 57
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/AudioUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 58
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 59
    .local v1, "result":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/AudioUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 60
    if-nez v1, :cond_0

    .line 61
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t get upload server"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 63
    :cond_0
    return-void
.end method

.method protected needShowNotifications()Z
    .locals 1

    .prologue
    .line 124
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/AudioUploadTask;->needShowNotification:Z

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
    .line 79
    new-instance v2, Lcom/vkontakte/android/api/audio/AudioSave;

    iget-object v3, p0, Lcom/vkontakte/android/upload/AudioUploadTask;->mForSaveAudio:Ljava/lang/String;

    iget-object v4, p0, Lcom/vkontakte/android/upload/AudioUploadTask;->mForSaveHash:Ljava/lang/String;

    iget-object v5, p0, Lcom/vkontakte/android/upload/AudioUploadTask;->mForSaveServer:Ljava/lang/String;

    invoke-direct {v2, v3, v4, v5}, Lcom/vkontakte/android/api/audio/AudioSave;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Lcom/vkontakte/android/upload/AudioUploadTask$2;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/AudioUploadTask$2;-><init>(Lcom/vkontakte/android/upload/AudioUploadTask;)V

    .line 80
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioSave;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 91
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/AudioUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 92
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 93
    .local v1, "res":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/AudioUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 94
    if-nez v1, :cond_0

    .line 95
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t save photo"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 97
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/upload/AudioUploadTask;->result:Lcom/vkontakte/android/audio/MusicTrack;

    if-nez v2, :cond_1

    .line 98
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "didn\'t get audio object"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 100
    :cond_1
    return-void
.end method

.method protected statsGetMethodNameForUploadUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 109
    const-string/jumbo v0, "audio.getUploadServer"

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 129
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->writeToParcel(Landroid/os/Parcel;I)V

    .line 130
    return-void
.end method
