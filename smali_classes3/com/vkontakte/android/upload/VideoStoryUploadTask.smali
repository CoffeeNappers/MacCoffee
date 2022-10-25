.class public Lcom/vkontakte/android/upload/VideoStoryUploadTask;
.super Lcom/vkontakte/android/upload/HTTPResumableUploadTask;
.source "VideoStoryUploadTask.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Lcom/vk/stories/util/VideoCompressor$CompressDelegate;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/upload/HTTPResumableUploadTask",
        "<",
        "Lcom/vk/stories/model/StoryEntry;",
        ">;",
        "Landroid/os/Parcelable;",
        "Lcom/vk/stories/util/VideoCompressor$CompressDelegate;"
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/upload/VideoStoryUploadTask;",
            ">;"
        }
    .end annotation
.end field

.field private static final LOG:Ljava/lang/String; = "VideoStoryUploadTask"


# instance fields
.field private compressException:Ljava/lang/Exception;

.field private compressProgress:F

.field private final parameters:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

.field private renderTask:Lcom/vk/stories/util/VideoCompressor$RenderTask;

.field private story:Lcom/vk/stories/model/StoryEntry;

.field private final storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 233
    new-instance v0, Lcom/vkontakte/android/upload/VideoStoryUploadTask$2;

    invoke-direct {v0}, Lcom/vkontakte/android/upload/VideoStoryUploadTask$2;-><init>()V

    sput-object v0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/vk/stories/model/StoryUploadParams;Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "storyUploadParams"    # Lcom/vk/stories/model/StoryUploadParams;
    .param p3, "parameters"    # Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    .prologue
    .line 43
    invoke-virtual {p3}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->inputVideo()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 44
    iput-object p2, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    .line 45
    iput-object p3, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->parameters:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    .line 46
    invoke-direct {p0}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->init()V

    .line 47
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;-><init>(Landroid/os/Parcel;)V

    .line 51
    const-class v0, Lcom/vk/stories/model/StoryUploadParams;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryUploadParams;

    iput-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    .line 52
    const-class v0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    iput-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->parameters:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    .line 53
    const-class v0, Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryEntry;

    iput-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->story:Lcom/vk/stories/model/StoryEntry;

    .line 54
    invoke-direct {p0}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->init()V

    .line 55
    return-void
.end method

.method private init()V
    .locals 5

    .prologue
    .line 58
    new-instance v2, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;

    invoke-direct {v2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;-><init>()V

    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    .line 59
    .local v1, "openIntent":Landroid/content/Intent;
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v3, 0x0

    const/high16 v4, 0x8000000

    invoke-static {v2, v3, v1, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 60
    .local v0, "intent":Landroid/app/PendingIntent;
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v3, 0x7f0806da

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3, v0}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->setDoneNotification(Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)V

    .line 61
    return-void
.end method


# virtual methods
.method public afterUpload()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 185
    invoke-super {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->afterUpload()V

    .line 186
    invoke-static {}, Lcom/vk/core/util/FileUtils;->clearOldFilesInUploads()V

    .line 187
    return-void
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->renderTask:Lcom/vk/stories/util/VideoCompressor$RenderTask;

    if-eqz v0, :cond_0

    .line 177
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->renderTask:Lcom/vk/stories/util/VideoCompressor$RenderTask;

    invoke-interface {v0}, Lcom/vk/stories/util/VideoCompressor$RenderTask;->cancel()V

    .line 178
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->renderTask:Lcom/vk/stories/util/VideoCompressor$RenderTask;

    .line 180
    :cond_0
    invoke-super {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->cancel()V

    .line 181
    return-void
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 222
    const/4 v0, 0x0

    return v0
.end method

.method public doUpload()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 152
    :try_start_0
    invoke-super {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->doUpload()V
    :try_end_0
    .catch Lcom/vkontakte/android/upload/UploadException; {:try_start_0 .. :try_end_0} :catch_0

    .line 157
    return-void

    .line 153
    :catch_0
    move-exception v0

    .line 154
    .local v0, "ex":Lcom/vkontakte/android/upload/UploadException;
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->dropState()V

    .line 155
    throw v0
.end method

.method protected extractArgsForSaveFromUploadResponse(Ljava/lang/String;)V
    .locals 5
    .param p1, "response"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 167
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 168
    .local v0, "jo":Lorg/json/JSONObject;
    new-instance v2, Lcom/vk/stories/model/StoryEntry;

    const-string/jumbo v3, "response"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v4, "story"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vk/stories/model/StoryEntry;-><init>(Lorg/json/JSONObject;)V

    iput-object v2, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->story:Lcom/vk/stories/model/StoryEntry;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 172
    return-void

    .line 169
    .end local v0    # "jo":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 170
    .local v1, "x":Ljava/lang/Exception;
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t parse upload response"

    invoke-direct {v2, v3, v1}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected getNotificationTitle()Ljava/lang/CharSequence;
    .locals 2

    .prologue
    .line 207
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->context:Landroid/content/Context;

    const v1, 0x7f0806d6

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getResult()Landroid/os/Parcelable;
    .locals 1

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->getResult()Lcom/vk/stories/model/StoryEntry;

    move-result-object v0

    return-object v0
.end method

.method public getResult()Lcom/vk/stories/model/StoryEntry;
    .locals 1

    .prologue
    .line 196
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->story:Lcom/vk/stories/model/StoryEntry;

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
    .line 118
    iget-object v2, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    invoke-static {v2}, Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;->getVideoUploadServer(Lcom/vk/stories/model/StoryUploadParams;)Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/upload/VideoStoryUploadTask$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/VideoStoryUploadTask$1;-><init>(Lcom/vkontakte/android/upload/VideoStoryUploadTask;)V

    .line 119
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 130
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 131
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 132
    .local v1, "result":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 133
    if-nez v1, :cond_0

    .line 134
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t get upload server"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 136
    :cond_0
    return-void
.end method

.method protected needShowNotifications()Z
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    invoke-virtual {v0}, Lcom/vk/stories/model/StoryUploadParams;->isAddToNews()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    invoke-virtual {v0}, Lcom/vk/stories/model/StoryUploadParams;->getUserIds()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    .line 202
    invoke-virtual {v0}, Lcom/vk/stories/model/StoryUploadParams;->getUserIds()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onBytes(I)V
    .locals 2
    .param p1, "bytes"    # I

    .prologue
    .line 73
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->setWrittenFileBytesCount(J)V

    .line 74
    return-void
.end method

.method public onCancel()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 89
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->setFileWriteFinished(Z)V

    .line 90
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->setPreProcessFilePath(Ljava/lang/String;)V

    .line 91
    iput-object v1, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->renderTask:Lcom/vk/stories/util/VideoCompressor$RenderTask;

    .line 92
    return-void
.end method

.method public onError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    const/4 v1, 0x0

    .line 96
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->setFileWriteFinished(Z)V

    .line 97
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->setPreProcessFilePath(Ljava/lang/String;)V

    .line 98
    iput-object v1, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->renderTask:Lcom/vk/stories/util/VideoCompressor$RenderTask;

    .line 99
    iput-object p1, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->compressException:Ljava/lang/Exception;

    .line 100
    invoke-static {p1}, Lcom/vk/analytics/Analytics;->logException(Ljava/lang/Throwable;)V

    .line 101
    return-void
.end method

.method public onFinish(JLjava/io/File;)V
    .locals 2
    .param p1, "time"    # J
    .param p3, "resultFile"    # Ljava/io/File;

    .prologue
    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->renderTask:Lcom/vk/stories/util/VideoCompressor$RenderTask;

    .line 79
    iget v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->id:I

    invoke-static {v0, p3}, Lcom/vk/stories/StoriesController;->onVideoUploadTaskCompressFinish(ILjava/io/File;)V

    .line 80
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->setFileWriteFinished(Z)V

    .line 82
    invoke-static {}, Lcom/vk/attachpicker/util/Prefs;->storiesPrefs()Lcom/vk/attachpicker/util/Prefs;

    move-result-object v0

    const-string/jumbo v1, "save_stories"

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/util/Prefs;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 83
    invoke-static {p3}, Lcom/vk/attachpicker/util/CameraUtils;->saveVideo(Ljava/io/File;)Ljava/io/File;

    .line 85
    :cond_0
    return-void
.end method

.method public onProgress(I)V
    .locals 2
    .param p1, "progress"    # I

    .prologue
    .line 68
    int-to-float v0, p1

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr v0, v1

    iput v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->compressProgress:F

    .line 69
    return-void
.end method

.method protected onProgress(IIZ)V
    .locals 2
    .param p1, "loaded"    # I
    .param p2, "total"    # I
    .param p3, "indeterminate"    # Z

    .prologue
    .line 191
    iget v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->compressProgress:F

    const/high16 v1, 0x42c80000    # 100.0f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    const/16 v1, 0x64

    invoke-super {p0, v0, v1, p3}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->onProgress(IIZ)V

    .line 192
    return-void
.end method

.method protected preProcessFile()Ljava/lang/String;
    .locals 2

    .prologue
    .line 140
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->renderTask:Lcom/vk/stories/util/VideoCompressor$RenderTask;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->getPreProcessFilePath()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 141
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->setFileWriteFinished(Z)V

    .line 142
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->parameters:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    const/4 v1, 0x1

    invoke-static {v0, v1, p0}, Lcom/vk/stories/util/VideoCompressor;->render(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;ZLcom/vk/stories/util/VideoCompressor$CompressDelegate;)Lcom/vk/stories/util/VideoCompressor$RenderTask;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->renderTask:Lcom/vk/stories/util/VideoCompressor$RenderTask;

    .line 143
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->renderTask:Lcom/vk/stories/util/VideoCompressor$RenderTask;

    invoke-interface {v0}, Lcom/vk/stories/util/VideoCompressor$RenderTask;->getOutputFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 145
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->getPreProcessFilePath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public save()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 162
    return-void
.end method

.method protected skipNFirstBytesUntilFileIsReady()J
    .locals 2

    .prologue
    .line 217
    const-wide/16 v0, 0x400

    return-wide v0
.end method

.method protected statsGetMethodNameForUploadUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 212
    const-string/jumbo v0, "stories.getVideoUploadServer"

    return-object v0
.end method

.method protected waitNewBytesWritten(J)V
    .locals 1
    .param p1, "fileLength"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->compressException:Ljava/lang/Exception;

    if-eqz v0, :cond_0

    .line 110
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->compressException:Ljava/lang/Exception;

    throw v0

    .line 112
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->waitNewBytesWritten(J)V

    .line 114
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 227
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->writeToParcel(Landroid/os/Parcel;I)V

    .line 228
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 229
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->parameters:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 230
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->story:Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 231
    return-void
.end method
