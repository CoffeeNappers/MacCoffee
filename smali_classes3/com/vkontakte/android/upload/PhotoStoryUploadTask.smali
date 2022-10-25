.class public Lcom/vkontakte/android/upload/PhotoStoryUploadTask;
.super Lcom/vkontakte/android/upload/HTTPFileUploadTask;
.source "PhotoStoryUploadTask.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/upload/HTTPFileUploadTask",
        "<",
        "Lcom/vk/stories/model/StoryEntry;",
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
            "Lcom/vkontakte/android/upload/PhotoStoryUploadTask;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private story:Lcom/vk/stories/model/StoryEntry;

.field private final storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 138
    new-instance v0, Lcom/vkontakte/android/upload/PhotoStoryUploadTask$2;

    invoke-direct {v0}, Lcom/vkontakte/android/upload/PhotoStoryUploadTask$2;-><init>()V

    sput-object v0, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/vk/stories/model/StoryUploadParams;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "storyUploadParams"    # Lcom/vk/stories/model/StoryUploadParams;

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 28
    iput-object p3, p0, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    .line 29
    invoke-direct {p0}, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->init()V

    .line 30
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 132
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;-><init>(Landroid/os/Parcel;)V

    .line 133
    const-class v0, Lcom/vk/stories/model/StoryUploadParams;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryUploadParams;

    iput-object v0, p0, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    .line 134
    const-class v0, Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryEntry;

    iput-object v0, p0, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->story:Lcom/vk/stories/model/StoryEntry;

    .line 135
    invoke-direct {p0}, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->init()V

    .line 136
    return-void
.end method

.method private init()V
    .locals 5

    .prologue
    .line 33
    new-instance v2, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;

    invoke-direct {v2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;-><init>()V

    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    .line 34
    .local v1, "openIntent":Landroid/content/Intent;
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v3, 0x0

    const/high16 v4, 0x8000000

    invoke-static {v2, v3, v1, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 35
    .local v0, "intent":Landroid/app/PendingIntent;
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v3, 0x7f0806da

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3, v0}, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->setDoneNotification(Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)V

    .line 36
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
    .line 99
    invoke-super {p0}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->afterUpload()V

    .line 100
    invoke-static {}, Lcom/vk/core/util/FileUtils;->clearOldFilesInUploads()V

    .line 101
    return-void
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 121
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
    .line 75
    :try_start_0
    invoke-super {p0}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->doUpload()V
    :try_end_0
    .catch Lcom/vkontakte/android/upload/UploadException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    return-void

    .line 76
    :catch_0
    move-exception v0

    .line 77
    .local v0, "ex":Lcom/vkontakte/android/upload/UploadException;
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->dropState()V

    .line 78
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
    .line 90
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 91
    .local v0, "jo":Lorg/json/JSONObject;
    new-instance v2, Lcom/vk/stories/model/StoryEntry;

    const-string/jumbo v3, "response"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v4, "story"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vk/stories/model/StoryEntry;-><init>(Lorg/json/JSONObject;)V

    iput-object v2, p0, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->story:Lcom/vk/stories/model/StoryEntry;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    return-void

    .line 92
    .end local v0    # "jo":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 93
    .local v1, "x":Ljava/lang/Exception;
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t parse upload response"

    invoke-direct {v2, v3, v1}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected getNotificationTitle()Ljava/lang/CharSequence;
    .locals 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->context:Landroid/content/Context;

    const v1, 0x7f0806d6

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getPostFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    const-string/jumbo v0, "file"

    return-object v0
.end method

.method public bridge synthetic getResult()Landroid/os/Parcelable;
    .locals 1

    .prologue
    .line 21
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->getResult()Lcom/vk/stories/model/StoryEntry;

    move-result-object v0

    return-object v0
.end method

.method public getResult()Lcom/vk/stories/model/StoryEntry;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->story:Lcom/vk/stories/model/StoryEntry;

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
    .line 52
    iget-object v2, p0, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    invoke-static {v2}, Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;->getPhotoUploadServer(Lcom/vk/stories/model/StoryUploadParams;)Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/upload/PhotoStoryUploadTask$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/PhotoStoryUploadTask$1;-><init>(Lcom/vkontakte/android/upload/PhotoStoryUploadTask;)V

    .line 53
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/stories/StoriesGetUploadServer;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 64
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 65
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 66
    .local v1, "result":Z
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

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
    .line 41
    iget-object v0, p0, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    invoke-virtual {v0}, Lcom/vk/stories/model/StoryUploadParams;->isAddToNews()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    invoke-virtual {v0}, Lcom/vk/stories/model/StoryUploadParams;->getUserIds()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    .line 42
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

.method public save()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 85
    return-void
.end method

.method protected statsGetMethodNameForUploadUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 111
    const-string/jumbo v0, "stories.getPhotoUploadServer"

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 126
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->writeToParcel(Landroid/os/Parcel;I)V

    .line 127
    iget-object v0, p0, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 128
    iget-object v0, p0, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->story:Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 129
    return-void
.end method
