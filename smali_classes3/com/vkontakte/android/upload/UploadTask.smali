.class public abstract Lcom/vkontakte/android/upload/UploadTask;
.super Ljava/lang/Object;
.source "UploadTask.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S::",
        "Landroid/os/Parcelable;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field protected static final ID_NOTIFICATION_DONE:I = 0x144

.field protected static final ID_NOTIFICATION_FAIL:I = 0x145

.field protected static final ID_NOTIFICATION_PROGRESS:I = 0x143

.field private static final STATE_DONE:I = 0x5

.field private static final STATE_GOT_SERVER:I = 0x2

.field private static final STATE_NEW:I = 0x0

.field private static final STATE_PRE_UPLOAD:I = 0x1

.field private static final STATE_SAVED:I = 0x4

.field private static final STATE_UPLOADED:I = 0x3

.field static lastID:I


# instance fields
.field protected canceled:Z

.field protected context:Landroid/content/Context;

.field protected currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field protected doneIntent:Landroid/app/PendingIntent;

.field protected doneText:Ljava/lang/String;

.field protected doneTitle:Ljava/lang/String;

.field protected id:I

.field private notifyBuilder:Landroid/app/Notification$Builder;

.field private progressListener:Lcom/vkontakte/android/upload/ProgressListener;

.field private state:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 33
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-int v0, v0

    div-int/lit16 v0, v0, 0x3e8

    sput v0, Lcom/vkontakte/android/upload/UploadTask;->lastID:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 53
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/upload/UploadTask;->state:I

    .line 54
    iput-object p1, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    .line 55
    sget v0, Lcom/vkontakte/android/upload/UploadTask;->lastID:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/vkontakte/android/upload/UploadTask;->lastID:I

    iput v0, p0, Lcom/vkontakte/android/upload/UploadTask;->id:I

    .line 56
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 283
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/upload/UploadTask;-><init>(Landroid/content/Context;)V

    .line 284
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/upload/UploadTask;->doneTitle:Ljava/lang/String;

    .line 285
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/upload/UploadTask;->doneText:Ljava/lang/String;

    .line 286
    const-class v0, Landroid/app/PendingIntent;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/app/PendingIntent;

    iput-object v0, p0, Lcom/vkontakte/android/upload/UploadTask;->doneIntent:Landroid/app/PendingIntent;

    .line 287
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
    .line 167
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    return-void
.end method

.method public beforeUpload()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 129
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    return-void
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 147
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/upload/UploadTask;->canceled:Z

    .line 148
    iget-object v0, p0, Lcom/vkontakte/android/upload/UploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/vkontakte/android/upload/UploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 150
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/upload/UploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 152
    :cond_0
    return-void
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 272
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public abstract doUpload()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation
.end method

.method dropState()V
    .locals 1

    .prologue
    .line 59
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/upload/UploadTask;->state:I

    .line 60
    return-void
.end method

.method public getID()I
    .locals 1

    .prologue
    .line 209
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    iget v0, p0, Lcom/vkontakte/android/upload/UploadTask;->id:I

    return v0
.end method

.method protected getNotificationTitle()Ljava/lang/CharSequence;
    .locals 2

    .prologue
    .line 205
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    iget-object v0, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    const v1, 0x7f08033d

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResult()Landroid/os/Parcelable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation

    .prologue
    .line 159
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract getServer()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation
.end method

.method public hideNotification()V
    .locals 2

    .prologue
    .line 264
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/UploadTask;->needShowNotifications()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 265
    iget-object v0, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    const-string/jumbo v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    const/16 v1, 0x143

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 267
    :cond_0
    return-void
.end method

.method public isCanceled()Z
    .locals 1

    .prologue
    .line 155
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/UploadTask;->canceled:Z

    return v0
.end method

.method protected needShowNotifications()Z
    .locals 1

    .prologue
    .line 217
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    const/4 v0, 0x0

    return v0
.end method

.method protected onProgress(IIZ)V
    .locals 5
    .param p1, "loaded"    # I
    .param p2, "total"    # I
    .param p3, "indeterminate"    # Z

    .prologue
    .line 170
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    iget v2, p0, Lcom/vkontakte/android/upload/UploadTask;->id:I

    invoke-static {v2, p1, p2, p3}, Lcom/vk/stories/StoriesController;->onUploadProgress(IIIZ)V

    .line 171
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "upload progress "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " / "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.UPLOAD_PROGRESS"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 173
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "done"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 174
    const-string/jumbo v2, "total"

    invoke-virtual {v0, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 175
    const-string/jumbo v2, "indeterminate"

    invoke-virtual {v0, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 176
    const-string/jumbo v2, "id"

    iget v3, p0, Lcom/vkontakte/android/upload/UploadTask;->id:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 177
    iget-object v2, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v2, v0, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 178
    iget-object v2, p0, Lcom/vkontakte/android/upload/UploadTask;->progressListener:Lcom/vkontakte/android/upload/ProgressListener;

    if-eqz v2, :cond_0

    .line 179
    iget-object v2, p0, Lcom/vkontakte/android/upload/UploadTask;->progressListener:Lcom/vkontakte/android/upload/ProgressListener;

    invoke-interface {v2, p0, p1, p2, p3}, Lcom/vkontakte/android/upload/ProgressListener;->onProgress(Lcom/vkontakte/android/upload/UploadTask;IIZ)V

    .line 181
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/UploadTask;->needShowNotifications()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 182
    iget-object v2, p0, Lcom/vkontakte/android/upload/UploadTask;->notifyBuilder:Landroid/app/Notification$Builder;

    if-nez v2, :cond_3

    .line 183
    new-instance v2, Landroid/app/Notification$Builder;

    iget-object v3, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 184
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/UploadTask;->getNotificationTitle()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v2

    const/4 v3, 0x1

    .line 185
    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 187
    invoke-virtual {v2, p2, p1, p3}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    move-result-object v2

    const v3, 0x1080088

    .line 189
    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/UploadTask;->notifyBuilder:Landroid/app/Notification$Builder;

    .line 195
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/upload/UploadTask;->notifyBuilder:Landroid/app/Notification$Builder;

    invoke-virtual {v2}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v1

    .line 196
    .local v1, "notification":Landroid/app/Notification;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_1

    .line 197
    iget-object v2, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0f0018

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    iput v2, v1, Landroid/app/Notification;->color:I

    .line 198
    const-string/jumbo v2, "progress"

    iput-object v2, v1, Landroid/app/Notification;->category:Ljava/lang/String;

    .line 200
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    const-string/jumbo v3, "notification"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/NotificationManager;

    const/16 v3, 0x143

    invoke-virtual {v2, v3, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 202
    .end local v1    # "notification":Landroid/app/Notification;
    :cond_2
    return-void

    .line 191
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/upload/UploadTask;->notifyBuilder:Landroid/app/Notification$Builder;

    .line 193
    invoke-virtual {v2, p2, p1, p3}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    goto :goto_0
.end method

.method run()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    const/4 v9, 0x5

    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 64
    :try_start_0
    iget v4, p0, Lcom/vkontakte/android/upload/UploadTask;->state:I

    if-ge v4, v5, :cond_0

    iget-boolean v4, p0, Lcom/vkontakte/android/upload/UploadTask;->canceled:Z

    if-nez v4, :cond_0

    .line 65
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/UploadTask;->beforeUpload()V

    .line 66
    const/4 v4, 0x1

    iput v4, p0, Lcom/vkontakte/android/upload/UploadTask;->state:I

    .line 68
    :cond_0
    iget v4, p0, Lcom/vkontakte/android/upload/UploadTask;->state:I

    if-ge v4, v6, :cond_1

    iget-boolean v4, p0, Lcom/vkontakte/android/upload/UploadTask;->canceled:Z

    if-nez v4, :cond_1

    .line 69
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/UploadTask;->getServer()V

    .line 70
    const/4 v4, 0x2

    iput v4, p0, Lcom/vkontakte/android/upload/UploadTask;->state:I

    .line 72
    :cond_1
    iget v4, p0, Lcom/vkontakte/android/upload/UploadTask;->state:I

    if-ge v4, v7, :cond_2

    iget-boolean v4, p0, Lcom/vkontakte/android/upload/UploadTask;->canceled:Z

    if-nez v4, :cond_2

    .line 73
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/UploadTask;->doUpload()V

    .line 74
    const/4 v4, 0x3

    iput v4, p0, Lcom/vkontakte/android/upload/UploadTask;->state:I

    .line 76
    :cond_2
    iget v4, p0, Lcom/vkontakte/android/upload/UploadTask;->state:I

    if-ge v4, v8, :cond_3

    iget-boolean v4, p0, Lcom/vkontakte/android/upload/UploadTask;->canceled:Z

    if-nez v4, :cond_3

    .line 77
    const/16 v4, 0xa

    const/16 v5, 0xa

    const/4 v6, 0x1

    invoke-virtual {p0, v4, v5, v6}, Lcom/vkontakte/android/upload/UploadTask;->onProgress(IIZ)V

    .line 78
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/UploadTask;->save()V

    .line 79
    const/4 v4, 0x4

    iput v4, p0, Lcom/vkontakte/android/upload/UploadTask;->state:I

    .line 81
    :cond_3
    iget v4, p0, Lcom/vkontakte/android/upload/UploadTask;->state:I

    if-ge v4, v9, :cond_4

    iget-boolean v4, p0, Lcom/vkontakte/android/upload/UploadTask;->canceled:Z

    if-nez v4, :cond_4

    .line 82
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/UploadTask;->afterUpload()V

    .line 83
    const/4 v4, 0x5

    iput v4, p0, Lcom/vkontakte/android/upload/UploadTask;->state:I

    .line 85
    :cond_4
    iget-boolean v4, p0, Lcom/vkontakte/android/upload/UploadTask;->canceled:Z

    if-nez v4, :cond_7

    .line 86
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v4, "com.vkontakte.android.UPLOAD_DONE"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 87
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v4, "id"

    iget v5, p0, Lcom/vkontakte/android/upload/UploadTask;->id:I

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 88
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/UploadTask;->getResult()Landroid/os/Parcelable;

    move-result-object v2

    .line 89
    .local v2, "result":Landroid/os/Parcelable;, "TS;"
    if-eqz v2, :cond_6

    .line 90
    const-string/jumbo v4, "result"

    invoke-virtual {v1, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 91
    instance-of v4, v2, Lcom/vkontakte/android/attachments/Attachment;

    if-eqz v4, :cond_8

    .line 92
    iget v5, p0, Lcom/vkontakte/android/upload/UploadTask;->id:I

    move-object v0, v2

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    move-object v4, v0

    invoke-static {v5, v4}, Lcom/vkontakte/android/data/Messages;->uploadDone(ILcom/vkontakte/android/attachments/Attachment;)V

    .line 98
    :cond_5
    :goto_0
    iget v4, p0, Lcom/vkontakte/android/upload/UploadTask;->id:I

    invoke-static {v4, v2}, Lcom/vk/stories/StoriesController;->onUploadDone(ILjava/lang/Object;)V

    .line 100
    :cond_6
    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    const-string/jumbo v5, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v4, v1, v5}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 101
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/UploadTask;->needShowNotifications()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 102
    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadTask;->doneTitle:Ljava/lang/String;

    iget-object v5, p0, Lcom/vkontakte/android/upload/UploadTask;->doneText:Ljava/lang/String;

    iget-object v6, p0, Lcom/vkontakte/android/upload/UploadTask;->doneIntent:Landroid/app/PendingIntent;

    invoke-virtual {p0, v4, v5, v6}, Lcom/vkontakte/android/upload/UploadTask;->showDoneNotification(Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)V
    :try_end_0
    .catch Lcom/vkontakte/android/upload/UploadException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 120
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "result":Landroid/os/Parcelable;, "TS;"
    :cond_7
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/UploadTask;->hideNotification()V

    .line 122
    return-void

    .line 93
    .restart local v1    # "intent":Landroid/content/Intent;
    .restart local v2    # "result":Landroid/os/Parcelable;, "TS;"
    :cond_8
    :try_start_1
    instance-of v4, v2, Lcom/vkontakte/android/audio/MusicTrack;

    if-eqz v4, :cond_b

    .line 94
    iget v5, p0, Lcom/vkontakte/android/upload/UploadTask;->id:I

    new-instance v6, Lcom/vkontakte/android/attachments/AudioAttachment;

    move-object v0, v2

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    move-object v4, v0

    invoke-direct {v6, v4}, Lcom/vkontakte/android/attachments/AudioAttachment;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    invoke-static {v5, v6}, Lcom/vkontakte/android/data/Messages;->uploadDone(ILcom/vkontakte/android/attachments/Attachment;)V
    :try_end_1
    .catch Lcom/vkontakte/android/upload/UploadException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 105
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "result":Landroid/os/Parcelable;, "TS;"
    :catch_0
    move-exception v3

    .line 106
    .local v3, "x":Lcom/vkontakte/android/upload/UploadException;
    :try_start_2
    instance-of v4, v3, Lcom/vkontakte/android/upload/BadUploadServerException;

    if-eqz v4, :cond_9

    .line 107
    const/4 v4, 0x1

    iput v4, p0, Lcom/vkontakte/android/upload/UploadTask;->state:I

    .line 110
    :cond_9
    iget v4, p0, Lcom/vkontakte/android/upload/UploadTask;->id:I

    invoke-static {v4}, Lcom/vk/stories/StoriesController;->onUploadFailed(I)V

    .line 111
    iget v4, p0, Lcom/vkontakte/android/upload/UploadTask;->id:I

    invoke-static {v4}, Lcom/vkontakte/android/data/Messages;->uploadFailed(I)V

    .line 112
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v4, "com.vkontakte.android.UPLOAD_FAILED"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 113
    .restart local v1    # "intent":Landroid/content/Intent;
    const-string/jumbo v4, "id"

    iget v5, p0, Lcom/vkontakte/android/upload/UploadTask;->id:I

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 114
    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    const-string/jumbo v5, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v4, v1, v5}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 115
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/UploadTask;->needShowNotifications()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 116
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/UploadTask;->showFailedNotification()V

    .line 118
    :cond_a
    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 120
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v3    # "x":Lcom/vkontakte/android/upload/UploadException;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/vkontakte/android/upload/UploadTask;->hideNotification()V

    throw v4

    .line 95
    .restart local v1    # "intent":Landroid/content/Intent;
    .restart local v2    # "result":Landroid/os/Parcelable;, "TS;"
    :cond_b
    :try_start_3
    instance-of v4, v2, Lcom/vkontakte/android/api/VideoFile;

    if-eqz v4, :cond_5

    .line 96
    iget v5, p0, Lcom/vkontakte/android/upload/UploadTask;->id:I

    new-instance v6, Lcom/vkontakte/android/attachments/VideoAttachment;

    move-object v0, v2

    check-cast v0, Lcom/vkontakte/android/api/VideoFile;

    move-object v4, v0

    invoke-direct {v6, v4}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    invoke-static {v5, v6}, Lcom/vkontakte/android/data/Messages;->uploadDone(ILcom/vkontakte/android/attachments/Attachment;)V
    :try_end_3
    .catch Lcom/vkontakte/android/upload/UploadException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method

.method public abstract save()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation
.end method

.method public setDoneNotification(Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "intent"    # Landroid/app/PendingIntent;

    .prologue
    .line 258
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    iput-object p1, p0, Lcom/vkontakte/android/upload/UploadTask;->doneTitle:Ljava/lang/String;

    .line 259
    iput-object p2, p0, Lcom/vkontakte/android/upload/UploadTask;->doneText:Ljava/lang/String;

    .line 260
    iput-object p3, p0, Lcom/vkontakte/android/upload/UploadTask;->doneIntent:Landroid/app/PendingIntent;

    .line 261
    return-void
.end method

.method public setID(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 213
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    iput p1, p0, Lcom/vkontakte/android/upload/UploadTask;->id:I

    .line 214
    return-void
.end method

.method public setProgressListener(Lcom/vkontakte/android/upload/ProgressListener;)V
    .locals 0
    .param p1, "l"    # Lcom/vkontakte/android/upload/ProgressListener;

    .prologue
    .line 221
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    iput-object p1, p0, Lcom/vkontakte/android/upload/UploadTask;->progressListener:Lcom/vkontakte/android/upload/ProgressListener;

    .line 222
    return-void
.end method

.method protected showDoneNotification(Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)V
    .locals 4
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "intent"    # Landroid/app/PendingIntent;

    .prologue
    .line 225
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    new-instance v1, Landroid/app/Notification$Builder;

    iget-object v2, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 226
    invoke-virtual {v1, p1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 227
    invoke-virtual {v1, p2}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 228
    invoke-virtual {v1, p2}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v1

    const v2, 0x7f02029d

    .line 229
    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v1

    const/4 v2, 0x1

    .line 230
    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 231
    .local v0, "bldr":Landroid/app/Notification$Builder;
    if-eqz p3, :cond_0

    .line 232
    invoke-virtual {v0, p3}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 234
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_1

    .line 235
    iget-object v1, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0f0018

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    .line 237
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    const-string/jumbo v2, "notification"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    const/16 v2, 0x144

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 238
    return-void
.end method

.method protected showFailedNotification()V
    .locals 7

    .prologue
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    const v6, 0x7f08072b

    .line 241
    new-instance v1, Landroid/content/Intent;

    iget-object v3, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    const-class v4, Lcom/vkontakte/android/upload/UploaderIntentService;

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 242
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "retry"

    invoke-virtual {p0}, Lcom/vkontakte/android/upload/UploadTask;->getID()I

    move-result v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 243
    iget-object v3, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    const/4 v4, 0x0

    const/high16 v5, 0x8000000

    invoke-static {v3, v4, v1, v5}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 244
    .local v2, "pIntent":Landroid/app/PendingIntent;
    new-instance v3, Landroid/app/Notification$Builder;

    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    invoke-direct {v3, v4}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    .line 245
    invoke-virtual {v4, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    .line 246
    invoke-virtual {v4, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    const v5, 0x7f0801f6

    .line 247
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v3

    const v4, 0x1080078

    .line 248
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v3

    const/4 v4, 0x1

    .line 249
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v3

    .line 250
    invoke-virtual {v3, v2}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 251
    .local v0, "bldr":Landroid/app/Notification$Builder;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x15

    if-lt v3, v4, :cond_0

    .line 252
    iget-object v3, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0f0018

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    .line 254
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/upload/UploadTask;->context:Landroid/content/Context;

    const-string/jumbo v4, "notification"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    const/16 v4, 0x145

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 255
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 277
    .local p0, "this":Lcom/vkontakte/android/upload/UploadTask;, "Lcom/vkontakte/android/upload/UploadTask<TS;>;"
    iget-object v0, p0, Lcom/vkontakte/android/upload/UploadTask;->doneTitle:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 278
    iget-object v0, p0, Lcom/vkontakte/android/upload/UploadTask;->doneText:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 279
    iget-object v0, p0, Lcom/vkontakte/android/upload/UploadTask;->doneIntent:Landroid/app/PendingIntent;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 280
    return-void
.end method
